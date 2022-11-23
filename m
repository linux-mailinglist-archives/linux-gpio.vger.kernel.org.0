Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDB586352EB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 09:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbiKWIkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 03:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235951AbiKWIkY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 03:40:24 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187F6F2C16;
        Wed, 23 Nov 2022 00:40:22 -0800 (PST)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id A19B31D40;
        Wed, 23 Nov 2022 09:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1669192819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D/EMtbTP9R4E/MtKQG9pTQh9FK26krPr+Kn/xDK/ihY=;
        b=uCudhlreDEiug7vDK9bxdzY5mPgf2mNbxSDIfkCmR5HFiXDsFY++ccYfj7B4kracs4twO5
        ++QZnu+8wY/uG0LWgomzNiDrhfqmpkngQT58DdidEigR0UE9Tt/3ttfnaMKhehZxB7fbGj
        mywSHKqrMfXZDpzBI5xfQPXs/smhJgPdChgTOM4yohmxN4I94IbpLsnVGkNBKDorg4hXf9
        m34zt0cVacCjya02DsvDhnPGz2vuLUP7u+J9knchB7SaCX2sA133IoXn7ikKcLSu/Gh6l3
        vRdu69MHwSwd02f3nfAi6RHzga5YIbQCHDNxKIQpLv03LsgcrDJhgo2IlkDGQw==
MIME-Version: 1.0
Date:   Wed, 23 Nov 2022 09:40:19 +0100
From:   Michael Walle <michael@walle.cc>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     vigneshr@ti.com, robh@kernel.org, krzysztof.kozlowski@linaro.org,
        a.zummo@towertech.it, linus.walleij@linaro.org, lee@kernel.org,
        brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] gpio: gpio-tps6594: add GPIO support for TPS6594
 PMIC
In-Reply-To: <20221123053512.1195309-5-mranostay@ti.com>
References: <20221123053512.1195309-1-mranostay@ti.com>
 <20221123053512.1195309-5-mranostay@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c5be254ecac34e13bbe6dda3506a7aff@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2022-11-23 06:35, schrieb Matt Ranostay:

> +static int tps6594_regmap_xlate(struct gpio_regmap *gpio,
> +				    unsigned int base, unsigned int offset,
> +				    unsigned int *reg, unsigned int *mask)
> +{
> +	if (base == TPS6594_GPIO_CONF) {
> +		*reg = base + offset;
> +		*mask = GPIO_CFG_MASK;
> +	} else {
> +		unsigned int line = offset % GPIO_BANK_SIZE;
> +		unsigned int stride = offset / GPIO_BANK_SIZE;
> +
> +		*reg = base + stride;
> +		*mask = BIT(line);
> +	}

This looks like a duplcate from gpio_regmap_simple_xlate(). Maybe
we can export it and do

if (base == TPS6594_GPIO_CONF) {
	*reg = base + offset;
	*mask = GPIO_CFG_MASK;
} else {
	return gpio_regmap_simple_xlate(gpio, base, offset, reg, mask);
}

Apart from that
Reviewed-by: Michael Walle <michael@walle.cc>

-michael
