Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92A234476E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 15:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhCVOf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 10:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhCVOff (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 10:35:35 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6E5C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:35:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f3so13300036lfu.5
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YjlKmZb0s9KeFtkpofY+AVeket3z7Q8G6E/vgeQdu+I=;
        b=QGiWBCT8B4LTjSjdwn2GkSnX67Nr7PuYXkUqXn0/kiRs6mDRDiuQlFc3eg55V2lI2y
         r5bKjMud3AIwxQlpYgLXzCBXxMUndHagnhEJPSABaoCb7S986Rcs2gt1cgBGvoF+JilJ
         nxNgRXP6MwRBzmfeYjfs0gljFweiga6EfpI1urd1+013tx8S/8Ubwyl9oPBBQ1IrRRlS
         rVylzusz/amiDxtz3PjGjcCKkfl7a2fsDm2aFez+lThwKfjX+R6OWQYLWSIfYHTsJSzx
         hq3Z/8bYtoJFoN0gHSX/ZVwIuNPa2X9L84xspWELWR/GdxMR8mo7Jh9VrgfJMmdVKJ15
         IhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YjlKmZb0s9KeFtkpofY+AVeket3z7Q8G6E/vgeQdu+I=;
        b=D0jehiA1woNr2joHKe1tCgg5cDH2/BSgk1+3bSEZSoSsQ+GPcqnshNx0XWjFM1GGq8
         SUGY6BdfCk0nARYU3pws9gz/Tc9gTMa9KVfX/+jrOxMBGLLtaDhMatsqnjCOO60BgUqw
         Wf9VIC8zdd+JqCyX5w9EHz7nkLXicqcuN1rh5PXMUJV6sNXN80+D6FgG5PK6odSrSBc4
         yw1oPpSK1SqQuSAFpTCAGlizvRs9/AjUbKokkHbzpvzIsr9t0FUH7fLwSKUmHDa+3NFk
         zIkwwUyNR2/nKOMEsNXIKRJM9RFC/mSPAIEZiuOcCgSNmKsa0BDD3Q4c4c8Lw8zWSeTb
         wP4g==
X-Gm-Message-State: AOAM531R+O7Gsxp/nJ3O/h0NOzK2aBbZHLeg2tix4KGv4/rUEPasZ3JR
        8o3ERAd3YY2o0Sl7qHu8vhaazs8Dh5ZLqg==
X-Google-Smtp-Source: ABdhPJz+V/nKgds6t/0+UrPOT43G+ZPsbZYkU8QST8m9AqDU/D1oYbyrnVnSx0CG89GyOC2iVnhwRQ==
X-Received: by 2002:a19:ad06:: with SMTP id t6mr9446057lfc.8.1616423733317;
        Mon, 22 Mar 2021 07:35:33 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e9sm1968444ljj.52.2021.03.22.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 07:35:31 -0700 (PDT)
Date:   Mon, 22 Mar 2021 15:35:30 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/6] pinctrl: renesas: Move R-Car bias helpers to sh_pfc.h
Message-ID: <YFirMvd5jvGN0QDR@oden.dyn.berto.se>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
 <20210303132619.3938128-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210303132619.3938128-3-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-03-03 14:26:15 +0100, Geert Uytterhoeven wrote:
> The Renesas Pin Function Controller driver uses two header files:
>   - sh_pfc.h, for use by both core code and SoC-specific drivers,
>   - core.h, for internal use by the core code only.
> 
> Hence move the R-Car bias helper declarations from core.h to sh_pfc.h,
> and drop the inclusion of core.h from SoC-specific drivers that no
> longer need it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice cleanup.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/core.h         | 4 ----
>  drivers/pinctrl/renesas/pfc-r8a7778.c  | 1 -
>  drivers/pinctrl/renesas/pfc-r8a7792.c  | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77950.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77951.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a7796.c  | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77965.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77970.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77980.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77990.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77995.c | 1 -
>  drivers/pinctrl/renesas/pfc-r8a779a0.c | 1 -
>  drivers/pinctrl/renesas/sh_pfc.h       | 7 +++++++
>  13 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/core.h b/drivers/pinctrl/renesas/core.h
> index 19f7b4308fac7a8f..51f391e9713ae9bc 100644
> --- a/drivers/pinctrl/renesas/core.h
> +++ b/drivers/pinctrl/renesas/core.h
> @@ -29,8 +29,4 @@ void sh_pfc_write(struct sh_pfc *pfc, u32 reg, u32 data);
>  int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin);
>  int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
>  
> -unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
> -void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> -			  unsigned int bias);
> -
>  #endif /* __SH_PFC_CORE_H__ */
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
> index 75f52b1798c3c5c9..6185af9c499006e7 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7778.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
> @@ -16,7 +16,6 @@
>  #include <linux/kernel.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define PORT_GP_PUP_1(bank, pin, fn, sfx)	\
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
> index 258f82fb31c0ec10..f54a7c81005d0a78 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7792.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
> @@ -8,7 +8,6 @@
>  
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CPU_ALL_GP(fn, sfx)						\
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
> index 32fe8caca70a119e..ee4ce9349aae2654 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77950.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
> @@ -8,7 +8,6 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
> index bdd605e41303bf3a..1c14a3925bef909b 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77951.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
> @@ -9,7 +9,6 @@
>  #include <linux/kernel.h>
>  #include <linux/sys_soc.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
> index 96b5b1509bb70d16..71e69f2a431e05d4 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7796.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
> @@ -14,7 +14,6 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
> index f15e29383d9b54fe..a5db0168fb86418e 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77965.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
> @@ -15,7 +15,6 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
> index e8a0fc468eb260c6..7935826cfae7c9a3 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77970.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
> @@ -16,7 +16,6 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CPU_ALL_GP(fn, sfx)						\
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
> index ebd07bebaeebca07..20cff93a2a13ca17 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77980.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
> @@ -16,7 +16,6 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CPU_ALL_GP(fn, sfx)	\
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
> index 0a32e3c317c1a0c5..04a74b5d08e16f4c 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77990.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
> @@ -14,7 +14,6 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_PULL_UP_DOWN)
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
> index 672251d86c2de3cd..b479f87a3b23f0f1 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77995.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
> @@ -14,7 +14,6 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CPU_ALL_GP(fn, sfx)			\
> diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> index 2250ccd0470aa504..ad6532443a785b13 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -11,7 +11,6 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  
> -#include "core.h"
>  #include "sh_pfc.h"
>  
>  #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
> index 5934faeb23d756d8..2d511c7280fa49e3 100644
> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -773,4 +773,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>   */
>  #define RCAR_GP_PIN(bank, pin)		(((bank) * 32) + (pin))
>  
> +/*
> + * Bias helpers
> + */
> +unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
> +void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> +			  unsigned int bias);
> +
>  #endif /* __SH_PFC_H */
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
