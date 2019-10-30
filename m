Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94CD6EA15E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 17:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfJ3QB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 12:01:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44531 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726476AbfJ3QB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 12:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572451315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rpk7qxJoyM7HQG2V6EZT7BrgctbgNVXnHL/DSCTFxKQ=;
        b=I7wG7pHwDCR1J2PzIin/0WIhaY8IW0K/9K31hWQf45lAKOapLB7Yc8jNJSvTJf1mbNbO8E
        raKfIbCE+SJq4Aq1GBnbPQWXMvgiK9Vs6UbxZB4P0l37czcxlm/PVY8w8V25RzZH2KpjWh
        kKygTATgeRBTHYO/vRRuTnHe2mjLbug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-5K4j0DJdPXe-EJPVk3mp_g-1; Wed, 30 Oct 2019 12:01:54 -0400
Received: by mail-wr1-f69.google.com with SMTP id f16so1236162wrr.16
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 09:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ho8qWLCcf8ve8LRqeOTpDDFfaTldOGWzehEmeyylxrY=;
        b=sIl54AnVhJo7dt3KHkFNsxdm9G+oc/60YPMr594SC7kx4bOWljazPV250rK9cUPOUH
         CzTQiAmj7+JqI9bMjKEX2hyHVoUvGoOeg1xasIx5RinbsjXPJL70Ctf//dOSng+MWsAm
         zDDSYguowNo08JyNx4fCLeBp6UvBUIUylNkzpa8S+CKSpvxq0qXbhzS9+RVUAeaDgFlJ
         b0GoqR1JJsU2hW4vA8+K+ljcEuRN7FI/6QRWUm9BZEI26slpg/6it0S82VR7rZ+HiDBM
         HKzSUbSh5pDejT/d01erPowmQQ0N+QniTluVzR5vnNCTaCSqnd332/3IjR3Q/u/o6ffQ
         WJaw==
X-Gm-Message-State: APjAAAX8wILowfG+YJ7uuDazbzIDvigCIQBjunb1RkUu1P9Igo9PDxFz
        EmlQuxZAWSevqx1SmD1Uq4kp6KGBYlt4jrksnw2cpwUlOVnR/wlsI3+QiVfrwpBJQtgi8G9W6D3
        K+G4A7h5HwqaFyz4OCNUOjw==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr174157wma.81.1572451312363;
        Wed, 30 Oct 2019 09:01:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy962+/rWFU/Y9VqWLkGaZ4Tel7t+U85SHrQ+aRrc1Z+W8ZYl03JY2agbXG/bNsM1bDjBaMZA==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr174112wma.81.1572451311984;
        Wed, 30 Oct 2019 09:01:51 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id d4sm860282wrc.54.2019.10.30.09.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 09:01:51 -0700 (PDT)
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
From:   Hans de Goede <hdegoede@redhat.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
 <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
Message-ID: <9d21b3fe-852b-a430-4e71-af0742edcd9b@redhat.com>
Date:   Wed, 30 Oct 2019 17:01:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
Content-Language: en-US
X-MC-Unique: 5K4j0DJdPXe-EJPVk3mp_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-10-2019 16:48, Hans de Goede wrote:
> Hi,
>=20
> On 30-10-2019 15:49, Linus Walleij wrote:
>> This fixes a semantic ordering issue as we need to add
>> pin ranges before adding gpiochips when gpiochips use
>> pin control as a backend: as it needs to talk to the
>> pin control backend during initialization, the backend
>> needs to be there already.
>>
>> Other drivers in the tree using pincontrol as backend do
>> not necessarily have this problem, as they might not need
>> to access the pincontrol portions during initialization.
>>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Hans: would be great if you could test this. I can't
>> even compiletest right now because of a slow machine
>> as workhorse...
>=20
> This does not seem to work I've tested in both a Bay Trail and
> a Cherry Trail device and neither will boot the kernel after
> these changes I'm afraid.
>=20
> I think it might be best to pass in an array of ranges (*) to
> gpiochip_add_data and have it register the ranges before
> doing the irq-chip setup.

p.s.

For 5.4 we should probably revert
"gpio: merrifield: Pass irqchip when adding gpiochip"
and the fixes added on top of it, since AFAICT _AEI handling
will be broken on merrifield after this change too.

So I suggest that we revert the following commits (in revert order):

4c87540940cbc7ddbe9674087919c605fd5c2ef1 "gpio: merrifield: Move hardware i=
nitialization to callback"
6658f87f219427ee776c498e07c878eb5cad1be2 "gpio: merrifield: Restore use of =
irq_base"
8f86a5b4ad679e4836733b47414226074eee4e4d "gpio: merrifield: Pass irqchip wh=
en adding gpiochip"

That seems like the safest thing to do at this point in the cycle.

Regards,

Hans


> *) Terminated with a range from 0 to 0
>=20
>> ---
>> =C2=A0 drivers/gpio/gpio-merrifield.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++++++-------
>> =C2=A0 drivers/pinctrl/intel/pinctrl-baytrail.c=C2=A0=C2=A0 | 14 +++++++=
++-----
>> =C2=A0 drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++++------
>> =C2=A0 drivers/pinctrl/intel/pinctrl-intel.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 16 ++++++++++------
>> =C2=A0 drivers/pinctrl/pinctrl-amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++++++++-----
>> =C2=A0 5 files changed, 49 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifie=
ld.c
>> index 2f1e9da81c1e..195e253cb561 100644
>> --- a/drivers/gpio/gpio-merrifield.c
>> +++ b/drivers/gpio/gpio-merrifield.c
>> @@ -463,13 +463,10 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, =
const struct pci_device_id *id
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 girq->default_type =3D IRQ_TYPE_NONE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 girq->handler =3D handle_bad_irq;
>> -=C2=A0=C2=A0=C2=A0 pci_set_drvdata(pdev, priv);
>> -=C2=A0=C2=A0=C2=A0 retval =3D devm_gpiochip_add_data(&pdev->dev, &priv-=
>chip, priv);
>> -=C2=A0=C2=A0=C2=A0 if (retval) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->dev, "gpiochi=
p_add error %d\n", retval);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retval;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Needs to happen first since the gpiochip is =
using pin
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * control as back-end.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl_dev_name =3D mrfld_gpio_get_pinct=
rl_dev_name(priv);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(mrfld_gpio_r=
anges); i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range =3D &mrfld_=
gpio_ranges[i];
>> @@ -484,6 +481,13 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *id
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 pci_set_drvdata(pdev, priv);
>> +=C2=A0=C2=A0=C2=A0 retval =3D devm_gpiochip_add_data(&pdev->dev, &priv-=
>chip, priv);
>> +=C2=A0=C2=A0=C2=A0 if (retval) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->dev, "gpiochi=
p_add error %d\n", retval);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retval;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/=
intel/pinctrl-baytrail.c
>> index beb26550c25f..b308567c5153 100644
>> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
>> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
>> @@ -1549,16 +1549,20 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 girq->handler =3D=
 handle_bad_irq;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 ret =3D devm_gpiochip_add_data(&vg->pdev->dev, gc, v=
g);
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Needs to happen first since the gpiochip is =
using pin
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * control as back-end.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_add_pin_range(gc, dev_name(&vg->pde=
v->dev),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, vg->soc_data->npi=
ns);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&vg->pdev->dev, "fai=
led adding byt-gpio chip\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&vg->pdev->dev, "fai=
led to add GPIO pin range\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_add_pin_range(&vg->chip, dev_name(&=
vg->pdev->dev),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, vg->soc_data->npi=
ns);
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_gpiochip_add_data(&vg->pdev->dev, gc, v=
g);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&vg->pdev->dev, "fai=
led to add GPIO pin range\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&vg->pdev->dev, "fai=
led adding byt-gpio chip\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctr=
l/intel/pinctrl-cherryview.c
>> index dff2a81250b6..13144e192c1f 100644
>> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
>> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
>> @@ -1572,12 +1572,10 @@ static int chv_gpio_probe(struct chv_pinctrl *pc=
trl, int irq)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (need_valid_mask)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->irq.init_va=
lid_mask =3D chv_init_irq_valid_mask;
>> -=C2=A0=C2=A0=C2=A0 ret =3D devm_gpiochip_add_data(pctrl->dev, chip, pct=
rl);
>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(pctrl->dev, "Failed =
to register gpiochip\n");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Needs to happen first since the gpiochip is =
using pin
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * control as back-end.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < community->ngpio_ranges=
; i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range =3D &commun=
ity->gpio_ranges[i];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_=
add_pin_range(chip, dev_name(pctrl->dev),
>> @@ -1589,6 +1587,12 @@ static int chv_gpio_probe(struct chv_pinctrl *pct=
rl, int irq)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_gpiochip_add_data(pctrl->dev, chip, pct=
rl);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(pctrl->dev, "Failed =
to register gpiochip\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The same set of machines in chv_n=
o_valid_mask[] have incorrectly
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * configured GPIOs that generate sp=
urious interrupts so we use
>> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/int=
el/pinctrl-intel.c
>> index b54b27228ad9..78afcf13c444 100644
>> --- a/drivers/pinctrl/intel/pinctrl-intel.c
>> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
>> @@ -1225,12 +1225,10 @@ static int intel_gpio_probe(struct intel_pinctrl=
 *pctrl, int irq)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pctrl->irqchip.irq_set_wake =3D intel_gpi=
o_irq_wake;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pctrl->irqchip.flags =3D IRQCHIP_MASK_ON_=
SUSPEND;
>> -=C2=A0=C2=A0=C2=A0 ret =3D devm_gpiochip_add_data(pctrl->dev, &pctrl->c=
hip, pctrl);
>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(pctrl->dev, "failed =
to register gpiochip\n");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Needs to happen first since the gpiochip is =
using pin
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * control as back-end.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pctrl->ncommunities; i+=
+) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct intel_comm=
unity *community =3D &pctrl->communities[i];
>> @@ -1241,6 +1239,12 @@ static int intel_gpio_probe(struct intel_pinctrl =
*pctrl, int irq)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_gpiochip_add_data(pctrl->dev, &pctrl->c=
hip, pctrl);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(pctrl->dev, "failed =
to register gpiochip\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We need to request the interrupt =
here (instead of providing chip
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to the irq directly) because on s=
ome platforms several GPIO
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd=
.c
>> index 2c61141519f8..3637059083ff 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -912,17 +912,21 @@ static int amd_gpio_probe(struct platform_device *=
pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(gp=
io_dev->pctrl);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_add_data(&gpio_dev->gc, gpio_dev);
>> -=C2=A0=C2=A0=C2=A0 if (ret)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Needs to happen first since the gpiochip is =
using pin
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * control as back-end.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_add_pin_range(&gpio_dev-=
>gc, dev_name(&pdev->dev),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 0, gpio_dev->gc.ngpio);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->de=
v, "Failed to add pin range\n");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out2;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_add_data(&gpio_dev->gc, gpio_dev);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D gpiochip_irqchip_add(&gpio_dev->g=
c,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amd_gpio_irqchip,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
>>

