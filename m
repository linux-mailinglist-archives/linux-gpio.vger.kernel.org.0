Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7635B9B12
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 14:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiIOMlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 08:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiIOMky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 08:40:54 -0400
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 05:40:28 PDT
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net [83.102.40.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F101834E;
        Thu, 15 Sep 2022 05:40:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 6A15313F40;
        Thu, 15 Sep 2022 15:24:16 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Score: 2.975
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.6
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
        by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
        with ESMTP id JJQ4Ub41JQ2D; Thu, 15 Sep 2022 15:24:16 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net [83.102.40.54])
        by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 4E600137B5;
        Thu, 15 Sep 2022 15:24:12 +0300 (EEST)
Received: from localhost (87-95-101-152.bb.dnainternet.fi [87.95.101.152])
        by omenapuu2.dnainternet.net (Postfix) with ESMTP id 8CBEB1E5;
        Thu, 15 Sep 2022 15:24:03 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Thu, 15 Sep 2022 15:24:02 +0300
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
Message-ID: <YyMZYjWTN7yw93n5@surfacebook>
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
 <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thu, Sep 15, 2022 at 05:18:03PM +0530, Shubhrajyoti Datta kirjoitti:
> slg7xl45106 is a I2C GPO expander.
> Add a compatible string for the same. Also update the
> driver to write and read from it.

It's better, but something to improve.

...

>  /**
>   * struct pca9570 - GPIO driver data
>   * @chip: GPIO controller chip
> @@ -25,6 +27,12 @@ struct pca9570 {
>  	struct gpio_chip chip;
>  	struct mutex lock;
>  	u8 out;
> +	const struct pca9570_platform_data *p_data;

I would put it after 'chip' member, so it will save 4 bytes on 64-bit machines
of some architectures. Also, don't you need to add a kernel doc for a new
member?

> +};

> +struct pca9570_platform_data {
> +	u16 ngpio;
> +	u32 command;
>  };

Strictly speaking this should be defined before struct pca9570, otherwise you
need to have a forward declaration.

> @@ -122,13 +138,28 @@ static int pca9570_probe(struct i2c_client *client)
>  static const struct i2c_device_id pca9570_id_table[] = {
>  	{ "pca9570", 4 },
>  	{ "pca9571", 8 },
> +	{ "slg7xl45106", 8 },
>  	{ /* sentinel */ }

This table should also use your new structure:

	{ "slg7xl45106", (kernel_ulong_t)&slg7xl45106_gpio },

(In the similar way for the existing entries)

Taking the last into consideration I would suggest to split this to two
changes:
1) introducing a new data structure with conversion of the existing members;
2) adding support for a new chip.

>  };

Othewise looks good.

-- 
With Best Regards,
Andy Shevchenko


