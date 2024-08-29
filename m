Return-Path: <linux-gpio+bounces-9365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE796459D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78536286644
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 12:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1416119309C;
	Thu, 29 Aug 2024 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zwADjAuP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676518C35B;
	Thu, 29 Aug 2024 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936307; cv=none; b=B96uwu/ASG20eBsL0qDM3pqtuIP3vvy1o8VUmEKxXrAMos/O3rHDMe7SyLeiS4CWd7gZkYTkIl0j9jYXpEv88QmP7vxa34uGtcWB0aIO1x8enrEu+5rW0Bb6u+G1+JD92bv8s++obRndEEw1yd8BdoerSfaH9DHnKwPqLs+dimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936307; c=relaxed/simple;
	bh=+PkUDybrY7h/5JAutPmUn6loGA2FCGqTdsMcANWYMlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptU3RRj8L40dkSQyyngy59CHv8rl2ybBfxDyELmFh9P17KEuAxG9PcQEvwW5Ok9QF19AQlL9ejIEXDcQS1kQzwGUMejgeh27GdBuXnFffrNpbCKeecIqPnXIrCkyTpLMyX0CXvRz7MJ4C1lTOdyH1lYqMmLo5sD9Z/4M+HC52xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zwADjAuP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2DMaGcBrCtwhweR0eYxljcor73ra0w4g90JZuCsAVrU=; b=zwADjAuPKsULeSQNlxljgFSZUn
	ft8C0DIQHCrrdse/KJcTUbRLPe7qqo1muAzpgqjwJ0+LKIcmPyTfVnRLoSdj2LsDQpmEah/jrS7S6
	9McE3p9dLIAsu/yIZWxqRZZ+IQKWrdbIcKlfqZOwWWQ/QK4DaoRfSZE240bSyLRAH0Sk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sjejG-0062HZ-GT; Thu, 29 Aug 2024 14:58:22 +0200
Date: Thu, 29 Aug 2024 14:58:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wang Jianzheng <wangjianzheng@vivo.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	opensource.kernel@vivo.com
Subject: Re: [PATCH 3/5] pinctrl: mvebu: Use devm_clk_get_enabled() helpers
Message-ID: <3c446336-c1f6-499c-8fcd-4c49f5be863e@lunn.ch>
References: <20240829064900.19909-1-wangjianzheng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829064900.19909-1-wangjianzheng@vivo.com>

On Thu, Aug 29, 2024 at 02:48:59PM +0800, Wang Jianzheng wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-dove.c | 45 +++++++++-------------------
>  1 file changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
> index dce601d99372..1c2a292ebbd9 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-dove.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
> @@ -767,7 +767,7 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
>  	struct resource fb_res;
>  	struct mvebu_mpp_ctrl_data *mpp_data;
>  	void __iomem *base;
> -	int i, ret;
> +	int i;
>  
>  	pdev->dev.platform_data = (void *)device_get_match_data(&pdev->dev);
>  
> @@ -775,25 +775,20 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
>  	 * General MPP Configuration Register is part of pdma registers.
>  	 * grab clk to make sure it is ticking.
>  	 */
> -	clk = devm_clk_get(&pdev->dev, NULL);
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "Unable to get pdma clock");
>  		return PTR_ERR(clk);
>  	}
> -	clk_prepare_enable(clk);
>  
>  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mpp_res);
> -	if (IS_ERR(base)) {
> -		ret = PTR_ERR(base);
> -		goto err_probe;
> -	}
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);

It appears that in patch 3 you add all these goto err_probe, and now
you delete them?

Please reverse the order of these two patches!

    Andrew

---
pw-bot: cr

