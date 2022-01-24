Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69352497A27
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 09:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242128AbiAXIVE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 03:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236188AbiAXIVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 03:21:01 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9D4C06173B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 00:21:00 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id b13so55315803edn.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 00:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAMMEDZZzMf+LhDFVyfybnNEp9s+ZQbRnxY43yAdhBc=;
        b=cen5QV0takQ/mGGbfXpus9s9nmPQ0K5oChBYcINSq+KSi0jx3B2m1/GxFO8heFiIKM
         R8up/UGScUZ4gyY9ifgTbmV/MWlK3Cl/yf0IIOeJOcHESguecoanMyw87+Tfh4vmotSJ
         jR39o4WbfGLaGjB+kXKj/RvG7YZStUl3yplJ1dT3Spu2QARb9gSrAmFwWblomHy26HbY
         Ao5WcLskmsOstsI9VMU0hJqCpuEj/DtmZCUGwQjq6j1xiu2uxJKQKJ+vnXKI3A0Oxbf1
         LPnJwLUeF4Z973iyk7zkFyLoN/Ym6HaOkelDPyEaYHS1rkGW8fG7SWl2skRunbHpgk1N
         symw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAMMEDZZzMf+LhDFVyfybnNEp9s+ZQbRnxY43yAdhBc=;
        b=CpRA10XSxWqHvzt0zNTS73DwTFHUPsJdx9V0FTIXU/RIwCdJ1A9yWK548OPleB3Agm
         tRoUezbo3li+E2YSQqvn5wkNjqVrEggQZwrwQSrVXYMXagHQ65Rc4pBmHVYKsiN5oDDt
         et4t5NUbOQLMJ7nujN18tckFC0Zadfd4j2/K6wLaKVMsfPqkjFpYUeTKeYxZ4waBuXRl
         E0TsEVH0BpaHmbNZlfMHV5MfQso3aWE6NXZG82YFG2l+ZrcmmwbeQzlCKRXHjVmEedYa
         n3Q5g5Fv3Q8PpFTomXhD7d0dQYvUnjrpk0ObD77mrc6uQhT4BuKbt9Akl67T+EjClIRN
         Fs1A==
X-Gm-Message-State: AOAM5320Iw1X0BVJTcEX3ZhedrmxLnWw/p+F68H2jVZLN8UMdsQEpgV8
        vVTpAnZFFp7JHAaly2Pd7vIPQNj9SxqMgQ5UUfeh2XyYVTE=
X-Google-Smtp-Source: ABdhPJxzLY7SmmusgtbKJ4wR7DmJ47bk3SEXPPOZ8MDHu+7tOCsvOmwszITt5o6T4LlhbuP1S/utZ1cNmjFYxdelIyQ=
X-Received: by 2002:a05:6402:299a:: with SMTP id eq26mr14792410edb.373.1643012459359;
 Mon, 24 Jan 2022 00:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20220120194948.1138813-1-brgl@bgdev.pl> <20220120221812.GA8128@sol>
In-Reply-To: <20220120221812.GA8128@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 24 Jan 2022 09:20:48 +0100
Message-ID: <CAMRc=Mek4QbY-_MeXyV5nOeJ=_QrPYKBdeb-ms29ecV0D6Opwg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: check the label length when setting up device properties
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 20, 2022 at 11:18 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jan 20, 2022 at 08:49:48PM +0100, Bartosz Golaszewski wrote:
> > If the user-space sets the chip label to an empty string - we should
> > check the length and assign the default name or otherwise line hogs
> > will not be properly attached.
> >
>
> "assign" -> "not override"?
>
> Cheers,
> Kent.
>
> > Fixes: cb8c474e79be ("gpio: sim: new testing module")
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  drivers/gpio/gpio-sim.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> > index 838bbfed11d3..04b137eca8da 100644
> > --- a/drivers/gpio/gpio-sim.c
> > +++ b/drivers/gpio/gpio-sim.c
> > @@ -816,7 +816,7 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
> >
> >       properties[prop_idx++] = PROPERTY_ENTRY_U32("ngpios", bank->num_lines);
> >
> > -     if (bank->label)
> > +     if (bank->label && (strlen(bank->label) > 0))
> >               properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
> >                                                              bank->label);
> >
> > --
> > 2.30.1
> >

Fixed when applying.

Bart
