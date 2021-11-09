Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67821449F52
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 01:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241114AbhKIAOc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 19:14:32 -0500
Received: from mx.socionext.com ([202.248.49.38]:51142 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhKIAOc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 19:14:32 -0500
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 09 Nov 2021 09:11:46 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 9C49D206E701;
        Tue,  9 Nov 2021 09:11:46 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 9 Nov 2021 09:11:46 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 62D7FB62AC;
        Tue,  9 Nov 2021 09:11:46 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v3] dt-bindings: pinctrl: uniphier: Add child node definitions to describe pin mux and configuration
Date:   Tue,  9 Nov 2021 09:11:39 +0900
Message-Id: <1636416699-21033-1-git-send-email-hayashi.kunihiko@socionext.com>
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

To avoid the issue, add the rules of pinmux and pincfg in each child node
and grandchild node.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
Changes since v2:
- Describe additionalProperties directly instead of patternProperties
- Remove unnecessary unevaluatedProperties

Changes since v1:
- Replace additionalProperties with unevaluatedProperties
- Add additionalProperties for child and grandchild nodes

.../pinctrl/socionext,uniphier-pinctrl.yaml        | 38 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
index a804d9bc1602..27c5762b9cf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
@@ -26,11 +26,45 @@ properties:
       - socionext,uniphier-pxs3-pinctrl
       - socionext,uniphier-nx1-pinctrl
 
+additionalProperties:
+  type: object
+
+  allOf:
+    - $ref: pincfg-node.yaml#
+    - $ref: pinmux-node.yaml#
+
+  properties:
+    phandle: true
+    function: true
+    groups: true
+    pins: true
+    bias-pull-up: true
+    bias-pull-down: true
+    bias-pull-pin-default: true
+    drive-strength: true
+
+  additionalProperties:
+    type: object
+
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    properties:
+      phandle: true
+      function: true
+      groups: true
+      pins: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-pull-pin-default: true
+      drive-strength: true
+
+    unevaluatedProperties: false
+
 required:
   - compatible
 
-additionalProperties: false
-
 examples:
   - |
     // The UniPhier pinctrl should be a subnode of a "syscon" compatible node.
-- 
2.7.4

