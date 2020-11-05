Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A22E2A7CB4
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 12:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgKELNI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 06:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgKELNH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 06:13:07 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20D7C0613CF;
        Thu,  5 Nov 2020 03:13:07 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id v12so1213061pfm.13;
        Thu, 05 Nov 2020 03:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuw3NCxX1XbUVG00e3Jk6RmUo6GlRMmd3AcO4LL+Yks=;
        b=s9I4eo9qWFe/xyKMAQHpYDRVYFQKKnNdOHn88076GhJXbaJwN7sN3heP7Mke2JEvHS
         ei+Krwu3UEO9bUNF+hlwdO1V4GKvenuil3qRi00O1eOa0V/rCHM0eEBfNHwwwFAlsv5z
         62scZuPIAmkqJL13IyMqfRO//pAC9pYlbOu3vgH+Kvo/cxy7lUMlOQhzyrMLzPeSU7w3
         gWA/DPUJJCOMBHoEmd9gdKMJYMGcQmnMWkyxVbWkp1aLkg3dWvLiBCFhVwVwfvPbWBr7
         785rDGsBLuKuHjaehjyn+LqKmEHvdO1Xi73+A2VbAz6RkPCIc98pge6CvVJUPhLFdP1R
         /CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuw3NCxX1XbUVG00e3Jk6RmUo6GlRMmd3AcO4LL+Yks=;
        b=Ay57o/oO8MWJHUEBOiU6fBGe2R5SMaeLPLgOtl80S+uWWzrM1/oJwePR3kvUQxoZ4P
         In7oC3a/g9tDKyMbQTk148JnHtiid5KrO+eBtCdgM3CIj2+S7rtHwRsUuZsRhuKvLWnW
         tDyraf+AvPdclnWn7AtSNfHeyD006436vDG3R9416ZQfpKudFA9uLNc3wfEWG82Hk6/u
         OO90h1kPN2rMxb3+4ZgCUIAy8wvn44eJLUQbGkgVigWB7daHg2hsgdCcpDma72cQM/V4
         L7yKND3K60cHjvg9S01A9ahSetTS4F+C/T4QTnNZffO7epSBMMrfoug9UWmuNQH3i2IF
         Tv0Q==
X-Gm-Message-State: AOAM530BAEKqf68t1GKspDJFSIa98yhnPEVTDrbxzLJN+KZvczOWYGnK
        Lel3IKMDkSxPhLNRwBpqZyA1RL15tbvTWM/pYhK0gHNcSbBP1w==
X-Google-Smtp-Source: ABdhPJwsqxmCsLgUTazBd/x1YzIH1UkYo5WWYre3ge4qGqaLv9kEsY6k59I2DesqUG3g+LLc+0EhGdN6Q33DdNsJT4Y=
X-Received: by 2002:a17:90a:430b:: with SMTP id q11mr1968328pjg.129.1604574787291;
 Thu, 05 Nov 2020 03:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20201104230703.21466-1-coiby.xu@gmail.com> <20201104230703.21466-5-coiby.xu@gmail.com>
In-Reply-To: <20201104230703.21466-5-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 13:13:56 +0200
Message-ID: <CAHp75VfXAJjZw1nc-axWvDsZATU7AKUdUKzabdaD=WhcRKT7tw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: amd: remove debounce filter setting in
 irq type setting
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Debounce filter setting should be independent from irq type setting
> because according to the ACPI specs, there are separate arguments for
> specifying debounce timeout and irq type in GpioIo and GpioInt.

irq -> IRQ
GpioIo()
GpioInt()

> This will fix broken touchpads for Lenovo Legion-5 AMD gaming laptops
> including 15ARH05 (R7000) and R7000P whose BIOS set the debounce timeout
> to 124.8ms which led to the kernel receiving only ~7 HID reports per
> second.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
> Link: https://lore.kernel.org/linux-gpio/CAHp75VcwiGREBUJ0A06EEw-SyabqYsp%2Bdqs2DpSrhaY-2GVdAA%40mail.gmail.com/
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index e9b761c2b77a..2d4acf21117c 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -468,7 +468,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 pin_reg &= ~BIT(LEVEL_TRIG_OFF);
>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                 pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
> -               pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>                 irq_set_handler_locked(d, handle_edge_irq);
>                 break;
>
> @@ -476,7 +475,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 pin_reg &= ~BIT(LEVEL_TRIG_OFF);
>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                 pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
> -               pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>                 irq_set_handler_locked(d, handle_edge_irq);
>                 break;
>
> @@ -484,7 +482,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 pin_reg &= ~BIT(LEVEL_TRIG_OFF);
>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                 pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
> -               pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>                 irq_set_handler_locked(d, handle_edge_irq);
>                 break;
>
> @@ -492,8 +489,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                 pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
> -               pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
> -               pin_reg |= DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF;
>                 irq_set_handler_locked(d, handle_level_irq);
>                 break;
>
> @@ -501,8 +496,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
>                 pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                 pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
> -               pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
> -               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>                 irq_set_handler_locked(d, handle_level_irq);
>                 break;
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
