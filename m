Return-Path: <linux-gpio+bounces-17076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B4A4EBE2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 19:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDB157AC329
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 18:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F00F24EA9B;
	Tue,  4 Mar 2025 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NnwGEh6A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092A1F4193;
	Tue,  4 Mar 2025 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112853; cv=none; b=HMO5czdrA4IHPAQ6cmFbr65WSvJTYWPcfQKguzoIadDBXhoJ5n5J/3eh0hGAK92xN+Y8ocu7OA1egsYT+r/jIEDWlwISUVsnuQPZ77gxoH51Ss45RQvD61KcCZWYZnHmhrOy5M5lIS+JgV6ubirJ18ucslTNBV1j9/MW4P4F/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112853; c=relaxed/simple;
	bh=fw3XFDpuR/okZsbBXVBMT/x7kct6cGuTWm5VfRiNRVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAgbJbT4hAI04/rvSpZEbMhaxL253w3uexrOOQju2zeINs6FofkluztTWy2hdcqcOdqI0sLGvLlPGWQ3P0sNBLOM5zYS6RyJN7yVhuQQVB7UVFlLq/kpaDEggDB/HSrAakEuuswSa3Z5QKgTQS6qaT8UMu1RfpLJiamTW7yUUXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NnwGEh6A; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rx3ABjWk1ldP5FCol6X6uLC9GxswBZMZjKTR2QA7emY=; b=NnwGEh6AY17SgydLVqzuydkcBe
	jteeXwmvTz7HIE32jeBKVj3KCJF8qYd8Izu3NvV6ORUZEGcWgIFUaA13CMp5L4My6GAaS9AH0/dof
	GU99zZRbYbpiSAVjmL79REoXvj4bW50wcp9pVtYs8Upj3tDRuuNrmz0Ab26iwZpw2+FKkUTyuiF2Q
	1HbV4v0wuXy8as4HO56T7BdhU5udPybpBKcjRj8ahSOZSLJpkR7eC8PYoh0F3oi7UoHtoJZblRDuB
	nlkwGP46Iu5mQq8pp/kFEjcG5pWhjCjuV1Q8ADcwsBEL7r6nGzIPz6TvwcrBHirL/7SIXNaTvrq6y
	B0khax1A==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpWz9-0005NR-IB; Tue, 04 Mar 2025 19:27:19 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: (subset) [PATCH 0/7] rockchip: Add support for leds and user button on
 Radxa E20C
Date: Tue, 04 Mar 2025 19:27:18 +0100
Message-ID: <8941439.NyiUUSuA9g@diego>
In-Reply-To: <03c34bdf-d470-4c99-bb06-0eb7496465a3@kwiboo.se>
References:
 <20250228064024.3200000-1-jonas@kwiboo.se>
 <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
 <03c34bdf-d470-4c99-bb06-0eb7496465a3@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 4. M=C3=A4rz 2025, 19:13:10 MEZ schrieb Jonas Karlman:
> Hi Heiko,
>=20
> On 2025-03-04 13:02, Heiko Stuebner wrote:
> >=20
> > On Fri, 28 Feb 2025 06:40:06 +0000, Jonas Karlman wrote:
> >> The Radxa E20C has three gpio leds and one gpio button.
> >>
> >> This series adds dt-binding, driver support, DT node in SoC .dtsi and
> >> gpio-keys and gpio-leds nodes in board DT to support the leds and user
> >> button.
> >>
> >> This series builds on top of the "rockchip: Add support for maskrom
> >> button on Radxa E20C" series [1].
> >>
> >> [...]
> >=20
> > Applied, thanks!
> >=20
> > [1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
> >       commit: ac32ad07a97648eb8330b2c4cb840b0ef46903ae
> > [4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
> >       commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b
> > [5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
> >       commit: 0d2312f0d3e4ce74af0977c1519a07dfc71a82ac
> >=20
> > Patches 6+7 depend on the parallel saradc support series and thus
> > do not apply - and need too much rework to safely apply.
>=20
> Do you want me to rebase/reorder and send an updated version with
> remaining patches? Look like the iio saradc patches [2] is pending apply
> so maybe not needed?

Not sure how long the that test run will be taking ...
and where after -rc5. But in theory things should be fine though.

So essentially up to you - and if you actually have spare minutes.

Heiko





