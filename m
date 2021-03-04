Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DD032CE46
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbhCDITl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbhCDITj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:19:39 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA2EC061756;
        Thu,  4 Mar 2021 00:18:59 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 848BD2223A;
        Thu,  4 Mar 2021 09:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614845934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MfywzyUqUPoR5W08pnkRZKWTrsP3h7iFAaQ7aCMj9j4=;
        b=c4eEpz1ehDo6Qsk+A+2plrzggirFsu0fCKoBSqsJl7MoKNOBJ8RRA2K0HtSmMflcAvnaRD
        ec/99tYROr3HUwLcgcnwCXowmVQ8pTmSorsE/ZkPBAMeZYIL6R7L+Wk8E1RH5OdRd7bqaz
        inKhkI3uUjtKGLLvK6t4AFTntwufDP8=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Mar 2021 09:18:53 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: regmap: set gpio_chip of_node
In-Reply-To: <20210304071506.18434-1-noltari@gmail.com>
References: <20210304071506.18434-1-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dc9933abd720e1449f78e86e5ff10f48@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-04 08:15, schrieb Álvaro Fernández Rojas:
> This is needed for properly registering gpio regmap as a child of a 
> regmap
> pin controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
>  v2: split this patch from the bcm63xx-pinctrl series
> 
>  drivers/gpio/gpio-regmap.c  | 1 +
>  include/linux/gpio/regmap.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index fed1e269c42a..8898ab3e1d59 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
> 
>  	chip = &gpio->gpio_chip;
>  	chip->parent = config->parent;
> +	chip->of_node = config->of_node ?: dev_of_node(config->parent);
>  	chip->base = -1;
>  	chip->ngpio = config->ngpio;
>  	chip->names = config->names;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index ad76f3d0a6ba..566d76d0dbae 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -4,6 +4,7 @@
>  #define _LINUX_GPIO_REGMAP_H
> 
>  struct device;
> +struct device_node;
>  struct gpio_regmap;
>  struct irq_domain;
>  struct regmap;
> @@ -15,6 +16,7 @@ struct regmap;
>   * struct gpio_regmap_config - Description of a generic regmap 
> gpio_chip.
>   * @parent:		The parent device
>   * @regmap:		The regmap used to access the registers
> + * @of_node:		(Optional) The device node
>   *			given, the name of the device is used

Something is messed up here ;) This line should be together with
the one containing @regmap. While at it please add the
"If not given, the of_node of the parent device is used."

-michael

>   * @label:		(Optional) Descriptive name for GPIO controller.
>   *			If not given, the name of the device is used.
> @@ -57,6 +59,7 @@ struct regmap;
>  struct gpio_regmap_config {
>  	struct device *parent;
>  	struct regmap *regmap;
> +	struct device_node *of_node;
> 
>  	const char *label;
>  	int ngpio;
