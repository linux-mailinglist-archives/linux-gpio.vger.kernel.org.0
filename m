Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC6EAE9C15
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfJ3NL6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:11:58 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38386 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726119AbfJ3NL5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 09:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572441115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gIS0qSozSZYyd34LftiaPKvGyQHid5LaghfmEeaS5TA=;
        b=eqOOeIIaHlRYpyrEE2CfkbpbidsMAFv/uG6RQmqxszqDPGwwn1xIO8sYM4l/aYhKoZHEbD
        oyL40V5Urdzum0GFFC+SCmQw7P+EDDuasHlXKRHjfq1QnPmp03WaXjhfxQVGKrt2hpmLtj
        xhOY4Ufiz0uLl8JW99cSDUTQbm5O6p8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-BtrWhw-ePr2iI4ng9_7P_A-1; Wed, 30 Oct 2019 09:11:54 -0400
Received: by mail-wm1-f69.google.com with SMTP id 6so819869wmj.9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 06:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=onOvok/ZAKjwi/cePW+9qVBwaGkfcR2T8yb9bv/1Jr8=;
        b=Lt0mSm4j3J1iWIw+htfo39CR3OF86+H4RORDF6qDy69Rl2uS46H/jAYZ9IMezP2Y/1
         pPtSxH4ciKD6E5aXBOOPsytixOCGrV+8h2cbFl2LEZi+V0JfObGw/Sfz4asRfWY4qiQ/
         1w+swNho7FyPjLVy7E27TjEIbLYVdXxeIfhSKB9UvlapyrgKDIi/27Y+eXOXepnXaW3+
         ECIXH61JPAQEsQ4XIF0dQS6tuuUPoyFakatuoJaqfmrlEQV7eElPphUsUby5iHk8s1YR
         etupagkW+9Ed1vhGuzBdiklU/lRSWNp3HNGgkpj/CDF/waV/U3IL8uOMC6Q4CGPsxKJ3
         SbzA==
X-Gm-Message-State: APjAAAVx073sDQ1l7GLQFmVaVA2/YwMsaIKErCEp1zJ+VV2w/9d+yC0V
        +SqHN+dx5RWuBGRpS75Hn5BtjTqsIns1E4WsIod0t4qZAThK95//9EfEXQM7o2FOj74vJeD4oc5
        z/dYT4FN78ssb/f31KZsHnA==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr21214863wrw.32.1572441112839;
        Wed, 30 Oct 2019 06:11:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNGX2RR8sJNAQH0FzCQUvUfwpYFxOMHyLMoJdrf4zfZZkgVOKuysQdso/mFjL96t2YmybKuQ==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr21214846wrw.32.1572441112575;
        Wed, 30 Oct 2019 06:11:52 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id p21sm2095675wmc.25.2019.10.30.06.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 06:11:51 -0700 (PDT)
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
 <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com>
 <CACRpkdboOodR4Ux-bNp+XcFkTtxA-QehtP6+H+RsfFk+h6OaXQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cae76d3c-7a9d-2fdd-2899-b1a98cf0df78@redhat.com>
Date:   Wed, 30 Oct 2019 14:11:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdboOodR4Ux-bNp+XcFkTtxA-QehtP6+H+RsfFk+h6OaXQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: BtrWhw-ePr2iI4ng9_7P_A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-10-2019 13:42, Linus Walleij wrote:
> On Wed, Oct 30, 2019 at 10:31 AM Hans de Goede <hdegoede@redhat.com> wrot=
e:
>=20
>> The problem here is that gpiochip_add_data_with_key() calls gpiochip_irq=
chip_init_hw()
>> before it calls gpiochip_irqchip_init_valid_mask(), so after commit 8858=
3e340a0e
>> when byt_gpio_irq_init_hw runs gc->irq.valid_mask is NULL and we crash w=
ith a NULL
>> pointer exception (or so I believe, the kernel never gets far enough to =
get
>> any info out of it without extra work).
>>
>> Note that this ("[PATCH v1] pinctrl: baytrail: Move IRQ valid mask initi=
alization to a dedicated callback")
>> patch fixes this since it moves the gc->irq.valid_mask accesses to
>> byt_init_irq_valid_mask.
>=20
> OK so we have a halfway fix there.
>=20
>> But this change itself triggers another variant of this ordering issue,
>> it causes these 2 new errors to get logged:
>>
>> byt_gpio INT33FC:01: GPIO interrupt error, pins misconfigured. INT_STAT0=
: 0x01800000
>> byt_gpio INT33FC:02: GPIO interrupt error, pins misconfigured. INT_STAT0=
: 0x00400000
>>
>> The problem is that before this change the code calculating the valid_ma=
sk
>> would also disable interrupts on GPIOs which do not have their
>> BYT_DIRECT_IRQ_EN bit set. This now happens after the check done in
>> byt_gpio_irq_init_hw() causing these false-positive error messages.
>=20
> Isn't that easily fixed with something like this:
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9afbc0612126..e865c889ba8d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1411,11 +1411,11 @@ int gpiochip_add_data_with_key(struct
> gpio_chip *chip, void *data,
>=20
>          machine_gpiochip_add(chip);
>=20
> -       ret =3D gpiochip_irqchip_init_hw(chip);
> +       ret =3D gpiochip_irqchip_init_valid_mask(chip);
>          if (ret)
>                  goto err_remove_acpi_chip;
>=20
> -       ret =3D gpiochip_irqchip_init_valid_mask(chip);
> +       ret =3D gpiochip_irqchip_init_hw(chip);
>          if (ret)
>                  goto err_remove_acpi_chip;
>=20
> (I sent a separate patch for this.)

Yes I just replied to that patch, this seems like a good fix
to me.

> It isn't super-easy to know the right ordering semantics
> for init_hw vs init_valid_mask I think. Sadly we need to
> test it out in practice.

Ack.

>> Even if we ignore the NULL pointer deref problem for now and we ignore
>> these 2 new error messages for now. Things are still broken with the
>> current changes in pinctrl/intel.git/for-next switching to letting
>> devm_gpiochip_add_data register the irqchip means that
>> acpi_gpiochip_request_interrupts() gets called before
>> gpiochip_add_pin_range() is called from pinctrl-baytrail.c, causing
>> the GPIO lookup of any ACPI _AEI handlers to fail, resulting in
>> errors like this one:
>>
>> byt_gpio INT33FC:02: Failed to request GPIO for pin 0x13: -517
>>
>> And none of the _AEI handlers working
>=20
> I just vaguely understand this...
>=20
> If what you're saying is that the Baytrail driver is dependent
> on registering the pin ranges *before* registering the GPIO
> chip

Yes I think so, I debugged the _AEI handlers not working a bit
yesterday and the problem is that pinctrl_gpio_request() fails,
first pinctrl_get_device_gpio_range fails with -EPROBEDEFER (*)
and then pinctrl_match_gpio_range() also fails. I added some
debug pr_err calls to pinctrl_match_gpio_range() and when it runs
the range for the gpiochip for which acpi_gpiochip_request_interrupts()
is processing _AEI event-handlers is not yet in the registered
ranges.

*) Which is not treated specially by acpi_gpiochip_request_interrupts()
as that normally gets called from the gpiochip driver itself, so the
device is expected to alreayd be probed.


> can we then:
>=20
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
> b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index beb26550c25f..b308567c5153 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1549,16 +1549,20 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>                  girq->handler =3D handle_bad_irq;
>          }
>=20
> -       ret =3D devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
> +       /*
> +        * Needs to happen first since the gpiochip is using pin
> +        * control as back-end.
> +        */
> +       ret =3D gpiochip_add_pin_range(gc, dev_name(&vg->pdev->dev),
> +                                    0, 0, vg->soc_data->npins);
>          if (ret) {
> -               dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
> +               dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n")=
;
>                  return ret;
>          }
>=20
> -       ret =3D gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev=
),
> -                                    0, 0, vg->soc_data->npins);
> +       ret =3D devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
>          if (ret) {
> -               dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n")=
;
> +               dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
>                  return ret;
>          }
>=20
> (Tell me if I should send this as a separate patch.)

If you want me to test if this fixes the issue, then yes please.

> It's not entirely logical to have this semantic ordering so
> the extra comment explains it, I hope, in case it actually
> works.
>=20
>> TL;DR: commit 88583e340a0e ("pinctrl: intel: baytrail: Pass irqchip when=
 adding gpiochip")
>> breaks a bunch of stuff and should be dropped from pinctrl/intel.git/for=
-next
>> and this needs some more work before it is ready for mainline.
>=20
> I don't know if that is such a good idea if this is a global problem,
> like something that would potentially disturb any ACPI-based
> GPIO chip. We might leave something else broken even if we
> fix the issue locally.

Right, I did a quick check and at least these x86 pinctrl drivers
all 3 have this ordering problem once the irq chip registration is
moved to the gpiochip_add_data() call.

drivers/pinctrl/intel/pinctrl-baytrail.c
drivers/pinctrl/intel/pinctrl-cherryview.c
drivers/pinctrl/intel/pinctrl-intel.c
drivers/pinctrl/pinctrl-amd.c

And it seems that drivers/gpio/gpio-merrifield.c is already
suffering from this problem in 5.4!

So some more generic solution would be ideal...

Regards,

Hans

