Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28CC3506B2
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 20:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbhCaSso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 14:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhCaSsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 14:48:37 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55766C061574
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 11:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=zsEOZ77JXlGERX+lYA3LDuc7h5Fmf9rwgsEBTk1dE3w=; b=nhtAZtV+4tsGAVHWj+NyWucwkP
        lpysjfGPg40zg/w3mCew36EJNCFSxKubjQTv9leMlTCxEK338Tj1qmsSmdibjBQxyzeHkIKLq9YWc
        /Ayp5AnXOAZ04tXEhOCfWnkj2wLo3gDv2YAPz3M05wfX1+lELhRDTA1bbm0Bro580W8Q3a1svagN9
        JD+4dk6PabWzl4JK3CJfrmT9ZDA8a8wDn2511mTCLYvJS5yXs3utdY6yvGvQq4eZqlPVbZgkWmuz/
        e7e1ApIeW4UTdUorqdRSxQtshHgsbyU4hr3Xz4sKdP24AeWBE0nnwF4ca9xhfijfaa557+R0uAzhe
        6UlyNJsQ==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lRftL-007JMQ-50; Wed, 31 Mar 2021 18:48:35 +0000
Subject: Re: [PATCH] pinctrl: bcm63xx: Fix dependencies
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
References: <20210331124733.2059013-1-linus.walleij@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1a2033f5-dff4-ef2f-82c4-26c1f2fbd785@infradead.org>
Date:   Wed, 31 Mar 2021 11:48:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331124733.2059013-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/31/21 5:47 AM, Linus Walleij wrote:
> Add depends on OF so we don't get weird build errors on
> randconfig.
> 
> Also order selects the same as the other drivers for
> pure aestetic reasons.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/bcm/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 33660e8fec05..17615674ac1a 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -31,10 +31,12 @@ config PINCTRL_BCM2835
>  
>  config PINCTRL_BCM63XX
>  	bool
> +	depends on OF
> +	select PINMUX
> +	select PINCONF
>  	select GENERIC_PINCONF
> +	select GPIOLIB
>  	select GPIO_REGMAP
> -	select PINCONF
> -	select PINMUX
>  
>  config PINCTRL_BCM6318
>  	bool "Broadcom BCM6318 GPIO driver"
> 

That gives me:

WARNING: unmet direct dependencies detected for PINCTRL_BCM63XX
  Depends on [n]: PINCTRL [=y] && OF [=n]
  Selected by [y]:
  - PINCTRL_BCM6328 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
  - PINCTRL_BCM6358 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
  - PINCTRL_BCM6362 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])
  - PINCTRL_BCM63268 [=y] && PINCTRL [=y] && (BMIPS_GENERIC || COMPILE_TEST [=y])

and

ld: drivers/pinctrl/bcm/pinctrl-bcm6328.o: in function `pinconf_generic_dt_node_to_map_pin':
pinctrl-bcm6328.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'
ld: drivers/pinctrl/bcm/pinctrl-bcm6358.o: in function `pinconf_generic_dt_node_to_map_pin':
pinctrl-bcm6358.c:(.text+0x207): undefined reference to `pinconf_generic_dt_node_to_map'
ld: drivers/pinctrl/bcm/pinctrl-bcm6362.o: in function `pinconf_generic_dt_node_to_map_pin':
pinctrl-bcm6362.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'
ld: drivers/pinctrl/bcm/pinctrl-bcm63268.o: in function `pinconf_generic_dt_node_to_map_pin':
pinctrl-bcm63268.c:(.text+0xe7): undefined reference to `pinconf_generic_dt_node_to_map'


-- 
~Randy

