Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251122916D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 09:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388859AbfEXHD0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 03:03:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44508 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388460AbfEXHD0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 03:03:26 -0400
Received: by mail-oi1-f195.google.com with SMTP id z65so6263906oia.11
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ggAqQCZOVRZtFKzDVVtPukGfGP3OkJTZeJtZud1HmIk=;
        b=VrpPEWTyV7w/xBs02DOpEB2wHeHLcT5gaBjDP3+JsnrYHNsdP/gHQs/91puwpoSwjk
         lI+Q6BKnQWGbZSAcUtt+qBmgzxJjPIehh1lqAs6zBvLLVtSJU1dc35uKKxtIBPJtRdrJ
         +MPG8/Oig2M2xOLcbZ64OB9F6H9f++/ZIRGdX42UUQsXKaSVQZ8/+UdKxOEbPLku9DGm
         I0LkfKw8RXhb40SCoxN2zrMDPkMYzDuAZBdjPtYIAUZd/45cIRRlB2GRyl+oXe8kO0vq
         EhA+pIJE+8ehAjGmHvnAsFwTB2JCRZCsdF50f5UCREyiZEYmM9S0D5/A1eNVUXS+FJwR
         PUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ggAqQCZOVRZtFKzDVVtPukGfGP3OkJTZeJtZud1HmIk=;
        b=KS1ezONlYuJ0neJ199PR26ESceznlCF4OIuFSMIMVaOQYlpk66yGoY0vK3cPU77AOl
         9uVW0fv/KyZfRaPV/xf3kyApM2tWK9H64koctSCdveuXp5wUpzjOeM64vZKUqwEfQyym
         dNY+Of8zYHoJ7vT15jXGdvo3dh+1M5QwE9qHR9hNQrPX73FXARHxRIojaD0IoYz/5N0H
         s/sWeEv5QI2nen7B5XGwvYxT81TOrP0MFL7l/JZ7jKHn9QnBt0j8BEtZM7wDIiWTay2I
         b7V/dGPt+2Y0XKiEc0JTak3Ft0lrkSNMHakuYRmCzunfgz2FVw1kFWakcQY24j9MSgil
         skFQ==
X-Gm-Message-State: APjAAAXXdZtJRTucPOaGW7ba73HXocA0s9lIYrsD/D8qq0BwBl++mOhL
        7YUXNT4RgGJj/wPwaZ+W++uRhU8yUZYyLBayB4Hq/A==
X-Google-Smtp-Source: APXvYqxAbBUuROv5rdCa31jOH1GdpIUh2srX0z4DRxWpYcHFRalRwK2qR7nmEndZPgcFAvpYqZyxeAGzKrIjF2xYEU8=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr5486438oib.170.1558681405264;
 Fri, 24 May 2019 00:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
In-Reply-To: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 24 May 2019 09:03:14 +0200
Message-ID: <CAMpxmJUVoaAq0-0ELpzmZjke7yjZN+n75WO9i=cWK-WbXw8gZw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix gpio-adp5588 build errors
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 24 maj 2019 o 00:00 Randy Dunlap <rdunlap@infradead.org> napisa=C5=82(=
a):
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> The gpio-adp5588 driver uses interfaces that are provided by
> GPIOLIB_IRQCHIP, so select that symbol in its Kconfig entry.
>
> Fixes these build errors:
>
> ../drivers/gpio/gpio-adp5588.c: In function =E2=80=98adp5588_irq_handler=
=E2=80=99:
> ../drivers/gpio/gpio-adp5588.c:266:26: error: =E2=80=98struct gpio_chip=
=E2=80=99 has no member named =E2=80=98irq=E2=80=99
>             dev->gpio_chip.irq.domain, gpio));
>                           ^
> ../drivers/gpio/gpio-adp5588.c: In function =E2=80=98adp5588_irq_setup=E2=
=80=99:
> ../drivers/gpio/gpio-adp5588.c:298:2: error: implicit declaration of func=
tion =E2=80=98gpiochip_irqchip_add_nested=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>   ret =3D gpiochip_irqchip_add_nested(&dev->gpio_chip,
>   ^
> ../drivers/gpio/gpio-adp5588.c:307:2: error: implicit declaration of func=
tion =E2=80=98gpiochip_set_nested_irqchip=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>   gpiochip_set_nested_irqchip(&dev->gpio_chip,
>   ^
>
> Fixes: 459773ae8dbb ("gpio: adp5588-gpio: support interrupt controller")
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/gpio/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- lnx-52-rc1.orig/drivers/gpio/Kconfig
> +++ lnx-52-rc1/drivers/gpio/Kconfig
> @@ -822,6 +822,7 @@ config GPIO_ADP5588
>  config GPIO_ADP5588_IRQ
>         bool "Interrupt controller support for ADP5588"
>         depends on GPIO_ADP5588=3Dy
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to enable the adp5588 to be used as an interrupt
>           controller. It requires the driver to be built in the kernel.
>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
