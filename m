Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A4054CA81
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349171AbiFON7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354820AbiFON6p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:58:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574642019F
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:58:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:5439:2bcc:4a70:48e8])
        by albert.telenet-ops.be with bizsmtp
        id jRyi2700e4lJ8fu06RyiNU; Wed, 15 Jun 2022 15:58:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TXe-0044oV-8j; Wed, 15 Jun 2022 15:58:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TXd-006xmH-QU; Wed, 15 Jun 2022 15:58:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: pinctrl: renesas: Remove spaces before #define
Date:   Wed, 15 Jun 2022 15:58:40 +0200
Message-Id: <5188ef93a911ce3781b16530fdebbf0f0af462b6.1655301264.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove spaces at the beginning of lines with #defines.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.20.

 include/dt-bindings/pinctrl/r7s9210-pinctrl.h | 2 +-
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/pinctrl/r7s9210-pinctrl.h b/include/dt-bindings/pinctrl/r7s9210-pinctrl.h
index 2d0c23e5d3a7f149..8736ce038ecab772 100644
--- a/include/dt-bindings/pinctrl/r7s9210-pinctrl.h
+++ b/include/dt-bindings/pinctrl/r7s9210-pinctrl.h
@@ -42,6 +42,6 @@
 /*
  * Convert a port and pin label to its global pin index
  */
- #define RZA2_PIN(port, pin)	((port) * RZA2_PINS_PER_PORT + (pin))
+#define RZA2_PIN(port, pin)	((port) * RZA2_PINS_PER_PORT + (pin))
 
 #endif /* __DT_BINDINGS_PINCTRL_RENESAS_RZA2_H */
diff --git a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
index b48f8c7a55566ff4..c78ed5e5efb78a5c 100644
--- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
+++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
@@ -18,6 +18,6 @@
 #define RZG2L_PORT_PINMUX(b, p, f)	((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
 
 /* Convert a port and pin label to its global pin index */
- #define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
+#define RZG2L_GPIO(port, pin)	((port) * RZG2L_PINS_PER_PORT + (pin))
 
 #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */
-- 
2.25.1

