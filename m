Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D868732C7F8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbhCDAdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384727AbhCCQJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 11:09:05 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DB5C061756;
        Wed,  3 Mar 2021 08:08:23 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 271E62223A;
        Wed,  3 Mar 2021 17:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614787701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AZ76YG/alRYTxnhFsgjOtuLThTbucEDar6wc/b9e3mI=;
        b=WUGUj5chPvm41q4yT0EBirH+hpEObDg73+GrlRdcPzN51KUq1amNtzyX5oBEV7RBDO2cDY
        c6GPB6gweq9dk9Wlc/GDMwsrsAviuxzsEGfmiPkf+UDnOyvNuPnqomL3MFUPgAYkhwutCu
        lSxdMnzefg7hBis495xOHq08A48HG2Q=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 03 Mar 2021 17:08:21 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
In-Reply-To: <20210303142310.6371-2-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
 <20210303142310.6371-2-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <40403445ae34e822474e5f39be75fd0b@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-03 15:22, schrieb Álvaro Fernández Rojas:
> This is needed for properly registering gpio regmap as a child of a 
> regmap
> pin controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v3: introduce patch needed for properly parsing gpio-ranges.
> 
>  drivers/gpio/gpio-regmap.c  | 1 +
>  include/linux/gpio/regmap.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 5412cb3b0b2a..752ccd780b7d 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
> 
>  	chip = &gpio->gpio_chip;
>  	chip->parent = config->parent;
> +	chip->of_node = config->of_node;

chip->of_node = config->of_node ?: dev_of_node(config->parent);

As mentioned in my previous reply in this thread, for clarity
reasons.

>  	chip->base = -1;
>  	chip->ngpio = config->ngpio;
>  	chip->names = config->names;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index ad76f3d0a6ba..f6e638e32d2a 100644
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
> @@ -14,6 +15,7 @@ struct regmap;
>  /**
>   * struct gpio_regmap_config - Description of a generic regmap 
> gpio_chip.
>   * @parent:		The parent device
> + * @of_node:		The device node

Please add "(Optional)" and move it below @regmap. This should also
mention that if not supplied parent->of_node is used.

>   * @regmap:		The regmap used to access the registers
>   *			given, the name of the device is used
>   * @label:		(Optional) Descriptive name for GPIO controller.
> @@ -56,6 +58,7 @@ struct regmap;
>   */
>  struct gpio_regmap_config {
>  	struct device *parent;
> +	struct device_node *of_node;
>  	struct regmap *regmap;
> 
>  	const char *label;

With these changes:
Reviewed-by: Michael Walle <michael@walle.cc>

-michael
