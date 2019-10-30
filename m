Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B2EE9E01
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfJ3Oz2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:55:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56941 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726866AbfJ3Oz2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 10:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572447326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3KjKq0B0korzwcQLB3kQ4f03vhwlPOqy/OXwKbOJibk=;
        b=eO5isIb3Rmh5IXgBGSoC23+jDSRouGDDU9zzViA/V8CsqS/d5/zMQ3qf1tj+++ZpqVdIFG
        bLOR+dWvB5QUBo9W+eGOgVZil7VTS6BqWKoI7uFHUwFW8VM1KJ94rZo7UVjrOH5V2tRCew
        q0XkFJNPdPlsLq91S6jZu+BnVAcdhEI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-fBup0HmLNVeiq6icv9tH3A-1; Wed, 30 Oct 2019 10:55:25 -0400
Received: by mail-wr1-f72.google.com with SMTP id i10so1472869wrp.7
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 07:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VbmoZXawvKMBBbzWONg1mAGlQvvhNA4Zw2kwo39ApfM=;
        b=FwvikBRECPsQwuoIe4Rt5eRHxMvtwJPIRb1XYtgMq6hKu2cPs0w6N3tYFJjoaCgS8U
         aUG/He2PfVgABnfXDIGL+lhXZi07aPprQ1S3dnFBFZR7l9yrx661MqO6mCLOF96BrWSm
         QGfw70BBYIQzjVh9Qbf7Mrak0lEQtfunEf/iqdVr7ELHoqMDZKFs7nI8HZ/N/f7Ti1KC
         Pi2dkR4iHpaEojLBy0OawsJQ6VvWoIb8Qc8a3P+toqVFH7GJdMZuO3eLPSQVuD3TNf01
         zB/au/kx128kwg0nMhA7PuQw6Ei6BSxCMdJN/qYjujRvJ3XBZIvWlh7F4k54lg73whJ/
         tPpw==
X-Gm-Message-State: APjAAAVyKeEclVZMJJORdXZKLlYYA8lpENBTRFof79H7UhDYnpGX8wIS
        65BcySTVDswngk0kphRBnAa+4/nLwD9DevwRiB/lvY5m9fDlAh+kekMfUfK22ymrqRLFF0dveWr
        rmn2l1DTterqFwStdw9vciQ==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr211153wrv.335.1572447323121;
        Wed, 30 Oct 2019 07:55:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPWbxn7QS2p8vhMcbetehKEG09/8VK3u7lYSwO2J/yAXQ70yfyA5EmTd/i4QKMuZX+wDBotA==
X-Received: by 2002:a5d:540c:: with SMTP id g12mr211128wrv.335.1572447322848;
        Wed, 30 Oct 2019 07:55:22 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id x7sm628933wrg.63.2019.10.30.07.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 07:55:22 -0700 (PDT)
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cda96f28-053a-002e-d168-0095c0eba047@redhat.com>
Date:   Wed, 30 Oct 2019 15:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030144940.21133-1-linus.walleij@linaro.org>
Content-Language: en-US
X-MC-Unique: fBup0HmLNVeiq6icv9tH3A-1
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

Thanks, I will give this a test-run asap.

Regards,

Hans


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

