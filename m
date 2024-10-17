Return-Path: <linux-gpio+bounces-11478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8709A168B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C69328519B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC22F9E8;
	Thu, 17 Oct 2024 00:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="afJqaLF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EAE10F2;
	Thu, 17 Oct 2024 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729123720; cv=none; b=EuMkWNWmqLo92042vlEx6pcRuqF4TbzbIa7BE1RdHEEBYgf+9cRYpCjX/t0DGTbYhhEtDEy46GnnQwU1pHpWgG7IrO/+J74p237wf5bQTo68NmCovAEoAoZV4X/PkgXe+8hfCD1oe/z1ItI/rwrsiMJSIyCAy+YwEas1YiL+OWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729123720; c=relaxed/simple;
	bh=AkaZZpyxa0ar4Vh8CM0JAX18j1X7QxXby32EFvezGJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kv7xzQyE6lvT3ZeROTKFND/Y6ayTTYQZtWcmVML0zZ5tSTUcQMtKEeB1b2pSOfk3btOSNhYKOep9zCcV6P1YIjI1S2s24xiozEmwthQ1d+WhUcdfXa0U9flqJrEwHJPu7lWep9z0Wmv5j2464HJ5m8gAXMG5c3UdmEpXVQ9IV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=afJqaLF6; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3684A88E31;
	Thu, 17 Oct 2024 02:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729123714;
	bh=vYSV0oHCDdhgWssZFIc2QwSWGapswZUxpsMug66FG0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=afJqaLF6wDv/enX5p61uwaUtXq2y6ce52k74CWJnLwqpglPc9+8Dt2ghnq05i7aYQ
	 I+c4DDz7la04MLLrydPjr5HMbnJaPZQLwTjvaIbBnF6LWzF2MIybXjwX7E9nEPZ/5Z
	 nhnUTI1Jz4OgnN6CMhqXOXdJTU2zCBVoSahHF40dhcXYkTewGe+kMfD8JzURQ/6L3I
	 oV8LkBYaNXjyb5IbcojsbRoM0Xx0nSaobhpW2+fgP/5BBStip4D4cz+0gMLwT1Sl/K
	 J+HJFCTrkvMxyQ6IhKgRH8b1jvIDytkstKn8/FswnuitagimS+9GE/5ifSfNTUqeny
	 x8AYu4lUJ9EpQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 09/12] ARM: dts: imx6qp: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 02:06:55 +0200
Message-ID: <20241017000801.149276-9-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017000801.149276-1-marex@denx.de>
References: <20241017000801.149276-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Bindings expect pin configuration nodes in pinctrl to match certain
naming and not be part of another fake node:

pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Drop the wrapping node and adjust the names to have "grp" prefix.
Diff looks big but this should have no functional impact, use e.g.
git show -w to view the diff.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
---
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts   |  2 +-
 .../arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts | 40 ++++++-------
 arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dts  | 58 +++++++++----------
 3 files changed, 48 insertions(+), 52 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
index ae00d538a4dfc..fbe260c9872e3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
@@ -548,7 +548,7 @@ MX6QDL_PAD_SD3_RST__SD3_RESET			0x1b0b1
 		>;
 	};
 
-	pinctrl_wifi_npd: wifinpd {
+	pinctrl_wifi_npd: wifinpdgrp {
 		fsl,pins = <
 			/* WL_REG_ON */
 			MX6QDL_PAD_NANDF_RB0__GPIO6_IO10		0x13069
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index 2bb3bfb18ec3e..c5b220aeaefd6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -22,27 +22,25 @@ max7322: gpio@68 {
 };
 
 &iomuxc {
-	imx6qdl-sabreauto {
-		pinctrl_enet: enetgrp {
-			fsl,pins = <
-				MX6QDL_PAD_KEY_COL1__ENET_MDIO          0x1b0b0
-				MX6QDL_PAD_KEY_COL2__ENET_MDC           0x1b0b0
-				MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0x1b018
-				MX6QDL_PAD_RGMII_TD0__RGMII_TD0         0x1b018
-				MX6QDL_PAD_RGMII_TD1__RGMII_TD1         0x1b018
-				MX6QDL_PAD_RGMII_TD2__RGMII_TD2         0x1b018
-				MX6QDL_PAD_RGMII_TD3__RGMII_TD3         0x1b018
-				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL   0x1b018
-				MX6QDL_PAD_RGMII_RXC__RGMII_RXC         0x1b018
-				MX6QDL_PAD_RGMII_RD0__RGMII_RD0         0x1b018
-				MX6QDL_PAD_RGMII_RD1__RGMII_RD1         0x1b018
-				MX6QDL_PAD_RGMII_RD2__RGMII_RD2         0x1b018
-				MX6QDL_PAD_RGMII_RD3__RGMII_RD3         0x1b018
-				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL   0x1b018
-				MX6QDL_PAD_GPIO_16__ENET_REF_CLK        0x4001b0a8
-				MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
-			>;
-		};
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__ENET_MDIO          0x1b0b0
+			MX6QDL_PAD_KEY_COL2__ENET_MDC           0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0x1b018
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0         0x1b018
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1         0x1b018
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2         0x1b018
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3         0x1b018
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL   0x1b018
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC         0x1b018
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0         0x1b018
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1         0x1b018
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2         0x1b018
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3         0x1b018
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL   0x1b018
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK        0x4001b0a8
+			MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dts
index f69eec18d8657..792697bd45512 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dts
@@ -17,36 +17,34 @@ &reg_arm {
 };
 
 &iomuxc {
-	imx6qdl-sabresd {
-		pinctrl_usdhc2: usdhc2grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
-				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10071
-				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
-				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
-				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
-				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
-				MX6QDL_PAD_NANDF_D4__SD2_DATA4		0x17059
-				MX6QDL_PAD_NANDF_D5__SD2_DATA5		0x17059
-				MX6QDL_PAD_NANDF_D6__SD2_DATA6		0x17059
-				MX6QDL_PAD_NANDF_D7__SD2_DATA7		0x17059
-			>;
-		};
-
-		pinctrl_usdhc3: usdhc3grp {
-			fsl,pins = <
-				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
-				MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10071
-				MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
-				MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
-				MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
-				MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
-				MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
-				MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
-				MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
-				MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
-			>;
-		};
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17059
+			MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10071
+			MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17059
+			MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17059
+			MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17059
+			MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17059
+			MX6QDL_PAD_NANDF_D4__SD2_DATA4		0x17059
+			MX6QDL_PAD_NANDF_D5__SD2_DATA5		0x17059
+			MX6QDL_PAD_NANDF_D6__SD2_DATA6		0x17059
+			MX6QDL_PAD_NANDF_D7__SD2_DATA7		0x17059
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x10071
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x17059
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x17059
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x17059
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x17059
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4		0x17059
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5		0x17059
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6		0x17059
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7		0x17059
+		>;
 	};
 };
 
-- 
2.45.2


