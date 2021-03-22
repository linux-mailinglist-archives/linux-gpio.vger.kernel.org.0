Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB2E344732
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 15:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCVObJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 10:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbhCVOap (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 10:30:45 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFEEC061756
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:30:44 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s17so21323086ljc.5
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jQmkMLQdcAH+hpXMMoYjyN+j0zqv/8Rbe5ltICXFPts=;
        b=QLk6YXOcXtveKEHo9VGYIeL7sZhjpWJGpI2v/hyxQlh4JHUiN4/vpUw3IyQMnGqP/O
         U/D3TPcrX2UGp9Ck24dgvMfCiGr6rWykhwQNlJE/5F9PLnc2Tfl2EHtqRf4iObvF7FKo
         NxAN6nFaBvCfFctxe2/KX1//eJCFFUciKDE6FeNElly8jfQAe7R34D1wafDmA5v+ZyMF
         68QyY3XiprZ9sH9njoY0aQDftqjds94C3tAi5GGt8U4OW/EtroddIzq7B5z3d+5yz8jb
         zpZFZnPb0ZJ2Wis80OlyviqfRSak9+40NSb3jzs7wZG1w4YRbrFiqbdxM/OlOHsMqqp2
         GqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jQmkMLQdcAH+hpXMMoYjyN+j0zqv/8Rbe5ltICXFPts=;
        b=rbXPNnx9y2k/s1jEJCS9tKPpQbnEmeE8mNFjsb6p97DaCoaYAIePYSmqZLUzTq5ogy
         pmBs/sPUsvlX6GFKCHROzhPza1EFb1XZmBKvewO8rCb/KxEPnEhwrOvDkeMAVL+NsvSX
         m7iMPSopLmS+FwCICAQnVyEPvrFMydLYz6bs6hadB4OXJToC0th3d4shTIrXa1mRG/mU
         ftuVA5ZAv2mrFGAj76RFTsKua2qCk+jIxZRENdq2qL14TKu56PiEhKp8sdaE6xlMh9P3
         44kouDqZIhcxJLPZi0QX6jzO5YPg5d0tF3EPJa8bvj0OUXwrdF0TuTDImzQ+2kMa3U5q
         ym9A==
X-Gm-Message-State: AOAM532tWybCAzP665t+nfpF46E4FOWQPOio56P45VjYxRd5zDSGw4wF
        9O/wakF82T+fEl4vyR5D3cAASw==
X-Google-Smtp-Source: ABdhPJzdXsiJ2BdpVE59mH5hrN+t68RJxTf0NLhoU9JrVuNrskzOIdu/LAtgRLXD9/9FEhQTCtxK6w==
X-Received: by 2002:a2e:9704:: with SMTP id r4mr9504031lji.486.1616423443031;
        Mon, 22 Mar 2021 07:30:43 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a1sm1584410lfd.31.2021.03.22.07.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 07:30:41 -0700 (PDT)
Date:   Mon, 22 Mar 2021 15:30:40 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: renesas: Make sh_pfc_pin_to_bias_reg()
 static
Message-ID: <YFiqEMVzBzk/jFEz@oden.dyn.berto.se>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
 <20210303132619.3938128-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303132619.3938128-2-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-03-03 14:26:14 +0100, Geert Uytterhoeven wrote:
> Now all R-Car pin control drivers have been converted to the common
> R-Car bias handling, sh_pfc_pin_to_bias_reg() is only called from a
> single place.  Move it from core.c to pinctrl.c, make it static, and
> rename it to rcar_pin_to_bias_reg(), as it is specific to R-Car SoCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/core.c    | 20 --------------------
>  drivers/pinctrl/renesas/core.h    |  4 ----
>  drivers/pinctrl/renesas/pinctrl.c | 24 ++++++++++++++++++++++--
>  3 files changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
> index 2bfd3006f6fda445..5ccc49b387f17eb9 100644
> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -394,26 +394,6 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type)
>  	return 0;
>  }
>  
> -const struct pinmux_bias_reg *
> -sh_pfc_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
> -		       unsigned int *bit)
> -{
> -	unsigned int i, j;
> -
> -	for (i = 0; pfc->info->bias_regs[i].puen; i++) {
> -		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
> -			if (pfc->info->bias_regs[i].pins[j] == pin) {
> -				*bit = j;
> -				return &pfc->info->bias_regs[i];
> -			}
> -		}
> -	}
> -
> -	WARN_ONCE(1, "Pin %u is not in bias info list\n", pin);
> -
> -	return NULL;
> -}
> -
>  static int sh_pfc_init_ranges(struct sh_pfc *pfc)
>  {
>  	struct sh_pfc_pin_range *range;
> diff --git a/drivers/pinctrl/renesas/core.h b/drivers/pinctrl/renesas/core.h
> index 5ca7e0830ae9de38..19f7b4308fac7a8f 100644
> --- a/drivers/pinctrl/renesas/core.h
> +++ b/drivers/pinctrl/renesas/core.h
> @@ -29,10 +29,6 @@ void sh_pfc_write(struct sh_pfc *pfc, u32 reg, u32 data);
>  int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin);
>  int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
>  
> -const struct pinmux_bias_reg *
> -sh_pfc_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
> -		       unsigned int *bit);
> -
>  unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
>  void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
>  			  unsigned int bias);
> diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
> index a49f74730272312e..963d217b940372b9 100644
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -840,12 +840,32 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
>  	return pinctrl_enable(pmx->pctl);
>  }
>  
> +static const struct pinmux_bias_reg *
> +rcar_pin_to_bias_reg(const struct sh_pfc *pfc, unsigned int pin,
> +		     unsigned int *bit)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; pfc->info->bias_regs[i].puen; i++) {
> +		for (j = 0; j < ARRAY_SIZE(pfc->info->bias_regs[i].pins); j++) {
> +			if (pfc->info->bias_regs[i].pins[j] == pin) {
> +				*bit = j;
> +				return &pfc->info->bias_regs[i];
> +			}
> +		}
> +	}
> +
> +	WARN_ONCE(1, "Pin %u is not in bias info list\n", pin);
> +
> +	return NULL;
> +}
> +
>  unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
>  {
>  	const struct pinmux_bias_reg *reg;
>  	unsigned int bit;
>  
> -	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
> +	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
>  	if (!reg)
>  		return PIN_CONFIG_BIAS_DISABLE;
>  
> @@ -864,7 +884,7 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
>  	u32 enable, updown;
>  	unsigned int bit;
>  
> -	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
> +	reg = rcar_pin_to_bias_reg(pfc, pin, &bit);
>  	if (!reg)
>  		return;
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
