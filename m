Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA461F98F0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbgFONeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:34:23 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:55673 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbgFONdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592228003; x=1623764003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0PFUuYEkowikkFlJngUHzPP7u9ABrMBxXuzfa3P9yDo=;
  b=SPoa65QWbrpFHzTkPFRMGb5647AHuesebi9TYlZiaMbAqhGoP3vkMVck
   0fQfoaFns2CLSZUI9EgQ8GCJVD4jSmV+NUTRerUxkoRf7xIMtT5pareci
   oHQ4JayTFSKoE72HQyz+DtxO59/TjnvpMQDzlb56zw+fLHy4yCHGKXFHb
   x1Y6DOJRMtvTuUfSpXvI5V2jbh530p3OwY43KNrljRt2XfhsGMucuB1Du
   7rOBtt96EpgLMWHgxcDkCXIJeZtm6hoFG04cR2aLvwtwA7qJbV8j+hj49
   +E/YhTU01k1S+riRPnriKbLO/Ar/B78spvC68SWhnd/8z5LmFAYIuD7Ks
   w==;
IronPort-SDR: oJYzDtKgrsOsrZsmpYoJQvL1qlnxoMuGLHlPBrX7kLDQE45P0YJUtqovnh9AFPgJlzfqJ+aRRD
 x77v63jtqehCSxfsMNzJdqePinUFECPkEaPbgZMBDlVlHdRrer7Ezl+isPcU2z1NueCToqkSwi
 8nZuk2r7cp97TO8JhHHED1BqTvyW68Bk5jiXFgmNk+/94qbITexJ92qmEZmG8wJcX1LP8AengO
 jCjW0xgdeFDZWBYzqsvk8jLYvbvDp6KnIycQB5AjhydodFDBLNoc/Y7TTb3C+NNCiOEao3Y+6h
 BSQ=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="15805525"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:33:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:33:22 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:33:18 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
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
Subject: [PATCH v3 07/10] dt-bindings: clock: sparx5: Add bindings include file
Date:   Mon, 15 Jun 2020 15:32:39 +0200
Message-ID: <20200615133242.24911-8-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
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

