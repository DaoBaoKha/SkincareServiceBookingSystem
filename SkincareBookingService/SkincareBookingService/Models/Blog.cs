﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SkincareBookingService.Models;

public partial class Blog
{
    public int BlogId { get; set; }

    public string Title { get; set; }

    public string Content { get; set; }

    public int? CustomerId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual Customer Customer { get; set; }
}