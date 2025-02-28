Return-Path: <linux-gpio+bounces-16761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0804A491B1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDBB16FDA3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 06:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AA31CAA82;
	Fri, 28 Feb 2025 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="OYUVt1RH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049041C5F10
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724860; cv=none; b=Vrb+SuMHGBy6VR40ATnscTPxXxIspu5LBGuyE/xEsteHZsnSky2m/4arhwGFvDKTGprlV7PNVJZu3tAbwk9TQ4XtELc7yoHlj8Buo2GW5Lp8XgUdZDYx73ckrA1MKKJBtd/XaZTXYgp6WodE75swdiAVhgBO4NmvPuVXqnDkJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724860; c=relaxed/simple;
	bh=8d9rZ2QO/Uvztx38z0+iKqqJdDKz03Ntmf6k1c6ANRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrgOahdQj8FjRlngibS3o0Hwmg1AlbdZfA7s9hkS4uh10gUz6IQToyAZB/shIfRY4h3kZWfJ8m5YpSQabZaVoc/5Qk6PLkAtzV/1KVespk1bLgUzVGrXxGOmAbsN8M8dTaRjq0jf1T4HjTBow2pMANyjV1sSG95RPMHXPoUkFK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=OYUVt1RH; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724858; bh=VqJ9ZmHuoztS9YRcb8WNF6K+ELpVTBpxmuX4DHyQ0+A=;
 b=OYUVt1RHyHDTgC31OMt9p1E066owuR0Pq1yLMbQST6cmeG1txBG+U17TZA/UPO6QkS7LjTV6t
 QQE/7wnLH8OYO2dApiMvFNWpwUi63wugxJE24W/XSXDNS4FRo7HBpkfmLACIzPPIOWLJgg9e8uS
 fkXzDet2FqvuBiZmRM7hkHZ/sy3ryWuDIA/HEMYA5rE+VsYu+JAOMw0rKkNFqG74tsLwK9XCgsW
 uwEofBZXq7P5DXzgAKkF6H/ujyxU0NIwnw6NKvR6BLtH2wqukJ5IhHc2S101AtggjLkuoDpheXc
 gMhDasICVU6Tz0eeq3byHp5V7bxjH+2XnPH63zYIaV8Q==
X-Forward-Email-ID: 67c15a76bcf1d1bd23db0205
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
Date: Fri, 28 Feb 2025 06:40:11 +0000
Message-ID: <20250228064024.3200000-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Radxa E20C route UART0 M0 pins (GPIO4_C7 and GPIO4_D0) to the onboard
CH340B for debug console use.

Add pinctrl for UART0 M0 pins used for serial console.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index dcc0b2584bbc..b9a66c6a1dfb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -68,5 +68,7 @@ &saradc {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
-- 
2.48.1


