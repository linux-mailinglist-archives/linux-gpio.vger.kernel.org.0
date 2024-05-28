Return-Path: <linux-gpio+bounces-6726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0283A8D1A3E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 13:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1D2B282D53
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 11:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D2016D313;
	Tue, 28 May 2024 11:51:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957EC16C698;
	Tue, 28 May 2024 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897064; cv=none; b=ZXVKwC3PDlJ8vA8eEx3pNZl0Koq5e+fNKyRW9xOaRMTWt4d7ahN0xbKpnIGP+enFFDnZV75zoSlIPATio9scNCL/npsZ0uMn21tS6pA4AGy4IC+L2c9Xv2WWRr25zNW8coWMwbBPgnV0BfGCkExUyHolZQ+3o7M5aAq+A3NJLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897064; c=relaxed/simple;
	bh=yehhiHIToAVv3gt1y4tVCU3+l1dEF5DFy/gq9nyFbfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=th0Z2/V0I0seOb4/VcbOMK9AmkbvcOPTxyH9nGs2nRxXzccbe0whCzvXZSSoewmSel3EPoGFMGZADdOKBgkM7nWuUqeoHYrm8RcP5wFnNZEmevevKhhZcKk0UXLuiLGH7XxF9b0sZteIE+KOI6EdGshv/XQjS5YbRGjsTy4tN34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86193d.versanet.de ([94.134.25.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sBvLv-0003En-4k; Tue, 28 May 2024 13:50:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
Date: Tue, 28 May 2024 13:50:50 +0200
Message-ID: <6026727.alqRGMn8q6@diego>
In-Reply-To: <20240515121634.23945-2-dmt.yashin@gmail.com>
References:
 <20240515121634.23945-1-dmt.yashin@gmail.com>
 <20240515121634.23945-2-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 15. Mai 2024, 14:16:32 CEST schrieb Dmitry Yashin:
> Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
> the rk3308b SoC. Remove them and correct i2c3 routes.
> 
> Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 3bedf36a0019..cc647db76927 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -870,9 +870,8 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
>  	RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
>  	RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
>  	RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
> -	RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x608, BIT(16 + 8) | BIT(16 + 9)), /* i2c3_sdam0 */
> -	RK_MUXROUTE_SAME(3, RK_PB4, 2, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(8)), /* i2c3_sdam1 */
> -	RK_MUXROUTE_SAME(2, RK_PA0, 3, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(9)), /* i2c3_sdam2 */
> +	RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x314, BIT(16 + 4)), /* i2c3_sdam0 */
> +	RK_MUXROUTE_SAME(3, RK_PB4, 2, 0x314, BIT(16 + 4) | BIT(4)), /* i2c3_sdam1 */

checked against TRM and no devicetree in the kernel currently enables i2c3 at all.

>  	RK_MUXROUTE_SAME(1, RK_PA3, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclktxm0 */
>  	RK_MUXROUTE_SAME(1, RK_PA4, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclkrxm0 */
>  	RK_MUXROUTE_SAME(1, RK_PB5, 2, 0x308, BIT(16 + 3) | BIT(3)), /* i2s-8ch-1-sclktxm1 */
> @@ -881,18 +880,6 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
>  	RK_MUXROUTE_SAME(1, RK_PB6, 4, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* pdm-clkm1 */
>  	RK_MUXROUTE_SAME(2, RK_PA6, 2, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* pdm-clkm2 */
>  	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
> -	RK_MUXROUTE_SAME(3, RK_PB2, 3, 0x314, BIT(16 + 9)), /* spi1_miso */
> -	RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x314, BIT(16 + 9) | BIT(9)), /* spi1_miso_m1 */
> -	RK_MUXROUTE_SAME(0, RK_PB3, 3, 0x314, BIT(16 + 10) | BIT(16 + 11)), /* owire_m0 */
> -	RK_MUXROUTE_SAME(1, RK_PC6, 7, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* owire_m1 */
> -	RK_MUXROUTE_SAME(2, RK_PA2, 5, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* owire_m2 */
> -	RK_MUXROUTE_SAME(0, RK_PB3, 2, 0x314, BIT(16 + 12) | BIT(16 + 13)), /* can_rxd_m0 */
> -	RK_MUXROUTE_SAME(1, RK_PC6, 5, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* can_rxd_m1 */
> -	RK_MUXROUTE_SAME(2, RK_PA2, 4, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* can_rxd_m2 */

> -	RK_MUXROUTE_SAME(1, RK_PC4, 3, 0x314, BIT(16 + 14)), /* mac_rxd0_m0 */
> -	RK_MUXROUTE_SAME(4, RK_PA2, 2, 0x314, BIT(16 + 14) | BIT(14)), /* mac_rxd0_m1 */

> -	RK_MUXROUTE_SAME(3, RK_PB4, 4, 0x314, BIT(16 + 15)), /* uart3_rx */
> -	RK_MUXROUTE_SAME(0, RK_PC1, 3, 0x314, BIT(16 + 15) | BIT(15)), /* uart3_rx_m1 */

checked against the TRM too.
And as far as usage:
- spi1: not used at all
- owire: not used at all
- can: not used at all
- mac_rxd0: all boards use the (default) m0 variant
- uart3: not currently enabled anywhere


And I guess the rk3308 is niche enough that people either use the vendor-kernel
or have the dts in mainline, so we should have a ok grasp on not causing breakage
by some accidental rk3308b somewhere.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




