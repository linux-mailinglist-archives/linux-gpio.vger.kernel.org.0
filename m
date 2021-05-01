Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1A9370626
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 09:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhEAHNX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 May 2021 03:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhEAHNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 May 2021 03:13:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B59CC06174A
        for <linux-gpio@vger.kernel.org>; Sat,  1 May 2021 00:12:30 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c11so472909lfi.9
        for <linux-gpio@vger.kernel.org>; Sat, 01 May 2021 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4n8PnFMxRKbESLRVtklUC+mzYEhjvtrXPmh+ZhuEABg=;
        b=zvezNe4rMrJEdq7f1o9Cg88axbpUrKCtzCZu8+vEsAK08b97RUd1RMNt0gZTJtQmlu
         OCgzHL+BoNim9mRh60Z75mz02CAxqQGqoLP3Paee+5TzbC2lVm/ipI/gw9O8gfRlrc8d
         wXE4m1J0CBN+wOgaywKUMS7U9LIhbUtQ+8b+JtieuL2Qv54aVAm2J0CtIEOUKR+XI0Mq
         E6wG/KRtG9d3gQZjsUE4qERdJYIX2OgZenNm3AeRZIoQ6w3+ZyUitK/JghAh8Qx2PcWF
         aF17xV0J0hxgKVVDCMai305qq91VBfIX3CCo22Nimi8s5OTGKMHow21U3n4kuC3l1sbd
         kOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4n8PnFMxRKbESLRVtklUC+mzYEhjvtrXPmh+ZhuEABg=;
        b=LToyOzrAvocukcvm/RF3ui1iITl4d+a89F83BJp8JifHOyF5K71Is+PzX9ylg9X/Xp
         mxIaQ+UFA+7lKbC/eiWbVFmag8/xE01ReynTsU0xvlyK+Sa0sOPvNj6Q6yScTpG6P6HY
         idA8XnoK/o6qgEsjMpC182AIwmMe/YBW2DrIXRltm5sBxhEy2qhMetq9jPILTMF8zh5r
         jv2rh0mfczt6QuIROqLlUi3TZ2EsVqPOIC34wOEZlGSWwQvhsPHuZP0HuZ9pdttKw28n
         VVZ2baR7aD+c4f7mZGmqPHD7fwCNA4i8eSm73NDyTdTP0s8sNB/2IScoDb84NEhrZ2Ey
         xB6A==
X-Gm-Message-State: AOAM532PgWmhyfe3vzFJ4FdijQEpgHIVS3Z44Sb0iHBiqm3RMaM0wXB+
        wO3Ul0N5R6ADD5iVRcNDnyhmcQ==
X-Google-Smtp-Source: ABdhPJyF7232HlmsDjj2EdMWbaNIHFAdbe/oCkBGYE/+dBB8mxcM9k/d26g2B0y+Ft/aOy0oBTqRPQ==
X-Received: by 2002:a05:6512:681:: with SMTP id t1mr6194559lfe.325.1619853148954;
        Sat, 01 May 2021 00:12:28 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w4sm497387lfu.105.2021.05.01.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:12:28 -0700 (PDT)
Date:   Sat, 1 May 2021 09:12:27 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/12] pinctrl: renesas: r8a7796: Add missing bias for
 PRESET# pin
Message-ID: <YIz/W/gHSBAlmvDZ@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <c479de5b3f235c2f7d5faea9e7e08e6fccb135df.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c479de5b3f235c2f7d5faea9e7e08e6fccb135df.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-30 14:31:00 +0200, Geert Uytterhoeven wrote:
> R-Car Gen3 Hardware Manual Errata for Rev. 0.52 of Nov 30, 2016, added
> the configuration bit for bias pull-down control for the PRESET# pin on
> R-Car M3-W.  Add driver support for controlling pull-down on this pin.
> 
> Fixes: 2d40bd24274d2577 ("pinctrl: sh-pfc: r8a7796: Add bias pinconf support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a7796.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
> index 44e9d2eea484ad5d..bbb1b436ded3123f 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
> @@ -67,6 +67,7 @@
>  	PIN_NOGP_CFG(QSPI1_MOSI_IO0, "QSPI1_MOSI_IO0", fn, CFG_FLAGS),	\
>  	PIN_NOGP_CFG(QSPI1_SPCLK, "QSPI1_SPCLK", fn, CFG_FLAGS),	\
>  	PIN_NOGP_CFG(QSPI1_SSL, "QSPI1_SSL", fn, CFG_FLAGS),		\
> +	PIN_NOGP_CFG(PRESET_N, "PRESET#", fn, SH_PFC_PIN_CFG_PULL_DOWN),\
>  	PIN_NOGP_CFG(RPC_INT_N, "RPC_INT#", fn, CFG_FLAGS),		\
>  	PIN_NOGP_CFG(RPC_RESET_N, "RPC_RESET#", fn, CFG_FLAGS),		\
>  	PIN_NOGP_CFG(RPC_WP_N, "RPC_WP#", fn, CFG_FLAGS),		\
> @@ -6218,7 +6219,7 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
>  		[ 4] = RCAR_GP_PIN(6, 29),	/* USB30_OVC */
>  		[ 5] = RCAR_GP_PIN(6, 30),	/* GP6_30 */
>  		[ 6] = RCAR_GP_PIN(6, 31),	/* GP6_31 */
> -		[ 7] = SH_PFC_PIN_NONE,
> +		[ 7] = PIN_PRESET_N,		/* PRESET# */
>  		[ 8] = SH_PFC_PIN_NONE,
>  		[ 9] = SH_PFC_PIN_NONE,
>  		[10] = SH_PFC_PIN_NONE,
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
