Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB02B162AD0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 17:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgBRQjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 11:39:53 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38938 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgBRQjx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 11:39:53 -0500
Received: by mail-wm1-f68.google.com with SMTP id c84so3638638wme.4;
        Tue, 18 Feb 2020 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4vYtRiW+6Wt12+b8bfpUgMwEp+iq8E8S7syR5LipLyA=;
        b=DKfe2wW9oaDeBM+SV6K4t1eNOba9J697CSC9qWu6Jp4mnmnBs3cOIUkzajTzF/yLbJ
         AjF0DdFDEiz+aZ9Nk23odnDRrBFuFOigR9d5WRvNyguuNWj7HFjn57McRQl1S7wkB7IO
         WjtGXV3kAWLjYpP15Mh+6s3eDsM8+6C54oQreYcR83sBC1rM+YnjkzHi/esxWO59nTA3
         2EzoAEgRUtygAqOLliHINcaQCRBZ0pActvOYcXXGGypJZ8vk3N5YqsuKl+fhIfFX85rT
         Z48XBB+2D8wM9UdJJFZ2VgUBx9gRCktPQW5G8+v1+kbLyGivkFL5St3cpAnKY+JMrDPq
         oJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4vYtRiW+6Wt12+b8bfpUgMwEp+iq8E8S7syR5LipLyA=;
        b=Hjii6/HDs6N5SUDnPH+7dwZpr1vLnFt+/mdVkvVKj+0rI/wKAr61OMKfU3S6Rf6NXW
         Wdf8bF+GRkz2eHdwsiIlOQp2fJfUkUzaex5bcmHCy6FmzaVvB+hDg53REnc79qYyWUud
         7gKfcB2KgqC1UiV9SzJi4MEkRB13xnBOXzt0/ml5s+9ewFo8dyhHim7ZfNiK8ZClEiGQ
         PKOEA3QwkXi5eQRQMD9iRleYXMNZuRt3L/GmmePoc/oDfWDedgMg0FmFf5vn86pNdb2W
         6aqv51k0xwsyv7CnX/Jmwt9E1RjLe7M6ZYPTGZBqaRRQ5BR7HrIhiz4zE3PqFOSN+Y2G
         CO3A==
X-Gm-Message-State: APjAAAVS46hqpBcGoyfM8hzKOUQf+wj0BUiKEsrX9/W/muIctIIz2YAY
        XmWKH5RpbD4SJy2o40ISfUE=
X-Google-Smtp-Source: APXvYqxcbI+RE+WYU+sXkJY9yUNjkkp8BNWl+KrGUkzF6VXs/f3FnNVbDMQEVrjHo9bLmnmRHMQZXQ==
X-Received: by 2002:a05:600c:295d:: with SMTP id n29mr4018188wmd.101.1582043989830;
        Tue, 18 Feb 2020 08:39:49 -0800 (PST)
Received: from ziggy.stardust ([213.195.113.243])
        by smtp.gmail.com with ESMTPSA id u62sm4293547wmu.17.2020.02.18.08.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 08:39:49 -0800 (PST)
Subject: Re: [PATCH v1 1/2] pinctrl: make MediaTek pinctrl v2 driver ready for
 buidling loadable module
To:     light.hsieh@mediatek.com, linus.walleij@linaro.org
Cc:     sean.wang@kernel.org, kuohong.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <1582016614-20728-1-git-send-email-light.hsieh@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3db80f29-093b-ffc8-4c45-07a0508b523b@gmail.com>
Date:   Tue, 18 Feb 2020 17:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582016614-20728-1-git-send-email-light.hsieh@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Light,

On 18/02/2020 10:03, light.hsieh@mediatek.com wrote:
> From: Light Hsieh <light.hsieh@mediatek.com>
> 
> Google plan to make platform driver as kernel module for future
> Andriod kernel. This patch make pinctrl-paris.c ready for building as
> loadable module. Besides, mtk-eint.c and pinctrl-mtk-common-v2.c,
> the dependent objects of pinctrl-paris.c, are made to be ready for
> building as loadable module.

My proposal for the commit message:

In the future we want to be able to build the pinctrl driver, based on paris, as
kernel module. This patch allows pinctrl-paris.c the external interrupt
controller mtk-eint.c and pinctrl-mtk-common-v2.c to be loadable as module.

With this or something similar:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> The following is the rationale for determining whether mtk-eint.c,
> pinctrl-mtk-common-v2.c, and pinctrl-paris.c are built as loadable module:
> 
> 1. drivers/pinctrl/mediatek/Kconfig:
> 1.1 PINCTRL_MTXXXX: change from bool to tristate. It is specified in
>         defconfig file. MTXXXX can only be the user of pinctrl-paris,
>         which can MT6765 or MT8183. The patch for changing
>         PINCTRL_MT6765 from bool to tristate will be given as the next
>         patch of the patch series.
> 1.2 PINCTRL_MTK_PARIS: change from bool to tristate and select
>         PINCTRL_MTK_V2. No need to specify in defconfig file.
>       * PINCTRL_MTK_PARIS will be y if any PINCTRL_MTXXXX selecting
>         PINCTRL_MTK_PARIS is y.
>       * PINCTRL_MTK_PARIS will be n if all PINCTRL_MTXXXX selecting
>         PINCTRL_MTK_PARIS is n.
>       * PINCTRL_MTK_PARIS will be m if some PINCTRL_MTXXXX selecting
>         PINCTRL_MTK_PARIS are m and other PINCTRL_MTXXXX selecting
>         PINCTRL_MTK_PARIS are n.
> 1.3 PINCTRL_MTK_MOORE: select EINT_MTK and PINCTRL_MTK_V2. It is make
>         to be ready for building as loadable kernel module because it
>         is not used on Android kernel.
> 1.4 PINCTRL_MTK_V2: add this tristate config which depends on
>         PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in
>         defconfig file.
>       * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
>         PINCTRL_MTK_MOORE is y.
>       * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
>         PINCTRL_MTK_MOORE are n.
>       * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
>         PINCTRL_MTK_MOORE is n.
> 1.5 EINT_MTK: change from bool to tristate and add rule for default.
>         No need to specify in defconfig file.
>       * First rule: determine if EINT_MTK is y or n according to
>         selection of PINCTRL_MTK or PINCTRL_MTK_MORE.
>       * Second rule: determine if EINT_MTK is y, m, or n according to
>         selection of PINCTRL_MTK_PARIS.
> 
> 2. drivers/pinctrl/mediatek/Makefile: Use PINCTRL_MTK_V2 to determine
>         if pinctrl-mtk-common-v2.c is built as loadable module or
>         built-in.
> 
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig                 | 13 +++++++++++--
>  drivers/pinctrl/mediatek/Makefile                |  5 +++--
>  drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         |  5 +++++
>  drivers/pinctrl/pinconf-generic.c                |  1 +
>  6 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 701f9af..4cd1109 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -3,10 +3,12 @@ menu "MediaTek pinctrl drivers"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  
>  config EINT_MTK
> -	bool "MediaTek External Interrupt Support"
> +	tristate "MediaTek External Interrupt Support"
>  	depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
>  	select GPIOLIB
>  	select IRQ_DOMAIN
> +	default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
> +	default PINCTRL_MTK_PARIS
>  
>  config PINCTRL_MTK
>  	bool
> @@ -17,23 +19,30 @@ config PINCTRL_MTK
>  	select EINT_MTK
>  	select OF_GPIO
>  
> +config PINCTRL_MTK_V2
> +	tristate
> +	depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS
> +
>  config PINCTRL_MTK_MOORE
>  	bool
>  	depends on OF
>  	select GENERIC_PINCONF
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
> +	select EINT_MTK
>  	select GPIOLIB
>  	select OF_GPIO
> +	select PINCTRL_MTK_V2
>  
>  config PINCTRL_MTK_PARIS
> -	bool
> +	tristate
>  	depends on OF
>  	select PINMUX
>  	select GENERIC_PINCONF
>  	select GPIOLIB
>  	select EINT_MTK
>  	select OF_GPIO
> +	select PINCTRL_MTK_V2
>  
>  # For ARMv7 SoCs
>  config PINCTRL_MT2701
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index a74325a..4b71328 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -2,8 +2,9 @@
>  # Core
>  obj-$(CONFIG_EINT_MTK)		+= mtk-eint.o
>  obj-$(CONFIG_PINCTRL_MTK)	+= pinctrl-mtk-common.o
> -obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o pinctrl-mtk-common-v2.o
> -obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o pinctrl-mtk-common-v2.o
> +obj-$(CONFIG_PINCTRL_MTK_V2)	+= pinctrl-mtk-common-v2.o
> +obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o
> +obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o
>  
>  # SoC Drivers
>  obj-$(CONFIG_PINCTRL_MT2701)	+= pinctrl-mt2701.o
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 7e526bcf..99703a8 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -9,6 +9,7 @@
>   *
>   */
>  
> +#include <linux/module.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/gpio/driver.h>
> @@ -379,6 +380,7 @@ int mtk_eint_do_suspend(struct mtk_eint *eint)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
>  
>  int mtk_eint_do_resume(struct mtk_eint *eint)
>  {
> @@ -386,6 +388,7 @@ int mtk_eint_do_resume(struct mtk_eint *eint)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
>  
>  int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>  			  unsigned int debounce)
> @@ -440,6 +443,7 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
>  
>  int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>  {
> @@ -451,6 +455,7 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>  
>  	return irq;
>  }
> +EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>  
>  int mtk_eint_do_init(struct mtk_eint *eint)
>  {
> @@ -495,3 +500,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_eint_do_init);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MediaTek EINT Driver");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 1da9425..cdf2d69 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -6,6 +6,7 @@
>   *
>   */
>  
> +#include <linux/module.h>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -206,6 +207,7 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_hw_set_value);
>  
>  int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>  		     int field, int *value)
> @@ -225,6 +227,7 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_hw_get_value);
>  
>  static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
>  {
> @@ -363,6 +366,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>  
>  	return mtk_eint_do_init(hw->eint);
>  }
> +EXPORT_SYMBOL_GPL(mtk_build_eint);
>  
>  /* Revision 0 */
>  int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
> @@ -382,6 +386,7 @@ int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set);
>  
>  int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
>  				 const struct mtk_pin_desc *desc, int *res)
> @@ -404,6 +409,7 @@ int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get);
>  
>  int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
>  			 const struct mtk_pin_desc *desc, bool pullup)
> @@ -423,6 +429,7 @@ int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set);
>  
>  int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
>  			 const struct mtk_pin_desc *desc, bool pullup, int *res)
> @@ -442,6 +449,7 @@ int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
>  
>  /* Revision 1 */
>  int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
> @@ -456,6 +464,7 @@ int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
>  
>  int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
>  				      const struct mtk_pin_desc *desc, int *res)
> @@ -473,6 +482,7 @@ int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get_rev1);
>  
>  int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>  			      const struct mtk_pin_desc *desc, bool pullup)
> @@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
>  
>  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>  			      const struct mtk_pin_desc *desc, bool pullup,
> @@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_gev1);
>  
>  /* Combo for the following pull register type:
>   * 1. PU + PD
> @@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
>  out:
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
>  
>  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>  			      const struct mtk_pin_desc *desc,
> @@ -737,6 +750,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>  out:
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
>  
>  /* Revision 0 */
>  int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
> @@ -766,6 +780,7 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set);
>  
>  int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
>  			  const struct mtk_pin_desc *desc, int *val)
> @@ -790,6 +805,7 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get);
>  
>  /* Revision 1 */
>  int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
> @@ -811,6 +827,7 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_rev1);
>  
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>  			       const struct mtk_pin_desc *desc, int *val)
> @@ -828,18 +845,21 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_rev1);
>  
>  int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
>  			       const struct mtk_pin_desc *desc, u32 arg)
>  {
>  	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_raw);
>  
>  int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
>  			       const struct mtk_pin_desc *desc, int *val)
>  {
>  	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_raw);
>  
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>  			     const struct mtk_pin_desc *desc, bool pullup,
> @@ -880,6 +900,7 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_set);
>  
>  int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
>  			     const struct mtk_pin_desc *desc, bool pullup,
> @@ -922,6 +943,7 @@ int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_get);
>  
>  int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>  			      const struct mtk_pin_desc *desc, u32 arg)
> @@ -948,6 +970,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>  
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
>  
>  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>  			      const struct mtk_pin_desc *desc, u32 *val)
> @@ -971,3 +994,4 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 83bf29c..af97794 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -9,6 +9,7 @@
>   *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/gpio/driver.h>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include "pinctrl-paris.h"
> @@ -1037,3 +1038,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
>  	.suspend_noirq = mtk_paris_pinctrl_suspend,
>  	.resume_noirq = mtk_paris_pinctrl_resume,
>  };
> +EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> index 9eb8630..dfef471 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -286,6 +286,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>  	kfree(cfg);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
>  
>  int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		struct device_node *np, struct pinctrl_map **map,
> 
