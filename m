Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCE81300D1
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2020 05:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgADEsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 23:48:06 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36126 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgADEsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 23:48:05 -0500
Received: by mail-pj1-f66.google.com with SMTP id n59so5486170pjb.1;
        Fri, 03 Jan 2020 20:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IoTdl+/r/+1PDTOBmkAtOt/aNfrTYnx6/vTmYpcU8Bk=;
        b=mBTSi1z8HQ5QN8ZL9wZwgjOBZcLjA6/1s/o81QkxPC3Gn1LJt7QS6MSGiI9NCCsJQI
         xwlIpwfxl+81MT4OH+Ckc3va0uV+gymXyyRkywUt0qEDLxF58/3e0bZADpvWzRffBzIE
         GcKkw5L+y2wKmxDXXvMBoASIBpbhEyI8xYgbuP4ry+pvA791SlDRFw1pYcK6NWSZ5q1q
         LXogHhdlAPDW2pO92kNmXoZzMbA38eBex2xeF0DNY8C3Y3/tlP6CLmRBf+0C+WGo6JXe
         uja8rjA9pbwrcxkn0rBxxp0IELwQsbYQtEOA5DqAN5DkVUr2CMlDifi9y9ZNiZuHjuj1
         l0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IoTdl+/r/+1PDTOBmkAtOt/aNfrTYnx6/vTmYpcU8Bk=;
        b=Q1OYDWcObduqhxHTyFw1DdNf2RMTRH79MtzIXHrHVBf7i4gDTgWTa5joKXB438JlsS
         SLYWXDjNDHmEnuWiPkN4TA/oBfwRSkY6VvkJphoLQrfNVqcNbdWp01CxpUDsWrPvvnvO
         o3y8BLbgpCKxIlbfaSzQv5kXp0vVKMInQjcKqkJlx/QtWz2cBKmxsu8Sc55AC2/r8t7o
         i1FyZCjqam+JhTfZsr1qlKFZwwocrW7t+8wiLNSr1uTOhngBopS2yo7o8bOfEEI+3O15
         p/l6YS+tFtrE2ieE+F5OZ4gp7H684zWuaIO+pcSVICaZh6tQt0vFuuuq9VdIUqpNKlb0
         4bEA==
X-Gm-Message-State: APjAAAXlIkliRj6UQjzqTJH2mVVkxi+QESE6oTQ1p3J/SaPUoGrhVMX/
        XfUQyyt7uRca/RwqliBv0VA=
X-Google-Smtp-Source: APXvYqzeds3/bTBx5/Pdi8NGCNH+FlJbUxV+IYl0LmLIGJ2scfHO4JnsggAhidTbq2sCByFRUHkqMQ==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id b44mr31811177pjc.9.1578113285104;
        Fri, 03 Jan 2020 20:48:05 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
        by smtp.gmail.com with ESMTPSA id h12sm53934136pfo.12.2020.01.03.20.48.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jan 2020 20:48:04 -0800 (PST)
Date:   Sat, 4 Jan 2020 12:48:01 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     linus.walleij@linaro.org, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        sean.wang@kernel.org, kuohong.wang@mediatek.com
Subject: Re: [PATCH v7 2/6] Supporting driving setting without mapping
 current to register value
Message-ID: <20200104044801.GA13072@nuc8i5>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 31, 2019 at 09:41:43PM +0800, Light Hsieh wrote:
> MediaTek's smarphone project actual usage does need to know current value
> (in mA) in procedure of finding the best driving setting.
> The steps in the procedure is like as follow:
smartphone ?

> 
> 1. set driving setting field in setting register as 0, measure waveform,
>    perform test, and etc.
> 2. set driving setting field in setting register as 1, measure waveform,
>    perform test, and etc.
> ...
> n. set driving setting field in setting register as n-1, measure
>    waveform, perform test, and etc.
> Check the results of steps 1~n and adopt the setting that get best result.
> 
> This procedure does need to know the mapping between current to register
> value.
> Therefore, setting driving without mapping current is more practical for
> MediaTek's smartphone usage.
> 
> Change-Id: I8bd6a2cecc0af650923704589b5b90097b0ff77e
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 32451e8..1212264 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1077,8 +1077,8 @@
>  	.bias_disable_get = mtk_pinconf_bias_disable_get,
>  	.bias_set = mtk_pinconf_bias_set,
>  	.bias_get = mtk_pinconf_bias_get,
> -	.drive_set = mtk_pinconf_drive_set_rev1,
> -	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.drive_set = mtk_pinconf_drive_set_raw,
> +	.drive_get = mtk_pinconf_drive_get_raw,
>  	.adv_pull_get = mtk_pinconf_adv_pull_get,
>  	.adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index d63e05e..2247eae 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -608,6 +608,18 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>  	return 0;
>  }
>  
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, u32 arg)
> +{
> +	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
> +}
> +
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, int *val)
> +{
> +	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> +}
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>  			     const struct mtk_pin_desc *desc, bool pullup,
>  			     u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..75d0e07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>  			       const struct mtk_pin_desc *desc, int *val);
>  
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +			       const struct mtk_pin_desc *desc, int *val);
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>  			     const struct mtk_pin_desc *desc, bool pullup,
>  			     u32 arg);
> -- 
> 1.8.1.1.dirty
