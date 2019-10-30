Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D20DE9F78
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 16:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfJ3Psb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 11:48:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28143 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726175AbfJ3Psb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 11:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572450508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gOJ9lTEC+s6bFREE7spa9Cm2EwjOkWGd5nUTqSizZqs=;
        b=B3GaDjJ6oWg2vXV8m8X0SQRNuxGQpl8F6u+oF74BcvYVkVmpYVxY0dSoUoK4SIH7wbzypd
        KpoDTUescF8o+s/se7o/MfhENOQLg1BJRnf97/6iyRL5Fq1jwF87aD+teimgBtltKYc7fu
        Gs0clLAgRPUXsLDp8jp6Cic61w+oPKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-YHP78U0mP2WX-OGU6YDXTg-1; Wed, 30 Oct 2019 11:48:27 -0400
Received: by mail-wr1-f72.google.com with SMTP id t2so1543836wri.18
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 08:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W60mbRQyKjgZODu0gVjO20IfUezfP8euSTBsEWb05+k=;
        b=UtwrNz2ro3sYK/98tdFF87BDUBPYNqWMyWCtbgn+Nm2Nf5Vs0vQHf+91YnEHfDHUTX
         IWjidCzvWx/SMPR6t4TMZeMCgzdCSS81drGLjxd+kxTKJVxjiOJhzOmxy2b0BKLwjHbq
         5+NJCa2RlsnIBlt/0c/YXSs5Xkik3lHvZIMp5J1oAT/7adH4U5oILYh93prsjZZFmXOP
         gtB7qk5TLNvUEt1/v/YKYC/z5NVCLWhaNIpWKrN0sBz2ZlEi/wHoDrs0rcZrCRlWX4ne
         eIXe3tbgcAcgz/vHNs39P2z0OGNJW7Tag8adQOlJHX8TdgdyrCx9KKMwo4lyw4fbFc6G
         5WRg==
X-Gm-Message-State: APjAAAUg/pmWhcyT158q2V7J9c+PYG4C9np0BGdgT49rGmcgcHwKkLeu
        CTQfuY4Aiz4l48OV7zfOnvll1v4NDd4BewOQ5LCuwSeSMERICENoG/8tU8goJgmf1oAABgVVrym
        PL+o2tQrUW+BzlgcvuOHR4A==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr475136wrr.368.1572450505349;
        Wed, 30 Oct 2019 08:48:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYN6fHEt09EFQkxrn1bSdOHEMJmnLgSrBkujOpHuqiXk/UUx38YoAscKWWBwzwRidLv1fAGg==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr475114wrr.368.1572450505081;
        Wed, 30 Oct 2019 08:48:25 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id r3sm485620wmh.9.2019.10.30.08.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 08:48:24 -0700 (PDT)
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
Date:   Wed, 30 Oct 2019 16:48:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030144940.21133-1-linus.walleij@linaro.org>
Content-Language: en-US
X-MC-Unique: YHP78U0mP2WX-OGU6YDXTg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-10-2019 15:49, Linus Walleij wrote:
> This fixes a semantic ordering issue as we need to add
> pin ranges before adding gpiochips when gpiochips use
> pin control as a backend: as it needs to talk to the
> pin control backend during initialization, the backend
> needs to be there already.
>=20
> Other drivers in the tree using pincontrol as backend do
> not necessarily have this problem, as they might not need
> to access the pincontrol portions during initialization.
>=20
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hans: would be great if you could test this. I can't
> even compiletest right now because of a slow machine
> as workhorse...

This does not seem to work I've tested in both a Bay Trail and
a Cherry Trail device and neither will boot the kernel after
these changes I'm afraid.

I think it might be best to pass in an array of ranges (*) to
gpiochip_add_data and have it register the ranges before
doing the irq-chip setup.

Regards,

Hans



*) Terminated with a range from 0 to 0

> ---
>   drivers/gpio/gpio-merrifield.c             | 18 +++++++++++-------
>   drivers/pinctrl/intel/pinctrl-baytrail.c   | 14 +++++++++-----
>   drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++++------
>   drivers/pinctrl/intel/pinctrl-intel.c      | 16 ++++++++++------
>   drivers/pinctrl/pinctrl-amd.c              | 14 +++++++++-----
>   5 files changed, 49 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifiel=
d.c
> index 2f1e9da81c1e..195e253cb561 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -463,13 +463,10 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *id
>   =09girq->default_type =3D IRQ_TYPE_NONE;
>   =09girq->handler =3D handle_bad_irq;
>  =20
> -=09pci_set_drvdata(pdev, priv);
> -=09retval =3D devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
> -=09if (retval) {
> -=09=09dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
> -=09=09return retval;
> -=09}
> -
> +=09/*
> +=09 * Needs to happen first since the gpiochip is using pin
> +=09 * control as back-end.
> +=09 */
>   =09pinctrl_dev_name =3D mrfld_gpio_get_pinctrl_dev_name(priv);
>   =09for (i =3D 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
>   =09=09range =3D &mrfld_gpio_ranges[i];
> @@ -484,6 +481,13 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *id
>   =09=09}
>   =09}
>  =20
> +=09pci_set_drvdata(pdev, priv);
> +=09retval =3D devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
> +=09if (retval) {
> +=09=09dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);
> +=09=09return retval;
> +=09}
> +
>   =09return 0;
>   }
>  =20
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/i=
ntel/pinctrl-baytrail.c
> index beb26550c25f..b308567c5153 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1549,16 +1549,20 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>   =09=09girq->handler =3D handle_bad_irq;
>   =09}
>  =20
> -=09ret =3D devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
> +=09/*
> +=09 * Needs to happen first since the gpiochip is using pin
> +=09 * control as back-end.
> +=09 */
> +=09ret =3D gpiochip_add_pin_range(gc, dev_name(&vg->pdev->dev),
> +=09=09=09=09     0, 0, vg->soc_data->npins);
>   =09if (ret) {
> -=09=09dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
> +=09=09dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
>   =09=09return ret;
>   =09}
>  =20
> -=09ret =3D gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev),
> -=09=09=09=09     0, 0, vg->soc_data->npins);
> +=09ret =3D devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
>   =09if (ret) {
> -=09=09dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
> +=09=09dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
>   =09=09return ret;
>   =09}
>  =20
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl=
/intel/pinctrl-cherryview.c
> index dff2a81250b6..13144e192c1f 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1572,12 +1572,10 @@ static int chv_gpio_probe(struct chv_pinctrl *pct=
rl, int irq)
>   =09if (need_valid_mask)
>   =09=09chip->irq.init_valid_mask =3D chv_init_irq_valid_mask;
>  =20
> -=09ret =3D devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
> -=09if (ret) {
> -=09=09dev_err(pctrl->dev, "Failed to register gpiochip\n");
> -=09=09return ret;
> -=09}
> -
> +=09/*
> +=09 * Needs to happen first since the gpiochip is using pin
> +=09 * control as back-end.
> +=09 */
>   =09for (i =3D 0; i < community->ngpio_ranges; i++) {
>   =09=09range =3D &community->gpio_ranges[i];
>   =09=09ret =3D gpiochip_add_pin_range(chip, dev_name(pctrl->dev),
> @@ -1589,6 +1587,12 @@ static int chv_gpio_probe(struct chv_pinctrl *pctr=
l, int irq)
>   =09=09}
>   =09}
>  =20
> +=09ret =3D devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
> +=09if (ret) {
> +=09=09dev_err(pctrl->dev, "Failed to register gpiochip\n");
> +=09=09return ret;
> +=09}
> +
>   =09/*
>   =09 * The same set of machines in chv_no_valid_mask[] have incorrectly
>   =09 * configured GPIOs that generate spurious interrupts so we use
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/inte=
l/pinctrl-intel.c
> index b54b27228ad9..78afcf13c444 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1225,12 +1225,10 @@ static int intel_gpio_probe(struct intel_pinctrl =
*pctrl, int irq)
>   =09pctrl->irqchip.irq_set_wake =3D intel_gpio_irq_wake;
>   =09pctrl->irqchip.flags =3D IRQCHIP_MASK_ON_SUSPEND;
>  =20
> -=09ret =3D devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> -=09if (ret) {
> -=09=09dev_err(pctrl->dev, "failed to register gpiochip\n");
> -=09=09return ret;
> -=09}
> -
> +=09/*
> +=09 * Needs to happen first since the gpiochip is using pin
> +=09 * control as back-end.
> +=09 */
>   =09for (i =3D 0; i < pctrl->ncommunities; i++) {
>   =09=09struct intel_community *community =3D &pctrl->communities[i];
>  =20
> @@ -1241,6 +1239,12 @@ static int intel_gpio_probe(struct intel_pinctrl *=
pctrl, int irq)
>   =09=09}
>   =09}
>  =20
> +=09ret =3D devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> +=09if (ret) {
> +=09=09dev_err(pctrl->dev, "failed to register gpiochip\n");
> +=09=09return ret;
> +=09}
> +
>   =09/*
>   =09 * We need to request the interrupt here (instead of providing chip
>   =09 * to the irq directly) because on some platforms several GPIO
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.=
c
> index 2c61141519f8..3637059083ff 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -912,17 +912,21 @@ static int amd_gpio_probe(struct platform_device *p=
dev)
>   =09=09return PTR_ERR(gpio_dev->pctrl);
>   =09}
>  =20
> -=09ret =3D gpiochip_add_data(&gpio_dev->gc, gpio_dev);
> -=09if (ret)
> -=09=09return ret;
> -
> +=09/*
> +=09 * Needs to happen first since the gpiochip is using pin
> +=09 * control as back-end.
> +=09 */
>   =09ret =3D gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
>   =09=09=09=090, 0, gpio_dev->gc.ngpio);
>   =09if (ret) {
>   =09=09dev_err(&pdev->dev, "Failed to add pin range\n");
> -=09=09goto out2;
> +=09=09return ret;
>   =09}
>  =20
> +=09ret =3D gpiochip_add_data(&gpio_dev->gc, gpio_dev);
> +=09if (ret)
> +=09=09return ret;
> +
>   =09ret =3D gpiochip_irqchip_add(&gpio_dev->gc,
>   =09=09=09=09&amd_gpio_irqchip,
>   =09=09=09=090,
>=20

