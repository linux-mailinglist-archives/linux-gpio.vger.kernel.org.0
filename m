Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36D140DA6E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 14:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239519AbhIPM6h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 08:58:37 -0400
Received: from mxout70.expurgate.net ([91.198.224.70]:35817 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239126AbhIPM6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 08:58:37 -0400
X-Greylist: delayed 348 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Sep 2021 08:58:36 EDT
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mQqrO-000TDY-RZ; Thu, 16 Sep 2021 14:51:26 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mQqrO-000Aip-0Y; Thu, 16 Sep 2021 14:51:26 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 5F15E240042;
        Thu, 16 Sep 2021 14:51:24 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 035FC240041;
        Thu, 16 Sep 2021 14:51:24 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id 1EC212021D;
        Thu, 16 Sep 2021 14:51:23 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Sep 2021 14:51:23 +0200
From:   Florian Eckert <fe@dev.tdt.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-gpio-owner@vger.kernel.org
Subject: Re: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform data
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
Message-ID: <290741faab199d3e43b6255bf2282075@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate: clean
X-purgate-ID: 151534::1631796686-00012A61-E517B635/0/0
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

I just wanted to port my target an APU3 (x86_64) to kernel version 5.10 
in OpenWrt.
This is the next stable LTS kernel version in OpenWrt.

On my board I have this device as an I2c bus IO-expander with which I 
control additional LEDs.
For this purpose I have a platform driver. Which registers these 
additional LEDs.
I have now discovered that the platform driver no longer compiles due to 
this change, as the platform data for the mcp23017 have been removed by 
this change in kernel version 5.8.

I don't have control over the BIOS (coreboot) and I can't adjust the 
ACPI tables.
Since this is an x86 platform, I can't work with a device tree, can I?

--
Florian

On 2020-04-07 19:38, Andy Shevchenko wrote:
> Platform data is a legacy interface to supply device properties
> to the driver. In this case we even don't have in-kernel users
> for it. Just remove it for good.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 42 +++++++++---------------------
>  include/linux/spi/mcp23s08.h       | 18 -------------
>  2 files changed, 12 insertions(+), 48 deletions(-)
>  delete mode 100644 include/linux/spi/mcp23s08.h
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c
> b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 3a235487e38d..2c8b8c45b70e 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -8,7 +8,6 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/spi/spi.h>
> -#include <linux/spi/mcp23s08.h>
>  #include <linux/slab.h>
>  #include <asm/byteorder.h>
>  #include <linux/interrupt.h>
> @@ -914,16 +913,9 @@ MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
>  static int mcp230xx_probe(struct i2c_client *client,
>  				    const struct i2c_device_id *id)
>  {
> -	struct mcp23s08_platform_data *pdata, local_pdata;
>  	struct mcp23s08 *mcp;
>  	int status;
> 
> -	pdata = dev_get_platdata(&client->dev);
> -	if (!pdata) {
> -		pdata = &local_pdata;
> -		pdata->base = -1;
> -	}
> -
>  	mcp = devm_kzalloc(&client->dev, sizeof(*mcp), GFP_KERNEL);
>  	if (!mcp)
>  		return -ENOMEM;
> @@ -937,7 +929,7 @@ static int mcp230xx_probe(struct i2c_client 
> *client,
>  	mcp->irq_chip.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock;
> 
>  	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
> -				    id->driver_data, pdata->base, 0);
> +				    id->driver_data, -1, 0);
>  	if (status)
>  		return status;
> 
> @@ -986,13 +978,13 @@ static void mcp23s08_i2c_exit(void) { }
> 
>  static int mcp23s08_probe(struct spi_device *spi)
>  {
> -	struct mcp23s08_platform_data	*pdata, local_pdata;
>  	unsigned			addr;
>  	int				chips = 0;
>  	struct mcp23s08_driver_data	*data;
>  	int				status, type;
>  	unsigned			ngpio = 0;
>  	const struct			of_device_id *match;
> +	u32				spi_present_mask;
> 
>  	match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), 
> &spi->dev);
>  	if (match)
> @@ -1000,32 +992,24 @@ static int mcp23s08_probe(struct spi_device 
> *spi)
>  	else
>  		type = spi_get_device_id(spi)->driver_data;
> 
> -	pdata = dev_get_platdata(&spi->dev);
> -	if (!pdata) {
> -		pdata = &local_pdata;
> -		pdata->base = -1;
> -
> +	status = device_property_read_u32(&spi->dev,
> +			"microchip,spi-present-mask", &spi_present_mask);
> +	if (status) {
>  		status = device_property_read_u32(&spi->dev,
> -			"microchip,spi-present-mask", &pdata->spi_present_mask);
> +				"mcp,spi-present-mask", &spi_present_mask);
>  		if (status) {
> -			status = device_property_read_u32(&spi->dev,
> -				"mcp,spi-present-mask",
> -				&pdata->spi_present_mask);
> -
> -			if (status) {
> -				dev_err(&spi->dev, "missing spi-present-mask");
> -				return -ENODEV;
> -			}
> +			dev_err(&spi->dev, "missing spi-present-mask");
> +			return -ENODEV;
>  		}
>  	}
> 
> -	if (!pdata->spi_present_mask || pdata->spi_present_mask > 0xff) {
> +	if (!spi_present_mask || spi_present_mask > 0xff) {
>  		dev_err(&spi->dev, "invalid spi-present-mask");
>  		return -ENODEV;
>  	}
> 
>  	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
> -		if (pdata->spi_present_mask & BIT(addr))
> +		if (spi_present_mask & BIT(addr))
>  			chips++;
>  	}
> 
> @@ -1040,7 +1024,7 @@ static int mcp23s08_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, data);
> 
>  	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
> -		if (!(pdata->spi_present_mask & BIT(addr)))
> +		if (!(spi_present_mask & BIT(addr)))
>  			continue;
>  		chips--;
>  		data->mcp[addr] = &data->chip[chips];
> @@ -1054,12 +1038,10 @@ static int mcp23s08_probe(struct spi_device 
> *spi)
>  			mcp23s08_irq_bus_unlock;
>  		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
>  					    0x40 | (addr << 1), type,
> -					    pdata->base, addr);
> +					    -1, addr);
>  		if (status < 0)
>  			return status;
> 
> -		if (pdata->base != -1)
> -			pdata->base += data->mcp[addr]->chip.ngpio;
>  		ngpio += data->mcp[addr]->chip.ngpio;
>  	}
>  	data->ngpio = ngpio;
> diff --git a/include/linux/spi/mcp23s08.h 
> b/include/linux/spi/mcp23s08.h
> deleted file mode 100644
> index 738a45b435f2..000000000000
> --- a/include/linux/spi/mcp23s08.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -struct mcp23s08_platform_data {
> -	/* For mcp23s08, up to 4 slaves (numbered 0..3) can share one SPI
> -	 * chipselect, each providing 1 gpio_chip instance with 8 gpios.
> -	 * For mpc23s17, up to 8 slaves (numbered 0..7) can share one SPI
> -	 * chipselect, each providing 1 gpio_chip (port A + port B) with
> -	 * 16 gpios.
> -	 */
> -	u32 spi_present_mask;
> -
> -	/* "base" is the number of the first GPIO or -1 for dynamic
> -	 * assignment. If there are gaps in chip addressing the GPIO
> -	 * numbers are sequential .. so for example if only slaves 0
> -	 * and 3 are present, their GPIOs range from base to base+15
> -	 * (or base+31 for s17 variant).
> -	 */
> -	unsigned	base;
> -};
