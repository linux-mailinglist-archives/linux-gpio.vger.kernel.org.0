Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2F73346B2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 19:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhCJS2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 13:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhCJS1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 13:27:47 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58455C061760;
        Wed, 10 Mar 2021 10:27:47 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id DCB7022173;
        Wed, 10 Mar 2021 19:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615400865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F8vDNH8421RXKDc4eht9KA1gFC2SxxBRRDukiV+MMMM=;
        b=CxkAO/k0r91N18hLq9c3RkDcy0oyNTMGFDRDx5ThQEr1MkpWhN6rpju8l7at0IUwvQKiUV
        wuXhMJjctMculrdUrAqkPCuh8ropI+x19oA8SXNRFjMruo0Lu1Pn2VU5eBWpOCMuZuLpcU
        Wmv3COHMuaGqqDdfkKrL411UEoS/H1M=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 10 Mar 2021 19:27:44 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/15] gpio: regmap: set gpio_chip of_node
In-Reply-To: <20210310125504.31886-3-noltari@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-3-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7e35bfd395f3ae40029b0f3cb2bc8f70@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-10 13:54, schrieb Álvaro Fernández Rojas:
> This is needed for properly registering GPIO regmap as a child of a 
> regmap
> pin controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
>  v6: add comment and simplify of_node assignment

Ah, I see you add the comment for the documentation. Nice. But I'd
like to see it in the code, too. See below.

>  v5: switch to fwnode
>  v4: fix documentation
>  v3: introduce patch needed for properly parsing gpio-range
> 
>  drivers/gpio/gpio-regmap.c  | 1 +
>  include/linux/gpio/regmap.h | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 5412cb3b0b2a..d4fc656e70b0 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
> 
>  	chip = &gpio->gpio_chip;
>  	chip->parent = config->parent;

If there will be a new version, please add the following comment:

/* gpiolib will use of_node of the parent if chip->of_node is NULL */

>> +       chip->of_node = to_of_node(config->fwnode);

Otherwise, it is not obvious that config->fwnode is optional.

-michael

> +	chip->of_node = to_of_node(config->fwnode);
>  	chip->base = -1;
>  	chip->ngpio = config->ngpio;
>  	chip->names = config->names;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index ad76f3d0a6ba..334dd928042b 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -4,6 +4,7 @@
>  #define _LINUX_GPIO_REGMAP_H
> 
>  struct device;
> +struct fwnode_handle;
>  struct gpio_regmap;
>  struct irq_domain;
>  struct regmap;
> @@ -16,6 +17,8 @@ struct regmap;
>   * @parent:		The parent device
>   * @regmap:		The regmap used to access the registers
>   *			given, the name of the device is used
> + * @fwnode:		(Optional) The firmware node.
> + *			If not given, the fwnode of the parent is used.
>   * @label:		(Optional) Descriptive name for GPIO controller.
>   *			If not given, the name of the device is used.
>   * @ngpio:		Number of GPIOs
> @@ -57,6 +60,7 @@ struct regmap;
>  struct gpio_regmap_config {
>  	struct device *parent;
>  	struct regmap *regmap;
> +	struct fwnode_handle *fwnode;
> 
>  	const char *label;
>  	int ngpio;
