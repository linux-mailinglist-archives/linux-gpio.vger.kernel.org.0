Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0AB447E20
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 11:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238567AbhKHKke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 05:40:34 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:39989 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238365AbhKHKke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 05:40:34 -0500
Received: (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 084A024000C;
        Mon,  8 Nov 2021 10:37:46 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 08/19] pinctrl: armada-37xx: Fix function name in the
 kernel doc
In-Reply-To: <20211105124242.27288-8-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-8-andriy.shevchenko@linux.intel.com>
Date:   Mon, 08 Nov 2021 11:37:46 +0100
Message-ID: <877ddjszk5.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Kernel doc validator is not happy:
>
>   .../pinctrl-armada-37xx.c:926: warning: expecting prototype for armada_37xx_fill_funcs(). Prototype was for armada_37xx_fill_func() instead
>
> Fix this by updating function name in the kernel doc.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 5cb018f98800..5615cb7a1209 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -913,7 +913,7 @@ static int armada_37xx_fill_group(struct armada_37xx_pinctrl *info)
>  }
>  
>  /**
> - * armada_37xx_fill_funcs() - complete the funcs array
> + * armada_37xx_fill_func() - complete the funcs array
>   * @info: info driver instance
>   *
>   * Based on the data available from the armada_37xx_pin_group array
> -- 
> 2.33.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
