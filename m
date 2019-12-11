Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 978EC11A805
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbfLKJrX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:47:23 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45745 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbfLKJrX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:47:23 -0500
Received: by mail-qt1-f196.google.com with SMTP id p5so5683137qtq.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hiyz++TEh319hVLwAB2olZ/3C2yOLqYZVb+XY1KilQk=;
        b=K0vTHkkDqUMjwhEvBZKfN8nWO6Gq+mP3OWCdvbCptx81sFRmyUM0KgerbhqMu3jV9D
         vOopYWXNC+KrffHCt+N2do5gAuACQXozX80hAE5AzkIhp8yq19kVpkwxwihnMXyxPilH
         u/mKaVAIqS9LqgEcOFph1xFHHdxE0IyfHt1M2E4RQKGb3K5iQhR0NkHtFreeEsDqzbGB
         5vyp+u5tbmDt5RdyuaaQHfLg/EVX/zMELgeM4SE1f2qiNEYJ7ek5BZ0DsyFVI1vR0jZY
         J/Rk3VdsWOyVdLRf7hHACSh1EtYjikBIN+QOM24GPj6T/GmjS+bQ2k4yh2AKc3SIEj/w
         PZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hiyz++TEh319hVLwAB2olZ/3C2yOLqYZVb+XY1KilQk=;
        b=n8EYAIZ/++Cl9eTmiNYjELPU/yAWMk/lYOSJ4knSDxatAPDRBJN1Uzb1XSDY03e4uI
         pDekEg+lja+xQr+3q/AsxgJi/L0K5C44Jk6X5m2V499vE09HFkKRGH7f+oKNnEHZfMZp
         VA1tkWZ1R4hrT+9bfmtQoGZqS+XDhDDNk7m/JwGnXGgfOOrhMCxc5T80KcEnHkBZ0PKP
         2xDU1G3zUZKOgLn+y/X/T+kWmwoEHLN9fuUullJdAltTRqAfFw7GkRo73PYxluSzu8W8
         2My6pSOJSrBeCy5VbntMpvZZ+T43omgf5mPmYb+D5ZmJw18Pt6YfnyFjT4OC7HBl4KMR
         i68Q==
X-Gm-Message-State: APjAAAU7k/WulHVf6TGyN4vDUQJ6YRM2M9dbLrx9npkntpa5hvhS4e6m
        obkHHnbSZ1l/HpQZlaKprq2aY9GbJ+nsQ9gJSyeALi9Q
X-Google-Smtp-Source: APXvYqzTlkGWWRR1v92Ypk/ypsdwwJ2TBq+bGc8ObbcQkyfQ4eJv5X5RWRHNQNd/7jZeBOCrj7utzC6q4mjgEwlT/AU=
X-Received: by 2002:ac8:5208:: with SMTP id r8mr1888782qtn.131.1576057642143;
 Wed, 11 Dec 2019 01:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20191209062749.26429-1-vigneshr@ti.com>
In-Reply-To: <20191209062749.26429-1-vigneshr@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:47:11 +0100
Message-ID: <CAMpxmJVLZfvh0p0qpcS+V3Cwuv-mi6o-hO5X-JThj-T_0dOCVw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Don't hardcode irq trigger type
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 gru 2019 o 07:27 Vignesh Raghavendra <vigneshr@ti.com> napisa=C5=82=
(a):
>
> Don't hardcode irq trigger to IRQF_TRIGGER_LOW while registering IRQ
> handler. IRQ/platform core will take care of setting appropriate trigger
> type.
>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v2:
> Drop explicit call to irq_get_trigger_type() as this is take care of in c=
ore
> code.
>
>  drivers/gpio/gpio-pca953x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 6652bee01966..40e48f7d83bb 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -770,8 +770,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p, int irq_base)
>
>         ret =3D devm_request_threaded_irq(&client->dev, client->irq,
>                                         NULL, pca953x_irq_handler,
> -                                       IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> -                                       IRQF_SHARED,
> +                                       IRQF_ONESHOT | IRQF_SHARED,
>                                         dev_name(&client->dev), chip);
>         if (ret) {
>                 dev_err(&client->dev, "failed to request irq %d\n",
> --
> 2.24.0
>

Patch applied, thanks!

Bartosz
