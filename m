Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBFB42C40E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 16:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhJMO4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 10:56:22 -0400
Received: from mx.socionext.com ([202.248.49.38]:49852 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230468AbhJMO4W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Oct 2021 10:56:22 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Oct 2021 23:54:18 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 255CB2058B40;
        Wed, 13 Oct 2021 23:54:18 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Wed, 13 Oct 2021 23:54:18 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id B281AB62B7;
        Wed, 13 Oct 2021 23:54:17 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] dt-bindings: pinctrl: uniphier: Add child node definitions to describe pin mux and configuration
Date:   Wed, 13 Oct 2021 23:54:08 +0900
Message-Id: <1634136848-20091-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In arch/arm/boot/dts/uniphier-pinctrl.dtsi, there are child nodes of
pinctrl that defines pinmux and pincfg, however, there are no rules about
that in dt-bindings.

'make dtbs_check' results an error with the following message:

   pinctrl: 'ain1', 'ain2', 'ainiec1', 'aout', 'aout1', 'aout2', ...
   ... 'usb2', 'usb3' do not match any of the regexes: 'pinctrl-[0-9]+'

To avoid this issue, add the rules of pinmux and pincfg in each child node
and grandchild node.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../pinctrl/socionext,uniphier-pinctrl.yaml        | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
index a804d9bc1602..4567330fe536 100644
--- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
@@ -26,11 +26,53 @@ properties:
       - socionext,uniphier-pxs3-pinctrl
       - socionext,uniphier-nx1-pinctrl
 
-required:
-  - compatible
+patternProperties:
+  "^.*$":
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      properties:
+        phandle: true
+        function: true
+        groups: true
+        pins: true
+        bias-pull-up: true
+        bias-pull-down: true
+        bias-pull-pin-default: true
+        drive-strength: true
+
+      patternProperties:
+        "^.*$":
+          if:
+            type: object
+          then:
+            allOf:
+              - $ref: pincfg-node.yaml#
+              - $ref: pinmux-node.yaml#
+
+            properties:
+              phandle: true
+              function: true
+              groups: true
+              pins: true
+              bias-pull-up: true
+              bias-pull-down: true
+              bias-pull-pin-default: true
+              drive-strength: true
+
+            unevaluatedProperties: false
+
+      unevaluatedProperties: false
 
 additionalProperties: false
 
+required:
+  - compatible
+
 examples:
   - |
     // The UniPhier pinctrl should be a subnode of a "syscon" compatible node.
-- 
2.7.4

