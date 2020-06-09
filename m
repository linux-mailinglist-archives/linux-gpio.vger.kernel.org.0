Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6197B1F35E1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 10:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgFIIIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 04:08:52 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35563 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbgFIIIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 04:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591690118; x=1623226118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CVX3KheKEZUyLSS073Y9Q703DmBTx+PPKOvv792Yx6Q=;
  b=pj/t/FlG4MINsruym3n3i+xFlmLam2o+fdA+Wej2Ce9XGi7LaD0qLtcf
   RM/8FClPj2cGxpZVPiuz9AuHnn9g9wdUHO1WWuKw0Es08b1VtPTmDZmTz
   OPYTtRqYOUURqUIMMVpcmHfv/N16XuLvke2n9DDTJNByn5BsxYXtN6vQ/
   zXMQoYpH6OXCaVUUjVg1ywrCbhLM9j4s3W6z9YStG2hQYhzdoDkt/bwBp
   9td4Gp9AsdRk1uXNHh3fItFFBf3H1WgfmYHgPedgQOgrUZLhOaPDhQTHC
   o/l5w+n59x1aTDZOIopRo3qrCifBcRzIpYD3Jv71BisUz16GHmdT93xUA
   Q==;
IronPort-SDR: xnpxjOnPkOs999EkK6zJ9UllPwRvBrkLSbWE3RXdU0eiOAfXLEbxa1g0Xdu+z54Bjj4IZU7Pc4
 MCgLQxd6FCpzDXIcOnaqOq9RoOE9xbr+GPOMQmIatWOwxpWrqd3rDhX8jki57HmNGTiFKOrobB
 PKeGA8lU3SjbM0hsYdSQOeBpip6JAKMaJYXmw/hUvRyoiZERrRcJiWtcdl5+CfWXtuXjTOains
 RdaM4pzIkygcrxEbgo1RvkZ2QbPmL+GmI5phLrn91y3rAAFT0Zy59FJIR13RqO4/fEsD0HccHS
 W3E=
X-IronPort-AV: E=Sophos;i="5.73,491,1583218800"; 
   d="scan'208";a="79412848"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2020 01:08:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 9 Jun 2020 01:08:31 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Tue, 9 Jun 2020 01:08:29 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
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
Subject: [PATCH v2 07/10] dt-bindings: clock: sparx5: Add bindings include file
Date:   Tue, 9 Jun 2020 10:07:06 +0200
Message-ID: <20200609080709.9654-7-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609080709.9654-1-lars.povlsen@microchip.com>
References: <20200608123024.5330-1-lars.povlsen@microchip.com>
 <20200609080709.9654-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Sparx5 support 9 different clock outputs. This include file has
defines for each supported clock ordinal.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 include/dt-bindings/clock/microchip,sparx5.h | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,sparx5.h

diff --git a/include/dt-bindings/clock/microchip,sparx5.h b/include/dt-bindings/clock/microchip,sparx5.h
new file mode 100644
index 0000000000000..4b04dabacec2c
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sparx5.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 Microchip Inc.
+ *
+ * Author: Lars Povlsen <lars.povlsen@microchip.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_SPARX5_H
+#define _DT_BINDINGS_CLK_SPARX5_H
+
+#define CLK_ID_CORE	0
+#define CLK_ID_DDR	1
+#define CLK_ID_CPU2	2
+#define CLK_ID_ARM2	3
+#define CLK_ID_AUX1	4
+#define CLK_ID_AUX2	5
+#define CLK_ID_AUX3	6
+#define CLK_ID_AUX4	7
+#define CLK_ID_SYNCE	8
+
+#define N_CLOCKS	9
+
+#endif
--
2.27.0
