Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A60601168DB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 10:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfLIJHY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 04:07:24 -0500
Received: from smtp1.axis.com ([195.60.68.17]:34539 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbfLIJHY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 04:07:24 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Dec 2019 04:07:23 EST
IronPort-SDR: PhzTVPKXtmwH+OjOSnfx0Jesg2XhztVzb0fC1r6/c5eqPraBIkHJTDVa+tsY+tGoIJpZ6D0eC/
 De9GETski7OBwhx6uelB25mimfda2nZU1iAEKZQXCZVpnxBaPbUQub++xBlp4lZFoeceexj5Bt
 KpcMltbs3MRmoHCS9L+Nfs3N/256lzDl1svtwaZXndtPSQ88xJWHZwyJLOhCSCXHpyVAlPCnaA
 jR2NR1ec9ZJegRi/5PbocL0aDG/u34+HTsm4WXo2zljHA6BvYCMy2Pk1KnyhCUbRskIN2Bv4Np
 y6U=
X-IronPort-AV: E=Sophos;i="5.69,294,1571695200"; 
   d="scan'208";a="3384606"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Date:   Mon, 9 Dec 2019 10:00:11 +0100
From:   Jesper Nilsson <jesper.nilsson@axis.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Jesper Nilsson <jespern@axis.com>,
        Lars Persson <larper@axis.com>
Subject: Re: [PATCH 4/9] mmc: usdhi6rol0: Convert to
 pinctrl_select_default_state()
Message-ID: <20191209090011.bt6j6rsrjisbhnkg@axis.com>
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
 <20191206170821.29711-5-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206170821.29711-5-ulf.hansson@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 06, 2019 at 06:08:16PM +0100, Ulf Hansson wrote:
> Let's drop the boilerplate code for managing the default pinctrl state and
> convert into using the new pinctrl_select_default_state().

Looks good, thanks!

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Cc: Lars Persson <lars.persson@axis.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/mmc/host/usdhi6rol0.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
> index b11ac2314328..969a34e698f2 100644
> --- a/drivers/mmc/host/usdhi6rol0.c
> +++ b/drivers/mmc/host/usdhi6rol0.c
> @@ -199,7 +199,6 @@ struct usdhi6_host {
>  
>  	/* Pin control */
>  	struct pinctrl *pinctrl;
> -	struct pinctrl_state *pins_default;
>  	struct pinctrl_state *pins_uhs;
>  };
>  
> @@ -1162,8 +1161,7 @@ static int usdhi6_set_pinstates(struct usdhi6_host *host, int voltage)
>  					    host->pins_uhs);
>  
>  	default:
> -		return pinctrl_select_state(host->pinctrl,
> -					    host->pins_default);
> +		return pinctrl_select_default_state(mmc_dev(host->mmc));
>  	}
>  }
>  
> @@ -1770,17 +1768,6 @@ static int usdhi6_probe(struct platform_device *pdev)
>  	}
>  
>  	host->pins_uhs = pinctrl_lookup_state(host->pinctrl, "state_uhs");
> -	if (!IS_ERR(host->pins_uhs)) {
> -		host->pins_default = pinctrl_lookup_state(host->pinctrl,
> -							  PINCTRL_STATE_DEFAULT);
> -
> -		if (IS_ERR(host->pins_default)) {
> -			dev_err(dev,
> -				"UHS pinctrl requires a default pin state.\n");
> -			ret = PTR_ERR(host->pins_default);
> -			goto e_free_mmc;
> -		}
> -	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	host->base = devm_ioremap_resource(dev, res);
> -- 
> 2.17.1
> 

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
