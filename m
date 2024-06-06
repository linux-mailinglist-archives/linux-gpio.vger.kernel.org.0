Return-Path: <linux-gpio+bounces-7231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD978FE36A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 11:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEFA31F243CC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 09:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D3617DE0B;
	Thu,  6 Jun 2024 09:51:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AD917DE1C;
	Thu,  6 Jun 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667469; cv=none; b=jF9DUcPpG4P6n9Xj3inwUIPtl8rxZvBYJuS/8kyyiX9AcPkeupM1VL8xEY+3RADCRF2oNH93M8AQ0hQdMH5aioD5xN4t1Gzh4+ik1hTfg9wWixNixHL6EWFu/lanly9wNobEex12/E6ehYknKbcRFwO3OQuWHpEovzDdROwRZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667469; c=relaxed/simple;
	bh=lQCVjCQl8DTqF87eiCriB0r+cf5cnwi6Z8BJtQTuc5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+H5AQcgwCQ7sRk21/AfwGolqqezGrUcquoP8r9JggMYRjWJdoP3qjjjwnlnnCYD74pps8TK/i4HxIuM1OeJm4QgFNIxXumpGlg2XdbXmD9cxkP79orR/VZzegF+JueuMhjRGG3X0eX1hIIRonHDVWlGmi58uFNcvJb37w0HuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sF9lw-0007hw-5J; Thu, 06 Jun 2024 11:51:04 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject:
 Re: [PATCH 3/3] pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
Date: Thu, 06 Jun 2024 11:51:03 +0200
Message-ID: <2308120.IFkqi6BYcA@diego>
In-Reply-To: <20240606060435.765716-4-i@mail.eh5.me>
References:
 <20240606060435.765716-1-i@eh5.me> <20240606060435.765716-4-i@mail.eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 6. Juni 2024, 08:04:35 CEST schrieb Huang-Huang Bao:
> rockchip_pmx_set reset all pinmuxs in group to 0 in the case of error,
> add missing bank data retrieval in that code to avoid setting mux on
> unexpected pins.
> 
> Fixes: 14797189b35e ("pinctrl: rockchip: add return value to rockchip_set_mux")
> Signed-off-by: Huang-Huang Bao <i@eh5.me>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 24ee88863ce3..3f56991f5b89 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -2751,8 +2751,10 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
>  
>  	if (ret) {
>  		/* revert the already done pin settings */
> -		for (cnt--; cnt >= 0; cnt--)
> +		for (cnt--; cnt >= 0; cnt--) {
> +			bank = pin_to_bank(info, pins[cnt]);
>  			rockchip_set_mux(bank, pins[cnt] - bank->pin_base, 0);
> +		}
>  
>  		return ret;
>  	}
> 

Oh, nice find - and wow that original code is actually 10 years old :-)
For context, original mistake is in the error handling (probably the case
it never turned up)

The first loop counts upwards doing pinmuxing and in the error case,
wants to reset everything back to the "standard" gpio muxing.
The first loop correctly retrieves the bank for each group, but the
error handling will always operate on that last retrieved bank:

 	for (cnt = 0; cnt < info->groups[group].npins; cnt++) {
 		bank = pin_to_bank(info, pins[cnt]);
		ret = rockchip_set_mux(bank, pins[cnt] - bank->pin_base,
				       data[cnt].func);
		if (ret)
			break;
	}

	if (ret) {
		/* revert the already done pin settings */
		for (cnt--; cnt >= 0; cnt--)
			rockchip_set_mux(bank, pins[cnt] - bank->pin_base, 0);

		return ret;
 	}

So, TL;DR:

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



