﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SkincareBookingService.Models;

public partial class Staff
{
    public int StaffId { get; set; }

    public string Name { get; set; }

    public string PhoneNumber { get; set; }

    public string Email { get; set; }

    public string Position { get; set; }

    public virtual ICollection<Schedule> Schedules { get; set; } = new List<Schedule>();
}