Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D50331C09
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 02:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhCIBIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 20:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbhCIBID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 20:08:03 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35D6C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 17:08:03 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id x135so8647686oia.9
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 17:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p3FtObQwLktZn8aGqaqTkJigyXLtVopswNVQ613mjEs=;
        b=F/wLpEFLMVCgh30TqSmJNK7jOsg34EkzybIDqUdNCB9R8eE4pELbqQDpb+tBV/Lsqs
         lYtzP+qx/g1MhqOCejSome/hzPXVGHfgbNnOneeuTnW/dfBzyaOZN9piieWhcACbC8QZ
         lmKII0J5GCK5BrSxy19wj+eRPjsbEJtC+ZfJRxL5tFJH/Jb7ybb9pdKY6Jb804SatAz2
         JF0dF/CtdssCbCKW9ih6OQDx9qHwcgPqg1wlTFcC4gDFZMFWIW4WRAeOsSOc7GoO1Z2/
         FFeSkzy4lAiiJT1IWh3BGD5CXrfcO1vXYgnxMHtNsdSYTpzWV/AByQb09HUKmsX34ABD
         +EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p3FtObQwLktZn8aGqaqTkJigyXLtVopswNVQ613mjEs=;
        b=qwxKYCKjXfV+lGq+Y6141zpkkiQmzsL1D4++F4I74wYyd9IJRQkXwUqfNBrudaDG/2
         sJvYUwFHunc5W3gg40iqRzL8m2Dem4xj4BQIsrFWCTNJzhaBCN2kzRuUhl6dKeusKdN2
         8sX/XdxuEi5knvB5RYvHPJWSmrhDtL2759An/4TyuDuo5VHNge5RyBrYqTGBIumPj1S9
         nZGafetKYDZg9sHBXj/D2TOjARRuqk78w+/jjrR+thRi7Xbu1kDmABKAEiZhxVxprRo+
         YnhlTgjuboEvHj2CB2pESwrB4J02L9Ub5s/7g0dRSmSPkfbhJBEA15703l9K5MobJlhr
         veLg==
X-Gm-Message-State: AOAM532FllJrlFcpdQoaSpMVX/mnnI6E1tK0DDLq/SHfCaCs5FCFih4p
        RngwZbV3VTPgJHifWReJFFIQQQ==
X-Google-Smtp-Source: ABdhPJxUjhGkfg0WWy4n+xEDcOrT1Nsu4/Gt2YWOB2KFJ2vxFBmaKzTzlsHGsvzivkpCust6ujKr6Q==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr1222707oig.175.1615252083045;
        Mon, 08 Mar 2021 17:08:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s125sm693278oif.56.2021.03.08.17.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 17:08:02 -0800 (PST)
Date:   Mon, 8 Mar 2021 19:08:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: sc8180x: drop the use of tiles
Message-ID: <YEbKcOwr/c1fPFLQ@builder.lan>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304060520.24975-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 04 Mar 00:05 CST 2021, Shawn Guo wrote:

> To support both ACPI and DT, it makes more sense to not use tiles for
> pinctrl-sc8180x driver, as ACPI table describes TLMM block with one
> single memory resource.  Since DTS of SC8180X hasn't landed, there is
> still chance to align DT description with ACPI.
> 

I don't like the idea that we make up addresses to put in the DT to fit
what was put in the DSDT. It is 3 different memory regions, with things
in-between that Linux shouldn't touch.

Isn't it possible to during ACPI probe take reg 0 and register the 3
named regions instead?

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc8180x.c | 41 +++++++++-----------------
>  1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> index b765bf667574..66f76ed22200 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> @@ -11,17 +11,9 @@
>  
>  #include "pinctrl-msm.h"
>  
> -static const char * const sc8180x_tiles[] = {
> -	"south",
> -	"east",
> -	"west"
> -};
> -
> -enum {
> -	SOUTH,
> -	EAST,
> -	WEST
> -};
> +#define WEST	0x00100000
> +#define EAST	0x00500000
> +#define SOUTH	0x00d00000
>  
>  #define FUNCTION(fname)					\
>  	[msm_mux_##fname] = {				\
> @@ -31,7 +23,7 @@ enum {
>  	}
>  
>  #define REG_SIZE 0x1000
> -#define PINGROUP_OFFSET(id, _tile, offset, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
> +#define PINGROUP_OFFSET(id, base, offset, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
>  	{						\
>  		.name = "gpio" #id,			\
>  		.pins = gpio##id##_pins,		\
> @@ -49,12 +41,11 @@ enum {
>  			msm_mux_##f9			\
>  		},					\
>  		.nfuncs = 10,				\
> -		.ctl_reg = REG_SIZE * id + offset,	\
> -		.io_reg = REG_SIZE * id + 0x4 + offset,	\
> -		.intr_cfg_reg = REG_SIZE * id + 0x8 + offset,	\
> -		.intr_status_reg = REG_SIZE * id + 0xc + offset,\
> -		.intr_target_reg = REG_SIZE * id + 0x8 + offset,\
> -		.tile = _tile,				\
> +		.ctl_reg = base + REG_SIZE * id + offset,		\
> +		.io_reg = base + REG_SIZE * id + 0x4 + offset,		\
> +		.intr_cfg_reg = base + REG_SIZE * id + 0x8 + offset,	\
> +		.intr_status_reg = base + REG_SIZE * id + 0xc + offset,	\
> +		.intr_target_reg = base + REG_SIZE * id + 0x8 + offset,	\
>  		.mux_bit = 2,				\
>  		.pull_bit = 0,				\
>  		.drv_bit = 6,				\
> @@ -71,20 +62,19 @@ enum {
>  		.intr_detection_width = 2,		\
>  	}
>  
> -#define PINGROUP(id, _tile, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
> -	PINGROUP_OFFSET(id, _tile, 0x0, f1, f2, f3, f4, f5, f6, f7, f8, f9)
> +#define PINGROUP(id, base, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
> +	PINGROUP_OFFSET(id, base, 0x0, f1, f2, f3, f4, f5, f6, f7, f8, f9)
>  
>  #define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
>  	{						\
>  		.name = #pg_name,			\
>  		.pins = pg_name##_pins,			\
>  		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
> -		.ctl_reg = ctl,				\
> +		.ctl_reg = EAST + ctl,			\
>  		.io_reg = 0,				\
>  		.intr_cfg_reg = 0,			\
>  		.intr_status_reg = 0,			\
>  		.intr_target_reg = 0,			\
> -		.tile = EAST,				\
>  		.mux_bit = -1,				\
>  		.pull_bit = pull,			\
>  		.drv_bit = drv,				\
> @@ -105,12 +95,11 @@ enum {
>  		.name = #pg_name,			\
>  		.pins = pg_name##_pins,			\
>  		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
> -		.ctl_reg = 0xb6000,			\
> -		.io_reg = 0xb6004,			\
> +		.ctl_reg = SOUTH + 0xb6000,		\
> +		.io_reg = SOUTH + 0xb6004,		\
>  		.intr_cfg_reg = 0,			\
>  		.intr_status_reg = 0,			\
>  		.intr_target_reg = 0,			\
> -		.tile = SOUTH,				\
>  		.mux_bit = -1,				\
>  		.pull_bit = 3,				\
>  		.drv_bit = 0,				\
> @@ -1575,8 +1564,6 @@ static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
>  };
>  
>  static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
> -	.tiles = sc8180x_tiles,
> -	.ntiles = ARRAY_SIZE(sc8180x_tiles),
>  	.pins = sc8180x_pins,
>  	.npins = ARRAY_SIZE(sc8180x_pins),
>  	.functions = sc8180x_functions,
> -- 
> 2.17.1
> 
