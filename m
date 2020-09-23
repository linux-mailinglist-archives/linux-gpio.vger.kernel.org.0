Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CCD2751EE
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 08:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgIWGy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 02:54:27 -0400
Received: from muru.com ([72.249.23.125]:45114 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgIWGy0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 02:54:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D420080A0;
        Wed, 23 Sep 2020 06:54:26 +0000 (UTC)
Date:   Wed, 23 Sep 2020 09:55:20 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Subject: Re: [PATCH v2] pinctrl: single: fix debug output when #pinctrl-cells
 = 2
Message-ID: <20200923065520.GP7101@atomide.com>
References: <20200913230306.2061645-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913230306.2061645-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200913 23:04]:
> The debug output in pcs_parse_one_pinctrl_entry() needs to be updated
> to print the correct pinctrl register value when #pinctrl-cells is 2.
> 
> Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> this is a fix to my prior email where I referred to #pinctrl-cells = 3
> which is incorrect.  pinctrl_spec.args_count is 3 but #pinctrl-cells = 2
> https://lore.kernel.org/linux-omap/20200913224746.2048603-1-drew@beagleboard.org/

Acked-by: Tony Lindgren <tony@atomide.com>

>  drivers/pinctrl/pinctrl-single.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 5cbf0e55087c..f3cd7e296712 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1033,7 +1033,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>  		}
>  
>  		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
> -			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
> +			pinctrl_spec.np, offset, vals[found].val);
>  
>  		pin = pcs_get_pin_by_offset(pcs, offset);
>  		if (pin < 0) {
> -- 
> 2.25.1
> 
