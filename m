Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A2AE992C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 10:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfJ3JbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 05:31:04 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50074 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726028AbfJ3JbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 05:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572427862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nRdjaU5vumBF04yyG06F0AragDOvRFIp01vZ0gtytIk=;
        b=hRu2t++902kAnz6KyHcl5hD6hm1Y6ukBEhZIUvGIaW7xdPjylFFmxlk6VRXTWwKZoWx1y8
        xLE4FoPiCkiHMNBg/OFgt1oDNVdeTY5XcYAHh2BjVcsURyO9iM+/HPXOn0Pa8aYsH5RPku
        vOpHy69bA8e9H8GsJu9wFAOBhMBaLgk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-Fi-4S9GXOsyAC7lEqM6-Hg-1; Wed, 30 Oct 2019 05:31:00 -0400
Received: by mail-wm1-f71.google.com with SMTP id q22so363578wmc.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 02:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nnzxwOaBx4U9Hb+LOjCv+hcoH1GZH6wkfDh4gvpRos4=;
        b=hNA6mJx50EUYdHmAYZzlORzQvVA7FaxT9BMZxbfIs3I3KLI4U4Rvnh4UXfkLaaMi4B
         Ny2nfBnPTEx/l/ShAWQ435YlMeZbj4oJHebjK9gUkEiKkoBsBJHaXjjhUwTrvQjW+iEk
         jhkjwTD1qzlaESxdsA1Wjil1Rzl9rB3hBKnk1Hk+k1EbWiZFdUonmwv+fD+c0xtWvsbP
         3V+NV1B4Op9G54KyIhZNZKK5orZJUFgs8vvGSfmfmpQ0imWSq9NZ7HdG8UsD7fk0p9tk
         otiaX9lEDc9WolYnynDJaeToOyLutAykyrqmJn3oklh4cx0uD4oUhgMb8JG9tuLdh395
         FXAA==
X-Gm-Message-State: APjAAAWiaBexOH6QhNi5slgJQNu9r3qiY5WGByxuEOsmAvhbRNMV9VTQ
        HI00bFsnX46a70L+y2Gur9ZBt2Voig13J1HNMQETR/4uM/wYx6nxCost/6T+QZ2Di6PsLwpqVF4
        XoPEaoyKC1HrJY9ICyHSNDQ==
X-Received: by 2002:a05:6000:11d2:: with SMTP id i18mr24972101wrx.109.1572427858873;
        Wed, 30 Oct 2019 02:30:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnqVUk76S987VcLJm3duw0zNNqlKCjXBeyvTQcDPYFXvnSqHZOf/68uIKog3IyJ1GhTK9Onw==
X-Received: by 2002:a05:6000:11d2:: with SMTP id i18mr24972080wrx.109.1572427858595;
        Wed, 30 Oct 2019 02:30:58 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id x21sm1851671wmj.42.2019.10.30.02.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 02:30:57 -0700 (PDT)
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com>
Date:   Wed, 30 Oct 2019 10:30:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-MC-Unique: Fi-4S9GXOsyAC7lEqM6-Hg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 25-10-2019 16:06, Andy Shevchenko wrote:
> There is a logical continuation of the commit 5fbe5b5883f8 ("gpio: Initia=
lize
> the irqchip valid_mask with a callback") to split IRQ initialization to
> hardware and valid mask setup parts.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

So I've been running some tests based on https://git.kernel.org/pub/scm/lin=
ux/kernel/git/pinctrl/intel.git/log/?h=3Dfor-next
+ this patch.

That combo causes several issues, so I tried reverting the patches one by o=
ne,
if I drop this patch and use just:

https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/log/?h=3D=
for-next

Then the kernel does not even boot. I believe this is caused by:
88583e340a0e ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip"=
)

The problem here is that gpiochip_add_data_with_key() calls gpiochip_irqchi=
p_init_hw()
before it calls gpiochip_irqchip_init_valid_mask(), so after commit 88583e3=
40a0e
when byt_gpio_irq_init_hw runs gc->irq.valid_mask is NULL and we crash with=
 a NULL
pointer exception (or so I believe, the kernel never gets far enough to get
any info out of it without extra work).

Note that this ("[PATCH v1] pinctrl: baytrail: Move IRQ valid mask initiali=
zation to a dedicated callback")
patch fixes this since it moves the gc->irq.valid_mask accesses to
byt_init_irq_valid_mask.

But this change itself triggers another variant of this ordering issue,
it causes these 2 new errors to get logged:

byt_gpio INT33FC:01: GPIO interrupt error, pins misconfigured. INT_STAT0: 0=
x01800000
byt_gpio INT33FC:02: GPIO interrupt error, pins misconfigured. INT_STAT0: 0=
x00400000

The problem is that before this change the code calculating the valid_mask
would also disable interrupts on GPIOs which do not have their
BYT_DIRECT_IRQ_EN bit set. This now happens after the check done in
byt_gpio_irq_init_hw() causing these false-positive error messages.

Even if we ignore the NULL pointer deref problem for now and we ignore
these 2 new error messages for now. Things are still broken with the
current changes in pinctrl/intel.git/for-next switching to letting
devm_gpiochip_add_data register the irqchip means that
acpi_gpiochip_request_interrupts() gets called before
gpiochip_add_pin_range() is called from pinctrl-baytrail.c, causing
the GPIO lookup of any ACPI _AEI handlers to fail, resulting in
errors like this one:

byt_gpio INT33FC:02: Failed to request GPIO for pin 0x13: -517

And none of the _AEI handlers working

TL;DR: commit 88583e340a0e ("pinctrl: intel: baytrail: Pass irqchip when ad=
ding gpiochip")
breaks a bunch of stuff and should be dropped from pinctrl/intel.git/for-ne=
xt
and this needs some more work before it is ready for mainline.

Regards,

Hans




> ---
>   drivers/pinctrl/intel/pinctrl-baytrail.c | 25 ++++++++++--------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/i=
ntel/pinctrl-baytrail.c
> index beb26550c25f..08e2b940cc11 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1432,22 +1432,10 @@ static void byt_init_irq_valid_mask(struct gpio_c=
hip *chip,
>   =09=09=09=09    unsigned long *valid_mask,
>   =09=09=09=09    unsigned int ngpios)
>   {
> -=09/*
> -=09 * FIXME: currently the valid_mask is filled in as part of
> -=09 * initializing the irq_chip below in byt_gpio_irq_init_hw().
> -=09 * when converting this driver to the new way of passing the
> -=09 * gpio_irq_chip along when adding the gpio_chip, move the
> -=09 * mask initialization into this callback instead. Right now
> -=09 * this callback is here to make sure the mask gets allocated.
> -=09 */
> -}
> -
> -static int byt_gpio_irq_init_hw(struct gpio_chip *gc)
> -{
> -=09struct byt_gpio *vg =3D gpiochip_get_data(gc);
> +=09struct byt_gpio *vg =3D gpiochip_get_data(chip);
>   =09struct device *dev =3D &vg->pdev->dev;
>   =09void __iomem *reg;
> -=09u32 base, value;
> +=09u32 value;
>   =09int i;
>  =20
>   =09/*
> @@ -1468,13 +1456,20 @@ static int byt_gpio_irq_init_hw(struct gpio_chip =
*gc)
>  =20
>   =09=09value =3D readl(reg);
>   =09=09if (value & BYT_DIRECT_IRQ_EN) {
> -=09=09=09clear_bit(i, gc->irq.valid_mask);
> +=09=09=09clear_bit(i, valid_mask);
>   =09=09=09dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
>   =09=09} else if ((value & BYT_PIN_MUX) =3D=3D byt_get_gpio_mux(vg, i)) =
{
>   =09=09=09byt_gpio_clear_triggering(vg, i);
>   =09=09=09dev_dbg(dev, "disabling GPIO %d\n", i);
>   =09=09}
>   =09}
> +}
> +
> +static int byt_gpio_irq_init_hw(struct gpio_chip *gc)
> +{
> +=09struct byt_gpio *vg =3D gpiochip_get_data(gc);
> +=09void __iomem *reg;
> +=09u32 base, value;
>  =20
>   =09/* clear interrupt status trigger registers */
>   =09for (base =3D 0; base < vg->soc_data->npins; base +=3D 32) {
>=20

