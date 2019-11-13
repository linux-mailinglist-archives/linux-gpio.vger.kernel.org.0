Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C855EFB0C5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 13:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfKMMs7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 07:48:59 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45705 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfKMMs6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 07:48:58 -0500
Received: by mail-oi1-f196.google.com with SMTP id 14so1609885oir.12
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 04:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aRyoGXUpoQzbaPeLeIbMAp8CoHAGIRwzjTcDJSFFYbA=;
        b=eaN8D4cu3V8Se39U37bhOetVYm0oaIrgslevQieJEmBAT0Ku/zu4kV0qgy4Vae1b+j
         62bW+1TG7+nv9EV4Y59601+DdJhn7tTbSVKzEBhGEyu493W1Jx+Jdh8Njd6W02rBx0Ls
         jK/yeaVbtGr6v8uIGcA6NK+GMx54RWN03NbcIxJ4BCHzwRlO/UyBpXx4Tkrdwcb0geJS
         s6TYjRCu6eobVFYUWqcLnQF09eUbBlxw3Q0NvoxqGl7SbGt7OydDgabm0hOad5VHq1FU
         BxeqeW43MjfCFYriJmqynUH6pNSEokhAYt9Rg+NhziFaz1uyyrPAFpttlzD5jU35C8X9
         E1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aRyoGXUpoQzbaPeLeIbMAp8CoHAGIRwzjTcDJSFFYbA=;
        b=h3WLMcVgzsk6oYVyjYraU+MJ/eQAh6ASN4gm+sOQc7qZbrbtBPZgUafwBOy8T4bhrR
         QaddHJRZEDDykXRiBLOYE1NfUScPtKWvJPAalwehuB6lJKrk3nRrKleuDJZsaxN60PP1
         yLx5Xz4S7fZs8ntDGyXpL9H19O+rFN2YbjPiwCMEAETUYTNwCezIR76dFoeFs3uDBWun
         boeUiv8OgazWlWGkZoGeRE2GKJHxSOk385GjPVNSpR5RPc4dYWDFDCEWDTO/ofFYfQT1
         T1yNnAJ5LeNWBfUh7ToSW9AZtcN0bk8tPKjRrH6cMx5nx075BX/BeiuL22mzW8H1OY0F
         zyYw==
X-Gm-Message-State: APjAAAXvc7XMH9zx4OsL85MW774u02aeGvPDcCaxEYTFD9FeHAfMLjJX
        SiVzFQoPgGE1+1NzLn1AFKtDqt6AdFMbjLQiQi/4rg==
X-Google-Smtp-Source: APXvYqyEFsQQTl6eUUaj0CeWJkYCu7CvPeKiWcJU/QOSAhzosed2y5eUxtS1GFj2iv2ME2jzUVJnLHiug20hW3xfemA=
X-Received: by 2002:aca:451:: with SMTP id 78mr3352328oie.170.1573649336925;
 Wed, 13 Nov 2019 04:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20191113101103.27821-1-geert+renesas@glider.be>
In-Reply-To: <20191113101103.27821-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 13 Nov 2019 13:48:45 +0100
Message-ID: <CAMpxmJVLyBnMWqpggke0TJVH0pGUVpZyqR1E+doxgOhR=sUPNw@mail.gmail.com>
Subject: Re: [PATCH] gpio: em: Use platform_get_irq() to obtain interrupts
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 13 lis 2019 o 11:11 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> Use the platform_get_irq() helper instead of handling resources
> directly.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/gpio/gpio-em.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
> index adc281daacff4896..17a243c528adeaf8 100644
> --- a/drivers/gpio/gpio-em.c
> +++ b/drivers/gpio/gpio-em.c
> @@ -269,13 +269,12 @@ static void em_gio_irq_domain_remove(void *data)
>  static int em_gio_probe(struct platform_device *pdev)
>  {
>         struct em_gio_priv *p;
> -       struct resource *irq[2];
>         struct gpio_chip *gpio_chip;
>         struct irq_chip *irq_chip;
>         struct device *dev =3D &pdev->dev;
>         const char *name =3D dev_name(dev);
>         unsigned int ngpios;
> -       int ret;
> +       int irq[2], ret;
>
>         p =3D devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
>         if (!p)
> @@ -285,13 +284,13 @@ static int em_gio_probe(struct platform_device *pde=
v)
>         platform_set_drvdata(pdev, p);
>         spin_lock_init(&p->sense_lock);
>
> -       irq[0] =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -       irq[1] =3D platform_get_resource(pdev, IORESOURCE_IRQ, 1);
> +       irq[0] =3D platform_get_irq(pdev, 0);
> +       if (irq[0] < 0)
> +               return irq[0];
>
> -       if (!irq[0] || !irq[1]) {
> -               dev_err(dev, "missing IRQ or IOMEM\n");
> -               return -EINVAL;
> -       }
> +       irq[1] =3D platform_get_irq(pdev, 1);
> +       if (irq[1] < 0)
> +               return irq[1];
>
>         p->base0 =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(p->base0))
> @@ -342,14 +341,12 @@ static int em_gio_probe(struct platform_device *pde=
v)
>         if (ret)
>                 return ret;
>
> -       if (devm_request_irq(dev, irq[0]->start,
> -                            em_gio_irq_handler, 0, name, p)) {
> +       if (devm_request_irq(dev, irq[0], em_gio_irq_handler, 0, name, p)=
) {
>                 dev_err(dev, "failed to request low IRQ\n");
>                 return -ENOENT;
>         }
>
> -       if (devm_request_irq(dev, irq[1]->start,
> -                            em_gio_irq_handler, 0, name, p)) {
> +       if (devm_request_irq(dev, irq[1], em_gio_irq_handler, 0, name, p)=
) {
>                 dev_err(dev, "failed to request high IRQ\n");
>                 return -ENOENT;
>         }
> --
> 2.17.1
>

Queued for v5.5, thanks!

Bartosz
