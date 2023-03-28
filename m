Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7E46CBC28
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 12:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbjC1KLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 06:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjC1KK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 06:10:56 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE7226186;
        Tue, 28 Mar 2023 03:10:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,297,1673881200"; 
   d="scan'208";a="154048945"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Mar 2023 19:10:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3338740071EC;
        Tue, 28 Mar 2023 19:10:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 01/10] dt-bindings: pinctrl: rzg2l-poeg: Document renesas,poeg-config property
Date:   Tue, 28 Mar 2023 11:10:02 +0100
Message-Id: <20230328101011.185594-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328101011.185594-1-biju.das.jz@bp.renesas.com>
References: <20230328101011.185594-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document renesas,poeg-config optional property.

The output pins of the general PWM timer (GPT) can be disabled by using
the port output enabling function for the GPT (POEG). The HW supports
following ways to disable the output pins.

1) Pin output disable by input level detection of the GTETRG{A..D} pins
2) Output disable request from the GPT
3) Pin output disable by user control

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7:
 * New patch
Ref:
 https://lore.kernel.org/linux-renesas-soc/20230306090014.128732-1-biju.das.jz@bp.renesas.com/T/#m07d2c4661d772a705b5a48fd050b7007b830f3eb
---
 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
index ab2d456c93e4..ae027a490206 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
@@ -57,6 +57,21 @@ properties:
         <2> : POEG group C
         <3> : POEG group D
 
+  renesas,poeg-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2, 4, 6, 8, 10, 12, 14, 16 ]
+    description: |
+      POEG Configuration. Valid values are:
+        <1> :  User control
+        <2> :  GPT both output high
+        <4> :  GPT both output low
+        <6> :  GPT both output high + GPT both output low
+        <8> :  GPT dead time error
+        <10> : GPT both output high + GPT dead time error
+        <12> : GPT both output low + GPT dead time error
+        <14> : GPT both output {high, low} + GPT dead time error
+        <16> : External pin control
+
 required:
   - compatible
   - reg
@@ -83,4 +98,5 @@ examples:
         resets = <&cpg R9A07G044_POEG_D_RST>;
         renesas,poeg-id = <3>;
         renesas,gpt = <&gpt>;
+        renesas,poeg-config = <1>;
     };
-- 
2.25.1

