Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E8443362C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 14:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhJSMpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 08:45:02 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:35343 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJSMpC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 08:45:02 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id DA185C0C68;
        Tue, 19 Oct 2021 12:42:47 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 167E9FF812;
        Tue, 19 Oct 2021 12:42:24 +0000 (UTC)
Date:   Tue, 19 Oct 2021 14:43:15 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza1: Fix kerneldoc function names
Message-ID: <20211019124315.5dg5pfaas2qmm7lx@uno.localdomain>
References: <2188ede78110c64b8a3bfbfa794a085dac0e4cd2.1634645735.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2188ede78110c64b8a3bfbfa794a085dac0e4cd2.1634645735.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Tue, Oct 19, 2021 at 02:34:22PM +0200, Geert Uytterhoeven wrote:
> make W=1:
>
>     drivers/pinctrl/renesas/pinctrl-rza1.c:770: warning: expecting prototype for rza1_gpio_disable_free(). Prototype was for rza1_gpio_free() instead
>     drivers/pinctrl/renesas/pinctrl-rza1.c:889: warning: expecting prototype for rza1_parse_pmx_function(). Prototype was for rza1_parse_pinmux_node() instead
>
> Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, looking at the driver now it seems I was really eager to write
comments at the time I wrote it! :)

Probably all kernel-doc comments should be demoted to regular
comments, as they're only internal driver functions.

But for now, the change is good

> ---
> To be queued in renesas-pinctrl for v5.17.
>
>  drivers/pinctrl/renesas/pinctrl-rza1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
> index 10020fe302b8a09f..3ad0537febe4f6b4 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> @@ -757,7 +757,7 @@ static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
>  }
>
>  /**
> - * rza1_gpio_disable_free() - reset a pin
> + * rza1_gpio_free() - reset a pin
>   *
>   * Surprisingly, disable_free a gpio, is equivalent to request it.

s/disable_free/free ?

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>   * Reset pin to port mode, with input buffer disabled. This overwrites all
> @@ -875,7 +875,7 @@ static int rza1_dt_node_pin_count(struct device_node *np)
>  }
>
>  /**
> - * rza1_parse_pmx_function() - parse a pin mux sub-node
> + * rza1_parse_pinmux_node() - parse a pin mux sub-node
>   *
>   * @rza1_pctl: RZ/A1 pin controller device
>   * @np: of pmx sub-node
> --
> 2.25.1
>
