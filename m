Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C401D2B29
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 11:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgENJVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 05:21:48 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:52954 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENJVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 05:21:48 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04E9LQV60025255, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04E9LQV60025255
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 14 May 2020 17:21:26 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 17:21:26 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 17:21:25 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 14 May 2020 17:21:25 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/7] dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1195 and rtd1295.
Date:   Thu, 14 May 2020 17:21:22 +0800
Message-ID: <20200514092125.6875-5-tychang@realtek.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514092125.6875-1-tychang@realtek.com>
References: <20200514092125.6875-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for RTD1195 and RTD1295.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 .../bindings/pinctrl/realtek,rtd-pinctrl.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.yaml
new file mode 100644
index 000000000000..5af5fc8fe633
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/realtek,rtd-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC pin control
+
+maintainers:
+  - Andreas Farber <afaerber@suse.de>
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1195-iso-pinctrl
+      - realtek,rtd1195-crt-pinctrl
+      - realtek,rtd1295-iso-pinctrl
+      - realtek,rtd1295-sb2-pinctrl
+      - realtek,rtd1295-disp-pinctrl
+      - realtek,rtd1295-cr-pinctrl
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    iso_pinctrl: pinctrl@300 {
+        compatible = "realtek,rtd1195-iso-pinctrl";
+        reg = <0x300 0x14>;
+    }
+  - |
+    crt_pinctrl: pinctrl@300 {
+        compatible = "realtek,rtd1195-crt-pinctrl";
+        reg = <0x300 0x78>;
+    }
+  - |
+    iso_pinctrl: pinctrl@300 {
+        compatible = "realtek,rtd1295-iso-pinctrl";
+        reg = <0x300 0x24>;
+    }
+  - |
+    sb2_pinctrl: pinctrl@900 {
+        compatible = "realtek,rtd1295-sb2-pinctrl";
+        reg = <0x900 0x100>;
+    }
+  - |
+    disp_pinctrl: pinctrl@4d000 {
+        compatible = "realtek,rtd1295-disp-pinctrl";
+        reg = <0x4d000 0x100>;
+    };
+  - |
+    cr_pinctrl: pinctrl@12600 {
+        compatible = "realtek,rtd1295-cr-pinctrl";
+        reg = <0x12600 0x100>;
+    };
+
-- 
2.26.2

