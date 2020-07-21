Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7598B227DE4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 12:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729495AbgGUKzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 06:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729482AbgGUKzy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 06:55:54 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D18C061794;
        Tue, 21 Jul 2020 03:55:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x9so10107706plr.2;
        Tue, 21 Jul 2020 03:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eYzySZTOlr+JZt7Rtk5EM6Eczpv1B0xy2HoZhPH/9z4=;
        b=lEqYbpGzJLgH71gwQKqfSqiMcyHve7Bz+0c+FZdDEDB5XsAa4t7SpOz4VL2zIPv9ew
         IR3xRmozg4FBJrzh9+tknzN4KG3x/IsBmtqxAE+/ZvaVbpN4n/f9Kg+HXlLbu2pzm2jT
         mMMyL6GWj/FmjKiLFkByNewNirrSc1xuVqfsjQ4b1Ix5ovZmY/Vy3z4DUaPTCKAihpWo
         YX3EKmsZzEAbCcR719cKqX6tgt47eS8jR/IhkYpNhGDUOzKgik3YcNObfa/hWots4xG8
         Tzj88ddU2rlbWRy7Tzhn9A0/TTzb+1DTffsyGmSoXPWDujvKjmQNDoXibvQRPQ5eCXcT
         1yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYzySZTOlr+JZt7Rtk5EM6Eczpv1B0xy2HoZhPH/9z4=;
        b=KzHaZgF0AY8rpL32nNiH3hcClhUi43mR0lUJM2wDrKgsyCSSPUpGp4uConTfCSbok+
         Scto+kzNCvQGxq4bM3ss7iURXI1wQqB5D0LQjvmUaNemvubG/Cc71Ss/iFwFwJpaktFy
         ToejyRa8L1/L5eM38lBFDErx94Rfh6exc93IajWH1n5QjyLe0cnGgh2DjeHO6HP5UseC
         vSx1UIuhsuM4VHVn3cTuM1dj+d6sno8HW1xxXxLFE++q3HczIR2oe/SumpvTNMA+ovyy
         P4tdfnKEBir3STENPNRzj7qzq7L21sEUhfNOOKNAcXw1awLnFVP249bY/mfsDorlgL1Z
         SWGA==
X-Gm-Message-State: AOAM533VlgTurSVyVHRcUT5ej6+UqSCMPzQy3LY42L5WxmKhHiS5nFRW
        N4HDevg1Q2Qag2B7q0ENZuSTH4g0xhDXn7BKpnY=
X-Google-Smtp-Source: ABdhPJxvUeCIGy4Tmj8MwKxt+uuKI04Wb4ZEWJYwgOY+En3pergbwustfKJIaY607vnoP9kCkyJv4yHdkxaYxgoB4Y8=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr21857873plv.255.1595328953380;
 Tue, 21 Jul 2020 03:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200721103634.2939493-1-abanoubsameh@protonmail.com> <20200721103634.2939493-2-abanoubsameh@protonmail.com>
In-Reply-To: <20200721103634.2939493-2-abanoubsameh@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 13:55:39 +0300
Message-ID: <CAHp75VehVVJ+1Lvo2EAGpp-e7wAG6qnCUmkKQ6Bd-CXx0VfBtw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fixed some coding style issues in gpiolib files
To:     Abanoub Sameh <abanoubsameh8@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks, my comments below.


On Tue, Jul 21, 2020 at 1:41 PM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:

Commit message is missed on why you did all these changes.

...

>         if (pin <= 255) {
>                 char ev_name[5];
> +
>                 sprintf(ev_name, "_%c%02hhX",
>                         agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
>                         pin);

Should be a separate patch.

...

>                 dev_err(chip->parent,
> -                       "Failed to install GPIO OpRegion handler\n");
> +                       "Failed to install GPIO OpRegion handler\n");
Make it simple in one line.

Also a separate patch.

...

> @@ -316,9 +316,8 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
>         desc = of_get_named_gpiod_flags(node, propname,
>                                         index, &flags);
>
> -       if (!desc || IS_ERR(desc)) {
> +       if (!desc || IS_ERR(desc))
>                 return desc;
> -       }

Also a separate patch.

...

> @@ -974,6 +974,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
>         if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
>             && le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
>                 int level = gpiod_get_value_cansleep(le->desc);
> +
>                 if (level)
>                         /* Emit low-to-high event */
>                         ge.id = GPIOEVENT_EVENT_RISING_EDGE;

This can be unified with a patch against gpiolib-acpi.

...

> -       if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> +       if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2)
>                 return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> -       }

Unify with the patch above removing {}.

>         /* If a parent irqdomain is provided, let's build a hierarchy */
>         if (gpiochip_hierarchy_is_hierarchical(gc)) {
>                 int ret = gpiochip_hierarchy_add_domain(gc);
> +
>                 if (ret)
>                         return ret;

Similar as above.

And so on...

-- 
With Best Regards,
Andy Shevchenko
