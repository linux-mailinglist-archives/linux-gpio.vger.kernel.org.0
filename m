Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 628BE1A31E6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 11:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgDIJiG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 05:38:06 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:42198 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgDIJiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2020 05:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RGFwgNOxy2c5vC5HpDYOZgBADwWmZdC/mr6ZrB/I1+o=; b=vWxBeDjoSh9OhHIils63Rrjju
        X/UBHlDShAXNcg2MZNhY2NIIxfBNU+JSAlmkVRvUgQTBlghcFNPpiUHZowfdnxdTq/fb/Gxa7Jvrj
        e1vCU5nLZN0NfaVhjPldRoZYQtw2ngYAd7Lu8YqTLNyziLFO/NDGA27gn3k1O5gkRSYjpcxRk9b6d
        yCA6MyIqCWhIXGJubHG302XX8XoW9PQpkhvI06Af6M5D/f9NwvXvPOmvp+/vX/NlrfNQVYrev9aSU
        dV3Qb/227TVaUkKHkKyOxPUZMgLbaPl04sL9OuxGSqtBG+Vy83yj7vHALT3TTgPgDk6j2DWgKIrFN
        O+3l+XINw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47690)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jMTdC-00035R-OS; Thu, 09 Apr 2020 10:37:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jMTdA-0002hb-Ax; Thu, 09 Apr 2020 10:37:52 +0100
Date:   Thu, 9 Apr 2020 10:37:52 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpc8xxx: Add shutdown function.
Message-ID: <20200409093752.GV25745@shell.armlinux.org.uk>
References: <20200409090259.13126-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409090259.13126-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:02:59PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> When the kexec command is executed, the memory area will be re-paginated.
> The shutdown function needed to make interrupt handler to be NULL.If
> not, an interrupt will be generated during this period. When the interrupt
> handler is executed,the handler function address changed and crash will
> occur.

I still don't think this is adequate.

When kexec takes effect, the existing kernel is shutdown and replaced
with the new kernel, and it completely takes over the system.  The
dynamically allocated structures (which include pointers for the parent
interrupt for mpc8xxx) are irrelevant, as they will need to be
reallocated.  It feels like you're just putting a band-aid over a real
problem.

I think rather than producing a patch, you need to give details of the
crash you are seeing.  Probably having the kernel message log across
the kexec and into the new kernel up to the point where the crash occurs
would be a good idea.

> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 604dfec..a24e6c5 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -446,9 +446,21 @@ static int mpc8xxx_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int mpc8xxx_shutdown(struct platform_device *pdev)
> +{
> +	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
> +
> +	if (mpc8xxx_gc->irq) {
> +		irq_set_chained_handler_and_data(mpc8xxx_gc->irqn, NULL, NULL);
> +		irq_domain_remove(mpc8xxx_gc->irq);
> +	}
> +
> +	return 0;
> +}
>  static struct platform_driver mpc8xxx_plat_driver = {
>  	.probe		= mpc8xxx_probe,
>  	.remove		= mpc8xxx_remove,
> +	.shutdown	= mpc8xxx_shutdown,
>  	.driver		= {
>  		.name = "gpio-mpc8xxx",
>  		.of_match_table	= mpc8xxx_gpio_ids,
> -- 
> 2.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
