Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266B137063A
	for <lists+linux-gpio@lfdr.de>; Sat,  1 May 2021 09:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhEAHhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 May 2021 03:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhEAHhb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 May 2021 03:37:31 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC8DC06174A
        for <linux-gpio@vger.kernel.org>; Sat,  1 May 2021 00:36:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x2so517841lff.10
        for <linux-gpio@vger.kernel.org>; Sat, 01 May 2021 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=va4hx7qodSJLS3GzYkZ5upr2M9xf2QrjBJElPNqSne8=;
        b=qhXY0PU4UtwqT25ZDbXaINJS+g60IWAYYifd5z3MF7Lje9iX4CNjnlBXoOusVlB+fs
         XAXkocLVXvXLhExsgyoAUxRWur+RhTuOyCKbuJO1HauEtxDnIUut0hBkMiGfb69XnA8i
         xETgw3/ergdq5lqiS2A3ksbla9InyOzjOEhew8I62D0S9dNxZNBcR0NRkFp5lwmaOAbp
         NzSUNt24NBw9zceqzTBQLlt54ap9jEuUh+5Ir03swIipYglieqbCCww9hJ/9UbFk1Wmq
         DonnqPaRJgMU4qd62LdZMfBl2qkqJ6ld6jFgRbiw/lcDzjJ60SNiFMU0g7KgGGJRZfLv
         IkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=va4hx7qodSJLS3GzYkZ5upr2M9xf2QrjBJElPNqSne8=;
        b=ZLVX9+g4DbDN4B3ETZ/yGr1cq0RYvz7F17D6XAhXUyC5E0g3hlRsaEc0i3gVuyF16L
         xEAnFMGVmM5BDZ+kmGu6yRP68GgvXioOBToR++Zixt8W1CWCDHJ27X5J7F2RQou2sDtF
         3GyAnt5xiJSt4I4UduuzLu9WZUQS3SVESJO5Nj7cEyN5agxmLO5sSzOpDV60CT5LC1kQ
         CAgBWlduj2UZ7Rr3RQi97um67ANA5pucyckw7b8KMx/WMj4DdmXTEdewT3wmwnswSBOZ
         UU7v0NEaiTGE6nRfQCa8f/30P5EYm3ahvQa8f6C98j6DGpkzYqmIOVKTrl/9pSyNdt7Y
         zFqQ==
X-Gm-Message-State: AOAM5301Gn6D5x851kHOuO13peHcfNsykMkOU83/5lqU+DLNIO/zzsdo
        qmx2/O78IAbz8AbxJv9lk5rdZgBwnzJtcw==
X-Google-Smtp-Source: ABdhPJxfAnvRNhELIUlqNxOSetu3Mvz//EoB9oW+1zW0SvGNMOO7Y6UyfLMNRMAKcsRoLLtibzO+jg==
X-Received: by 2002:a05:6512:713:: with SMTP id b19mr5697181lfs.125.1619854598444;
        Sat, 01 May 2021 00:36:38 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id b17sm503556lfv.34.2021.05.01.00.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:36:38 -0700 (PDT)
Date:   Sat, 1 May 2021 09:36:37 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/12] pinctrl: renesas: r8a7778: Remove unused
 PORT_GP_PUP_1() macro
Message-ID: <YI0FBbjZdTncP2X5@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <129147ac57f5e931cc7108db0a6483b803a1b8f4.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <129147ac57f5e931cc7108db0a6483b803a1b8f4.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-04-30 14:31:03 +0200, Geert Uytterhoeven wrote:
> The last user was removed in commit dd1f760bffcee2c5 ("pinctrl: sh-pfc:
> r8a7778: Use common PORT_GP_CFG_27() macro").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a7778.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
> index 6185af9c499006e7..d641e408f1bd413c 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a7778.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
> @@ -18,9 +18,6 @@
>  
>  #include "sh_pfc.h"
>  
> -#define PORT_GP_PUP_1(bank, pin, fn, sfx)	\
> -	PORT_GP_CFG_1(bank, pin, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
> -
>  #define CPU_ALL_GP(fn, sfx)		\
>  	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
>  	PORT_GP_CFG_32(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
