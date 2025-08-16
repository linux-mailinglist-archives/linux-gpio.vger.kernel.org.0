Return-Path: <linux-gpio+bounces-24456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B85B28A5B
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 05:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31386AE46C4
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 03:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702CD1D9663;
	Sat, 16 Aug 2025 03:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JWY/AcAc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE921D5165;
	Sat, 16 Aug 2025 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755316312; cv=none; b=BdBpOlIf0ELFcKdMKits8zivQYBc3i7LsT1y0dxw412jCwPdB7NpjdISMb88f0wZeKaIkH7vytfQKPHHgFjwcebLwT9pDRiSi/9otmP2VUcfCyomDVUfV+9Om7NrYkdeU39I5Ltx8HXW0RM1IbsMAguvRDF86jSrRtKso0sJYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755316312; c=relaxed/simple;
	bh=z+QX49317csTrXfz8J0F5bFGxPypVOXL9Q3FPo0GCeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STxWgIsMbHDzA/Ri3BaVJ3JHawRCVyPouldimFcDfutbUtwOmL+ooYtqs3dE0e9+BC6ljU7y+KopO5xv5Vm+GPo4lZHQz6jS07VB6TJUp+e/11DqIyLo0G1sQbPTCgwKA0hfNAzDO4O2fP3jzNFMeR8xU6SgN0f1gx4M3V1S+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JWY/AcAc; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 75C8F2524A;
	Sat, 16 Aug 2025 05:51:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD3xxEUm5ASV; Sat, 16 Aug 2025 05:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755316308; bh=z+QX49317csTrXfz8J0F5bFGxPypVOXL9Q3FPo0GCeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JWY/AcAckCYAnfE6oaPnq2Nn1tY8NQcnpT8D5TumG+izIpatoCDM+Zf6pm58Y2jD5
	 aGKhnvxwqWf3URliNtHT+QtJCiBoDH0LzLWN7/n4XWFepHmLdY0KaDIlkRPs3puaGC
	 BTgUUH7atOgzu8DzgMPuZu6TlZ8NiJfIAE8XDISTeFvvuaAojl6wahHzMoKB2/mktW
	 rRIA0jvB0gCoW75m6hIlqOo4EVmXbWr8/+nyaWaBxksftrWuazcb018TE3L6i/rS4l
	 o+XqQ+74AcchhoytVdfatTxOAzqWjzCGi1+kSeLSiyWoeuY1ftVGR/YFAU78bM7hGw
	 RuohBFHXTcbMw==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/3] LoongArch: dts: Add GPIO controller for Loongson 2K0300
Date: Sat, 16 Aug 2025 03:50:28 +0000
Message-ID: <20250816035027.11727-5-ziyao@disroot.org>
In-Reply-To: <20250816035027.11727-2-ziyao@disroot.org>
References: <20250816035027.11727-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe Loongson 2K0300's GPIO controller in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
index 835d3c63537b..60a055b05c44 100644
--- a/arch/loongarch/boot/dts/loongson-2k0300.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -240,6 +240,26 @@ uart9: serial@16102400 {
 			status = "disabled";
 		};
 
+		gpio: gpio@16104000 {
+			compatible = "loongson,ls2k0300-gpio";
+			reg = <0x0 0x16104000 0x0 0x4000>;
+			interrupt-parent = <&liointc1>;
+			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>,
+				     <22 IRQ_TYPE_LEVEL_HIGH>,
+				     <23 IRQ_TYPE_LEVEL_HIGH>,
+				     <24 IRQ_TYPE_LEVEL_HIGH>,
+				     <25 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>;
+			ngpios = <106>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 106>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			resets = <&rst RST_GPIO>;
+		};
+
 		isa@16400000 {
 			compatible = "isa";
 			#address-cells = <2>;
-- 
2.50.1


