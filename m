Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5820AEC06E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 10:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbfKAJUh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 05:20:37 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:6553 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbfKAJUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 05:20:37 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 4EucVUhtbVEvbbmY/hUuxzdLY3HCA1DJyUwm5BdYJsMKc+vK+Hl1Tad9RkaHzU00ItPmJTt4fx
 D3rUN1GvKpNhF7r+p2hYpM3hG7ghEPYimBdDHMChdk8lG+BbpTDHb1JLoR/94JaHgvdSJO6Mgr
 bNFSJKPlVmTVQBRnsyMJjC0kqtVRxOF7cIQE0uvUvzuvQSt82Jky/x2MURFc+bF8sPhSNYbR8A
 jaeN388kkBxt45fbOkIOLPHRyjLrcROGbACLj3vccRiVjc0R0bE9GLWfXvCZV83xITufjKic9p
 5vQ=
X-IronPort-AV: E=Sophos;i="5.68,254,1569308400"; 
   d="scan'208";a="53750120"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2019 02:20:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 1 Nov 2019 02:20:35 -0700
Received: from rob-ult-m19940.corp.atmel.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 1 Nov 2019 02:20:33 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <ludovic.desroches@microchip.com>, <linus.walleij@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <claudiu.beznea@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v2] pinctrl: at91: Enable slewrate by default on SAM9X60
Date:   Fri, 1 Nov 2019 11:20:31 +0200
Message-ID: <20191101092031.24896-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On SAM9X60, slewrate should be enabled on pins with a switching frequency
below 50Mhz. Since most of our pins do not exceed this value, we enable
slewrate by default. Pins with a switching value that exceeds 50Mhz will
have to explicitly disable slewrate.

This patch changes the ABI. However, the slewrate macros are only used
by SAM9X60 and, at this moment, there are no device-tree files available
for this platform.

Suggested-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
 - updated commit message to reflect the ABI change

 drivers/pinctrl/pinctrl-at91.c     | 4 ++--
 include/dt-bindings/pinctrl/at91.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 117075b5798f..c135149e84e9 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -85,8 +85,8 @@ enum drive_strength_bit {
 					 DRIVE_STRENGTH_SHIFT)
 
 enum slewrate_bit {
-	SLEWRATE_BIT_DIS,
 	SLEWRATE_BIT_ENA,
+	SLEWRATE_BIT_DIS,
 };
 
 #define SLEWRATE_BIT_MSK(name)		(SLEWRATE_BIT_##name << SLEWRATE_SHIFT)
@@ -669,7 +669,7 @@ static void at91_mux_sam9x60_set_slewrate(void __iomem *pio, unsigned pin,
 {
 	unsigned int tmp;
 
-	if (setting < SLEWRATE_BIT_DIS || setting > SLEWRATE_BIT_ENA)
+	if (setting < SLEWRATE_BIT_ENA || setting > SLEWRATE_BIT_DIS)
 		return;
 
 	tmp = readl_relaxed(pio + SAM9X60_PIO_SLEWR);
diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
index 3831f91fb3ba..e8e117306b1b 100644
--- a/include/dt-bindings/pinctrl/at91.h
+++ b/include/dt-bindings/pinctrl/at91.h
@@ -27,8 +27,8 @@
 #define AT91_PINCTRL_DRIVE_STRENGTH_MED			(0x2 << 5)
 #define AT91_PINCTRL_DRIVE_STRENGTH_HI			(0x3 << 5)
 
-#define AT91_PINCTRL_SLEWRATE_DIS	(0x0 << 9)
-#define AT91_PINCTRL_SLEWRATE_ENA	(0x1 << 9)
+#define AT91_PINCTRL_SLEWRATE_ENA	(0x0 << 9)
+#define AT91_PINCTRL_SLEWRATE_DIS	(0x1 << 9)
 
 #define AT91_PIOA	0
 #define AT91_PIOB	1
-- 
2.20.1

