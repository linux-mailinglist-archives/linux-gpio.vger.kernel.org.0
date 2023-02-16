Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C51698FB1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjBPJXl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBPJXk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:23:40 -0500
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612AF1C7C1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:23:39 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Vbo9nOJ_1676539416;
Received: from 30.97.48.85(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Vbo9nOJ_1676539416)
          by smtp.aliyun-inc.com;
          Thu, 16 Feb 2023 17:23:37 +0800
Message-ID: <c2c7b71c-ae30-31f0-c40a-0546c09de86e@linux.alibaba.com>
Date:   Thu, 16 Feb 2023 17:23:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] gpio: pmic-eic-sprd: Move Kconfig to MFD expanders
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Cixi Geng <cixi.geng1@unisoc.com>
References: <20230216091909.1808306-1-linus.walleij@linaro.org>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20230216091909.1808306-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2/16/2023 5:19 PM, Linus Walleij wrote:
> The Spreadtrum PMIC EIC interrupt controller is part of an
> MFD expander and should thus be in the MFD GPIO expander
> menu section with the rest. Move it.
> 
> Cc: Cixi Geng <cixi.geng1@unisoc.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks good to me. Thanks Linus.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/gpio/Kconfig | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c9f3ef56eb24..58b742a50fe0 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -492,14 +492,6 @@ config GPIO_PL061
>   	help
>   	  Say yes here to support the PrimeCell PL061 GPIO device.
>   
> -config GPIO_PMIC_EIC_SPRD
> -	tristate "Spreadtrum PMIC EIC support"
> -	depends on MFD_SC27XX_PMIC || COMPILE_TEST
> -	depends on OF_GPIO
> -	select GPIOLIB_IRQCHIP
> -	help
> -	  Say yes here to support Spreadtrum PMIC EIC device.
> -
>   config GPIO_PXA
>   	bool "PXA GPIO support"
>   	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> @@ -1310,6 +1302,14 @@ config GPIO_PALMAS
>   	  Select this option to enable GPIO driver for the TI PALMAS
>   	  series chip family.
>   
> +config GPIO_PMIC_EIC_SPRD
> +	tristate "Spreadtrum PMIC EIC support"
> +	depends on MFD_SC27XX_PMIC || COMPILE_TEST
> +	depends on OF_GPIO
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support Spreadtrum PMIC EIC device.
> +
>   config GPIO_RC5T583
>   	bool "RICOH RC5T583 GPIO"
>   	depends on MFD_RC5T583
