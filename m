Return-Path: <linux-gpio+bounces-6404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A75218C6A97
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 18:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7531F23DE2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 16:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A0EF9F0;
	Wed, 15 May 2024 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DFxOs1kP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E677156672;
	Wed, 15 May 2024 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715790604; cv=none; b=ll+1CUdkeytG4UUC8WCai+gROys5S9Aspt8C0v24pWwL3TRADpgUL6wRqibigHirC8TI+H9K8S8zTfyoniyHug/AtCMYmyOLWovHESH6uNMM1CogzbhtSdtR8QKljr0Yc85OgkcD821hft/40NkuKiWP1069LzOiLQua75aJcnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715790604; c=relaxed/simple;
	bh=2Fw7EGP5gnCtdsTqAi3dBdIyvt19JoaAOnStGWcs9Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgPJJlEXfu4sUm2ZtrL5m6LXHKzB+wWBIWFfS1WvlScIQmlcnjZusgURNVXWM8R/MOEsBWjHN5tnVaKLKZ6cXz5B5ACbnqLaqDrHvRTSAx7e5YoDb7SGvorYI0Tr+NZ8/vMVjog6BwnG1fWQyAuxbWWNc5qIspgonyDaVl54M4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DFxOs1kP; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AA38C0006;
	Wed, 15 May 2024 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715790599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOto8pkdzNcDGrx6zGWKATW1hZHmdFwBb/iquxmXsu0=;
	b=DFxOs1kPZXEjrYT7zrVpLQ8+MV1VFCFSNxIl7VbSNEjAdCF2bHaUQccNGAG08mRZB8TUlu
	fgeVCNxsSiEgcqiLOERDy+DW8CbrnsyHUBmMYcEW+b+h8JpvUjrbu41sHJ22snoQu8i0ol
	UasyrI+PHdEmJaMIJVuKVP2lQaa83sn/SfvFslms8zpaJhWH/NELKvdT/jpk2z4LH4regT
	8TXZP1I4w3LUEUtoHE0ScTUwknULloPO+KCRoTRf24QmeX+MiNvDceG/ZfLzQXUnon2+0z
	FiYpY1Fhj1FSeQRJz8aXlHQDdOovu3fTpxXGZi/3ZDzckkFzwtidhYmo0MBCWw==
Date: Wed, 15 May 2024 18:29:54 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jianqun Xu
 <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add rk3308b SoC support
Message-ID: <20240515182954.03c4a475@booty>
In-Reply-To: <20240515121634.23945-4-dmt.yashin@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
	<20240515121634.23945-4-dmt.yashin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Dmitry,

On Wed, 15 May 2024 17:16:34 +0500
Dmitry Yashin <dmt.yashin@gmail.com> wrote:

> Add pinctrl support for rk3308b. This pin controller much the same as
> rk3308's, but with additional iomux routes and 3bit iomuxes selected
> via gpio##_sel_src_ctrl registers. Set them up in the function
> rk3308b_soc_sel_src_init to use new 3bit iomuxes over some 2bit old ones.
> 
> Fixes: 1f3e25a06883 ("pinctrl: rockchip: fix RK3308 pinmux bits")
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>

Thanks for the effort! I have one high-level remark, see below.
Otherwise at a superficial look it looks good.

> @@ -3952,6 +4150,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  		.data = &rk3288_pin_ctrl },
>  	{ .compatible = "rockchip,rk3308-pinctrl",
>  		.data = &rk3308_pin_ctrl },
> +	{ .compatible = "rockchip,rk3308b-pinctrl",
> +		.data = &rk3308b_pin_ctrl },

I'm skeptical about this being bound to a new DT compatible. As far as I
know the RK3308 and RK3308B are mostly equivalent, so it looks as the
pinctrl implementation could be detected at runtime. This would let
products to be built with either chip version and work on any without
any DT change.

Code for reading the chip ID is in the RK3308 codec driver [0].

[0] https://lore.kernel.org/all/20240305-rk3308-audio-codec-v4-4-312acdbe628f@bootlin.com/ -> search "GRF_CHIP_ID"

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

