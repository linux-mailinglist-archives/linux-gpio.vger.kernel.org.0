Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6501F7292
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 11:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfKKK6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 05:58:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35131 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKK6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 05:58:10 -0500
Received: by mail-wr1-f65.google.com with SMTP id s5so3009092wrw.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2019 02:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ff/OMC2uAau2mAhoofAs4UHMiQyAXj1c9pkY1OLPdoo=;
        b=LaQUYxSAfzZQj1a+zLxcy0Bq4BPZXruN2Hxaf+yfK5bqy4gcUXMQvhDQfCa6Yd+azj
         Bn4Hzk7Zw65+tT5QtfUkt19a6HtUsl+smEI8Fy3Pu2pqZuBi7NxHilp8UY47PBKdSWPA
         JTDvBQ1FSdHz19EGtx/6oPc7RTZx+Ln4H5fBqaytmDr1gyqhNy5hIVtntxwl3tZeh0U4
         vkexstcL+mlHtM67IvlNwNCB+EHkRhwFXQCSBgnYqTVD1ZYwUw8ycjp9YF8fyuesQB14
         Nz2ybFFtUfVysQqiF4iqzR51IFPGbbbim9u5hnyAE4j4sCLWOpbXS5l8mmFWTPcwIZJ2
         K4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ff/OMC2uAau2mAhoofAs4UHMiQyAXj1c9pkY1OLPdoo=;
        b=fv+il4YPT2NRczX+gXrkn1qEnhq3o3rE6v00XUUUo+FZTI3jvgXr/poNd9afijCdjk
         xrEJgmg8T7SALj5aElZM1pCsXOuvEIV4Nhrg9Z+xyfV64udSh77aIl3nFZd7FnGfCXFB
         BSkYzVznWdf4EeIOtNyLm/mcjdnniL8QsCWkIB6teoUGgSnKqlpRnoUlB7kn10cWTFTE
         LXAmBWBLs3nzR+jImPyVjY0TRoJbTdcssgWARqkX+JrOg7Q2vQBLst5yLmRVrHJ5FRcZ
         XxbaMmFZUB6VEDF0cfRHeYb7PtZbH7M9AQjWFbyx1JCucdCZYYIFVYUcQWC4uT8kpsaF
         cRKQ==
X-Gm-Message-State: APjAAAV0PuFXwpQpSDMBPc1cEPldwzYibwGDBAk0BqkSOx/dIqy61Chd
        hRCMQkMx4VN8BUgZzt8SuSbRgA==
X-Google-Smtp-Source: APXvYqx8xObmE5fwQgmIoKQH3kqqcFm/LXo1giQF34YvA+BOHYlXNSI8WpZX656F+0hWaH4gE1NXpA==
X-Received: by 2002:adf:f084:: with SMTP id n4mr20238286wro.369.1573469887033;
        Mon, 11 Nov 2019 02:58:07 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id x205sm23261337wmb.5.2019.11.11.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 02:58:06 -0800 (PST)
Date:   Mon, 11 Nov 2019 10:57:58 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH v3 01/15] mfd: bd71828: Support ROHM BD71828 PMIC -
 core
Message-ID: <20191111105758.GF3218@dell>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <9ce6f5810847422f4def629d30bae7b43dd4c6c6.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ce6f5810847422f4def629d30bae7b43dd4c6c6.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 01 Nov 2019, Matti Vaittinen wrote:

> BD71828GW is a single-chip power management IC for battery-powered portable
> devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
> single-cell linear charger. Also included is a Coulomb counter, a real-time
> clock (RTC), 3 GPO/regulator control pins, HALL input and a 32.768 kHz
> clock gate.
> 
> Add MFD core driver providing interrupt controller facilities and i2c
> access to sub device drivers.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes compared to v2
> 
>  drivers/mfd/Kconfig              |  15 ++
>  drivers/mfd/Makefile             |   2 +-
>  drivers/mfd/rohm-bd71828.c       | 322 +++++++++++++++++++++++
>  include/linux/mfd/rohm-bd71828.h | 425 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   1 +
>  5 files changed, 764 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/rohm-bd71828.c
>  create mode 100644 include/linux/mfd/rohm-bd71828.h

/me wonders why this is still an RFC after 3 revisions?

[...]

> +static struct mfd_cell bd71828_mfd_cells[] = {
> +	{ .name = "bd71828-pmic", },
> +	{ .name = "bd71828-gpio", },
> +	{ .name = "bd71828-led", },
> +	/*
> +	 * We use BD71837 driver to drive the clock block. Only differences to
> +	 * BD70528 clock gate are the register address and mask.
> +	 */
> +	{ .name = "bd718xx-clk", },
> +	{
> +		.name = "bd71827-power",

Why isn't this on one line, like the others above?

> +	}, {
> +		.name = "bd70528-rtc",
> +		.resources = rtc_irqs,
> +		.num_resources = ARRAY_SIZE(rtc_irqs),
> +	},
> +};

[...]

> +unsigned int bit0_offsets[] = {11};		/* RTC IRQ register */
> +unsigned int bit1_offsets[] = {10};		/* TEMP IRQ register */
> +unsigned int bit2_offsets[] = {6, 7, 8, 9};	/* BAT MON IRQ registers */
> +unsigned int bit3_offsets[] = {5};		/* BAT IRQ register */
> +unsigned int bit4_offsets[] = {4};		/* CHG IRQ register */
> +unsigned int bit5_offsets[] = {3};		/* VSYS IRQ register */
> +unsigned int bit6_offsets[] = {1, 2};		/* DCIN IRQ registers */

Something actually wrong with the tabbing here, or is this a
Git/patch/mailer anomaly?

[...]

> +static int bd71828_i2c_probe(struct i2c_client *i2c,
> +			     const struct i2c_device_id *id)
> +{
> +	struct rohm_regmap_dev *chip;
> +	struct regmap_irq_chip_data *irq_data;
> +	int ret;
> +
> +	if (!i2c->irq) {
> +		dev_err(&i2c->dev, "No IRQ configured\n");
> +		return -EINVAL;
> +	}
> +
> +	chip = devm_kzalloc(&i2c->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&i2c->dev, chip);
> +
> +	chip->chip_type = ROHM_CHIP_TYPE_BD71828;
> +	chip->regmap = devm_regmap_init_i2c(i2c, &bd71828_regmap);
> +	if (IS_ERR(chip->regmap)) {
> +		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
> +		return PTR_ERR(chip->regmap);
> +	}
> +
> +	ret = devm_regmap_add_irq_chip(&i2c->dev, chip->regmap,
> +				       i2c->irq, IRQF_ONESHOT, 0,
> +				       &bd71828_irq_chip, &irq_data);
> +	if (ret) {
> +		dev_err(&i2c->dev, "Failed to add IRQ chip\n");
> +		return ret;
> +	}

Nit: '\n' here.

> +	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
> +		bd71828_irq_chip.num_irqs);
> +
> +	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				   bd71828_mfd_cells,
> +				   ARRAY_SIZE(bd71828_mfd_cells), NULL, 0,
> +				   regmap_irq_get_domain(irq_data));
> +	if (ret)
> +		dev_err(&i2c->dev, "Failed to create subdevices\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id bd71828_of_match[] = {
> +	{ .compatible = "rohm,bd71828", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, bd71828_of_match);
> +
> +static struct i2c_driver bd71828_drv = {
> +	.driver = {
> +		.name = "rohm-bd71828",
> +		.of_match_table = bd71828_of_match,
> +	},
> +	.probe = &bd71828_i2c_probe,

If 'id' isn't used, perhaps you should be using probe2?

[...]

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
