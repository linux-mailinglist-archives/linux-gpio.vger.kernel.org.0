Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBCCB68049
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jul 2019 18:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfGNQmc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Jul 2019 12:42:32 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40046 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbfGNQmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Jul 2019 12:42:32 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so6586807pgj.7;
        Sun, 14 Jul 2019 09:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J5dS/JXowkdv5WB/Z8jomVaxmm5qYX5+tOsJ5uovcWo=;
        b=gdP2kbqMMoC7Yradyph/t591dpaznz9iKJ5+x6jJzV/IoqdC0iFcPvP+4/3u/22MHi
         lV227N75DwfboolGPdqPP5WHrIzmH9q/PxAob4p9+DxylrHrtw5S04wdvATuGjgzguZV
         wfa8Zh85Vi9sdscFCvrezOX59rKGYGyaMrVwgdQviQrfXLVaBodV3s8/iIOJDIc/5ih9
         PEUBS5HKK9/gRSYft2BXkuCbKOugRSK3sqSLUcfwHn4u+M2lRZMI9G3okugGjqwkIfmd
         tWjH+0uAUNN5C0Y8CVXjvxra7yrpwMJa82N2eaUVGpsN6sbASRC2nLER8XuxdHBN9JWL
         MUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J5dS/JXowkdv5WB/Z8jomVaxmm5qYX5+tOsJ5uovcWo=;
        b=mDDGVceiykkO2PYs9Q5hyxS8I0fXivnyl2VikxB4Cuz5GOx6095MVmrXXHpuElbUh9
         qMxw8CZrffsMNP4d4AocYqo+bON3A13499QqtIqCP3irMfh8JYMzg9s+2IiMOJbMTnyj
         SdP3+kt9p/VkICcwDCKnnyhksQWByF8HUInHhdMc5cf6jdHntoFNr65MJL68YpXGMKZT
         tIByKKC96WDVbePiORrdFlsXyOl0dqT3x0emf9kB6TPKwIOZiJ8CR7H8t3P3i0h1PRAA
         FIwHLHNtAEmZyocV4XsAqgXv3yNouiVxIAXPj8CbSlmHsds3Xw1oy88qnPkx8hcVlonY
         +6Nw==
X-Gm-Message-State: APjAAAW6WDJHu3L1dAez9rTTXZIaU+8sy4vm+MZS1DafJFWPg8BQPGXL
        t8Joyu3tFiRfCZjrEFxAsT1M/7B77FmUL/fghjUvGI5qg+g=
X-Google-Smtp-Source: APXvYqz1DuJaXVd1wmozaCRu3gWM97LBH+4Mr5CDWdloZK/5lW8TrgjBHdSsR6YWLBGvEy/C/iTRFfLQ4x9XnqUIXq0=
X-Received: by 2002:a63:6eca:: with SMTP id j193mr21987456pgc.74.1563122551548;
 Sun, 14 Jul 2019 09:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190704062725.50400-1-yuehaibing@huawei.com> <603661e6-8694-4787-6cee-61cc6ba61fc2@metux.net>
In-Reply-To: <603661e6-8694-4787-6cee-61cc6ba61fc2@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jul 2019 19:42:20 +0300
Message-ID: <CAHp75VciMooaw9QXSsSBXV_DdMPjvmc2PL+RAPehT1_VuZEvCA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Fix PCENGINES_APU2 Kconfig warning
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 8, 2019 at 1:43 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 04.07.19 08:27, YueHaibing wrote:
> > Fix Kconfig warning for PCENGINES_APU2 symbol:
> >
> > WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
> >   Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
> >   Selected by [y]:
> >   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
> >
> > WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
> >   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
> >   Selected by [y]:
> >   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
> >
> > Add GPIOLIB dependency to fix it.
>

Applied.

> hmm, I'm not really happy w/ the kernel config system at that point:
>
> If the select on the gpio driver would just subsequently enable gpiolib,
> everything would be fine. But that contradicts how subsystems are
> currently handled - you first have to enable gpio subsystem before
> choosing anything that depends on it :(
>
> Could it make sense to refactor gpiolib in a way that pieces directly
> needed by gpio consumers or drivers (hmm, perhaps have separate
> dependency symbols for consumer vs driver) can be selected directly,
> even if the big gpio subsystem knob is disabled ? (but the other things
> like userland interfaces would remain disabled) ?
>
> OTOH, for this particular patch:
>

> Ack-By: Enrico Weigelt <info@metux.net>

Patchwork doesn't recognize non-standard tags, thus the patch went
without it to the upstream.

>
>
> --mtx
>
> --
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287



-- 
With Best Regards,
Andy Shevchenko
