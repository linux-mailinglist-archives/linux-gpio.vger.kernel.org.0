Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E7C4391F8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 11:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbhJYJKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 05:10:04 -0400
Received: from marcansoft.com ([212.63.210.85]:40302 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232222AbhJYJKD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Oct 2021 05:10:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 097C741EA7;
        Mon, 25 Oct 2021 09:07:37 +0000 (UTC)
To:     Joey Gouly <joey.gouly@arm.com>, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
 <20211024101838.43107-5-joey.gouly@arm.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v4 4/5] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <7092f3f8-c9ae-4cde-2d1d-f5fd19ad2626@marcan.st>
Date:   Mon, 25 Oct 2021 18:07:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024101838.43107-5-joey.gouly@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/10/2021 19.18, Joey Gouly wrote:
> This driver adds support for the pinctrl / GPIO hardware found
> on some Apple SoCs.
> 
> Co-developed-by: Stan Skowronek <stan@corellium.com>
> Signed-off-by: Stan Skowronek <stan@corellium.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> ---
[snip]

> +/* GPIO chip functions */
> +
> +static int apple_gpio_gpio_get_direction(struct gpio_chip *chip,
> +					 unsigned int offset)

Nit: do we really need to gpio_gpio all the things? I think maz already 
mentioned this one.

> +	for (i = 0; i < npins; i++) {
> +		res = pinctrl_generic_add_group(pctl->pctldev, pins[i].name,
> +						pin_nums + i, 1, pctl);
> +		if (res < 0)
> +			return dev_err_probe(pctl->dev, res,
> +					     "Failed to register group");
> +	}
> +
> +	res = pinmux_generic_add_function(pctl->pctldev, "gpio", pin_names,
> +					  npins, pctl);
> +	if (res < 0)
> +		return dev_err_probe(pctl->dev, res,
> +				     "Failed to register function.");
> +
> +	res = pinmux_generic_add_function(pctl->pctldev, "periph", pin_names,
> +					  npins, pctl);

Since we have up to 3 peripheral functions I guess this should be done 
thrice, as "periph0" - "periph2" (or maybe 1-3 if you prefer the 
1-indexed version, as it matches the selector).

AFAICT this doesn't have DT impact though, so it's not a big deal since 
right now I don't think we use any functions > 1.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
