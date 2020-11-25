Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029952C461E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 17:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731995AbgKYQ53 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Nov 2020 11:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730062AbgKYQ53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 11:57:29 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5814C0613D4;
        Wed, 25 Nov 2020 08:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4U4bIkyvLbipqWfNVOGRkeGb+iA7768WDmrILxF8xXA=; b=0Fa0yYLDLb39qNaJ6gia4Sb00y
        z8ro7R6/82bVLRQuXN+Yk0kT376mj5h8u8NQ3DUYgT9G7Nfs9qSuZy7REqgnIuCHPwtDTa6UHaCBD
        Aap0wTZpLecTJW1tqAeZtY4/x1SoTRKZngQSUoVJk6kNN5jgBbdAnRlKkZJFhv37mkuS7WSWNVacC
        PoJPN2J0zso/BbTHE+Wn1og0opUMhJd11Feg4l4T5lAEfumSeYmiopplVAvQjgm49dMqPAVX/KIJc
        qDIB1YIjCjBEZxOk5f9J/bwTwzpw/3iAgSFXF8S9NywzGlmUgtvsiGZlR8x4g3DrYnL+NPyhM/dbn
        oOE203Lw==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1khy6W-0003Zm-29; Wed, 25 Nov 2020 16:57:16 +0000
Subject: Re: [PATCH -next] pinctrl: pinctrl-microchip-sgpio: Add OF config
 dependency
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20201125122014.11237-1-lars.povlsen@microchip.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ea50d383-4904-a2cf-f80c-96b99c9cf495@infradead.org>
Date:   Wed, 25 Nov 2020 08:57:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125122014.11237-1-lars.povlsen@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/25/20 4:20 AM, Lars Povlsen wrote:
> The pinctrl-microchip-sgpio driver needs OF support, so add that to
> Kconfig.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/pinctrl/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 9b8ed7516355..94e49da49f5c 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -376,11 +376,13 @@ config PINCTRL_OCELOT
>  
>  config PINCTRL_MICROCHIP_SGPIO
>  	bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> +	depends on OF
>  	depends on HAS_IOMEM
>  	select GPIOLIB
>  	select GENERIC_PINCONF
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
> +	select OF_GPIO
>  	help
>  	  Support for the serial GPIO interface used on Microsemi and
>  	  Microchip SoC's. By using a serial interface, the SIO
> 


-- 
~Randy

