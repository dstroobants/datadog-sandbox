package main

import (
    //gintrace "gopkg.in/DataDog/dd-trace-go.v1/contrib/gin-gonic/gin"
    "gopkg.in/DataDog/dd-trace-go.v1/ddtrace/tracer"
    "github.com/gin-gonic/gin"
    "net/http"
)

func main() {
    tracer.Start()
    defer tracer.Stop()

    // Create a gin.Engine
    r := gin.New()

    // Use the tracer middleware with your desired service name.
    //r.Use(gintrace.Middleware("apm-go-tracer"))

    // Continue using the router as normal.
    r.GET("/parameters", func(c *gin.Context) {
        param1 := c.Request.URL.Query().Get("param1")
        param2 := c.Request.URL.Query().Get("param2")
        
        span := tracer.StartSpan("apm-go-tracer")
        span.SetTag("urlparams.param1", param1)
        span.SetTag("urlparams.param2", param2)
        span.SetTag("urlparams.urlPath", c.Request.URL)
        defer span.Finish()
		
        c.JSON(http.StatusOK, gin.H{
			param1: param2,
		})
	})
	r.Run(":5010")
}
