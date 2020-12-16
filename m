Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7772DC333
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 16:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgLPPgK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 10:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgLPPgJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 10:36:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755E7C06179C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 07:35:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id n16so2176634wmc.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=URTVybMkWU8UOlGVLaTerEC4ELLPucxmBX8a0bhaGVg=;
        b=OOSVoZuKDXySvJ/oKHQBcnmLq3xNDvShNNiG7HUxz+TvEQ8cWeGV+/ertIL6ktkpin
         GVRaSKcleSuL24RQZJzpFVaB1qvxLhXHf3mqUSZLYgJmDQXH2UVX0/mtiPBX5aOTEKMI
         zk3mrlJqmNYNvMTYhLn1Cts8feAtcYEt0tavcNxumPqUPuREBX5p5fedZZ24Sw99qFzO
         V62rs2qK5pDbNcVpBA54arCt6cYJFRqYYwmILCotth+PgqbI1o/n5Umocaiw2lkDxBbV
         4CQKL1kaZ11Nxw9PqXSmtaCf1ZPP31ZN0nyblTGS9VRyW89iZ8IdEwcM9ymkoFT9THWL
         OA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=URTVybMkWU8UOlGVLaTerEC4ELLPucxmBX8a0bhaGVg=;
        b=Cpul/3wPYfQtV5RH87zy4Qh8ugXU/eqU29LvyMweCaHK4aexkfW0HgpkSIZuhCH1P+
         +Qvh256RJMUiApOIxKDFDboM0q2B47bWEg6U1z6AxraVc2gGs8M2QaStbtHGNYETt6q4
         XyP4z4kRSP0sTGO3RiIyQ686UbaF9RcLh47XKWnn68om0IA1uGWL0FIAhV0/Xbf7Bf+u
         WelV1Z5NHngXvCwJyWgUmRQ3F2IpOV3RRCQUL14zBaw8sxGUJet2vdDl74OpxMAKwI2V
         +KJqN0OMxkuUkIPFKHNbg72Azcz4ZtHCtcDgkAzhWH1Rhxsf1QICShJwg4ldTZpCjtN4
         COaw==
X-Gm-Message-State: AOAM5318nstK7Zw2W0df5FNXyusOAuiRjDQpODimcw1zLZoEq8rqGwjZ
        hP1r238dtwxSjxsjBEjVwEcvAA==
X-Google-Smtp-Source: ABdhPJzK67M8YB+SEHXxtsaOMW915TF/g0Ssdd/Ffk4HHFiOTfWlZay7Ohu3tVu+eWIvjmTD25I2dA==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr4005872wmg.168.1608132928041;
        Wed, 16 Dec 2020 07:35:28 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id y130sm3444766wmc.22.2020.12.16.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 07:35:27 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:35:25 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/12] mfd: bd9571mwv: Make the driver more generic
Message-ID: <20201216153525.GM207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608104275-13174-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Dec 2020, Yoshihiro Shimoda wrote:

> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> 
> Since the driver supports BD9571MWV PMIC only,
> this patch makes the functions and data structure become more generic
> so that it can support other PMIC variants as well.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> [shimoda: rebase and refactor]

This is kind of expected.  Please just add Co-developed-by instead.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mfd/bd9571mwv.c       | 95 +++++++++++++++++++++++++++----------------
>  include/linux/mfd/bd9571mwv.h | 18 ++------
>  2 files changed, 63 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
> index 49e968e..ccf1a60 100644
> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c
> @@ -3,6 +3,7 @@
>   * ROHM BD9571MWV-M MFD driver
>   *
>   * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
> + * Copyright (C) 2020 Renesas Electronics Corporation
>   *
>   * Based on the TPS65086 driver
>   */
> @@ -14,6 +15,19 @@
>  
>  #include <linux/mfd/bd9571mwv.h>
>  
> +/**

This is wrong.  Please do not abuse kernel-doc formatting.

> + * struct bd957x_data - internal data for the bd957x driverbd957x_data
> + *
> + * Internal data to distinguish bd957x variants
> + */
> +struct bd957x_data {

Call this bd957x_ddata please.

ddata == driver data.

> +	char *part_name;

What is this used for besides a print?  Those kinds of log messages
are usually frowned upon anyway.  Probably best to just remove the
print, along with the variable.

> +	const struct regmap_config *regmap_config;
> +	const struct regmap_irq_chip *irq_chip;
> +	const struct mfd_cell *cells;
> +	int num_cells;
> +};
> +
>  static const struct mfd_cell bd9571mwv_cells[] = {
>  	{ .name = "bd9571mwv-regulator", },
>  	{ .name = "bd9571mwv-gpio", },
> @@ -102,13 +116,21 @@ static struct regmap_irq_chip bd9571mwv_irq_chip = {
>  	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
>  };
>  
> -static int bd9571mwv_identify(struct bd9571mwv *bd)
> +static const struct bd957x_data bd9571mwv_data = {
> +	.part_name = BD9571MWV_PART_NAME,
> +	.regmap_config = &bd9571mwv_regmap_config,
> +	.irq_chip = &bd9571mwv_irq_chip,
> +	.cells = bd9571mwv_cells,
> +	.num_cells = ARRAY_SIZE(bd9571mwv_cells),
> +};
> +
> +static int bd9571mwv_identify(struct device *dev, struct regmap *regmap,

I guess this function name also needs to change?

And all other occurences of bd9571mwv?

> +			      const char *part_name)
>  {
> -	struct device *dev = bd->dev;
>  	unsigned int value;
>  	int ret;
>  
> -	ret = regmap_read(bd->regmap, BD9571MWV_VENDOR_CODE, &value);
> +	ret = regmap_read(regmap, BD9571MWV_VENDOR_CODE, &value);
>  	if (ret) {
>  		dev_err(dev, "Failed to read vendor code register (ret=%i)\n",
>  			ret);
> @@ -121,27 +143,20 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
>  		return -EINVAL;
>  	}
>  
> -	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_CODE, &value);
> +	ret = regmap_read(regmap, BD9571MWV_PRODUCT_CODE, &value);
>  	if (ret) {
>  		dev_err(dev, "Failed to read product code register (ret=%i)\n",
>  			ret);
>  		return ret;
>  	}
> -
> -	if (value != BD9571MWV_PRODUCT_CODE_VAL) {
> -		dev_err(dev, "Invalid product code ID %02x (expected %02x)\n",
> -			value, BD9571MWV_PRODUCT_CODE_VAL);
> -		return -EINVAL;
> -	}
> -
> -	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_REVISION, &value);
> +	ret = regmap_read(regmap, BD9571MWV_PRODUCT_REVISION, &value);
>  	if (ret) {
>  		dev_err(dev, "Failed to read revision register (ret=%i)\n",
>  			ret);
>  		return ret;
>  	}
>  
> -	dev_info(dev, "Device: BD9571MWV rev. %d\n", value & 0xff);
> +	dev_info(dev, "Device: %s rev. %d\n", part_name, value & 0xff);
>  
>  	return 0;
>  }
> @@ -149,38 +164,48 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
>  static int bd9571mwv_probe(struct i2c_client *client,
>  			  const struct i2c_device_id *ids)
>  {
> -	struct bd9571mwv *bd;
> -	int ret;
> -
> -	bd = devm_kzalloc(&client->dev, sizeof(*bd), GFP_KERNEL);
> -	if (!bd)
> -		return -ENOMEM;
> -
> -	i2c_set_clientdata(client, bd);
> -	bd->dev = &client->dev;
> -	bd->irq = client->irq;
> +	const struct bd957x_data *data;

ddata

> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +	struct regmap_irq_chip_data *irq_data;
> +	int ret, irq = client->irq;
> +
> +	/* Read the PMIC product code */
> +	ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
> +	if (ret < 0) {
> +		dev_err(dev, "failed reading at 0x%02x\n",
> +			BD9571MWV_PRODUCT_CODE);

"Failed to read product code" is more user friendly.

> +		return ret;
> +	}
> +	switch (ret) {
> +	case BD9571MWV_PRODUCT_CODE_VAL:

Suggest:

s/BD9571MWV_PRODUCT_CODE/BD9571MWV_PRODUCT_CODE_CMD/
  then
s/BD9571MWV_PRODUCT_CODE_VAL/BD9571MWV_PRODUCT_CODE/

> +		data = &bd9571mwv_data;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported device 0x%x\n", ret);
> +		return -ENOENT;

ENOENT == "No such file or directory"

I think you mean -ENODEV.

> +	}
>  
> -	bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
> -	if (IS_ERR(bd->regmap)) {
> -		dev_err(bd->dev, "Failed to initialize register map\n");
> -		return PTR_ERR(bd->regmap);
> +	regmap = devm_regmap_init_i2c(client, data->regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to initialize register map\n");
> +		return PTR_ERR(regmap);
>  	}
>  
> -	ret = bd9571mwv_identify(bd);
> +	ret = bd9571mwv_identify(dev, regmap, data->part_name);

Just pass ddata, then you'll have 'dev' and 'regmap'.

I'd remove 'part_name' completely.

>  	if (ret)
>  		return ret;
>  
> -	ret = devm_regmap_add_irq_chip(bd->dev, bd->regmap, bd->irq,
> -				       IRQF_ONESHOT, 0, &bd9571mwv_irq_chip,
> -				       &bd->irq_data);
> +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
> +				       data->irq_chip, &irq_data);
>  	if (ret) {
> -		dev_err(bd->dev, "Failed to register IRQ chip\n");
> +		dev_err(dev, "Failed to register IRQ chip\n");
>  		return ret;
>  	}
>  
> -	return devm_mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO,
> -				    bd9571mwv_cells, ARRAY_SIZE(bd9571mwv_cells),
> -				    NULL, 0, regmap_irq_get_domain(bd->irq_data));
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->cells,
> +				    data->num_cells, NULL, 0,
> +				    regmap_irq_get_domain(irq_data));
>  }
>  
>  static const struct of_device_id bd9571mwv_of_match_table[] = {
> diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
> index bcc7092..5ab976a 100644
> --- a/include/linux/mfd/bd9571mwv.h
> +++ b/include/linux/mfd/bd9571mwv.h
> @@ -3,6 +3,7 @@
>   * ROHM BD9571MWV-M driver
>   *
>   * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
> + * Copyright (C) 2020 Renesas Electronics Corporation
>   *
>   * Based on the TPS65086 driver
>   */
> @@ -83,6 +84,8 @@
>  
>  #define BD9571MWV_ACCESS_KEY			0xff
>  
> +#define BD9571MWV_PART_NAME			"BD9571MWV"
> +
>  /* Define the BD9571MWV IRQ numbers */
>  enum bd9571mwv_irqs {
>  	BD9571MWV_IRQ_MD1,
> @@ -94,19 +97,4 @@ enum bd9571mwv_irqs {
>  	BD9571MWV_IRQ_WDT_OF,
>  	BD9571MWV_IRQ_BKUP_TRG,
>  };
> -
> -/**
> - * struct bd9571mwv - state holder for the bd9571mwv driver
> - *
> - * Device data may be used to access the BD9571MWV chip
> - */
> -struct bd9571mwv {
> -	struct device *dev;
> -	struct regmap *regmap;
> -
> -	/* IRQ Data */
> -	int irq;
> -	struct regmap_irq_chip_data *irq_data;
> -};
> -
>  #endif /* __LINUX_MFD_BD9571MWV_H */

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
