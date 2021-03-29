Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F83C34D277
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 16:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhC2OhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhC2Og5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 10:36:57 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D4CC061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:36:57 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v10so4637658pfn.5
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rdR7frvJefcL0FQw3bmE0MjP3OOGuDZEDjrhAmWHsOA=;
        b=N32xVZLAlEsCkATlJbu76YVk+i/FiU+pW7aDXSHcDnUDt8e1X52KZ8eoe3ncPUalNU
         h4d+hazFLrTEswDNqVMh11bAuycYWroQZn8UfoC32Kw574HQ6eBpkofzSFrOxp9cSw/z
         axN5mV3FTLmk/4Kob3Oht6RKxy+fvsVq2lsR9TNPS9kRVXmjQtnat7jWFy9/RdnHByLt
         W3CPJuira6oqGVvSup4aYB3itP4HcgJIpv471QmNntNQGdGeMzS4CuwoknJTkneyl9jm
         aQ/xQUL7M5R5ZD4v4oxPJZC9Au9hxn2oIVacbnlXu+kQOR9zZtnID6TPMFq7k/+7shRp
         5/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdR7frvJefcL0FQw3bmE0MjP3OOGuDZEDjrhAmWHsOA=;
        b=Nn1zCGEXDW1gJt7irdnXRhsKI40H6kUrUX6rC2CXeMgFRZR5ztb9r231JwA9eH7rMl
         5SeEe8jCMjj/fYgcUytVCrxnNdJbmN+hBK0ExZOO/jKHhra2tOdnRdY7iKXE+v/ZQT+6
         DoXp5+7wMd/bVrBtdLdN9eUWoT7VOr2qfGDbYEyQRz2FR/fvrpg5qHDVnnrjuFRQ7NDo
         kpvG5uOMcy26Ji4BA6Q2/eNNG71AA9v/eQXzqwJrNps0RztVdnWyT/dtpQ3dzisUtvzZ
         QJKf6PVfgBVrk8kC0wt68lLCNvkFomjF3rEHwetQRXTDl86KBVBzt37Xs3JpOzTFW9DC
         WYGg==
X-Gm-Message-State: AOAM531N1oEoTuRqJM7XgDbJb8sfnhlbWunS+BpaTI24HHL5VRzlsALd
        KMQXWvfjlwzrJ/OmTrj/z6fw7VvzzmhJ8ApzwUQ=
X-Google-Smtp-Source: ABdhPJw8mgr+1AgodCD6U6NghxTUb5M/oQuCO6cjdLT6qPpVa5vaLHLrnEIW97wfqEJmXF4PXFb/0qsBvA+j7Rh3u30=
X-Received: by 2002:a63:c48:: with SMTP id 8mr2148125pgm.74.1617028617017;
 Mon, 29 Mar 2021 07:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VfFfJ8g-mHSneNbk4ujDdTbfu3CypSY_e106+3jhS6SWA@mail.gmail.com>
 <CACRpkdY_uNpeg9Y6k0NeKPxV14Nd3rJ1faFtrKs-16PZ8=boGg@mail.gmail.com>
In-Reply-To: <CACRpkdY_uNpeg9Y6k0NeKPxV14Nd3rJ1faFtrKs-16PZ8=boGg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 17:36:40 +0300
Message-ID: <CAHp75Ve584UmwG6EWVewcp8N49yXPEp2hMCidVnRzS-g9JHrWQ@mail.gmail.com>
Subject: Re: gpio_is_valid()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 4:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Mar 29, 2021 at 12:50 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Anybody to shed a light why we have two stubs of gpio_is_valid() and
> > one actual declaration?
> > % git grep -n -w gpio_is_valid -- include/
> > include/asm-generic/gpio.h:44:static inline bool gpio_is_valid(int number)
> > include/asm-generic/gpio.h:143:static inline bool gpio_is_valid(int number)
> > include/linux/gpio.h:109:static inline bool gpio_is_valid(int number)
>
> Remnants from "generic GPIO" where some custom platform would have
> a custom implementation (and semantic!) while using the same
> API.
>
> include/linux/gpio.h:109 - this is just a stub !CONFIG_GPIOLIB
>
> include/asm-generic/gpio.h:44 - this one is used if CONFIG_GPIOLIB
>
> This is for all "normal" GPIO providers and consumers, end of
> story.
>
> include/asm-generic/gpio.h:143 - this one is used of !CONFIG_GPIOLIB
> but only <asm/gpio.h> is included, meaning the system has a
> private implementation of the symbols, not those from GPIOLIB.

Aha, thanks for elaboration!

> It makes sense if you realize there are GPIO drivers that only include
> <asm/gpio.h> and does not include <linux/gpio.h>. But I wonder if
> there still are? (Unfortunately I think so, used to be some weird archs
> and some minor ARM systems.)

The files so far that include asm/gpio.h

Documentation/translations/zh_CN/gpio.txt
drivers/gpio/Kconfig
include/asm-generic/gpio.h
include/linux/gpio.h

> Generic GPIO was probably not a very good idea, I think at the time
> it was a compromise for making custom implementations migrate
> to the generic implementation over time.
>
> I think it is actually gone now! We can probably delete:
> arch/arm/include/asm/gpio.h
> include/asm-generic/gpio.h
>
> And just move the remaining stubs into <linux/gpio.h>.
>
> Interested in the job or should I take a stab at it? :D

I think it's you who understands the area better.
I missed (I hope *fortunately*) the legacy GPIO APIs.

-- 
With Best Regards,
Andy Shevchenko
