Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081C934481C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 15:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhCVOv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 10:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbhCVOuq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 10:50:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC74FC061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:50:45 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w37so21716890lfu.13
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8gxKKa+jFMOn8kpKn0e6MLe4OZgKmL6kxx0+G7XwlIk=;
        b=WF1tRthZZumg+uqxFUa9Cfk+9NzBwURBark3y9qvDwrJwwJRqmoshCAfNqCNDTQQpO
         49en4yOo3940I/gIiAihjgtY+qBgDfb7UvQjcFn+kIQtrEWx1OXCXCOg3LCT7gF8Er9t
         KBs+a4hFCeh0Ft/1g0SrbZkRHfI2wrdRefA6RX/Ida0XC22zsG4JcPdCOoAwwbAPLNn4
         XgRY+IBeNlzPpdo+6W2/rfYPA8CCZ4QI5+pAHRQEFRJHTwAG/uNlQcesrye2jxjsh2wV
         MCfbnLcWobeCnRCLKlp2/TjhAHdb9tqlnl7pxA79AmAjiBxQRCO3nguiT4kt/BlzzJPQ
         qf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8gxKKa+jFMOn8kpKn0e6MLe4OZgKmL6kxx0+G7XwlIk=;
        b=G0VIWk2vCvT79Ms3Ac5Ov5E0O+xDFUVh729QE+pVfFkWW9lJ5aCIW5UQp/FiIChvkW
         gYrp7A6ID5gJz0ivvdn+hKNvsSf82QBR0JxtPtJIpSoUFXCwxme8/28ss3wm599MxXAr
         8PrcqWGVTu8XwFBa3RLIN/leTHlDqa4o6+gOTWe3tDWipgrqH6KUQDjMRXR4II/g2JYZ
         nQVb3152IuQcbITnZUxxXcAm/AUiFElGyoWcBcrTB3WBY6KclsV2+XmqVcXiKfcmqMhT
         OTNMfRNlg2RM17qqA6ObgI1J8piuD5Y0Sg4prak827cxclSSzSIjfZ9ObVlO1fy1ogYt
         QEcw==
X-Gm-Message-State: AOAM532dYAKnakf4KrY6sG82U544i5bflpSeozOw6Y46lUxKOX3Wk0B3
        IbgyiKPWSMn5DsAxYK1qIeBEKg==
X-Google-Smtp-Source: ABdhPJw3WpRUDg+BXqZ2CUzr2ZAOLb7RLYtKhTfOkS8TVuM3UTg2LldqvCmRL+4MWy1ISSihnv0BnA==
X-Received: by 2002:a19:48d2:: with SMTP id v201mr9038553lfa.504.1616424644284;
        Mon, 22 Mar 2021 07:50:44 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 194sm1599635lfd.116.2021.03.22.07.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 07:50:43 -0700 (PDT)
Date:   Mon, 22 Mar 2021 15:50:43 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: renesas: Add PORT_GP_CFG_7 macros
Message-ID: <YFiuw9RRXC5t2HMG@oden.dyn.berto.se>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
 <20210303132619.3938128-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303132619.3938128-5-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-03-03 14:26:17 +0100, Geert Uytterhoeven wrote:
> Add PORT_GP_CFG_7() and PORT_GP_7() helper macros, to be used by the
> r8a7791 subdriver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
> index 8dc0fbb012b0c970..fc8391712af8cf4b 100644
> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -479,9 +479,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>  	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg)
>  #define PORT_GP_6(bank, fn, sfx)	PORT_GP_CFG_6(bank, fn, sfx, 0)
>  
> -#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
> +#define PORT_GP_CFG_7(bank, fn, sfx, cfg)				\
>  	PORT_GP_CFG_6(bank, fn, sfx, cfg),				\
> -	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg),				\
> +	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg)
> +#define PORT_GP_7(bank, fn, sfx)	PORT_GP_CFG_7(bank, fn, sfx, 0)
> +
> +#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
> +	PORT_GP_CFG_7(bank, fn, sfx, cfg),				\
>  	PORT_GP_CFG_1(bank, 7,  fn, sfx, cfg)
>  #define PORT_GP_8(bank, fn, sfx)	PORT_GP_CFG_8(bank, fn, sfx, 0)
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
