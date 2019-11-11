Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD23F72A4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 12:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfKKLAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 06:00:13 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35408 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfKKLAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 06:00:13 -0500
Received: by mail-wr1-f67.google.com with SMTP id s5so3016077wrw.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2019 03:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TYoTnmxtieLkll/Leqoa1DJhCx8L4akQBrFiPa7ShkQ=;
        b=gds7b1wir0aQ7njohNYUaOjiRjXjdxQt2R2dXFLUyaIaBiii6c/tJCNwHkHV0fZM6t
         ni5mB5W0ZdShI/TVclwG5A2ovUP/c1HggiQgPUe+NuHK43DANgc4//J4wJyIxk8NNVY9
         NT7V15COgO6pKoiIFGeu5NQp2rA/K31k9AW5X8frG/X3U8a0+8DJV+t+0SSab8wmX4hh
         vh7Gvx7UqindMzLD2bNHQ3AQf9mxb9rKmcA9prgFSY892MLE/hsVDXvqPBxn2ncc7SaB
         iafgnCndvQIi4kFryeXd3NErkTWaSA6uX69HDF4nDu4DWrLma+Cu1zkk4J/p6ZvUT57w
         RMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TYoTnmxtieLkll/Leqoa1DJhCx8L4akQBrFiPa7ShkQ=;
        b=aZ1jrD++xeIVbdysSZsX2zRfvL0lFMNs1r4EW0B14tV600ES1Xe5zhvV7J0QT5Pf5h
         aR0Le5ki62BxvJO9rYxLLbXeXZjyii3QvI2DZr2w6E1XCGJvYeeV753nmu1Ja4fSHScE
         Z+VxMMHhIrCPcHvH1LpDc1w0obFT2Abwq0KF7BDCTCPNx/dwIbUUEtZjuzsyggCI6c05
         9XZcN1BJK9F8zJiVzRn63VEMJ175MGOlayAYakVdfin+NvTcZTygMMqXwS9Y2Byrugmm
         5PL4CHlCRuxQc4cLnj4ZaoXMFjnNVcGo+zNQfUdk9M8V42tQryC2RTtvbKy1BcuwzB1A
         rU+Q==
X-Gm-Message-State: APjAAAXwCcMySYCv4BcR3AoCIHwLPq3YoPZbeLoEYyY84G2XqKY0uv9W
        PnQrNzVw5VZ7wgDK9/sYo+dxfg==
X-Google-Smtp-Source: APXvYqw1xrTXnJrhBxh8P/A8uStccEhy7+/qu3o4uWIkYoYjhVhXXQjMB6DXFsKksquWgg9sZYWfdQ==
X-Received: by 2002:a05:6000:12c4:: with SMTP id l4mr9236312wrx.110.1573470003617;
        Mon, 11 Nov 2019 03:00:03 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id t5sm14215954wro.76.2019.11.11.03.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 03:00:03 -0800 (PST)
Date:   Mon, 11 Nov 2019 10:59:55 +0000
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
Subject: Re: [RFC PATCH v3 05/15] mfd: input: bd71828: Add power-key support
Message-ID: <20191111105955.GG3218@dell>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <d7be7969b9fed57e7790811ff90b9a2b4b6478bb.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7be7969b9fed57e7790811ff90b9a2b4b6478bb.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 01 Nov 2019, Matti Vaittinen wrote:

> Use gpio_keys to send power input-event to user-space when power
> button (short) press is detected.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v2 - No changes
> 
>  drivers/mfd/rohm-bd71828.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index b7de79e1fcdb..f77ba1ec3e99 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -4,7 +4,9 @@
>  //
>  // ROHM BD71828 PMIC driver
>  
> +#include <linux/gpio_keys.h>
>  #include <linux/i2c.h>
> +#include <linux/input.h>
>  #include <linux/interrupt.h>
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
> @@ -15,6 +17,18 @@
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  
> +static struct gpio_keys_button button = {
> +	.code = KEY_POWER,
> +	.gpio = -1,
> +	.type = EV_KEY,
> +};
> +
> +static struct gpio_keys_platform_data bd71828_powerkey_data = {
> +	.buttons = &button,
> +	.nbuttons = 1,
> +	.name = "bd71828-pwrkey",
> +};
> +
>  static const struct resource rtc_irqs[] = {
>  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
>  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
> @@ -36,6 +50,10 @@ static struct mfd_cell bd71828_mfd_cells[] = {
>  		.name = "bd70528-rtc",
>  		.resources = rtc_irqs,
>  		.num_resources = ARRAY_SIZE(rtc_irqs),
> +	}, {
> +		.name = "gpio-keys",
> +		.platform_data = &bd71828_powerkey_data,
> +		.pdata_size = sizeof(bd71828_powerkey_data),
>  	},
>  };
>  
> @@ -288,9 +306,19 @@ static int bd71828_i2c_probe(struct i2c_client *i2c,
>  		dev_err(&i2c->dev, "Failed to add IRQ chip\n");
>  		return ret;
>  	}
> +

This should be fixed in the last patch.

>  	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
>  		bd71828_irq_chip.num_irqs);
>  
> +	ret = regmap_irq_get_virq(irq_data, BD71828_INT_SHORTPUSH);
> +

Remove this empty line.

> +	if (ret < 0) {
> +		dev_err(&i2c->dev, "Failed to get the power-key IRQ\n");
> +		return ret;
> +	}
> +
> +	button.irq = ret;
> +

Once fixed, please apply my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
