Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA73414B227
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 11:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgA1KBN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 05:01:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:52978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgA1KBN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 05:01:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0DB87B122;
        Tue, 28 Jan 2020 10:01:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <1580148908-4863-3-git-send-email-stefan.wahren@i2se.com>
Date:   Tue, 28 Jan 2020 10:44:23 +0100
From:   "Nicolas Saenz Julienne" <nsaenzjulienne@suse.de>
To:     "Stefan Wahren" <stefan.wahren@i2se.com>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Ray Jui" <rjui@broadcom.com>,
        "Scott Branden" <sbranden@broadcom.com>
Cc:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <devicetree@vger.kernel.org>,
        "Stefan Wahren" <stefan.wahren@i2se.com>
Subject: Re: [RFC PATCH 2/4] pinctrl: bcm2835: Refactor platform data
Message-Id: <C07BSWY2PTAT.1MNBWW503QTQ0@linux-9qgx>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stefan,
thanks for the series!

On Mon Jan 27, 2020 at 7:15 PM, Stefan Wahren wrote:
> This prepares the platform data to be easier to extend for more GPIOs.
> Except of this there is no functional change.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

[...]

> @@ -1083,6 +1112,7 @@ static int bcm2835_pinctrl_probe(struct
> platform_device *pdev)
> struct device *dev =3D &pdev->dev;
> struct device_node *np =3D dev->of_node;
> struct bcm2835_pinctrl *pc;
> + struct bcm_plat_data *pdata;

You could define pdata as const here...

> struct gpio_irq_chip *girq;
> struct resource iomem;
> int err, i;
> @@ -1108,7 +1138,13 @@ static int bcm2835_pinctrl_probe(struct
> platform_device *pdev)
> if (IS_ERR(pc->base))
> return PTR_ERR(pc->base);
> =20
> - pc->gpio_chip =3D bcm2835_gpio_chip;
> + match =3D of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
> + if (!match)
> + return -EINVAL;
> +
> + pdata =3D (struct bcm_plat_data *)match->data;

...And avoid this cast.

> +
> + memcpy(&pc->gpio_chip, pdata->gpio_chip, sizeof(pc->gpio_chip));

Here (and below) you could do:

	pc->gpio_chip =3D *pdata->gpio_chip;

IMO it's nicer, but it's a matter of taste.

> pc->gpio_chip.parent =3D dev;
> pc->gpio_chip.of_node =3D np;
> =20
> @@ -1159,19 +1195,14 @@ static int bcm2835_pinctrl_probe(struct
> platform_device *pdev)
> return err;
> }
> =20
> - match =3D of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
> - if (match) {
> - bcm2835_pinctrl_desc.confops =3D
> - (const struct pinconf_ops *)match->data;
> - }
> -
> - pc->pctl_dev =3D devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
> + memcpy(&pc->pctl_desc, pdata->pctl_desc, sizeof(pc->pctl_desc));
> + pc->pctl_dev =3D devm_pinctrl_register(dev, &pc->pctl_desc, pc);
> if (IS_ERR(pc->pctl_dev)) {
> gpiochip_remove(&pc->gpio_chip);
> return PTR_ERR(pc->pctl_dev);
> }
> =20
> - pc->gpio_range =3D bcm2835_pinctrl_gpio_range;
> + memcpy(&pc->gpio_range, pdata->gpio_range, sizeof(pc->gpio_range));
> pc->gpio_range.base =3D pc->gpio_chip.base;
> pc->gpio_range.gc =3D &pc->gpio_chip;
> pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
> --
> 2.7.4

