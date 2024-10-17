Return-Path: <linux-gpio+bounces-11577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B49A2F5F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F53E2831CB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41B5229115;
	Thu, 17 Oct 2024 21:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="X5wFA6If"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E81EE036;
	Thu, 17 Oct 2024 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199600; cv=none; b=Dv311/2qLKArb7hGYodKxu54eVufmfARgc/hdklRTKD5ir+YEer6kuJnR10oCEuEJR1lp67gUtkSWoSaIdZoqpKjdS+B5HhBf/xvYipPrvXD+LrXfY7cvFjI4tYmiQzZQIe3+7AeBPmkmi5diebfrwCCWIeIGmLFmeOh4MNTR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199600; c=relaxed/simple;
	bh=Oy/e7JWNkhcRqj6yNG/yuGqiTQvBXIoSv0gybuEmWis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNzzgWmJOKCZ/do1D4N8g5PeBzkJ5vxtPtD/6G9opY3HNcO+/gHj/ktGalMhmTukO91GHuUsa98rysfYrFrCPxm5BpIQgeF+P2mSjPJXGoSVVHqUj7o7sHHTvPwgkf7f/TlA5zkBS3qA3XnkMNUMAuD+rmV3CsCxv//giL/bZTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=X5wFA6If; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7EBDD890B4;
	Thu, 17 Oct 2024 23:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199593;
	bh=mGBHN+cWLuGSpX3Py00iReQ0dSlLZeKQUPTbulzDnD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X5wFA6IfJasjjsJhC+txBqMAw1huYlnkwIaKWqFDBb+ZfBdGFmwnKw5DmrGFIpxKh
	 jTu2Iy6MLw2At3B+l37Emo1ql4wxTJw/ycr437Nqd2ZVBHKwmwSFC+5K3uFPr9Hfxc
	 0Kl9S9jIkIicvTHqBO1lxkHO5BBM2rRINYXNkZyqaVoeU4JLocIx2AxsSmuBP+98k3
	 JNokzz/J2f2pkZxCpuCNEYV6Sygfd7GHGoIBcp8yPO0NRdX4BNVVkl+RQ6ZAzR3mN2
	 Njjy2veNZUUn2RhYpJvk/kCCqjM/SLnibtqJDxtFtGW1VxwUlQ8FlRgxzJg560YEUd
	 8VUHRSH1hUs6g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 09/12] ARM: dts: imx6qp: Align pin config nodes with bindings
Date: Thu, 17 Oct 2024 23:11:26 +0200
Message-ID: <20241017211241.170861-9-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
References: <20241017211241.170861-1-marex@denx.de>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
V2: New patch
V3: No change
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


