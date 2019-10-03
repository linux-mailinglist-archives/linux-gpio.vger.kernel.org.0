Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2682EC98BD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 09:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfJCHA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 03:00:57 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35502 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJCHA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 03:00:57 -0400
Received: by mail-ot1-f68.google.com with SMTP id z6so1385193otb.2;
        Thu, 03 Oct 2019 00:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/o7+lPyhXfByOmUhHhnpj0UsZcq/PhdEJ3X9OEuVos=;
        b=cGAI+CpzvH6ji24osSufuUM611anUhP7+s387B9wT4USHRwC7S8JbO4YIJqQZZiPSo
         /RDz93s9dArbMk2bA6p4wO4kO9VMn+0HUfFypLCAesg8SRPLAMaP1sFfLx2xHQc8GENp
         YfYI1+B0jpINQv83upFxaTFS/oJFTIPcMeVEzzaHXFvypOpMx+2yI7qVAeEAP3MYGBCo
         fZGsuiVyx0X7DjSl9DSjnNjqC62s41rPQ0w8pPmVBvdk7fDG0def2A7TixBOJyMfmT1l
         RnQeeNsOpuc1O31w/MlkvFwewpfXoVa370DS0H0+jLk0HHULfAz8lr4YPtX+jVlHFCeo
         hd1Q==
X-Gm-Message-State: APjAAAWWNMWhkZCHjqM9MIxK1l18ZKCvtRPt6fczWWZ9RPQQXTEswxpy
        INxH4Q44nStZzBNYKHXSqxxKKyJt0LxYheZDiQk=
X-Google-Smtp-Source: APXvYqzcwfXnZWydi54Y7sZbiLsX7wlhg5cibkmkIhjdQluuVqjnRFAyl/Y6NdEU98qwbgG5YYIJw+1qUq1U0Wj9Qwg=
X-Received: by 2002:a9d:6642:: with SMTP id q2mr5555345otm.250.1570086056314;
 Thu, 03 Oct 2019 00:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191002170249.17366-1-brgl@bgdev.pl> <20191002170249.17366-4-brgl@bgdev.pl>
In-Reply-To: <20191002170249.17366-4-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Oct 2019 09:00:45 +0200
Message-ID: <CAMuHMdXKXicew2iyU-09iVLuN7jAY85=grNbb3f7TSCnK14YwQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: em: use devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alban Bedel <albeu@free.fr>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC linux-renesas-soc

On Wed, Oct 2, 2019 at 7:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> There's no need to use the nocache variant of ioremap(). Switch to
> using devm_platform_ioremap_resource().
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpio-em.c
> +++ b/drivers/gpio/gpio-em.c
> @@ -269,7 +269,7 @@ static void em_gio_irq_domain_remove(void *data)
>  static int em_gio_probe(struct platform_device *pdev)
>  {
>         struct em_gio_priv *p;
> -       struct resource *io[2], *irq[2];
> +       struct resource *irq[2];
>         struct gpio_chip *gpio_chip;
>         struct irq_chip *irq_chip;
>         struct device *dev = &pdev->dev;
> @@ -285,25 +285,21 @@ static int em_gio_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, p);
>         spin_lock_init(&p->sense_lock);
>
> -       io[0] = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       io[1] = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>         irq[0] = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>         irq[1] = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
>
> -       if (!io[0] || !io[1] || !irq[0] || !irq[1]) {
> +       if (!irq[0] || !irq[1]) {
>                 dev_err(dev, "missing IRQ or IOMEM\n");
>                 return -EINVAL;
>         }
>
> -       p->base0 = devm_ioremap_nocache(dev, io[0]->start,
> -                                       resource_size(io[0]));
> -       if (!p->base0)
> -               return -ENOMEM;
> +       p->base0 = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(p->base0))
> +               return PTR_ERR(p->base0);
>
> -       p->base1 = devm_ioremap_nocache(dev, io[1]->start,
> -                                  resource_size(io[1]));
> -       if (!p->base1)
> -               return -ENOMEM;
> +       p->base1 = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(p->base1))
> +               return PTR_ERR(p->base1);
>
>         if (of_property_read_u32(dev->of_node, "ngpios", &ngpios)) {
>                 dev_err(dev, "Missing ngpios OF property\n");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
