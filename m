Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEF55B332A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbiIIJKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbiIIJKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:10:00 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC94632EE3
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:09:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by albert.telenet-ops.be with bizsmtp
        id Hl9v2800K0sKggw06l9vcR; Fri, 09 Sep 2022 11:09:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWa1L-004bZP-5b; Fri, 09 Sep 2022 11:09:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWa1K-004OZM-85; Fri, 09 Sep 2022 11:09:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779g0 support
Date:   Fri,  9 Sep 2022 11:09:53 +0200
Message-Id: <649e875962b486e0bf849aba8f386eb6290a433a.1662714555.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document support for the GPIO controller blocks in the Renesas R-Car
V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 75e5da6a7cc04bbd..aa424e2b95f87a51 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -52,6 +52,7 @@ properties:
           - enum:
               - renesas,gpio-r8a779a0     # R-Car V3U
               - renesas,gpio-r8a779f0     # R-Car S4-8
+              - renesas,gpio-r8a779g0     # R-Car V4H
           - const: renesas,rcar-gen4-gpio # R-Car Gen4
 
   reg:
-- 
2.25.1

