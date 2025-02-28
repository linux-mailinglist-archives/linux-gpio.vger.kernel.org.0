Return-Path: <linux-gpio+bounces-16768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E1A49285
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1B41887E5E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD2B1CAA74;
	Fri, 28 Feb 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EGnzNvCv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173A2CCC0;
	Fri, 28 Feb 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729392; cv=none; b=LoVwVDSJ8KyFBBltDJfpUQPo84ivFfH/nPLEtosKy/dYl4gYEkBl1FTxS7KGuR62dSNcoiQFLvXT5PerQ1b8b6EKRJPpOo2Nt7GZbSyg1P962EPAg8g6cpqH6lNsnyooONFDEOm7ArzV34rkRImCuRXEylkkovkxsK0rM4YOdQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729392; c=relaxed/simple;
	bh=dp8kyVgPnNcisMcXuoynAscduH2k4wDF9Y9YpVkH7Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSSCZ5mveoAMzCP53MVHg6OSwIfe4M3r5UAxgTz4iP0KKEIXRuI/jPlkyZoZ6FPjIDv0EfQjJQFCzNMFsjC4yBtUJpO6mavvB/9i9CyheSVB/PzPV4N8XL0DxKJDETVw4F3w8UH2QR6FXkHEr1LI+i4tQSZA17e17l43/fS9igo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EGnzNvCv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K2DxYtrFEQMjTZ9KR1ITVyVPbljGfrE2mQwTdKzGoro=; b=EGnzNvCvw4UH/TphnAmDwE9mzE
	rYAtRafiSW6oVrs59LUi471G87bZdrYb4cW/v2MDVDGBmMagF380jsXKhdZUwfQaAknECv02r333n
	Ok8sfAoNnboHLQL4BaBXXOb9bLfVVaSuUOoxS4Lc1DtFL5KZDLghJ4xbodw/u4NLvOMBojnjW3/e+
	r8HWDgfd7m6ijH/DPcFbJEd0UG278d7YMtTrVMJ7UouqnWurT9R1/tdku4vK1LRoYfAb0+YlvoLtN
	zuS7ayWojRliSu6AVwKncoQriZfMWxD+RYMtl9pvznFk9LJHyq/9ptYDLmkP52DcKD5TGynYAApmI
	+LGSylVw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnvEO-0007ax-AG; Fri, 28 Feb 2025 08:56:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Steven Liu <steven.liu@rock-chips.com>
Subject: Re: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
Date: Fri, 28 Feb 2025 08:56:23 +0100
Message-ID: <5140210.a9HWlOh95j@diego>
In-Reply-To: <20250228064024.3200000-4-jonas@kwiboo.se>
References:
 <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-4-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Freitag, 28. Februar 2025, 07:40:09 MEZ schrieb Jonas Karlman:
> From: Steven Liu <steven.liu@rock-chips.com>
> 
> Add gpio and pinctrl support for the 5 GPIO banks on RK3528.
> 
> Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Thankfully the iomux settings follow pretty stanard ways on the rk3528,
so all looks good

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




