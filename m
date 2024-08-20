Return-Path: <linux-gpio+bounces-8881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B77958EDA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 21:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358D0B21EC8
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 19:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795CD15C13E;
	Tue, 20 Aug 2024 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pYSmpacu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1B1547D1;
	Tue, 20 Aug 2024 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183630; cv=none; b=CI5IDId+t2uPQGROv13zozOY4npYij9MxRAHLHsFiclSCplpV0ZV4jKvOd1WFz7r4AXUgTVNSyPgLK2r7i1BjexTjJrSbqhH8x+MCsMKkGuSiMOcPVSI1UVH7N1DAR+iYHFQMUqczkluHQel1je+QGUZ5Tywnrv7kr50/0b46mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183630; c=relaxed/simple;
	bh=DR2GJN7s3OoXebWgjtePJ6xiOH9yRIZ/F7+6AiRug2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QKlIaYhFyg2dPnbHYmt55ddsyPKILF5eYkTe59Is4MJqFMI6cig5Syh2c8J8TaHk7TKxpqZBUvcraB9v5NwLNvT8wg5EBSw5wBlV6sq6ExyNAg/uVedyZf9a5FLh4e+Owl37VEz5xoJCfqyhbtYazoTQxycyAjXy14GTjvnGrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pYSmpacu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BVZoZvXjYkyYcVetsS+NsA6dchCrMli+gEckw36uz5k=; b=pYSmpacuNcBLDgxvE9kbjJw6H9
	Hmn/kWIdsbrtWZRMyyM1EaKN+ITOzjK6AzYD96mTuohFp1pDdoxeSYAWezaDn9aiXjAJezehsVXWe
	Drr99YgqxHRhe2WyWUGlH4LNoiWJlm07xXeP2xfEczb3u2mUsCoK8559IZkHRe0R6EulOT0RgWleA
	loPsRGG59j/JcHbHus8QNA+AHrnjDpkhyhdYVCZoLxzabWwYmA9YPcjh005YG0ry6+bJoBfvvqkKA
	imHBdkhLsh/+5tVfFBGHIW7Um5y6bxcLuIUO5SkIkDMU6hoVv4aMLBTcM2eQMVsMYo1gaLpNodGXi
	jaPu8FHg==;
Received: from i53875aca.versanet.de ([83.135.90.202] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sgUvD-0001So-3G; Tue, 20 Aug 2024 21:53:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: Richard Kojedzinszky <richard@kojedz.in>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huang-Huang Bao <i@eh5.me>,
 stable@vger.kernel.org
Subject:
 Re: [PATCH] pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B
 pins
Date: Tue, 20 Aug 2024 21:54:05 +0200
Message-ID: <2241778.ZfL8zNpBrT@diego>
In-Reply-To: <20240709105428.1176375-1-i@eh5.me>
References: <20240709105428.1176375-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Linus,

Am Dienstag, 9. Juli 2024, 12:54:28 CEST schrieb Huang-Huang Bao:
> The base iomux offsets for each GPIO pin line are accumulatively
> calculated based off iomux width flag in rockchip_pinctrl_get_soc_data.
> If the iomux width flag is one of IOMUX_WIDTH_4BIT, IOMUX_WIDTH_3BIT or
> IOMUX_WIDTH_2BIT, the base offset for next pin line would increase by 8
> bytes, otherwise it would increase by 4 bytes.

could you pick this patch that fixes a pinctrl problem on rk3328?

The change is good and I added my reviewed-by on july 29th.


Thanks a lot
Heiko


> Despite most of GPIO2-B iomux have 2-bit data width, which can be fit
> into 4 bytes space with write mask, it actually take 8 bytes width for
> whole GPIO2-B line.
> 
> Commit e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328
> GPIO2-B pins") wrongly set iomux width flag to 0, causing all base
> iomux offset for line after GPIO2-B to be calculated wrong. Fix the
> iomux width flag to IOMUX_WIDTH_2BIT so the offset after GPIO2-B is
> correctly increased by 8, matching the actual width of GPIO2-B iomux.
> 
> Fixes: e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins")
> Cc: stable@vger.kernel.org
> Reported-by: Richard Kojedzinszky <richard@kojedz.in>
> Closes: https://lore.kernel.org/linux-rockchip/4f29b743202397d60edfb3c725537415@kojedz.in/
> Tested-by: Richard Kojedzinszky <richard@kojedz.in>
> Signed-off-by: Huang-Huang Bao <i@eh5.me>
> ---
> 
> I have double checked the iomux offsets in debug message match iomux
> register definitions in "GRF Register Description" section in RK3328
> TRM[1].
> 
> [1]: https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
> 
> Kernel pinctrl debug message with dyndbg="file pinctrl-rockchip.c +p":
>   rockchip-pinctrl pinctrl: bank 0, iomux 0 has iom_offset 0x0 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 0, iomux 1 has iom_offset 0x4 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 0, iomux 2 has iom_offset 0x8 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 0, iomux 3 has iom_offset 0xc drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 0 has iom_offset 0x10 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 1 has iom_offset 0x14 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 2 has iom_offset 0x18 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 3 has iom_offset 0x1c drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 0 has iom_offset 0x20 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 1 has iom_offset 0x24 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 2 has iom_offset 0x2c drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 3 has iom_offset 0x34 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 0 has iom_offset 0x38 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 1 has iom_offset 0x40 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 2 has iom_offset 0x48 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 3 has iom_offset 0x4c drv_offset 0x0
> 
> The "Closes" links to test report from original reporter with original
> issue contained, which was not delivered to any mailing list thus not
> available on the web.
> 
> Added CC stable as the problematic e8448a6c817c fixed by this patch was
> recently merged to stable kernels.
> 
> Sorry for the inconvenience caused,
> Huang-Huang
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 3f56991f5b89..f6da91941fbd 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3813,7 +3813,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
>  	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
>  	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
>  	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
> -			     0,
> +			     IOMUX_WIDTH_2BIT,
>  			     IOMUX_WIDTH_3BIT,
>  			     0),
>  	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
> 
> base-commit: 4376e966ecb78c520b0faf239d118ecfab42a119
> --
> 2.45.2
> 





