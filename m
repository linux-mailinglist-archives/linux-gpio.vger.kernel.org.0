Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633E945D7E2
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 11:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344828AbhKYKFK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 05:05:10 -0500
Received: from mx.socionext.com ([202.248.49.38]:14420 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345458AbhKYKDJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Nov 2021 05:03:09 -0500
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 25 Nov 2021 18:57:57 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 0012C205D965;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 25 Nov 2021 18:57:56 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id B17EAB62AC;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
Received: from scorpio.e01.socionext.com (aries.syh.socionext.com [10.213.112.88])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 9FA2710D22;
        Thu, 25 Nov 2021 18:57:56 +0900 (JST)
From:   Sugaya Taichi <sugaya.taichi@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orito.takao@socionext.com,
        sugaya.taichi@socionext.com,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v3 2/2] dt-bindings: pinctrl: add bindings for Milbeaut pin controller
Date:   Thu, 25 Nov 2021 18:57:56 +0900
Message-Id: <1637834276-10466-3-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com>
References: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Device Tree bindings documentation for pin controller of
the Milbeaut SoCs.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 .../pinctrl/socionext,milbeaut-pinctrl.yaml        | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
new file mode 100644
index 0000000..78bc2d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/socionext,milbeaut-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Milbeaut SoCs pin controller
+
+maintainers:
+  - Taichi Sugaya <sugaya.taichi@socionext.com>
+
+description: |
+  Bindings for memory-mapped pin controller of the Milbeaut SoCs.
+
+properties:
+  $nodename:
+    pattern: "pinctrl"
+
+  compatible:
+    enum:
+      - socionext,milbeaut-m10v-pinctrl
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: "pinctrl"
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl: pinctrl@1d022000 {
+        compatible = "socionext,milbeaut-m10v-pinctrl";
+        reg = <0x1d022000 0x1000>;
+        reg-names = "pinctrl";
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.7.4

