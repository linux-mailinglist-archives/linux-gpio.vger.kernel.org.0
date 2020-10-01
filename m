Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A0627FA4F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 09:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbgJAHcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 03:32:05 -0400
Received: from muru.com ([72.249.23.125]:45838 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAHcE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Oct 2020 03:32:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 008778057;
        Thu,  1 Oct 2020 07:32:05 +0000 (UTC)
Date:   Thu, 1 Oct 2020 10:31:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: single: fix pinctrl_spec.args_count bounds
 check
Message-ID: <20201001073159.GT9471@atomide.com>
References: <20200930174839.1308344-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930174839.1308344-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200930 17:51]:
> The property #pinctrl-cells can either be 1 or 2:
> 
> - if #pinctrl-cells = <1>, then pinctrl_spec.args_count = 2
> - if #pinctrl-cells = <2>, then pinctrl_spec.args_count = 3
> 
> All other values of pinctrl_spec.args_count are incorrect.  This fix
> checks the upper bound instead of just the lower bound.
> 
> Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> - correct the description as I had previously been mistakenly using the
>   term #pinctrl-cells instead of pinctrl_spec.args_count

Acked-by: Tony Lindgren <tony@atomide.com>

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
