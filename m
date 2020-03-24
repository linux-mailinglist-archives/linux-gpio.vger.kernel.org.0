Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B377190D32
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 13:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgCXMUW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 08:20:22 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:54156 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727161AbgCXMUW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Mar 2020 08:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=pXWFCcdJO8akl4rGuYz9ZIQj1bJiMdcrPKoInwmnqv0=; b=6XdVZySdOeqUJwBUZiP1uu6hSJ
        RNqKrZKoX1H5ErMOy/+4NEuUpXD3WEHZgxinaQR0j0mBwW8WqzyYKSP1FDFYhSmT6ocWBEc7vLvJe
        XOhUsnq1Qbx92j8YMcbi5OH556mcZ2mwtYRZ2q1LgrFhWh3IN5yY14foEMd/m2J6lDkg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jGiXZ-0001TW-SD; Tue, 24 Mar 2020 13:20:17 +0100
Date:   Tue, 24 Mar 2020 13:20:17 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH pinctrl REGRESSION] Revert "pinctrl: mvebu: armada-37xx:
 use use platform api"
Message-ID: <20200324122017.GR3819@lunn.ch>
References: <20200324004413.14355-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324004413.14355-1-marek.behun@nic.cz>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 24, 2020 at 01:44:13AM +0100, Marek Behún wrote:
> This reverts commit 06e26b75f5e613b400116fdb7ff6206a681ab271.
> 
> This commit caused a regression on Armada 37xx. The pinctrl driver says
>   armada-37xx-pinctrl d0013800.pinctrl: invalid or no IRQ
>   armada-37xx-pinctrl d0018800.pinctrl: invalid or no IRQ
> and afterwards other drivers cannot use GPIOs by this driver as IRQs.
> 
> Fixes: 06e26b75f5e6 ("pinctrl: mvebu: armada-37xx: use use platform...")
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 32f12a388b3c..5f125bd6279d 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -15,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_irq.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinctrl.h>
> @@ -741,14 +742,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  		return ret;
>  	}
>  
> -	nr_irq_parent = platform_irq_count(pdev);

Hi Marek

Could you determine the value of nr_irq_parent(). Is it -EPROBE_DEFER?
This patch has removed the handling of that.

> -	if (nr_irq_parent < 0) {
> -		if (nr_irq_parent != -EPROBE_DEFER)
> -			dev_err(dev, "Couldn't determine irq count: %pe\n",
> -				ERR_PTR(nr_irq_parent));
> -		return nr_irq_parent;
> -	}

Thanks
	Andrew
