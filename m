Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992FE3DF83C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhHCXJX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 19:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbhHCXJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 19:09:22 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D94C06175F;
        Tue,  3 Aug 2021 16:09:10 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so6140917pjb.2;
        Tue, 03 Aug 2021 16:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C3KYIJGdJToivyjORx5q82nqhu11jt/K74TDDXfOTGo=;
        b=QIZwzTIiTszqKVgfitNRcGkm/ynh/6HIxfhVKQSYPBDy4QpjzJOX9rWVNgE4M4vVX8
         dPZ055r+K5Xk3oLieWoRIMZSmpu2OkSfhbJkQOdCKJfQZtRbyqnApb65ej0qfoJp8Qvl
         Xrj3bVtCHpBHM4OpaXfHIm7TdIBhGcFrEv+UeUWiuVFZTKGdm7ah3HmNvNlTWgFoHxyg
         CZeFP3wJ2mLdYTBWrKDBkmaHKxJ5eJ4p4QQ4gomLdqGWIghBpEcqI8jV/2ZcGr2IqugI
         9JimAum7yy6iq+tbFOYO2mSVL4RHOOkzBFOWprjT9FflJZc0ei6teglpCF4MtAsAm/2T
         RRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C3KYIJGdJToivyjORx5q82nqhu11jt/K74TDDXfOTGo=;
        b=s7Mq9BAWmEQ5rO+tgtI0l3BsRYAWrWn8CB8MwHZU8ovqYJrZjfxfijJyMao61Q5Vm6
         S0LP1mLckp6b9S2r+FQsplpqOBjsKYLzL4qvFuSfSvAR8xzPvNkQYLU91eijJLXRWNX8
         nyuTsSEPJ+m6hnQZgBFXGODHEAntDFKojQAikw4DDlcDEnv8wXSZXYLVgmS5e/8qxTfZ
         fdAkKvcMT1EuW8/5aOEbz3UrksXhQtYkepy/7A48jCYTHuQqAWD/1QNY8NzVHx70mj5m
         cEU8DqwGHjxc8t4hENN2uWxDjt0/sCXu42JcKrlztlys4Y1I7wWV5b74/OEMdgEeXfgx
         bgRw==
X-Gm-Message-State: AOAM532YpxIQMSgCzp6IZzSOWVVVuZqwHHzf416LGX3EWGImSpzON8Pc
        HV+MIZwgILQVlNGWi7YUtIA=
X-Google-Smtp-Source: ABdhPJykE5uxGG4ltXmtBgNgS89quz1IZwLAwmx8DoUUclEyGv+Lsan3bQfl848E+zaQYCp6lRAn5A==
X-Received: by 2002:a65:55c9:: with SMTP id k9mr589617pgs.262.1628032149840;
        Tue, 03 Aug 2021 16:09:09 -0700 (PDT)
Received: from sol (106-69-177-173.dyn.iinet.net.au. [106.69.177.173])
        by smtp.gmail.com with ESMTPSA id d15sm181821pgj.84.2021.08.03.16.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:09:09 -0700 (PDT)
Date:   Wed, 4 Aug 2021 07:09:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, thierry.reding@gmail.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
Message-ID: <20210803230902.GA7730@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-9-dipenp@nvidia.com>
 <7e49e6a9-bd7c-1b97-50e6-bc803addc27f@nvidia.com>
 <65bf01e1-66e1-7eec-0052-4d707f4a3f6b@nvidia.com>
 <8d3257f3-54b1-e658-245d-3a070aba44c4@nvidia.com>
 <f0d8da75-6e31-5432-6909-8eab6960b787@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0d8da75-6e31-5432-6909-8eab6960b787@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 03, 2021 at 03:51:31PM -0700, Dipen Patel wrote:
> 
> On 8/3/21 9:42 AM, Jon Hunter wrote:
> >
> > On 30/07/2021 03:33, Dipen Patel wrote:
> >>
> >> On 7/9/21 1:30 AM, Jon Hunter wrote:
> >>> On 26/06/2021 00:55, Dipen Patel wrote:
> >>>> This patch adds new clock type for the GPIO controller which can
> >>>> timestamp gpio lines using hardware means. To expose such
> >>>> functionalities to the userspace, code has been added in this patch
> >>>> where during line create call, it checks for new clock type and if
> >>>> requested, calls hardware timestamp related API from gpiolib.c.
> >>>> During line change event, it retrieves timestamp in nano seconds by
> >>>> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
> >>>> it disables this functionality by calling gpiod_hw_timestamp_control.
> >>>>
> >>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> >>>> ---
> >>>>   drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
> >>>>   include/uapi/linux/gpio.h   |  1 +
> >>>>   2 files changed, 64 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> >>>> index 1631727bf0da..9f98c727e937 100644
> >>>> --- a/drivers/gpio/gpiolib-cdev.c
> >>>> +++ b/drivers/gpio/gpiolib-cdev.c
> >>>> @@ -518,6 +518,7 @@ struct linereq {
> >>>>        GPIO_V2_LINE_DRIVE_FLAGS | \
> >>>>        GPIO_V2_LINE_EDGE_FLAGS | \
> >>>>        GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
> >>>> +     GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
> >>>>        GPIO_V2_LINE_BIAS_FLAGS)
> >>>>     static void linereq_put_event(struct linereq *lr,
> >>>> @@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
> >>>>     static u64 line_event_timestamp(struct line *line)
> >>>>   {
> >>>> +    bool block;
> >>>> +
> >>>>       if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
> >>>>           return ktime_get_real_ns();
> >>>>   +    if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
> >>>> +        if (irq_count())
> >>>> +            block = false;
> >>>> +        else
> >>>> +            block = true;
> >>>> +
> >>>> +        return gpiod_get_hw_timestamp(line->desc, block);
> >>>> +    }
> >>>> +
> >>>>       return ktime_get_ns();
> >>>>   }
> >>>
> >>> Looking at line_event_timestamp() and the callers of this function, it
> >>> appears that this should always return nanoseconds. Does
> >>> gpiod_get_hw_timestamp() return nanoseconds?
> >> Yes, it returns in ns to align with line_event_timestamp.
> >
> >
> > It might be worth updating the function name to gpiod_get_hw_timestamp_ns() so that this is clear.
> Wouldn't be sufficient to right into its description rather embed in API name?
> >

Adding a suffix identifying the timestamp resolution to variable and
function names is pretty standard in the kernel.
It makes the code easier to read as you don't have to keep checking the
documentation.

Cheers,
Kent.
