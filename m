Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839B911FF30
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 08:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfLPHrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 02:47:40 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58859 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbfLPHrj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 02:47:39 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1igl6M-0003xT-O3; Mon, 16 Dec 2019 08:47:34 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1igl6M-0007Km-68; Mon, 16 Dec 2019 08:47:34 +0100
Date:   Mon, 16 Dec 2019 08:47:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
Message-ID: <20191216074734.ctjxx6rqtj6mt2dw@pengutronix.de>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-4-m.felsch@pengutronix.de>
 <AM5PR1001MB0994E2D72A95E4AC4796F80A80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB0994E2D72A95E4AC4796F80A80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:38:41 up 30 days, 22:57, 40 users,  load average: 0.92, 1.16,
 1.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Adam,

On 19-12-12 16:48, Adam Thomson wrote:
> On 12 December 2019 16:04, Marco Felsch wrote:
> 
> > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> > +				  unsigned long config)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +	int gpio_mode;
> > +
> > +	/*
> > +	 * We need to meet the following restrictions [1, Figure 18]:
> > +	 * - PIN_CONFIG_BIAS_PULL_DOWN -> only allowed if the pin is used as
> > +	 *				  gpio input
> > +	 * - PIN_CONFIG_BIAS_PULL_UP   -> only allowed if the pin is used as
> > +	 *				  gpio output open-drain.
> > +	 */
> > +
> > +	switch (pinconf_to_config_param(config)) {
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		gpio_mode = da9062_pctl_get_pin_mode(pctl, offset);
> > +		if (gpio_mode < 0)
> > +			return -EINVAL;
> > +		else if (gpio_mode != DA9062_PIN_GPI)
> > +			return -ENOTSUPP;
> > +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +					  BIT(offset), BIT(offset));
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		gpio_mode = da9062_pctl_get_pin_mode(pctl, offset);
> > +		if (gpio_mode < 0)
> > +			return -EINVAL;
> > +		else if (gpio_mode != DA9062_PIN_GPO_OD)
> > +			return -ENOTSUPP;
> > +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +					  BIT(offset), BIT(offset));
> 
> Apologies for the delay on reviewing. Just looking at the datasheet, how do we
> disable PULL_DOWN (for input) and PULL_UP (for output)? Should we not have a
> 'PIN_CONFIG_BIAS_DISABLE' case here to handle this?

No worries, thanks for the review :)
Nice catch, Linus is it okay to add this as follow up patch? The current
patch isn't wrong without the 'PIN_CONFIG_BIAS_DISABLE' case.

Regards,
  Marco

> > +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > +		return da9062_pctl_set_pin_mode(pctl, offset,
> > +						DA9062_PIN_GPO_OD);
> > +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> > +		return da9062_pctl_set_pin_mode(pctl, offset,
> > +						DA9062_PIN_GPO_PP);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> 

