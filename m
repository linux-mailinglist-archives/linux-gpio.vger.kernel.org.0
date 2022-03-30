Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1C14EC81B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Mar 2022 17:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348125AbiC3PYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 11:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243242AbiC3PYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 11:24:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81565192371
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 08:22:24 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id k124-20020a1ca182000000b0038c9cf6e2a6so206964wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=VsktZd1lrpgrX+V/L1u1pkl3lthFyT18R1StRVOqeME=;
        b=BDBQTdTSUt24gLYrTuCs4gNhSDd1O1k0+jDSX4hWVEL3W35F5nbZjZ6EqJkh/9u0En
         erGGuiv2FmAgVkcHi3VHqY60MlgY9g8+jqhXktkdqhLkJlVMaGZhOJyBjUe3L/1I82Ir
         Ob5u3nAXtykeHInVc7gS8LV7ZCpdCIwQtC5JvG+lHvtkLf+hSTiJMi4N9X9O/5hl+NnC
         megWRTGELbcngkgNBzf9ZN0TE5dxEAtG8ySyHl9SWDbvG3MwcHB/dIloYWBD+IqWSWLT
         W8Gu5aWG9ktI2GAUpgQY8fZsYV7fj+mxmarBzBgzTQ8ToduTMTrGAhhDySSzxO536S9N
         x58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=VsktZd1lrpgrX+V/L1u1pkl3lthFyT18R1StRVOqeME=;
        b=hKLhOqERcumpzinDYCVLwAoNWsr3oI+09QGQ7k0urx2H1Yu6eQj7l93246bLux0/vq
         t83lX4nZxlg2rpMyOrG4zEI7USf3P3rqc5HGVT3tCRIlMC3iENpELcIGMd9M1UuQUtHs
         EWL3gcXRDG5b9H07+cxfnbm97Lk0O1D9s039qr/W7prVOAEWdVcTu+mej5rDXtMrHpQ/
         jsYNQnsNmXN6XlMzLF9f30kczBIJWuUTA4n73ugKv7ev2SMI+ToMwiq8ZmqYkV6DAfYL
         0b5RQEHBdBfoU7YszBg3WkzGMMmbYhvWDPWndRVx/shj8fbLCDH0fDEqO90S/INxpn/T
         SaXg==
X-Gm-Message-State: AOAM5304w8a1tV7eMJfLDQgacT/nxZmE037Bc56Fe96xSEr2ExGeNf1Y
        Z54gMfEKj+U1dtLJQbbqvzplwg==
X-Google-Smtp-Source: ABdhPJzQnHg7FADFhfDN5WNwL6d7L/J0cN4GJJs3uwA9AeUV9+yD7d8e2R/SvmrTa8scE2MOsp2T/A==
X-Received: by 2002:a1c:f607:0:b0:381:1db:d767 with SMTP id w7-20020a1cf607000000b0038101dbd767mr4793481wmc.165.1648653742795;
        Wed, 30 Mar 2022 08:22:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8? ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
        by smtp.gmail.com with ESMTPSA id c5-20020a5d63c5000000b002040822b680sm25478862wrw.81.2022.03.30.08.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 08:22:22 -0700 (PDT)
Message-ID: <357c0ae6-7910-dfe5-eefa-1a7820e7e46b@baylibre.com>
Date:   Wed, 30 Mar 2022 17:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/13] pinctrl: meson: Rename REG_* to MESON_REG_*
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
 <20220330145030.1562-10-andriy.shevchenko@linux.intel.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220330145030.1562-10-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/03/2022 16:50, Andy Shevchenko wrote:
> Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
>   drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..5b46a0979db7 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
>   				    unsigned int pin,
>   				    bool out)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_DIR, !out);
>   }
>   
>   static int meson_pinconf_get_output(struct meson_pinctrl *pc,
>   				    unsigned int pin)
>   {
> -	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
> +	int ret = meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_DIR);
>   
>   	if (ret < 0)
>   		return ret;
> @@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin,
>   				   bool high)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_OUT, high);
>   }
>   
>   static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin)
>   {
> -	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
> +	return meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_OUT);
>   }
>   
>   static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
> @@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
>   	if (ret)
>   		return ret;
> @@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
>   	if (pull_up)
>   		val = BIT(bit);
>   
> @@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
>   	if (ret)
>   		return ret;
> @@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
>   
>   	if (drive_strength_ua <= 500) {
>   		ds_val = MESON_PINCONF_DRV_500UA;
> @@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_pullen, reg, &val);
>   	if (ret)
> @@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (!(val & BIT(bit))) {
>   		conf = PIN_CONFIG_BIAS_DISABLE;
>   	} else {
> -		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +		meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
>   
>   		ret = regmap_read(pc->reg_pull, reg, &val);
>   		if (ret)
> @@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_ds, reg, &val);
>   	if (ret)
> @@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, gpio, MESON_REG_IN, &reg, &bit);
>   	regmap_read(pc->reg_gpio, reg, &val);
>   
>   	return !!(val & BIT(bit));
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index ff5372e0a475..fa042cd6a7ff 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -63,12 +63,12 @@ struct meson_reg_desc {
>    * enum meson_reg_type - type of registers encoded in @meson_reg_desc
>    */
>   enum meson_reg_type {
> -	REG_PULLEN,
> -	REG_PULL,
> -	REG_DIR,
> -	REG_OUT,
> -	REG_IN,
> -	REG_DS,
> +	MESON_REG_PULLEN,
> +	MESON_REG_PULL,
> +	MESON_REG_DIR,
> +	MESON_REG_OUT,
> +	MESON_REG_IN,
> +	MESON_REG_DS,
>   	NUM_REG,
>   };
>   
> @@ -150,12 +150,12 @@ struct meson_pinctrl {
>   		.irq_first	= fi,					\
>   		.irq_last	= li,					\
>   		.regs = {						\
> -			[REG_PULLEN]	= { per, peb },			\
> -			[REG_PULL]	= { pr, pb },			\
> -			[REG_DIR]	= { dr, db },			\
> -			[REG_OUT]	= { or, ob },			\
> -			[REG_IN]	= { ir, ib },			\
> -			[REG_DS]	= { dsr, dsb },			\
> +			[MESON_REG_PULLEN]	= { per, peb },		\
> +			[MESON_REG_PULL]	= { pr, pb },		\
> +			[MESON_REG_DIR]		= { dr, db },		\
> +			[MESON_REG_OUT]		= { or, ob },		\
> +			[MESON_REG_IN]		= { ir, ib },		\
> +			[MESON_REG_DS]		= { dsr, dsb },		\
>   		},							\
>   	 }
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
