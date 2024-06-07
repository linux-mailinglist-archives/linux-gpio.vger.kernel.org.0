Return-Path: <linux-gpio+bounces-7258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64A9003AA
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 14:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70EF528A365
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F5B190671;
	Fri,  7 Jun 2024 12:32:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA115748C;
	Fri,  7 Jun 2024 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763554; cv=none; b=uXElYorFM9Eixmqn0YMIQrqFGByuR+C+xqT3ICtl+us2LL6JKtUvXuHY5Mh+EiY0WVlW1J37v81qXWTVwCp7m0g2zPZ1uvRA9JArLmfBx6JZ4aBe4dCuQiLMPA9S8bave0w7fephXBnKKCS2eaiwQptfs72gCMvmxYmPc68VWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763554; c=relaxed/simple;
	bh=fDJy+Jwnw3LyhLHgSM3+xzzik78ArJtMK97aZ3fIwuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9BGpNV0lotuEzPfMGdNLuPVyrsb2J2g37lL8A7kYRKWGZWI8d7px7j6J6oK0gQlkOiAp5Cz+0FY23Apl4iwdUXC8B2g9qBgVfGaxGwbdOdcmmu4gloH4OiKbeOmYbxcHGSokPnLcqoMy6WBSfRiAEFmflwCICdYjiEA6ZE4OEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [213.70.33.226] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFYlc-0002sh-3l; Fri, 07 Jun 2024 14:32:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>,
 kever.yang@rock-chips.com
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject:
 Re: [PATCH v2 2/4] pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
Date: Fri, 07 Jun 2024 14:32:22 +0200
Message-ID: <4786379.ElGaqSPkdT@phil>
In-Reply-To: <20240606125755.53778-3-i@eh5.me>
References:
 <20240606125755.53778-1-i@eh5.me> <20240606125755.53778-3-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 6. Juni 2024, 14:57:53 CEST schrieb Huang-Huang Bao:
> The pinmux bits for GPIO3-B1 to GPIO3-B6 pins are not explicitly
> specified in RK3328 TRM, however we can get hint from pad name and its
> correspinding IOMUX setting for pins in interface descriptions. The
> correspinding IOMIX settings for these pins can be found in the same
> row next to occurrences of following pad names in RK3328 TRM.
> 
> GPIO3-B1:  IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6
> GPIO3-B2: IO_TSPd6m0_CIFdata6m0_GPIO3B2vccio6
> GPIO3-B3: IO_TSPd7m0_CIFdata7m0_GPIO3B3vccio6
> GPIO3-B4: IO_CARDclkm0_GPIO3B4vccio6
> GPIO3-B5: IO_CARDrstm0_GPIO3B5vccio6
> GPIO3-B6: IO_CARDdetm0_GPIO3B6vccio6
> 
> Add pinmux data to rk3328_mux_recalced_data as mux register offset for
> these pins does not follow rockchip convention.
> 
> Signed-off-by: Huang-Huang Bao <i@eh5.me>

This matches the information that I found in my TRM, thanks to your
detailed explanation.

Though I of course can't say if the TRM is just wrong or the hardware
changed after the pads-description was written.

Did you test the usage of these pins on your board?


Heiko



> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 78dcf4daccde..23531ea0d088 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -634,17 +634,68 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
>  
>  static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
>  	{
> +		/* gpio2_b7_sel */
>  		.num = 2,
>  		.pin = 15,
>  		.reg = 0x28,
>  		.bit = 0,
>  		.mask = 0x7
>  	}, {
> +		/* gpio2_c7_sel */
>  		.num = 2,
>  		.pin = 23,
>  		.reg = 0x30,
>  		.bit = 14,
>  		.mask = 0x3
> +	}, {
> +		/* gpio3_b1_sel */
> +		.num = 3,
> +		.pin = 9,
> +		.reg = 0x44,
> +		.bit = 2,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b2_sel */
> +		.num = 3,
> +		.pin = 10,
> +		.reg = 0x44,
> +		.bit = 4,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b3_sel */
> +		.num = 3,
> +		.pin = 11,
> +		.reg = 0x44,
> +		.bit = 6,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b4_sel */
> +		.num = 3,
> +		.pin = 12,
> +		.reg = 0x44,
> +		.bit = 8,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b5_sel */
> +		.num = 3,
> +		.pin = 13,
> +		.reg = 0x44,
> +		.bit = 10,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b6_sel */
> +		.num = 3,
> +		.pin = 14,
> +		.reg = 0x44,
> +		.bit = 12,
> +		.mask = 0x3
> +	}, {
> +		/* gpio3_b7_sel */
> +		.num = 3,
> +		.pin = 15,
> +		.reg = 0x44,
> +		.bit = 14,
> +		.mask = 0x3
>  	},
>  };
>  
> 





