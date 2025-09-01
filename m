Return-Path: <linux-gpio+bounces-25329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D0B3E57C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 15:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 300461A84CA3
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0112D3376BC;
	Mon,  1 Sep 2025 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CkquwShr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA823375B2;
	Mon,  1 Sep 2025 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733975; cv=none; b=frr9xuqL6yVx52Uw3O1eeSwwRu792v0aOayKLeFN0asxuanVV19iR2+s4jJXGu79Ki6Jtpy8cCPw4wd+OWJXym7454wU1CEaCZzt4D004Cr8xTtU7Y4Hu3ZIj9YprOEi8ccQY3Rkn5xwo3LGkM+oVhBFb40trVBWak1FR6VWv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733975; c=relaxed/simple;
	bh=z+QX49317csTrXfz8J0F5bFGxPypVOXL9Q3FPo0GCeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHJNtWum1Ev7rEjWyzmC2n8wOvtTf3GI6ctDAylBN8cOggL6vG6NnQLXUCQ0te1mk8BDud3VBd3QvfvcQU0s6WB1eGcacj/NWBUKRtVbBy92/wXakyQmXVuSEfJH8RgTwu4H8qCn2jSkMw7xnCae9xszX3UFPrYvEkpCdZEQBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CkquwShr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CC0A125A84;
	Mon,  1 Sep 2025 15:39:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjDEYYP8-OSB; Mon,  1 Sep 2025 15:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756733972; bh=z+QX49317csTrXfz8J0F5bFGxPypVOXL9Q3FPo0GCeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CkquwShr5zEwu49uYpWOfglTQHSyIV4nbnC74DI55f4Yl1iVqnqTmXIT6+dM24KKn
	 NSPAaKORj4I2Lt0b3ZgS8a7yjWjkL/s/uJlD9GxDvaI1pXo/IURxb+Qhh3Hz69xvCM
	 ETWjMEh7asSKef0e+fQtBHNzRxgdC7mO5Wq+rBUcUp0BKVLNNCTZ09HeqJib58EX0+
	 oyNOVSfq4uQuJMIy7RsJJJiROA3kl/AzvZB5VvMIGY+WaIwB3b2c8eCAmCu1FHdrx/
	 lD223hz1YpSOPj6uWka95qriPNAWgvs4A2GEVtBJID0hf1/C8+he+CewZJvIz/oiMO
	 48dVSiK2N+n0Q==
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
Subject: [PATCH v2 3/3] LoongArch: dts: Add GPIO controller for Loongson 2K0300
Date: Mon,  1 Sep 2025 13:38:04 +0000
Message-ID: <20250901133804.38433-4-ziyao@disroot.org>
In-Reply-To: <20250901133804.38433-1-ziyao@disroot.org>
References: <20250901133804.38433-1-ziyao@disroot.org>
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


