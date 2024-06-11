Return-Path: <linux-gpio+bounces-7359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8378903A5E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A124B20DF6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694A517DE38;
	Tue, 11 Jun 2024 11:33:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D86517C238;
	Tue, 11 Jun 2024 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105610; cv=none; b=R+fxDwS0gUGa4QLf9CP+VmotcScfJFn5Ix9PUWzjFxPwGjvqW933sAIxOk6U5DREYvfUeJdLxGiRhgapWioYrLf6lNJo/tUXGaeWD9GW0Ont6KYqYJ/PVx6PxU2EGL0MX3sFbVoJufdBTh5+/L4mHtqZ9bO8kJHdJDRkj3evUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105610; c=relaxed/simple;
	bh=rNLwxnX2uzIbPvclexQueU9358TEaM3Ctz22bta13/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BS1nzzKzA8S+O0LqAtt0/WUbSmXGagmwCSNI1s1rJ8gF9i9emj9JHuDFq/mzxytSo2EPeIExx6irzV762fRzOermgb2uyGdPUI1QYHHRWHiLW6xLN10qziL/Llsr25h1x76iodFVKG5i1/Qc4bDGxJkqMpl4QaRKgtwa4CcULD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="211449692"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2024 20:33:27 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.82])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 17D574008C4F;
	Tue, 11 Jun 2024 20:33:22 +0900 (JST)
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
Subject: [PATCH v2 8/9] arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
Date: Tue, 11 Jun 2024 12:32:02 +0100
Message-Id: <20240611113204.3004-9-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
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
---
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


