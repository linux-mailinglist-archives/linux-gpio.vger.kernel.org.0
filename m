Return-Path: <linux-gpio+bounces-7257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2A90035F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 14:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB391F24C1C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 12:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313711922D3;
	Fri,  7 Jun 2024 12:24:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC318F2E8;
	Fri,  7 Jun 2024 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763045; cv=none; b=szk5FUiUfCrW2In+fX2aTHQQp/RYD3IgKVLDbPuHbgksCtqF/V7a0GpP96RLrvhskutcAZekBF2f5amGBBBqq+Lx/2xzmquLDW9RtoBc4v/pX7yu5+WuMpWnS/qJfBy5gWY3N78QpVzKCWxBV6syJZiJCQH5NN2t9wNMyJ7Uf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763045; c=relaxed/simple;
	bh=dajpKZz4Hj46LCnthaetZN7F81O2tDQTMjdjJVZjR1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYshXE6hbe4J1tC8HXPWMo0I9QdvXWcLcgQI6bSYEFFEXKgNKZO+R3wsO3umTIX8YzK4XDtQ7imaPiw6k7mvHQeo9/IyIQB3+kCRzHcO/J85rqlHCzTBOMZrmz/MFzAJBd6hNuiJD/qV7linYem0HjgAd/mlNHeBCZhN/8odPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [213.70.33.226] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFYdN-0002pU-Uq; Fri, 07 Jun 2024 14:23:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject:
 Re: [PATCH v2 1/4] pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
Date: Fri, 07 Jun 2024 14:23:52 +0200
Message-ID: <8510397.lOV4Wx5bFT@phil>
In-Reply-To: <20240606125755.53778-2-i@eh5.me>
References:
 <20240606125755.53778-1-i@eh5.me> <20240606125755.53778-2-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 6. Juni 2024, 14:57:52 CEST schrieb Huang-Huang Bao:
> The pinmux bits for GPIO2-B0 to GPIO2-B6 actually have 2 bits width,
> correct the bank flag for GPIO2-B. The pinmux bits for GPIO2-B7 is
> recalculated so it remain unchanged.
> 
> The pinmux bits for those pins are not explicitly specified in RK3328
> TRM, however we can get hint from pad name and its correspinding IOMUX
> setting for pins in interface descriptions. The correspinding IOMIX
> settings for GPIO2-B0 to GPIO2-B6 can be found in the same row next to
> occurrences of following pad names in RK3328 TRM.
> 
> GPIO2-B0: IO_SPIclkm0_GPIO2B0vccio5
> GPIO2-B1: IO_SPItxdm0_GPIO2B1vccio5
> GPIO2-B2: IO_SPIrxdm0_GPIO2B2vccio5
> GPIO2-B3: IO_SPIcsn0m0_GPIO2B3vccio5
> GPIO2-B4: IO_SPIcsn1m0_FLASHvol_sel_GPIO2B4vccio5
> GPIO2-B5: IO_ I2C2sda_TSADCshut_GPIO2B5vccio5
> GPIO2-B6: IO_ I2C2scl_GPIO2B6vccio5
> 
> This fix has been tested on NanoPi R2S for fixing confliting pinmux bits
> between GPIO2-B7 with GPIO2-B5.
> 
> Signed-off-by: Huang-Huang Bao <i@eh5.me>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Fixes: 3818e4a7678e ("pinctrl: rockchip: Add rk3328 pinctrl support")

The TRM also supports those findings, as gpio2-b4 actually is documented
there as 2-bit wide with the functions you found in the pad descriptions.



