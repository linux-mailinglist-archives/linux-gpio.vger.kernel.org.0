Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F5243D652
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 00:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhJ0WOk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 18:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhJ0WOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Oct 2021 18:14:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E528C061570;
        Wed, 27 Oct 2021 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=vLcvcoDLoRsO1QRkWZDKvUBuvpcc21DXYKf15cUuQwA=; b=gvDkv5wfjyVnLjEmbDanwtnLfB
        A/QP/9U4V4iMkZodfT0tsu09Qf+vnUJtcgrHiJMcdhe6piNJEL+uVlITUWI6ZRq+2Fa53bjGqqWBM
        GhKwn77BZVK8lnOq7ZBPqzdOjgnihU0ekuiq9o5ilBEPJ2+XQsWkqp1fkxDuqbqv7bP0G4AOMPT1i
        JwCxRhMTF6a8S51MbkWZPu5pmi7ye/0LYd8kVVCD9eRcDloBoHPM32jYorH8M+f1wPpacpGoDRGdT
        YV5cc9OEFrsBGotH6L6nHnqqIDtHrwNgL7rDnLBMwzR2hKb1S6Q0mURz4f25z9m5MLdJ4UA2if4l/
        oXxbtxug==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mfr9R-006NlZ-56; Wed, 27 Oct 2021 22:12:05 +0000
Subject: Re: [PATCH 1/3] pinctrl: Add driver for Sunplus SP7021
To:     Wells Lu <wellslutw@gmail.com>, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635324926-22319-2-git-send-email-wells.lu@sunplus.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3ed37bf9-d698-2a03-60e7-9b357e3abfb4@infradead.org>
Date:   Wed, 27 Oct 2021 15:12:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635324926-22319-2-git-send-email-wells.lu@sunplus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi--

On 10/27/21 1:55 AM, Wells Lu wrote:
> diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
> new file mode 100644
> index 0000000..93b5ccf
> --- /dev/null
> +++ b/drivers/pinctrl/sunplus/Kconfig
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Sunplus Pin control driver configuration
> +#
> +
> +config PINCTRL_SPPCTL
> +	bool "Sunplus SP7021 pinmux and gpio driver"

Preferably                              GPIO

> +	depends on SOC_SP7021
> +	select PINMUX
> +	select GENERIC_PINCTRL_GROUPS
> +	select CONFIG_GENERIC_PINMUX_FUNCTIONS

	Drop   CONFIG_

> +	select PINCONF
> +	select GENERIC_PINCONF
> +	select OF_GPIO

Probably
	depends on OF && HAS_IOMEM
Otherwise how do you know that it's safe to do
	select OF_GPIO
?


> +	select GPIOLIB
> +	select GPIO_SYSFS
> +	select GENERIC_IRQ_CHIP
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say Y here to support Sunplus SP7021 pinmux controller.
> +	  The driveer is selected automatically by platform.

	      driver

> +	  This driver requires the pinctrl framework.
> +	  GPIO is provided by the same driver.
> +
> +config PINCTRL_SPPCTL_DEBUG
> +	bool "Sunplus pinmux specific debug"
> +	depends on SOC_SP7021 && DEBUG_PINCTRL
> +	help
> +	  Say Y if you need to debug Sunplus pinmux driver in-depth.
> +	  Pin control driver will output more messages if you enable
> +	  this item. This function is dependent on DEBUG_PINCTRL. It
> +	  should be enabled first.


thanks.
-- 
~Randy
