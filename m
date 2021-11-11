Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FD144DCC3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhKKUzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbhKKUzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:55:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E7DC061766;
        Thu, 11 Nov 2021 12:52:51 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v11so29121583edc.9;
        Thu, 11 Nov 2021 12:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+cH2C9yE0ExULKUHaMROMM0VBkg0fGYZ9rM73cKix5c=;
        b=T7O1uOUe315mXHviJDLpkRBg/Yx/qOeG3AapEahRvLMZWAgPsw5Nh6ox5EcjBQy+FW
         74SwRG7xTthrKCr4GzW6wsiDpc1oHwzB8XtTFpPqNvMrlBKCrX3/1cMpgDZCse1uCuMv
         Qqwc3WeI6zA8JdHiSwmgb/4deLvH6/nLWHSeykTqBaRVxbNlzdkRXr8Y94cpRYlG+ilS
         YyhJGIAm30Usmcp2DmA9/CrkcpHxcRovYeoK9HxLgr4u5QWEDQY+h4bTSM5+Po9q6Mhg
         9K8YvFKyTFDCsIpUZ44XuX9WD8K8yHGK6GwuEOOUrY4jQNV1SppboyeY2/iT40AeqrdL
         cOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+cH2C9yE0ExULKUHaMROMM0VBkg0fGYZ9rM73cKix5c=;
        b=UJkgu8mBHHXrojdqGA1Q//3k8Wrv6cHQhQ7SHZiiD3KRYjTAtMnwR9rsI7ihjuRwPO
         k/hdQgOJnp5ENSBGrwMvk7mILOaxC3vGjtKrlDyuUGZ7/Xl/W/EbjJ3w3mOh9u3svbZY
         4yjpHK2Z1Lbk+P+5YAQ1ZWXvChvJOyH2t/qogP1J9RFrRzuGbofMnhonN6yhnpJGCNyU
         I5z8AVGz9mhK1aGGzRf9LC5ZgVknDr+pb6OnOx1NGgClsOIB+bQK4079h03bHlp1Rvkm
         IGtclw12JkONO8wwtatAQrw8DkUs455qnzCK9xwR849WCe/LzQsfBqnVADeh7nQTucTs
         uWmw==
X-Gm-Message-State: AOAM533UoTzmDnmH5aezdd11qJeEiO29P83O/wwmlDvd61hLX6U7A8NC
        Tz7SrNRJ5Rc/XIcv8VjYNVLvjhXW8DHI6Y5Vogw=
X-Google-Smtp-Source: ABdhPJzd8qEf0x4N/Rqh1rNtUw3sXbbupr8iVLjo1ia6gxg7clP9BXqjtcf1NtzC/u+jB+aTSIlx8+e0VHI99jpqVy8=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr12519897ejb.377.1636663969693;
 Thu, 11 Nov 2021 12:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211110225808.16388-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211110225808.16388-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Nov 2021 22:52:06 +0200
Message-ID: <CAHp75VcM-BWoLmS8yBm9uVcbUb6bZr--+m5qXx=WFe024sWJoQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/7] gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 12:59 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Number of GPIO IRQ's supported by the chip is not always

supported GPIO IRQs by the chip

> equal to the number of GPIO pins. For example on Renesas RZ/G2L
> SoC where it has GPIO0-122 pins but at a give point a maximum
> of only 32 GPIO pins can be used as IRQ lines in the IRQC domain.
>
> This patch adds ngirq member to struct gpio_irq_chip and passes
> this as a size to irq_domain_create_hierarchy()/irq_domain_create_simple()
> if it is being set in the driver otherwise fallbacks to using ngpio.

...

>         gc->irq.domain = irq_domain_create_hierarchy(
>                 gc->irq.parent_domain,
>                 0,
> -               gc->ngpio,
> +               gc->irq.ngirq ? gc->irq.ngirq : gc->ngpio,

You may use ?: instead as it's done somewhere else in this module.

>                 gc->irq.fwnode,
>                 &gc->irq.child_irq_domain_ops,
>                 gc);

...

>                 gc->irq.domain = irq_domain_create_simple(fwnode,
> -                       gc->ngpio,
> +                       gc->irq.ngirq ? gc->irq.ngirq : gc->ngpio,

Ditto.

>                         gc->irq.first,
>                         gc->irq.domain_ops ?: &gpiochip_domain_ops,

(^^^ You see?)

>                         gc);

...

> +       /**
> +        * @ngirq:
> +        *
> +        * The number of GPIO IRQ's handled by this IRQ domain; usually is

handled GPIO IRQs

> +        * equal to ngpio

Missed period.

> +        */

-- 
With Best Regards,
Andy Shevchenko
