Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9460D32AD2C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383838AbhCBV15 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580756AbhCBSVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 13:21:10 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EB5C0617A7;
        Tue,  2 Mar 2021 10:19:23 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 0F0B22223E;
        Tue,  2 Mar 2021 19:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614708977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f1o1gnNWlC/NUtDWxWJeDtEym9UtbhEVjLxvEBdBC2k=;
        b=b6erdFrmE04Jmxg6LNKxUmw4U3GdXeLpLqt0J0FwK4Qui+KQdy0FiuRTezzE76+7npughH
        Z2UIBUiRtY+tNDO2opH0zfTRLRCZLGsEuFcxco8cx9wRNRcadivkWpegmeX24S5JyQujIJ
        HNqomz7cXV1wEL0JxfJqSNZTDPKk1aI=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 02 Mar 2021 19:16:16 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: regmap: fix direction register check
In-Reply-To: <20210302180621.12301-1-noltari@gmail.com>
References: <20210302180621.12301-1-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c05bf9228206786a09f4f17160a2edf9@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-02 19:06, schrieb Álvaro Fernández Rojas:
> If there's a direction register, we should also have dat or set 
> registers.
> However, we only need one of them, not both.

Can you give some more context or an example? If there is a direction
register, we'd need to set and get the value, no?

-michael

> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using 
> regmap")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/gpio/gpio-regmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 23b0a8572f53..5a9fca00b5e8 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -194,7 +194,7 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
> 
>  	/* if we have a direction register we need both input and output */
>  	if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
> -	    (!config->reg_dat_base || !config->reg_set_base))
> +	    (!config->reg_dat_base && !config->reg_set_base))
>  		return ERR_PTR(-EINVAL);
> 
>  	/* we don't support having both registers simultaneously for now */
