Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A639AE1E91
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 16:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391231AbfJWOtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 10:49:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41891 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389782AbfJWOtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 10:49:24 -0400
Received: by mail-oi1-f195.google.com with SMTP id g81so17591761oib.8
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O9ox2pve6NHLhmzZq/Et8NzVsXtqJowAf4+8XmKRml8=;
        b=dAsNYaoPoa0FVkpWQ+Mw+OCElmBkuYpU/+5PWViTjpSeETA9ynnP/Lnu5J8g+tEwPl
         Z6CcJN9xhR5BUDtYeZo9pCcZcWgrjwimMU2rLTLsvOJ7Grm6/FgwwLndipgusj6dfSHe
         uvZCqwqAuX/HwaHmKgRe7nqV6abw2AgJEO2HQsn5NNKSWdI+nMJ2dQj1aHZSNuvlxxkC
         r7kOEy01YoQHDzoqp0/Pvv9vKFOrtdAqF8yY0wKKCS2JrckS1rrpCWE1NOplPVKbjQCn
         igGlIMe9VeUAHKuVbdq2nCkNNzar9KcKo+925snr22p2nkRwUyxsNlcn9/dBY+O5puWd
         DFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O9ox2pve6NHLhmzZq/Et8NzVsXtqJowAf4+8XmKRml8=;
        b=NoN7M3gHoSVhV4GwZR9J6ukewdOBdYJj3c2AVZgFd5tg4SlNMuRQ7JNLkfmj6g9qko
         sQ4CPbr9NiAGiDdHUylvVlSaDKkxy/2OSIrkalvhW2iOc+aK7dXZYoAgU68dBo9dg3rw
         PE/te21RW+kduoqYi9N9nDloHA5EHLpNtKiS+Jem3JsS3CisxCeywE4/EeTiwttiByve
         id16fDnB6mwqhk+onEH81V2opilJ9NrmbuoMAU2rLi8SMnwpRPk/dZsCSEyOObTPA7NI
         taucgTj9zAZ8AVEjrIuUbkeqAI1C995zByOitMi5IYh3k6HYekuwsJ62W64eWoQtdNtn
         Aogg==
X-Gm-Message-State: APjAAAUst0+rwYVZOs6wHZi0f41SOkdqJWgPIldVvwFd/YsDpYkt+h6o
        WmC26yK+cSog246twXrGIMMQafGCRxUiBOvTzN+MIQ==
X-Google-Smtp-Source: APXvYqxcQwBzv+jaQBkvWrghfop7WtOGJow2UATWn++Bc0AtxhpgfFM1bZDEQ52mEG0UiB4ijf7XIJ9Qz1JjTc95Wzg=
X-Received: by 2002:aca:5c06:: with SMTP id q6mr244007oib.175.1571842163611;
 Wed, 23 Oct 2019 07:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191023122150.GA2524@localhost.localdomain>
In-Reply-To: <20191023122150.GA2524@localhost.localdomain>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 23 Oct 2019 16:49:12 +0200
Message-ID: <CAMpxmJUhwLOey+NtLrkvvj4apfyZyqLM_P87et+jHvGtBETspA@mail.gmail.com>
Subject: Re: [PATCH] gpio: bd70528: Add MODULE ALIAS to autoload module
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 23 pa=C5=BA 2019 o 14:22 Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> napisa=C5=82(a):
>
> The bd70528 GPIO driver is probed by MFD driver. Add MODULE_ALIAS
> in order to allow udev to load the module when MFD sub-device cell
> for GPIO is added.
>
> Fixes: 18bc64b3aebfa ("gpio: Initial support for ROHM bd70528 GPIO block"=
)
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> I'm not really sure if this is a bug-fix or feature but I guess the
> Fixes tag won't harm, right?

It's definitely a feature, not a bug-fix. I applied it to for-next but
dropped the tag.

Bart

>
>  drivers/gpio/gpio-bd70528.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
> index fd85605d2dab..8123260a92a2 100644
> --- a/drivers/gpio/gpio-bd70528.c
> +++ b/drivers/gpio/gpio-bd70528.c
> @@ -230,3 +230,4 @@ module_platform_driver(bd70528_gpio);
>  MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
>  MODULE_DESCRIPTION("BD70528 voltage regulator driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:bd70528-gpio");
> --
> 2.21.0
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =3D]
