Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00094151B1E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 14:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgBDNUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 08:20:41 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45205 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbgBDNUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 08:20:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id a6so22981146wrx.12
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 05:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=XaOtnSmzwpqADcl/kwe3o8mbid0WESYZNWMYyEuDIjM=;
        b=KHoP5KecYifpzizq0LyKJkI7pjf2kWbuenRWZGJiBDwgkUZc31ziPNB6nqwLjG9npc
         KAX0XDURZf36xyreQaiyQe6xOuQJsC1SDk0JQtGkWDS555cvo9S5ME02I2cjsu6CDCtm
         ROx7aeI2JPFsA2cgLJOK9MSkxM5MaXZn8XiLuaSs8AeGcE/pqgrUcCDheP7k0GRMFNbt
         GfxPb60iivqDbN2z/Q9tn9bZQNsZwXs3xJVjpBAdpDSkrgPYMWON8s1gR5Ojbx6smAQR
         le0wO0VNYgA2QnWV+ou+Hcqq63sKZb+EtLRaHOP4DYyUdL5pcG9HsrBWppR3b8gN2fqq
         h4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XaOtnSmzwpqADcl/kwe3o8mbid0WESYZNWMYyEuDIjM=;
        b=KRfxquQt8FuRSAex3YAkhYRVBEhSsxKyH17GYnAdB/YAO0RSYGj9BirV3H634jCr9W
         szf6ybxxEtAshojSPP2gd6OQPsBgpNcF43X1gkY9W/8AEW8XVNo2Og3+yotMnleN822F
         el5QGza4SxgSlrImbCW8xVu9In08Io2FMfKCMbmmQ88gT7ZqJQtG+Xat0YKEY1S2FH2Z
         nKuHjprr/qQkMAMxzj2q4PmyjtL/S3O27o7m4OFfP9kRtCYIptINa+/pDWpvtobuJckI
         dBIywbR8NyLmwwM5/eLBgxFdIXVT9apL3WYvyqBpR+nkDOGyxUMpHBQe0bez8B172Hi2
         yt5w==
X-Gm-Message-State: APjAAAXJ58Y6dE/c7RV0x/GlIstT+QLtCQno8AEu0tIetKLzc358/acC
        ycpYhofvpSqFNWh+yXRU6p/NxI5kVLzC5+xd4YtdZQ==
X-Google-Smtp-Source: APXvYqxFk3kRy1ZQP2QQwPqXFpYok0EQTah2rU0DNhlQkZuqvsIg5ncZU+CUvzF2Ie9OldR3RU0ZUH77xYFip2lzHrc=
X-Received: by 2002:a5d:538e:: with SMTP id d14mr23301124wrv.358.1580822438982;
 Tue, 04 Feb 2020 05:20:38 -0800 (PST)
MIME-Version: 1.0
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Tue, 4 Feb 2020 13:20:27 +0000
Message-ID: <CAFhCfDYzej7qixOtnL8Lvm0+JnSaOrE3UmDm7rGo3eM+Co6Aag@mail.gmail.com>
Subject: New Mailing List Member w/ Queries
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey Folks,

New to the mailing list and looking to get involved in the development
of the GPIO Subsystem and libgpiod.  I am new to the Linux Kernel
project, although I am a user of Linux within 'real-time' applications
and have previously had some experience on the embedded side too.  I
am looking to get involved in a personal capacity at the moment, as I
feel that doing so will be highly educational and a worth while
investment of my time.  I am likely to ask questions on the design
intent of some aspects of this subsystem as I increase my familiarity
of the internals, but only after RTFM, source code and consulting what
other material I can find on the internet.  I won't pollute this space
with basic generic questions - Kernel Newbies is for that.

I will also be looking to invest in some representative hardware for
development and testing.  If we are short of certain hardware within
the mailing list (for testing), then let me know and I can investigate
further.

I have a few queries:-

1.  Documentation/ABI/obsolete/sysfs-gpio states that the 'ABI is
deprecated and will be removed after 2020'.  This intention has been
made very clear since 2008.  Any idea of when this feature will be
removed from the mainline kernel (e.g., target version)?  Will it be
removed during this year?

2. I see that within libgpiod, a TODO task was raised to implement a
dbus API and system daemon for controlling GPIOs on 03-APR-19.  This
task is something that I would be happy to get involved with,
depending on the current priority of the task.  Bartosz and Kent, is
this something I could get involved with?  From recent patches to
libgpiod, I can see that development of the dbus interface is further
underway.  I will have to get up to speed with the dbus implementation
being used, but that should not be a major bar of entry.

I look forward to collaborating and learning from you all.

Many Thanks,
Jack W.

--------------------------------------------------------------------------------
'Against stupidity the gods themselves contend in vain'.
~ Friedrich von Schiller

'A common mistake that people make when trying to design something completely
foolproof is to underestimate the ingenuity of complete fools'.
~ Douglas Adams
--------------------------------------------------------------------------------
