Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 625BDE9BB4
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 13:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfJ3Mnp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 08:43:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32214 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726088AbfJ3Mno (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 08:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572439423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UY6YEskkdPexmYLlBdt+0Hm6c9p061YRILPo1TQ9/Z4=;
        b=N6fmFPEPjz4s3RqZjVLyt7X8VzEZ+/15ve6Q2+OEO44NgYZCOwt34dUJzfaBA1WljT79a/
        CSAaQOWZK6Zm7wNEZcojQmEMZJR/RO/XyAJXF8nKWlUCrh/9ACnnEcIOqAjXKN/tN2sEvI
        gwH0XOI2Ip7L+M7QOq+U0CdyWze04iE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-EGc3Yv11MaCisZjsQuxvFg-1; Wed, 30 Oct 2019 08:43:41 -0400
Received: by mail-wm1-f70.google.com with SMTP id i8so786805wmd.5
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 05:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0AdpCDThZGz0lw+RnZznpNr6YrHDsf8ohW+6nHiqEf4=;
        b=G7Qp48RE3rQWoLCQ7PVwvUb9SXogRQfL3n/mjOEeD9maHfZfY5xjDGCpbWlQFOvhtg
         yDt29UipRTsxD1BO1ExS053S+TWviJWXlgivgazZ+yNk1tPgirgGnYs3NJ2F7NFMRpSV
         JPQS/wGuUyI3YqQ2VWTcQCFN2p9k76BH/u8Ns1rxAiRiLjBBar4PMjptcY149L/u6SQK
         VkS8nYLT6h/EYKKt26Qr++VlzZs1n/5Lr9GyLIEB8YVORIELNZfqF4vXAQQ4xGr7URS0
         Hj8TJ5Df1z+NRWAQRH71xqa5J+0r3tm3OK3PAwWUmQHBTcjAs3aXY6Psu1wTVfK/yCT3
         kWjQ==
X-Gm-Message-State: APjAAAUt13+oAs8reCiCSOHITOOfDXhvWHE/hrU5E14kWWPuO5eUWZzg
        ChDnDlVJsw+VqAU8YsAuRfM/keTrTUWmP4j+YkDllAa6268Dmjv+AHuxB+0SFNXxZkj4z3vL8fV
        KaQM29Nlcu7L9nzx2aOqq1w==
X-Received: by 2002:a7b:ce0c:: with SMTP id m12mr8952784wmc.38.1572439419861;
        Wed, 30 Oct 2019 05:43:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwb5S7rzjKzFVp+W19N1JzwUEBzKQTGC+8hhGtze90RcUcZynpkrma9fW5XcZRkALxOksIJaQ==
X-Received: by 2002:a7b:ce0c:: with SMTP id m12mr8952765wmc.38.1572439419605;
        Wed, 30 Oct 2019 05:43:39 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id v16sm75413wrc.84.2019.10.30.05.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 05:43:39 -0700 (PDT)
Subject: Re: [PATCH] gpiolib: Switch order of valid mask and hw init
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191030122914.967-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <677730df-4960-0572-2de9-6c9c8b31a26f@redhat.com>
Date:   Wed, 30 Oct 2019 13:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030122914.967-1-linus.walleij@linaro.org>
Content-Language: en-US
X-MC-Unique: EGc3Yv11MaCisZjsQuxvFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-10-2019 13:29, Linus Walleij wrote:
> The GPIO irqchip needs to initialize the valid mask
> before initializing the IRQ hardware, because sometimes
> the latter require the former to be executed first.
>=20
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Ack, I was thinking along these lines myself too, but I was
not sure if this would be an acceptable solution:

Acked-by: Hans de Goede <hdegoede@redhat.com>

> ---
> Thinking of applying this for fixes to fix some part
> of the problems that Hans is seeing.

So you want to get this into 5.4, so that when
"pinctrl: intel: baytrail: Pass irqchip when adding gpiochip"
lands in 5.5 this is already in place.

Ok, I've just checked all the existing users if the
init_hw callback and none of them use init_valid_mask
so for them to order should not matter.

So yes getting this into 5.4 would be good.

This fixes 2 of the 3 issues I mentioned in my other mail,
the NULL pointer deref and the false_positive error messages
from byt_gpio_irq_init_hw().

But as I guess you are aware, that still leaves us with the third
problem: "acpi_gpiochip_request_interrupts() gets called before
gpiochip_add_pin_range() is called from pinctrl-baytrail.c, causing
the GPIO lookup of any ACPI _AEI handlers to fail, resulting in
errors like this one:

byt_gpio INT33FC:02: Failed to request GPIO for pin 0x13: -517

And none of the _AEI handlers working"

Regards,

Hans


> ---
>   drivers/gpio/gpiolib.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9afbc0612126..e865c889ba8d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1411,11 +1411,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
chip, void *data,
>  =20
>   =09machine_gpiochip_add(chip);
>  =20
> -=09ret =3D gpiochip_irqchip_init_hw(chip);
> +=09ret =3D gpiochip_irqchip_init_valid_mask(chip);
>   =09if (ret)
>   =09=09goto err_remove_acpi_chip;
>  =20
> -=09ret =3D gpiochip_irqchip_init_valid_mask(chip);
> +=09ret =3D gpiochip_irqchip_init_hw(chip);
>   =09if (ret)
>   =09=09goto err_remove_acpi_chip;
>  =20
>=20

