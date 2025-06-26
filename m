Return-Path: <linux-gpio+bounces-22252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C059DAE9804
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 10:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340EC3B7786
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 08:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7781265CB0;
	Thu, 26 Jun 2025 08:15:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB425D1F1;
	Thu, 26 Jun 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925727; cv=none; b=oyC9fkCpidF4C1omKUbZyhaav0yTHGD1C43o5P1gvUfFbhovNLVLvVF/BCqGtQq9LQZ/RNAgdQ49aZblE6heye5thq0UTKBRwyNNBEVIr+Dk2FxBIZsST+hxhp6Yt2lwqv+FlHS5xcAhzJGL1eKul1nk/Bx2TgHZsBdD4f3M8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925727; c=relaxed/simple;
	bh=PEZYGH+OI3VJSlIhgXQphteONYdoErA4jc7oo1FClP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntr3aOC8/MC6d+bQ3dJY0Y6O89H76n7TkwmybZHCMpKL18VcnBZoCwaTpizp8Ho3U9+3piTadp3L2AGQvCVRBiCiglPvL3vUrOK6SZcYZfdfpZUlemOrje2s5teY2l9P88lkIPdQ8fbwkdIGK/HCRcCe2cQoVIf/LpbTNij9f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5C6011F0004B;
	Thu, 26 Jun 2025 08:15:24 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A5A52AC7F8D; Thu, 26 Jun 2025 08:15:23 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 6F66CAC7F7C;
	Thu, 26 Jun 2025 08:09:42 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 5/5] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
Date: Thu, 26 Jun 2025 10:09:23 +0200
Message-ID: <20250626080923.632789-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Liontron H-A133L board features an Ethernet controller with a
JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.

Note that the reset pin must be handled as a bus-wide reset GPIO in
order to let the MDIO core properly reset it before trying to read
its identification registers. There's no other device on the MDIO bus.

The datasheet of the PHY mentions that the reset signal must be held
for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
be on the safe side without wasting too much time during boot.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index fe77178d3e33..04dd7f781894 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -65,6 +65,25 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-handle = <&rmii_phy>;
+	phy-mode = "rmii";
+	status = "okay";
+};
+
+&mdio {
+	reset-gpios = <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
+	reset-delay-us = <2000>;
+	reset-post-delay-us = <2000>;
+
+	rmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdc1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
-- 
2.49.0


