Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B06D1928
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 21:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbfJIToj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 15:44:39 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58463 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728804AbfJIToi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 15:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570650277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HS38OQM3Qxdz5Utoo5aFr7u8IF5QZy1SFI9eq19YTf8=;
        b=XuuTbicq9+czQcJDmqrSg23XTl+qCZRexQFtaw5ex1JyyKoSWipJLDT/czM4y8/b+s0prO
        911niY5AXziHC8fJqDGCrE5LPDG8HeMbl9/tY/P7g/ONF9sYK/gWBZM19Qp78NRKlu1Fiz
        Aioo/IyLSY31Rvkz/BuqFrAuLvbrS44=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-cWJUR8-0OHmXp5oaE9ZafQ-1; Wed, 09 Oct 2019 15:44:34 -0400
Received: by mail-ed1-f70.google.com with SMTP id t13so2075153edr.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 12:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eJGhWyJryffr1GUO4hTtzvMrEmk3lNLgDRY02/I9nWQ=;
        b=OmPVbL8C1rkG8P6r1gK0+18rC2Ib2EiHcI2qLzUGG+1c5eVPIaw4JY5OwR5PdcAFtB
         tE9qr20v90NUe9iMdoSaV+dk04C+2yARhcRNuBGKyrXs/m3CcrKZH5uOzYfzxGfvABcR
         Zrxe61w+9xfXT9bE16xdBHTcrYBpRuYg3g46dKgDx3Dm181VzZHkcMpzBtReidg/OO/i
         flGVyaU39epveix3/fMrh058/mAmmkwHVbWZBYdwFYupnLfttmv8kdEsmcyEJatmaybi
         Pf9nKZuSzfEDsOxSooO0VlWWwdKBg1bRjYBZZ9a8ENp2hkU4g2QtI4Yhkje1ZW0lUdqN
         Jpjw==
X-Gm-Message-State: APjAAAUKH5ZsrigqvP5URJfTn0JnDlbmjQ8h2oOOHxEiJ+fktxvvGZS9
        nRGRWicgx4F+EoXiyTBfyyh/4f+4djm38D86rV7I+G15FOidsazqWXUIKXkpDmk/+A/kw3upE8f
        tfpZ/N84JY34mKVLmjDZHyQ==
X-Received: by 2002:a17:906:6a4f:: with SMTP id n15mr4499647ejs.19.1570650273081;
        Wed, 09 Oct 2019 12:44:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzO7OEbQ70bkotzQVjmMcpmV2dW3Qb6iKsxCseFf/3DChFNeyDhe90K5gnR4RSicEauOhheeg==
X-Received: by 2002:a17:906:6a4f:: with SMTP id n15mr4499630ejs.19.1570650272822;
        Wed, 09 Oct 2019 12:44:32 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id jp14sm370693ejb.60.2019.10.09.12.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 12:44:32 -0700 (PDT)
Subject: Re: [PATCH 2/5] gpiolib: Initialize the hardware with a callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <44c7e540-5390-78df-26db-7251866ac6ad@redhat.com>
Date:   Wed, 9 Oct 2019 21:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-MC-Unique: cWJUR8-0OHmXp5oaE9ZafQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 09-10-2019 18:50, Andy Shevchenko wrote:
> After changing the drivers to use GPIO core to add an IRQ chip
> it appears that some of them requires a hardware initialization
> before adding the IRQ chip.
>=20
> Add an optional callback ->init_hw() to allow that drivers
> to initialize hardware if needed.
>=20
> This change is a part of the fix NULL pointer dereference
> brought to the several drivers recently.
>=20
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hmm, IIRC Linus Walleij already added a callback for initializing the
mask before the irchip gets initialized which is basically intended for
what you want this callback for I think ?

Regards.

Hans



> ---
>   drivers/gpio/gpiolib.c      | 22 +++++++++++++++++++++-
>   include/linux/gpio/driver.h |  8 ++++++++
>   2 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bdbc1649eafa..85601ad4fcd5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -86,6 +86,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpioc=
hip,
>   =09=09=09=09struct lock_class_key *lock_key,
>   =09=09=09=09struct lock_class_key *request_key);
>   static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
> +static int gpiochip_irqchip_init_hw(struct gpio_chip *gpiochip);
>   static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)=
;
>   static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip=
);
>  =20
> @@ -1406,6 +1407,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *c=
hip, void *data,
>  =20
>   =09machine_gpiochip_add(chip);
>  =20
> +=09ret =3D gpiochip_irqchip_init_hw(chip);
> +=09if (ret)
> +=09=09goto err_remove_acpi_chip;
> +
>   =09ret =3D gpiochip_irqchip_init_valid_mask(chip);
>   =09if (ret)
>   =09=09goto err_remove_acpi_chip;
> @@ -1622,6 +1627,16 @@ static struct gpio_chip *find_chip_by_name(const c=
har *name)
>    * The following is irqchip helper code for gpiochips.
>    */
>  =20
> +static int gpiochip_irqchip_init_hw(struct gpio_chip *gc)
> +{
> +=09struct gpio_irq_chip *girq =3D &gc->irq;
> +
> +=09if (!girq->init_hw)
> +=09=09return 0;
> +
> +=09return girq->init_hw(gc);
> +}
> +
>   static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc)
>   {
>   =09struct gpio_irq_chip *girq =3D &gc->irq;
> @@ -2446,8 +2461,13 @@ static inline int gpiochip_add_irqchip(struct gpio=
_chip *gpiochip,
>   {
>   =09return 0;
>   }
> -
>   static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
> +
> +static inline int gpiochip_irqchip_init_hw(struct gpio_chip *gpiochip)
> +{
> +=09return 0;
> +}
> +
>   static inline int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gp=
iochip)
>   {
>   =09return 0;
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index f8245d67f070..5dd9c982e2cb 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -201,6 +201,14 @@ struct gpio_irq_chip {
>   =09 */
>   =09bool threaded;
>  =20
> +=09/**
> +=09 * @init_hw: optional routine to initialize hardware before
> +=09 * an IRQ chip will be added. This is quite useful when
> +=09 * a particular driver wants to clear IRQ related registers
> +=09 * in order to avoid undesired events.
> +=09 */
> +=09int (*init_hw)(struct gpio_chip *chip);
> +
>   =09/**
>   =09 * @init_valid_mask: optional routine to initialize @valid_mask, to =
be
>   =09 * used if not all GPIO lines are valid interrupts. Sometimes some
>=20

