﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SkincareBookingService.Models;

public partial class Schedule
{
    public int ScheduleId { get; set; }

    public int? TherapistId { get; set; }

    public string Description { get; set; }

    public int? StaffId { get; set; }

    public virtual ICollection<Slot> Slots { get; set; } = new List<Slot>();

    public virtual Staff Staff { get; set; }

    public virtual SkinTherapist Therapist { get; set; }
}