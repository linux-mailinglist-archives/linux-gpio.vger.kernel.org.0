Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 728A2DB013
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 16:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440129AbfJQO2c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 10:28:32 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:32847 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731664AbfJQO2c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 10:28:32 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 02998E0006;
        Thu, 17 Oct 2019 14:28:26 +0000 (UTC)
Date:   Thu, 17 Oct 2019 16:28:23 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Message-ID: <20191017142823.GF3125@piout.net>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/10/2019 09:04:48-0500, Dan Murphy wrote:
> Matt
> 
> On 10/17/19 4:53 AM, Matti Vaittinen wrote:
> > ROHM BD71828 power management IC has two LED outputs for charge status
> > and button pressing indications. The LED outputs can also be forced
> > bs SW so add driver allowing to use these LEDs for other indications
> s/bs/by
> > as well.
> > 
> > Leds are controlled by SW using 'Force ON' bits. Please note the
> > constrains mentioned in data-sheet:
> > 1. If one LED is forced ON - then also the other LED is forced.
> > 	=> You can't use SW control to force ON one LED and allow HW
> > 	   to control the other.
> > 2. You can't force both LEDs OFF. If the FORCE bit for both LED's is
> >     zero, then LEDs are controlled by HW and indicate button/charger
> >     states as explained in data-sheet.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >   drivers/leds/Kconfig        | 10 ++++
> >   drivers/leds/Makefile       |  1 +
> >   drivers/leds/leds-bd71828.c | 97 +++++++++++++++++++++++++++++++++++++
> >   3 files changed, 108 insertions(+)
> >   create mode 100644 drivers/leds/leds-bd71828.c
> > 
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index b0fdeef10bd9..ec59f28bcb39 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -529,6 +529,16 @@ config LEDS_BD2802
> >   	  This option enables support for BD2802GU RGB LED driver chips
> >   	  accessed via the I2C bus.
> > +config LEDS_BD71828
> > +	tristate "LED driver for LED pins on ROHM BD71828 PMIC"
> > +	depends on LEDS_CLASS
> doesn't this have a dependency on MFD_ROHM_BD71828
> > +	depends on I2C
> > +	help
> > +	  This option enables support for LED outputs located on ROHM
> > +	   BD71828 power management IC. ROHM BD71828 has two led output pins
> > +	   which can be left to indicate HW states or controlled by SW. Say
> > +	   yes here if you want to enable SW control for these LEDs.
> > +
> 
> Add module statement
> 
> 
> >   config LEDS_INTEL_SS4200
> >   	tristate "LED driver for Intel NAS SS4200 series"
> >   	depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 41fb073a39c1..2a8f6a8e4c7c 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
> >   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> >   obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
> >   obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
> > +obj-$(CONFIG_LEDS_BD71828)		+= leds-bd71828.o
> >   obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
> >   obj-$(CONFIG_LEDS_LOCOMO)		+= leds-locomo.o
> >   obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
> > diff --git a/drivers/leds/leds-bd71828.c b/drivers/leds/leds-bd71828.c
> > new file mode 100644
> > index 000000000000..2427619444f5
> > --- /dev/null
> > +++ b/drivers/leds/leds-bd71828.c
> > @@ -0,0 +1,97 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (C) 2019 ROHM Semiconductors
> > +
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/rohm-bd71828.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +
> > +#define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ? \
> > +	container_of((l), struct bd71828_leds, green) : \
> > +	container_of((l), struct bd71828_leds, amber))
> 
> I don't think we should be defining the color as the variable. The outputs
> can drive any color LED.
> 
> 
> > +
> > +enum {
> > +	ID_GREEN_LED,
> > +	ID_AMBER_LED,
> > +	ID_NMBR_OF,
> > +};
> > +
> 
> Please use the color_id in linux/include/dt-bindings/leds/common.h
> 
> 
> > +struct bd71828_led {
> > +	int id;
> > +	struct led_classdev l;
> > +	u8 force_mask;
> > +};
> > +
> > +struct bd71828_leds {
> > +	struct rohm_regmap_dev *bd71828;
> > +	struct bd71828_led green;
> > +	struct bd71828_led amber;
> > +};
> > +
> > +static int bd71828_led_brightness_set(struct led_classdev *led_cdev,
> > +				      enum led_brightness value)
> > +{
> > +	struct bd71828_led *l = container_of(led_cdev, struct bd71828_led, l);
> > +	struct bd71828_leds *data;
> > +	unsigned int val = BD71828_LED_OFF;
> > +
> > +	data = BD71828_LED_TO_DATA(l);
> > +	if (value != LED_OFF)
> > +		val = BD71828_LED_ON;
> > +
> > +	return regmap_update_bits(data->bd71828->regmap, BD71828_REG_LED_CTRL,
> > +			    l->force_mask, val);
> > +}
> > +
> > +static int bd71828_led_probe(struct platform_device *pdev)
> > +{
> > +	struct rohm_regmap_dev *bd71828;
> > +	struct bd71828_leds *l;
> > +	struct bd71828_led *g, *a;
> > +	static const char *GNAME = "bd71828-green-led";
> > +	static const char *ANAME = "bd71828-amber-led";
> The LED class creates the name it can get it from the DT.
> > +	int ret;
> > +
> > +	pr_info("bd71828 LED driver probed\n");
> > +
> > +	bd71828 = dev_get_drvdata(pdev->dev.parent);
> > +	l = devm_kzalloc(&pdev->dev, sizeof(*l), GFP_KERNEL);
> > +	if (!l)
> > +		return -ENOMEM;
> > +	l->bd71828 = bd71828;
> > +	a = &l->amber;
> > +	g = &l->green;
> > +	a->id = ID_AMBER_LED;
> > +	g->id = ID_GREEN_LED;
> > +	a->force_mask = BD71828_MASK_LED_AMBER;
> > +	g->force_mask = BD71828_MASK_LED_GREEN;
> > +
> > +	a->l.name = ANAME;
> > +	g->l.name = GNAME;
> > +	a->l.brightness_set_blocking = bd71828_led_brightness_set;
> > +	g->l.brightness_set_blocking = bd71828_led_brightness_set;
> > +
> > +	ret = devm_led_classdev_register(&pdev->dev, &g->l);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_led_classdev_register(&pdev->dev, &a->l);
> > +}
> > +
> 
> This looks different.  Not sure why you register both LEDs in this probe.
> 
> You can use the DT to define both LEDs and then each will be probed and
> registered separately.
> 
> This is how it is commonly done.
> 
> You can reference the LM36274 led driver as this is a MFD device to the
> ti-lmu.c in the MFD directory.
> 
> 
> > +static struct platform_driver bd71828_led_driver = {
> > +	.driver = {
> > +		.name  = "bd71828-led",
> > +	},
> > +	.probe  = bd71828_led_probe,
> > +};
> > +
> > +module_platform_driver(bd71828_led_driver);
> > +
> > +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> > +MODULE_DESCRIPTION("ROHM BD71828 LED driver");
> > +MODULE_LICENSE("GPL");
> GPL v2

GPL is fine, see bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL"
vs. "GPL v2" bogosity")


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
