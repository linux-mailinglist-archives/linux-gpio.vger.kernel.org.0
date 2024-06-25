Return-Path: <linux-gpio+bounces-7690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E3917240
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 22:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229B01F279CA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 20:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A9A17F509;
	Tue, 25 Jun 2024 20:04:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D974C17E445;
	Tue, 25 Jun 2024 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345852; cv=none; b=sTDrFC4unUcU/k4/0M1bEWYqO735gDT1sDqeEFoVu50XCaG04ySIgIDbLFTifECScywgBh+dGR7yZ9fZ6Tb+mOEtSrewM6zn/rGu4RdCnzlPMgx3vubz2UP72LjGDjg1k2K6aSG/g1qZ8HU91h/stY9ia1gB784FhSXDsFohZq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345852; c=relaxed/simple;
	bh=+fkc24+0B8xzt1iEyPKkVNZoIEHtBh0VYdQq0tm9i2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n3OZKyX4kGQn0UEoaNsED3C4UtIPgNLwaxJrP5xN31g70kxB2PKyw24TNA0f3iYEhjqCDBoqlqxfBfX0H5tND+nx+Apl8taOJyd+Kd2Ljsu+JMMnRguioqx6oNz9YVZqurqKljz0qStlTwlL9PVW5IVA28Re87o8ro1bD2EEv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,264,1712588400"; 
   d="scan'208";a="209263996"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2024 05:04:09 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.125])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6C29540078B4;
	Wed, 26 Jun 2024 05:04:05 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
Date: Tue, 25 Jun 2024 21:03:15 +0100
Message-Id: <20240625200316.4282-9-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the RZ/G2LC SMARC SOM, the RGMII interface between the SoC and the
Ethernet PHY operates at 1.8V.

The power supply for this interface may be correctly configured in
u-boot, but the kernel should not be relying on this. Now that the
RZ/G2L pinctrl driver supports configuring the Ethernet power supply
voltage, we can simply specify the desired voltage in the device tree.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes v2->v3:
  * Picked up Linus W's Acked-by tag.
Changes v1->v2:
  * Picked up Geert's Reviewed-by tag.

 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 664311fd2098..b4ef5ea8a9e3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -130,6 +130,7 @@ &pinctrl {
 	eth0_pins: eth0 {
 		txc {
 			pinmux = <RZG2L_PORT_PINMUX(20, 0, 1)>; /* ET0_TXC */
+			power-source = <1800>;
 			output-enable;
 		};
 
@@ -147,8 +148,12 @@ mux {
 				 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
 				 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
 				 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
-				 <RZG2L_PORT_PINMUX(26, 1, 1)>, /* ET0_RXD3 */
-				 <RZG2L_PORT_PINMUX(0, 0, 1)>;  /* IRQ0 */
+				 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+			power-source = <1800>;
+		};
+
+		irq {
+			pinmux = <RZG2L_PORT_PINMUX(0, 0, 1)>;  /* IRQ0 */
 		};
 	};
 
-- 
2.39.2


