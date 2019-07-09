Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 538CC63B65
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 20:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfGIStj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 14:49:39 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41383 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGISti (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 14:49:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id o101so20986806ota.8;
        Tue, 09 Jul 2019 11:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhxO6zJT4kRA59/IE9s5VDYziBesrtC+fZUNEZkjtko=;
        b=gBJO1isCIiP+YinNQDOtEByiDAIVlFe0gYZMVIsSBdfCfI55vV35d08PclcbGd9xRN
         Kd5/gYW+sBZufftojyWncqoXBulOPsPpAJBJhO/AC2eJDsF1E8TKROHSCe+8LB38CC2a
         gso9qiEhckdpMTXCasR0Xps5TmKtAAlftOx0uB8DW9sq14Cu8K+ZgwHcCh+ceWpOuVAA
         XlD/SesliZVmXyZY3Xc0Jy61n5L31oLGqLHqXhWsmL8S5F2gocypJzQgbyTmWhAQpvfY
         1hbuJNWz3ffdRQhUwRwqnAlGr9WoHxCuAfzMVXRwG1Ogd4+t0OGFFDTDP7nkVmHDkJgR
         5iWg==
X-Gm-Message-State: APjAAAWTjhsl4nQ5lz/KmgOSlf4l61zDYtbiwAvry+LvkqgMpWmVzsaY
        E33lLTBNI6cLV0aSnOw4fwDLXaqFDcC2s0Zhs1Q=
X-Google-Smtp-Source: APXvYqyL3dMbX2i3nej8DK/ZmGllJsd3RJyRbEKEzUYfxJu+XFcPm+IWp2Bxk++nSFFXCeSNzisYGHWavSJL4Bp5h3A=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr3012583otc.250.1562698177652;
 Tue, 09 Jul 2019 11:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190528154601.7597-1-brgl@bgdev.pl>
In-Reply-To: <20190528154601.7597-1-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 20:49:23 +0200
Message-ID: <CAMuHMdV=eVJKVENkLUi1pj7MY8RGwUGZEt=MG4fdfvToZZquNQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: em: use the managed version of gpiochip_add_data()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, May 28, 2019 at 5:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Use the managed variant of gpiochip_add_data() and remove the call to
> gpiochip_remove().
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-em.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
> index 40f8c38bec1c..299101d25fa8 100644
> --- a/drivers/gpio/gpio-em.c
> +++ b/drivers/gpio/gpio-em.c
> @@ -359,7 +359,7 @@ static int em_gio_probe(struct platform_device *pdev)
>                 goto err1;
>         }
>
> -       ret = gpiochip_add_data(gpio_chip, p);
> +       ret = devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to add GPIO controller\n");
>                 goto err1;
> @@ -376,8 +376,6 @@ static int em_gio_remove(struct platform_device *pdev)
>  {
>         struct em_gio_priv *p = platform_get_drvdata(pdev);
>
> -       gpiochip_remove(&p->gpio_chip);
> -
>         irq_domain_remove(p->irq_domain);

On a second thought, is it safe to call irq_domain_remove() before
gpiochip_remove() (which calls gpiochip_irqchip_remove())?

>         return 0;

>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
