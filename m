Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0DB1D138F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgEMM5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:57:09 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:7011 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgEMM5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374626; x=1620910626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xXJynxC1V+h72C8jGLqY9iD3zxa+PCkiEZWrzWLo4sc=;
  b=VwNouJhCByK3bn7CwPfNUVwngLRxKUEAfhbkYa84veCGBnmdEawZL3wN
   RSXIr2A8LW4LFfoMVoKt+2D0ChcFIaCpHfAweo00qE5tQsG+SRcUBMhoK
   e/AbmZroqAc2jooB8v2f0D/B4fqEdmtCJf38N582YpEoukBaoVef8Qzf5
   Ovwx9KjWDgv1M33BUcu72MU2Iee+LiXgNwoylrJCJz5Ef6bVXjioqZ4no
   vBN+h0iJ6zAuOqQDVhG0V1tRtpOCUUqvxZ2bYMrUAC8Py00Eio+wXeTb6
   whALgA/OG3WeQx4iWlhSmmxL0317p+d0CLNQRa3/id19AQP3UGhnYuq95
   A==;
IronPort-SDR: NvIML1Er/K90nIzYLbI8PG5XGtzccaa59ul/HN7TPT0pSCir3gKv9DnyhjUOSU5kx8utt4y68X
 SDygjKCvEZ2UI/fnAJnrZNIbjveyyH4J9b2akdOdsbEnf0Zh2yZ7UsLMyIEVUeOtrWZEGOMlo4
 hkIEwcwYhN6wHrnzfJ1vdC1ezZLigalGeC1GiSthWba5ahB7qrf89nmjSM5ERpAJWruiaFmA5w
 pUwkawnxrP6DD4mObHusuFYyISg1BhnWValJ9+XFC+8+hGvDqWdd/vSfJm8fq3VrFQAPDumNEU
 cFw=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="75132848"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:57:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:57:05 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:57:02 -0700
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
Subject: [PATCH 11/14] dt-bindings: clock: sparx5: Add bindings include file
Date:   Wed, 13 May 2020 14:55:29 +0200
Message-ID: <20200513125532.24585-12-lars.povlsen@microchip.com>
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

The Sparx5 support 9 different clock outputs. This include file has
defines for each supported clock ordinal.

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
2.26.2
