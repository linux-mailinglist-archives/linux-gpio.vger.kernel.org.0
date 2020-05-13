Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FF31D136F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733141AbgEMM4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:36 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:6871 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732989AbgEMM4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374593; x=1620910593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XzyAjS+VdICD+VDbBl+tF57k++B6rYPYjva3OeaJ/X8=;
  b=muJMCVLBG01L3Gkgt5yYVoHUxYX8DuTMCbc3r+l/Q1Wmn5BEwRpks4ON
   PVlYaH8QRNblx8VNSTvoknEEN/do5+Kn3bthzmVX9AwxCGpP5e1fDKVI+
   9coRCf1gcKSkOmhP+6oN4qUtffyXCiKv5+Rvxtpn36AO+gmS/KqvglWUy
   PnJXgJ1qmUr91Y+p4RSzq97Gt9bzzjkkFIhrZqGSCuP8m5BcfZJAz7rSh
   w2u0Zgct0liLFN2Wm3S5o376WxBnl1Pk7VhXiPRvvdO0c6NIYgxpkEELH
   Uc/thI3LG0HIwuOys0Qprohn4X841g8BISPXEoGOPu0P52o1Y7LK+jSp+
   Q==;
IronPort-SDR: JwLwlM1erNzBBGrUO3T1+ZqDwN8fhRVhDgIwzSxlGBJtM46S/CKnrYo4HkoV/lOh6UzB2CqgAu
 a4xgKEkrsGAhVgDYrbv6HCfdIGBxKv/tUn0OKhb8cHQj0bUWBWnDwRI0DyO/bs3Lu8HCffr4Re
 I2ZgrNSvM5UF2ub5WOoWyPliNeAYMKom1MVzcuFN3zeJBWDssIa3fvY6Vc4AICcjOfNxlWtaNY
 KsKGX3TX+AxoU54N/faoOMEmT6yWR08YKHYD521JoOMg+VJ+m6vCeVKeNMTNXVDb3j7PkR/9ZS
 3tc=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="75132778"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:33 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:30 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 04/14] arm64: sparx5: Add support for Microchip 2xA53 SoC
Date:   Wed, 13 May 2020 14:55:22 +0200
Message-ID: <20200513125532.24585-5-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds support for the Microchip Sparx5 ARMv8-based SoC family of
TSN-capable gigabit switches.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                  |  8 ++++++++
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 091ec22c1a23f..1b5a18d3dbb9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2079,6 +2079,14 @@ X:	drivers/net/wireless/atmel/
 N:	at91
 N:	atmel

+ARM/Microchip Sparx5 SoC support
+M:	Lars Povlsen <lars.povlsen@microchip.com>
+M:	Steen Hegelund <Steen.Hegelund@microchip.com>
+M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+N:	sparx5
+S:	Supported
+
 ARM/MIOA701 MACHINE SUPPORT
 M:	Robert Jarzmik <robert.jarzmik@free.fr>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 55d70cfe0f9e1..e1734a13a967b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -89,6 +89,20 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.

+config ARCH_SPARX5
+	bool "ARMv8 based Microchip Sparx5 SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip Sparx5 ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The SparX-5 Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
--
2.26.2
