Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E64D22648B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 17:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730594AbgGTPp6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 11:45:58 -0400
Received: from crapouillou.net ([89.234.176.41]:53584 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730587AbgGTPp5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jul 2020 11:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595259953; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=MYfSK0uCqzVeDm3Bgtm0aTqhsB8rtuNFCVEW421QRKw=;
        b=ViLLZSgTdkS7MmHwzrvODyCaxPA9gXgb9Yz0MAjOzBpVUXU4ZKq6EVhy8BNdiZi4i6xLLv
        4B+faPF+EAaMOHMiUqIOrceGjTMtUW/VDLNE0dwb2Dd/69Pyy+0B7rJEck3sd1AGdcYzgu
        FkfhtUUlHZ3wQ/VkHhHA22M0j+8S1Jw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2] dt-bindings: ingenic,pinctrl: Support pinmux/pinconf nodes
Date:   Mon, 20 Jul 2020 17:45:48 +0200
Message-Id: <20200720154548.12453-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add YAML to describe the pinmux/pinconf sub-nodes of the pinctrl IP on
Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Rebased on top of pinctrl/devel

 .../bindings/pinctrl/ingenic,pinctrl.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 5be2b1e95b36..18163fb69ce7 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -110,6 +110,46 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      properties:
+        phandle: true
+        function: true
+        groups: true
+        pins: true
+        bias-disable: true
+        bias-pull-up: true
+        bias-pull-down: true
+        output-low: true
+        output-high: true
+      additionalProperties: false
+
+    - type: object
+      properties:
+        phandle: true
+      additionalProperties:
+        type: object
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          phandle: true
+          function: true
+          groups: true
+          pins: true
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+          output-low: true
+          output-high: true
+        additionalProperties: false
+
 examples:
   - |
     pin-controller@10010000 {
-- 
2.27.0

