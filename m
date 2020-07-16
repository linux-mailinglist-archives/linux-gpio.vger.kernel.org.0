Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1A1222F0B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 01:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgGPXco (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 19:32:44 -0400
Received: from crapouillou.net ([89.234.176.41]:53488 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726113AbgGPXcn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 19:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1594942361; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=+1Kb8nnWPB1Zc7NVfyeJbEQ3GGKwUIHABCYSOtEjTRM=;
        b=T+RHCtxHInksJsTLwKvVb+WRJ4gVo+pm3YzFfrqbn1R9covwWTxMEYhJt90xVahmYT6sWX
        SPamXh6pd3kgPdtY1rbQN7FHLYtvn9hePZsYaZV7LUQyuuZQt6Bbb2WqRmRp0gpauH9bQ8
        9nsar+gUi/VICnCJrPpeUi+PlCZYKC0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] dt-bindings: ingenic,pinctrl: Support pinmux/pinconf nodes
Date:   Fri, 17 Jul 2020 01:32:29 +0200
Message-Id: <20200716233229.208750-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add YAML to describe the pinmux/pinconf sub-nodes of the pinctrl IP on
Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
In-Reply-To: CAL_Jsq+nHZsbOMPpXC7NWp1etgVL57Q+o=gr6BJ6ijAq1pLJUw@mail.gmail.com
---
 .../bindings/pinctrl/ingenic,pinctrl.yaml     | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index adf462cc2737..9d374f55ebb1 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -110,7 +110,46 @@ required:
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
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
-- 
2.27.0

