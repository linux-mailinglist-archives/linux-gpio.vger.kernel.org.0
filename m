Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B8943D8E0
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 03:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJ1BtP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 21:49:15 -0400
Received: from mx.socionext.com ([202.248.49.38]:57202 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhJ1BtM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 21:49:12 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 28 Oct 2021 10:46:45 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 2DDEC207616C;
        Thu, 28 Oct 2021 10:46:45 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 28 Oct 2021 10:46:45 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id B8346B1D51;
        Thu, 28 Oct 2021 10:46:44 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2] dt-bindings: pinctrl: uniphier: Add child node definitions to describe pin mux and configuration
Date:   Thu, 28 Oct 2021 10:46:39 +0900
Message-Id: <1635385599-17778-1-git-send-email-hayashi.kunihiko@socionext.com>
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
Changes since v1:
- Replace additionalProperties with unevaluatedProperties
- Add additionalProperties for child and grandchild nodes

 .../pinctrl/socionext,uniphier-pinctrl.yaml        | 50 +++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
index a804d9bc1602..7e504e003181 100644
--- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
@@ -26,10 +26,58 @@ properties:
       - socionext,uniphier-pxs3-pinctrl
       - socionext,uniphier-nx1-pinctrl
 
+additionalProperties:
+  type: object
+
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
+      additionalProperties:
+        type: object
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
+
 required:
   - compatible
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.7.4

