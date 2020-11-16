Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073522B4A80
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 17:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbgKPQPc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 16 Nov 2020 11:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730530AbgKPQPc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 11:15:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56758C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 08:15:32 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kehAA-0003nU-I8; Mon, 16 Nov 2020 17:15:30 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kehA9-0000Gs-Tx; Mon, 16 Nov 2020 17:15:29 +0100
Message-ID: <65af91dc19822f5f164f23c3bc558a5d1b136440.camel@pengutronix.de>
Subject: Re: [PATCH] gpio: mxc: Remove unused .id_table support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Date:   Mon, 16 Nov 2020 17:15:29 +0100
In-Reply-To: <20201116154407.15179-1-festevam@gmail.com>
References: <20201116154407.15179-1-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Fabio,

On Mon, 2020-11-16 at 12:44 -0300, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
> .id_table support in this driver was only useful for old non-devicetree
> platforms.
> 
> Get rid of the .id_table since it is no longer used.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpio/gpio-mxc.c | 29 +++++------------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 643f4c557ac2..aadc11064b74 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -133,30 +133,12 @@ static struct mxc_gpio_hwdata *mxc_gpio_hwdata;
>  #define GPIO_INT_FALL_EDGE	(mxc_gpio_hwdata->fall_edge)
>  #define GPIO_INT_BOTH_EDGES	0x4
>  
> -static const struct platform_device_id mxc_gpio_devtype[] = {
> -	{
> -		.name = "imx1-gpio",
> -		.driver_data = IMX1_GPIO,
> -	}, {
> -		.name = "imx21-gpio",
> -		.driver_data = IMX21_GPIO,
> -	}, {
> -		.name = "imx31-gpio",
> -		.driver_data = IMX31_GPIO,
> -	}, {
> -		.name = "imx35-gpio",
> -		.driver_data = IMX35_GPIO,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> -
>  static const struct of_device_id mxc_gpio_dt_ids[] = {
> -	{ .compatible = "fsl,imx1-gpio", .data = &mxc_gpio_devtype[IMX1_GPIO], },
> -	{ .compatible = "fsl,imx21-gpio", .data = &mxc_gpio_devtype[IMX21_GPIO], },
> -	{ .compatible = "fsl,imx31-gpio", .data = &mxc_gpio_devtype[IMX31_GPIO], },
> -	{ .compatible = "fsl,imx35-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
> -	{ .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
> +	{ .compatible = "fsl,imx1-gpio", .data = (const void *)IMX1_GPIO },
> +	{ .compatible = "fsl,imx21-gpio", .data = (const void *)IMX21_GPIO },
> +	{ .compatible = "fsl,imx31-gpio", .data = (const void *)IMX31_GPIO },
> +	{ .compatible = "fsl,imx35-gpio", .data = (const void *)IMX35_GPIO },
> +	{ .compatible = "fsl,imx7d-gpio", .data = (const void *)IMX35_GPIO },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
> @@ -596,7 +578,6 @@ static struct platform_driver mxc_gpio_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  	.probe		= mxc_gpio_probe,
> -	.id_table	= mxc_gpio_devtype,
>  };
>  
>  static int __init gpio_mxc_init(void)

This seems to be missing conversion of the code that uses the matched
of_device_id. That currently has to expect .data to be a pointer to
struct platform_device_id.

regards
Philipp
