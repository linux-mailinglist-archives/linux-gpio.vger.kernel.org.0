Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0674E4A32FA
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 02:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353622AbiA3BIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 20:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233927AbiA3BIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 20:08:51 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5769C06173B
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:08:50 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id m6so29634319ybc.9
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=02uHw9l58hh+muQ0KbMFsY5uF5yxmJgiUPQGP+bydes=;
        b=SFWZj0gBP6IRp9aDFoy+xQUE8PPySKJ2umdyyTH0/76Ude/Sa/8rlfSvjRzOSZuCe1
         oI6l+vseIe7/wXn6K3j1gw7WNCxH2Kb6dO46ZlmI9ZtUvV+Xsci0jYIZiVFh/GorOMWY
         XW+NSPF5dIGmv7XqLzUPcuOmN6fqf3R1AombzO9zj2ZVhbhC3PDzYow+rhUZR7RFqf6I
         DhuknS+cFKrmSjx+0En68Njj7Y9UjJhPu1duqbPCjKZyVWgmstU+nKDqpMZIbfbptud0
         /yxVS1IUB97IlmE3oa8oTm2CACbtR/U9NOnRpqMQVCt6hx7VqsEcmAoR2bJUzhPGhRKB
         s55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=02uHw9l58hh+muQ0KbMFsY5uF5yxmJgiUPQGP+bydes=;
        b=7WBLXrxUw0cTIoU225kCzvLl94gX+BqbS+dk3szEvWANGSObUccvng+1dwKiO2bj3a
         OJ7yk0HvvZ31hWaNybGG16o5bDRNd1FXaEWY3uMCg9XN7crnTe+QYmZcFPFYHIq6B6NN
         K0/W7yZCuTK6WCdAC4RwyPeaZkbQDM+DODYGNmLMii7uVqRhStQlMIn4qycwueFvfcft
         6Owww7yH2Eyjp/O+zAZhVOJ3ZXC1BmrM2AesXKeGO2hlrLDKIpYSeLTy0lh6VdCXmJtD
         i3x6sGLntyhiKZfEaOuVmV/VLYDSN3ZQe/SlZ6hWVvyDkDFlZmHyTMcOSQsjJ27lEv1s
         fwyw==
X-Gm-Message-State: AOAM5316MpXucUFZEO24BsxUJuSaZKGFGbEZ3NVOAXwywYiqm/XLy0eq
        x+FnPI3z5mevo2WiGR83C3k5LDVVaiWc7upy6H0QhQ==
X-Google-Smtp-Source: ABdhPJyxe/T6VMm8ymvO6Ahfr5MEhtC4jE74F8HctHiIiYxrOIhRbLOh6y0Ddd9fyCHF8SU029pA7zW3pKDOLCSxsdo=
X-Received: by 2002:a05:6902:124a:: with SMTP id t10mr20237420ybu.634.1643504929797;
 Sat, 29 Jan 2022 17:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20220119160715.650535-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20220119160715.650535-1-nikita.yoush@cogentembedded.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:08:38 +0100
Message-ID: <CACRpkdZ2rBii88APKacg=LyVY-9m9pxM5z08YawkvjuWmjSJrA@mail.gmail.com>
Subject: Re: [PATCH/RFC] gpiolib: create irq_domain hierarchy bottom if possible
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 19, 2022 at 5:07 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:

> Currently, gpiolib creates irq_domain compatible with hierarchical API
> only when interrupts provided by gpiochip lay on top of existing
> hierarchy. Otherwise, legacy API is used.
>
> With this patch, as soon as
> - irq_domain hierarchical API is enabled in the kernel config,
> - chip driver does not request preallocated interrupt numbers,
> - chip driver does not provide it's own irq_domain_ops,
> - chip driver provides fwnode, either explicitly or via it's struct
>   device,
> irq_domain created by gpiolib will use hierarchical API even without
> parent.
>
> This allows other irqchips to lay on top of this irq_domain.

I see what you're trying to do, but we definitely need Marc Z to
provide review for this patch before we merge it.

> @@ -1095,14 +1095,6 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
(...)
> +       if (d->parent) {

You have just put a big if (d->parent) around 95% of the code, invent
a different
function name and make that do what you want if parent is set, or just
inline the code you need for that case.

>  static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
>  {
> -       return !!gc->irq.parent_domain;
> +       if (gc->irq.parent_domain)
> +               return true;    /* will add to existing hierarchy */

OK the old case...

> +       if (!gc->irq.first && !gc->irq.domain_ops &&
> +           (gc->irq.fwnode || dev_fwnode(&gc->gpiodev->dev)))
> +               return true;    /* will create hierarchy bottom */

This will turn a *lot* of GPIO chips created with this helper
into hierarchical root controllers.

Is this really the right thing to do? (Marc?)

Yours,
Linus Walleij
