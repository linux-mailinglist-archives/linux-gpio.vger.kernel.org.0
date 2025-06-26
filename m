Return-Path: <linux-gpio+bounces-22249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D9FAE97C0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 10:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C7F27B37B8
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 08:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7590D25C838;
	Thu, 26 Jun 2025 08:12:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EB525C70D;
	Thu, 26 Jun 2025 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925561; cv=none; b=KrGgTLKlx2ynKB7qfbt0VBsOpqDtVy7ClXK+W+bdjUhf7WNbftdhKLCLVuq4wTmt2rVgyw6d2R36btvF3fjQnP7Lw0MECAo87fByGyYaxpToVXqQfF9Z/pXGUTa+7WvebNIdQ3Y9X40mmUt0nA2KTIY602vgFO2kNG6HSzXnifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925561; c=relaxed/simple;
	bh=VFiodgVBU+frCM31/xTGFTIbf1DYWZz32/4rKCb6CNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4Fz3EacIBFKTxTyiz1rdnYAjDhepsw5ZRf73q6Lm3TcbwOE6hEoy6JySeSeGG62mHwVMgrYFMzUIjToVS/ssAvZA223IBtjUtldgum2xZdi6WogpFeAl9HU3XJr5wkEk05VNA/a5GDdCeTsaZeE4rIfcGJhFBpXIVG7I1tNNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C37B21F0004B;
	Thu, 26 Jun 2025 08:12:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2B22DAC7F8A; Thu, 26 Jun 2025 08:12:37 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 89D1EAC7F7A;
	Thu, 26 Jun 2025 08:09:40 +0000 (UTC)
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
Subject: [PATCH 2/5] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
Date: Thu, 26 Jun 2025 10:09:20 +0200
Message-ID: <20250626080923.632789-3-paulk@sys-base.io>
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

The Allwinner A100/A133 supports both RGMII and RMII for its Ethernet
MAC (EMAC) controller. Add corresponding pin definitions.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index bd366389b238..1c4e71b32911 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii_pins: rgmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
+			rmii_pins: rmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				function = "uart0";
-- 
2.49.0


