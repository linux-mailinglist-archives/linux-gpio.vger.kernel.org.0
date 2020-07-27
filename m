Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CFD22E812
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgG0Imv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:42:51 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:48576 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgG0Imr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595839367; x=1627375367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5MLPYjoTsh+TV8uVlGQyI3alO8753yChgHddi7BhCF8=;
  b=fAeM8Q6xl8SES3TRL4vyHLyyTHxj6SeYA2+VvCs59NW5OXVUNYj2mCNF
   /x1qEmIa75xepbEKiJqUpZKv9ZWjM2pDALMvOf7gdVI+9gIkkg6ziwgTl
   HR+rZrMltLwj1uDSz8s74p9tn2664z471A/hxCWQFS8yIqI4x+s7srrDi
   SGHm9NcZweAlNiuI0+ynf816k6Uzigg1Xt+t4yNDyYhmmwSgVwO42U2M7
   rocvX+6/FTbLs5gKSaEuHLltO17yky8d85QdxhkkM6IqOJRe/58DOa/pS
   ++8Xdl7RVeZfcRdYoweoLEbjy/YbZICDM1B5qS1AOt5iHT9yssvcz6wK1
   w==;
IronPort-SDR: gw4bQ4piImdVZxzMe0uD+Vv822Zj4ziUfjOp1qw6OWY3QTeN/BC2CtsunB0XtcpKbFiODd4L67
 epzktl0eKfRqz3LWalqn69fIRUpphexjT3X2LiK3HfNKYHiESaAl82I0P4lMhsW2q1BcBL65o0
 4aHjcsirqcwAbdI1Al3RJe/WB1hM66Bls4gMkKr2OyKiHpqqnyhPS2l7vBMmcp6PPrxkDUOSFW
 y49jlKL7mPrfnIP7x6zg5pnIxqOr5HaAqBlwH95p9UWOwg0uRmnwkjA3yHAeMEGZhsRZHwKVU+
 iJ0=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="85470448"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2020 01:42:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 01:42:00 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 01:42:42 -0700
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
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 07/10] dt-bindings: clock: sparx5: Add bindings include file
Date:   Mon, 27 Jul 2020 10:42:08 +0200
Message-ID: <20200727084211.6632-8-lars.povlsen@microchip.com>
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

The Sparx5 support 9 different clock outputs. This include file has
defines for each supported clock ordinal.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

