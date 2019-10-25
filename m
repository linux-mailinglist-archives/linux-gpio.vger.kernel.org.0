Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166C4E4743
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 11:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408495AbfJYJbo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 05:31:44 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38593 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405781AbfJYJbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 05:31:44 -0400
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E7C3160004;
        Fri, 25 Oct 2019 09:31:41 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     YueHaibing <yuehaibing@huawei.com>, jason@lakedaemon.net,
        andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] pinctrl: armada-37xx: remove unneeded semicolon
In-Reply-To: <20191025092233.25108-1-yuehaibing@huawei.com>
References: <20191025092233.25108-1-yuehaibing@huawei.com>
Date:   Fri, 25 Oct 2019 11:31:41 +0200
Message-ID: <87lft9p3wi.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> writes:

> Remove unneeded semicolon.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I am against this patch, I don't see any value of this change. It will
only make backporting future fix more difficult and will obscurate the
git blame.

I could see the interest of scripts/coccinelle/misc/semicolon.cocci
when submitting new code, but not for existing code.

Gregory

> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 9df4277..fd32989 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -733,7 +733,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  			ret = 0;
>  			break;
>  		}
> -	};
> +	}
>  	if (ret) {
>  		dev_err(dev, "no gpio-controller child node\n");
>  		return ret;
> @@ -800,7 +800,7 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
>  			ret = 0;
>  			break;
>  		}
> -	};
> +	}
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.7.4
>
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
