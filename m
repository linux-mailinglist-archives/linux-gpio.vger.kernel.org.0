Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB9D2E1E54
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Dec 2020 16:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgLWPkM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Dec 2020 10:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgLWPkM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Dec 2020 10:40:12 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B20C061794
        for <linux-gpio@vger.kernel.org>; Wed, 23 Dec 2020 07:39:31 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c133so5696914wme.4
        for <linux-gpio@vger.kernel.org>; Wed, 23 Dec 2020 07:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/G4fSaigUz7IpFOG/AKovDnFvrqG5J/wVP194Wd2vO4=;
        b=aQbEQnbeClWHygIAJkldGf0Rlnw6BWGSaJfFbfZNdsd+p5+I/0tfSKc0o/Xi0sVAZH
         U58+ta1f7ma4vF6fnbLP/BKTm112tpPTN2w178cg1Qp2VIjyry+X7gDR1Bn8teVVr49D
         hO3I9CNN3mrGHZxHs0LyOmOQncgZQOr70hPy5lCAHEBmlFbbdjJLOk+5GV2+Ym5OFEL0
         zIZsYnTuWKe7oYoWvmKWz77kClGOsAJLuli5xg5ssDAXpMoW2Auj5tbtGHRra7K7sWXw
         OfU4vMmFMs6jAVsuLcBsejhIV3CquDImRiwE10gqigudnEf5qgo3XuUVgY8LCipZkG01
         Onhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/G4fSaigUz7IpFOG/AKovDnFvrqG5J/wVP194Wd2vO4=;
        b=XxXPBuERlFoNt3p1gzB8raGdLpUzBsZe2FBd0+d+9WozJnDxk1T4PZDAA1IqpGI4AX
         pkjD6nIRZPPe7BuZ2+nz+zToQgZw5q5bX6mLA+Bx+pAJFD14f66CCiscu0FsxW+f0qpy
         v7cgDEdBh6RLy1bGQIzQFnzzvIRKS/kXnkrgTBGAmIo8oWSDDBJx5EXPOCZF67PsE+it
         dh9eYb1t3mt9SE9waF39U48gFHgJ43jZonEtq2A182OBKHQ0Bp2+Vb+b3Y7x/+Hg7EOv
         s3/BAq3lI6K4tyqyymGeiMOux7vQjFCJeNsIQb2OljYVSVNkBeTIDN5Nr2kF7sHvU+jx
         f7KQ==
X-Gm-Message-State: AOAM532mAZ4uGBy+H0wWOSjPh+r9NDZgpEvOaes0+qvg3PjcWg69syQ+
        SiQMic+TfVXUYokI3DG+pdHWag==
X-Google-Smtp-Source: ABdhPJyJD+8Vn4ATXGuuAUHW+x0rIx2/uGTiuWW2HCUMmgIT+SSJ3ONqzXLFGPO3S2zZtuiEY03mmg==
X-Received: by 2002:a1c:2188:: with SMTP id h130mr294918wmh.176.1608737970639;
        Wed, 23 Dec 2020 07:39:30 -0800 (PST)
Received: from dell ([91.110.221.175])
        by smtp.gmail.com with ESMTPSA id w17sm202319wmk.12.2020.12.23.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 07:39:29 -0800 (PST)
Date:   Wed, 23 Dec 2020 15:39:28 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/12] mfd: bd9571mwv: Make the driver more generic
Message-ID: <20201223153928.GA681741@dell>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608718963-21818-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 23 Dec 2020, Yoshihiro Shimoda wrote:

> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> 
> Since the driver supports BD9571MWV PMIC only, this patch makes
> the functions and data structure become more generic so that
> it can support other PMIC variants as well. Also remove printing
> part name which Lee Jones suggested.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/bd9571mwv.c       | 89 +++++++++++++++++++++++++------------------
>  include/linux/mfd/bd9571mwv.h | 18 +--------
>  2 files changed, 54 insertions(+), 53 deletions(-)

Couple of small points.

Remainder looks good.

> diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
> index 49e968e..c905ab4 100644
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
> @@ -14,6 +15,14 @@
>  
>  #include <linux/mfd/bd9571mwv.h>
>  
> +/* Driver data to distinguish bd957x variants */
> +struct bd957x_ddata {
> +	const struct regmap_config *regmap_config;
> +	const struct regmap_irq_chip *irq_chip;

> +	const struct mfd_cell *cells;
> +	int num_cells;

Are you using these post-probe?

If not, they're not ddata.

> +};

[...]

>  static int bd9571mwv_probe(struct i2c_client *client,
> -			  const struct i2c_device_id *ids)
> +			   const struct i2c_device_id *ids)
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
> +	const struct bd957x_ddata *ddata;
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +	struct regmap_irq_chip_data *irq_data;
> +	int ret, irq = client->irq;
> +
> +	/* Read the PMIC product code */
> +	ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read product code\n");
> +		return ret;
> +	}

Nit: '\n' here.

> +	switch (ret) {
> +	case BD9571MWV_PRODUCT_CODE_BD9571MWV:
> +		ddata = &bd9571mwv_ddata;

Simply declare 'const struct mfd_cell *cells' locally in probe and
assign it here instead.

> +		break;
> +	default:
> +		dev_err(dev, "Unsupported device 0x%x\n", ret);
> +		return -ENODEV;
> +	}
>  
> -	bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
> -	if (IS_ERR(bd->regmap)) {
> -		dev_err(bd->dev, "Failed to initialize register map\n");
> -		return PTR_ERR(bd->regmap);
> +	regmap = devm_regmap_init_i2c(client, ddata->regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to initialize register map\n");
> +		return PTR_ERR(regmap);
>  	}

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
