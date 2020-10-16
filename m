Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8922906DE
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408640AbgJPOMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 10:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408570AbgJPOMe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 10:12:34 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B00C061755;
        Fri, 16 Oct 2020 07:12:34 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w21so1575634pfc.7;
        Fri, 16 Oct 2020 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WeJBT440qxGlWoOHusH1/zQt+ShlV28y2KKBM8Hjk6E=;
        b=oNtP+ujg/ola3c0AjurY3soFKGDNIxJrL3i4VvoYBWoUeqQkoJ9ULSwzC3RjeSp6K0
         mWrAih9qEXpoVtWIU0xAPTa5haWASD5MARoVoHxxfHlihRhERSlaDNKRfG/Qmxf03W7P
         4Un/hYYzblZITTdVTJjxAWx1ufvirRaTh2sVHmwPIHAY87SC4Dxh8Ddqc63o0BGILuB/
         ZK0D3lCkhi01DAwW3xsCGAT5FoUqNwtIwVjsJ1Uhqz3sAiNaoZGyRyeBZfxo2uO/o/O+
         Dv2GUIeWd5JD2bmWV6Pj6e3Y7TqFz4vylXrMqykp4oE6/4CyPWFiU6khPpgSTMN8MYzg
         kTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WeJBT440qxGlWoOHusH1/zQt+ShlV28y2KKBM8Hjk6E=;
        b=IDjm2jyD0XD6QOEYDRE/MPPAL0bxpBGwgH23ExmPikIxFDMSYfNOTfdFcoQKTx0X+t
         5B6aUMKMo8djMgMjotp8YxqJEPZqnnDkuazd7VZiD80nMXngJAs6ColEd3DpSjo3MpDX
         R69ydEaDTP7dzC7BDo1oQ0BBGyjd+CsmE/vnaqej2hiw3wOvchVZBwGQWgGQVq5wpQ8i
         a2xuwty+g8JH0RMLGKASIkWtoyt9DdbmN0i/sXphHxkASfO+EoJRWLcCEiqZ1DJF5P0Q
         YaruCilDSnnmoG8BAagnY9TTs7pZL+0SBgYmBcN+r1R9/QuFIpxc2fC008AEN9Na19nF
         Yb+g==
X-Gm-Message-State: AOAM532vnUuPI9k7dUoZfCsXB1ApdTTx62MXd+J+EjDFRWddzqvguSsn
        zmE2OrnAOcOY6r6/69CSaIALYyMUSnsqh5myPfg=
X-Google-Smtp-Source: ABdhPJx96m5FGgQj2qTgKwgmsWldccnNoDxBn9KwwuAFHi+iWmxsYquSLTJ/dgTiKzVW9DdGP6ySFvKwlx2Z2NTM94A=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr3986342pfn.73.1602857553516; Fri, 16
 Oct 2020 07:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201014231158.34117-1-warthog618@gmail.com> <20201014231158.34117-2-warthog618@gmail.com>
In-Reply-To: <20201014231158.34117-2-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Oct 2020 17:13:22 +0300
Message-ID: <CAHp75VcAf8i=jEdDFntpDfLBDMWoJh+ykHBTBRX53B9L+yFNUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 6:53 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Using CLOCK_REALTIME as the source for event timestamps is crucial for
> some specific applications, particularly those requiring timetamps
> relative to a PTP clock, so provide an option to switch the event
> timestamp source from the default CLOCK_MONOTONIC to CLOCK_REALTIME.
>
> Note that CLOCK_REALTIME was the default source clock for GPIO until
> Linux 5.7 when it was changed to CLOCK_MONOTONIC due to issues with the
> shifting of the realtime clock.
> Providing this option maintains the CLOCK_MONOTONIC as the default,
> while also providing a path forward for those dependent on the pre-5.7
> behaviour.

...

>          GPIO_V2_LINE_DIRECTION_FLAGS | \
>          GPIO_V2_LINE_DRIVE_FLAGS | \
>          GPIO_V2_LINE_EDGE_FLAGS | \
> +        GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \

Wondering if we would have something like

          GPIO_V2_LINE_CLOCK_FLAGS | \

here for the sake of consistency.

>          GPIO_V2_LINE_BIAS_FLAGS)

...

> +static u64 line_event_timestamp(struct line *line)
> +{

> +       if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))

I dunno if we can actually drop the word EVENT from these definitions.
I don't think we would have in the near future something similar for
the non-event data.

> +               return ktime_get_real_ns();
> +
> +       return ktime_get_ns();
> +}

In general it looks good, thanks!

-- 
With Best Regards,
Andy Shevchenko
