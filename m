Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5697622E7FF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgG0Imd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:42:33 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:48534 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0Imb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595839351; x=1627375351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5wjLdEVL0+5wkcGZWXGlwE+jpjsqmabT9Jw33q+g7no=;
  b=zJmf4w1mXUuYhzRFsyDwqzAhtLj8tIAmnf5tX/v/2YkflrUHncp2Mxgi
   5MivU++Z3EGH3OMozrTPPJ7qJn7RrK7RoEHij5CWSpfOptDtyKvcDepep
   Ww6AUqJ8GSScNas231yVCE+UX1rzX8D7qoGAfOdMMwypcXkglo+vFIVtO
   lfjMLcFznVdu3FgGiEWKq456d5aYRwobMR71Y5H3t0j/x8yZ+2mEp8RWB
   CH3SlZfUBXuGVzL12sNFEUnluLfXQ8TMha4fv3Vy72R3cN0P5zF5LTCXs
   5F6ZFkL6Bp+TtQm4q2H7zHJ2NmYvsEu4oZQxCt4Uu/CYVsz9Qc+ZRy3XE
   Q==;
IronPort-SDR: Q7Tk98p1VpkhnBLBFv5chqOFQVGahl7JqC095p8CeUs+hARbSOozs5d8/PkfksO2D5Yxaq4Ky0
 U8/tXXH9e1pGwvxb+u8dB7r2nJVtiaZo6N8lqGL3El18dZeyGe5orsc6FN4XLMQFeC221r6Qjy
 2ZkmkNkRuujoBmoDiavwx3P/6Gl/Dj21HcXUJNZqurgFKbITFfePrNI+iBwh2MrekxpO8xBCl9
 /ZAiCWkzoPTtKVrI+HHG6SH5UnjR9k8g/O07aI1R6j1D+66U1kpNWnbgG6qclZYyzNEx3T/TSd
 Z0c=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="85470325"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2020 01:42:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 01:42:29 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 01:42:26 -0700
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
Subject: [PATCH v4 02/10] arm64: sparx5: Add support for Microchip 2xA53 SoC
Date:   Mon, 27 Jul 2020 10:42:03 +0200
Message-ID: <20200727084211.6632-3-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727084211.6632-1-lars.povlsen@microchip.com>
References: <20200727084211.6632-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds support for the Microchip Sparx5 ARMv8-based SoC family of
TSN-capable gigabit switches.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 MAINTAINERS                  |  8 ++++++++
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c4..13553b77ed4f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2111,6 +2111,14 @@ X:	drivers/net/wireless/atmel/
 N:	at91
 N:	atmel
 
+ARM/Microchip Sparx5 SoC support
+M:	Lars Povlsen <lars.povlsen@microchip.com>
+M:	Steen Hegelund <Steen.Hegelund@microchip.com>
+M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+N:	sparx5
+
 ARM/MIOA701 MACHINE SUPPORT
 M:	Robert Jarzmik <robert.jarzmik@free.fr>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8dd05b2a925c5..8939e4e6e34c2 100644
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
2.27.0

