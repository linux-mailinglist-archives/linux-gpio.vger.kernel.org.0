Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141862751F4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 08:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgIWGyq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 02:54:46 -0400
Received: from muru.com ([72.249.23.125]:45128 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgIWGyp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 02:54:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B770980A0;
        Wed, 23 Sep 2020 06:54:45 +0000 (UTC)
Date:   Wed, 23 Sep 2020 09:55:39 +0300
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
Subject: Re: [PATCH v2] pinctrl: single: check pinctrl_spec.args_count > 3
Message-ID: <20200923065539.GQ7101@atomide.com>
References: <20200913231557.2063071-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913231557.2063071-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200913 23:18]:
> pinctrl_spec.args_count can either be 2 when #pinctrl-cells = 1 or
> 3 when #pinctrl-cells = 2.
> 
> There is currently only a check to make sure that it is 2 or greater.
> This patch adds a check to make sure it is not greater than 3.
> 
> Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> - this is a fix to my prior email where I referred to #pinctrl-cells
>   exceeding 3 which is incorrect.  It is pinctrl_spec.args_count which
>   must be greater than 2 (when #pinctrl-cells = 1) and less than 3 (when
>   #pinctrl-cells = 2)

Acked-by: Tony Lindgren <tony@atomide.com>

> https://lore.kernel.org/linux-omap/20200913210825.2022552-1-drew@beagleboard.org/
> 
> 
>  drivers/pinctrl/pinctrl-single.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index efe41abc5d47..5cbf0e55087c 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1014,7 +1014,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
>  		if (res)
>  			return res;
>  
> -		if (pinctrl_spec.args_count < 2) {
> +		if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
>  			dev_err(pcs->dev, "invalid args_count for spec: %i\n",
>  				pinctrl_spec.args_count);
>  			break;
> -- 
> 2.25.1
> 
