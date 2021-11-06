Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F18446EF6
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Nov 2021 17:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbhKFQey (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Nov 2021 12:34:54 -0400
Received: from gloria.sntech.de ([185.11.138.130]:35294 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231658AbhKFQey (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 6 Nov 2021 12:34:54 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mjObq-0008E6-R1; Sat, 06 Nov 2021 17:32:02 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 03/19] pinctrl/rockchip: Drop wrong kernel doc annotation
Date:   Sat, 06 Nov 2021 17:32:01 +0100
Message-ID: <1844978.gOY4SzdxhB@diego>
In-Reply-To: <20211105124242.27288-3-andriy.shevchenko@linux.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com> <20211105124242.27288-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Freitag, 5. November 2021, 13:42:26 CET schrieb Andy Shevchenko:
> Kernel doc validator is not happy:
> 
>   .../pinctrl-rockchip.c:45: warning: This comment starts with '/**', but isn't a kernel-doc comment.
> 
> Drop it as it's indeed not a kernel doc comment.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 5ce260f152ce..6031d98d9849 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -39,7 +39,7 @@
>  #include "pinconf.h"
>  #include "pinctrl-rockchip.h"
>  
> -/**
> +/*
>   * Generate a bitmask for setting a value (v) with a write mask bit in hiword
>   * register 31:16 area.
>   */
> 




