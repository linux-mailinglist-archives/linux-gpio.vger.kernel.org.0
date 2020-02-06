Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079C31544EE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 14:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbgBFNdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 08:33:16 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33962 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFNdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2020 08:33:16 -0500
Received: by mail-io1-f66.google.com with SMTP id z193so6326036iof.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2020 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S3PWVWDemFhb1VuaU5EnVMCtT713YQaKuEAVAAsC8Rw=;
        b=SVQoMGxeni4EphTDdQwALXstFSp3H9i71WqrF/ILlh7MQBJ3ukBrZ5kBSZAkkCFw5n
         RHBa16PCMuy9Enq8OiOSOudM33PFvQttyoCm9V99JXXBQtZVPfJu+qjKjZy5WFeLknX2
         skDyzdboYLW3438yFoHNfpsU444C40zSyNKkUE1BQ2vFsdU7NRE829Qxm+DEDnNqUGFR
         VxMv+VSGwIBD9eVF/+B2DubQVq0GcV/zwuTsZAkL4yD7U2WsmtOHKnnCsiYdNIXB5gwQ
         e5FuzD0UqPkiYJI2bSMQ0fYsBIZ/4QQJ+wSa0vIWz3qCPfVvjO/PUQ0rd2OLFP7Jvjft
         hlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S3PWVWDemFhb1VuaU5EnVMCtT713YQaKuEAVAAsC8Rw=;
        b=YRY08vULkYB6KeHG9SEBNgQp+LbTxY0p9ijBWQ6AyhTs/sZjV5HodWsvz5DcwJwhEn
         MQn15mP5dOBygSFIWJZjb8IA24XFcrYznvu51jgE8EFrDSPrlS4BjWCCQbcQ1tzUuCYl
         AD2CllThut/kdBMYrEiwyMjoHRztTAztJJAns8qZeq6F3+OvN7D/G9RYzuqNxU8Rm/hI
         cj9o/VxopOne2Dno7a2RHixOfdP7w+i9qRbmHE9/B2Zst9iKHlWsL/o47jCcx2NoIEm7
         xotsBBfvhQKcwfzhO2sp84wyvscxfE+e5FWrky7kuMph8pbVSktZMjwvGhXCQOsXeytF
         8seQ==
X-Gm-Message-State: APjAAAU+Mp14gJg2Fy2xjTmVMyb5wN8LBP9606NX0vrCUjhzyQx5ud+6
        n1ogPP2DVrTvGsR4LptkayInWNGQPsNe/ILc6jfDcQ==
X-Google-Smtp-Source: APXvYqwXMtzlNZEiVi7/zO4cWT029pIb/sNjVuKYzcxlV2H+TWDewZ+BJGuexdtqROXVjtGuXwPDS4dGjRGBTDwvq4E=
X-Received: by 2002:a6b:fd18:: with SMTP id c24mr24339380ioi.189.1580995993824;
 Thu, 06 Feb 2020 05:33:13 -0800 (PST)
MIME-Version: 1.0
References: <CAFhCfDYzej7qixOtnL8Lvm0+JnSaOrE3UmDm7rGo3eM+Co6Aag@mail.gmail.com>
In-Reply-To: <CAFhCfDYzej7qixOtnL8Lvm0+JnSaOrE3UmDm7rGo3eM+Co6Aag@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 6 Feb 2020 14:33:03 +0100
Message-ID: <CAMRc=MczvJNCVzMcU=Bz5w2fHBUEASi2Qw4bB7oMzt-vocFp3Q@mail.gmail.com>
Subject: Re: New Mailing List Member w/ Queries
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 4 lut 2020 o 14:20 Jack Winch <sunt.un.morcov@gmail.com> napisa=C5=82(=
a):
>
> Hey Folks,
>
> New to the mailing list and looking to get involved in the development
> of the GPIO Subsystem and libgpiod.  I am new to the Linux Kernel
> project, although I am a user of Linux within 'real-time' applications
> and have previously had some experience on the embedded side too.  I
> am looking to get involved in a personal capacity at the moment, as I
> feel that doing so will be highly educational and a worth while
> investment of my time.  I am likely to ask questions on the design
> intent of some aspects of this subsystem as I increase my familiarity
> of the internals, but only after RTFM, source code and consulting what
> other material I can find on the internet.  I won't pollute this space
> with basic generic questions - Kernel Newbies is for that.
>
> I will also be looking to invest in some representative hardware for
> development and testing.  If we are short of certain hardware within
> the mailing list (for testing), then let me know and I can investigate
> further.
>
> I have a few queries:-
>
> 1.  Documentation/ABI/obsolete/sysfs-gpio states that the 'ABI is
> deprecated and will be removed after 2020'.  This intention has been
> made very clear since 2008.  Any idea of when this feature will be
> removed from the mainline kernel (e.g., target version)?  Will it be
> removed during this year?
>

Well, it depends. Sysfs is considered stable ABI. As much as we'd like
to remove it - if anyone in user-space objects, we'll be forced to
leave it be.

> 2. I see that within libgpiod, a TODO task was raised to implement a
> dbus API and system daemon for controlling GPIOs on 03-APR-19.  This
> task is something that I would be happy to get involved with,
> depending on the current priority of the task.  Bartosz and Kent, is
> this something I could get involved with?  From recent patches to
> libgpiod, I can see that development of the dbus interface is further
> underway.  I will have to get up to speed with the dbus implementation
> being used, but that should not be a major bar of entry.
>

I've been working on glib and dbus bindings on and off but eventually
paused the development due to the recent and upcoming new features in
the kernel API and core libgpiod. Once these are done and stable, I'll
continue on dbus. I think it's better than to release something
half-baked now and then realize that new interfaces are hard to
integrate.

Bartosz
