Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B35723ECB
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 12:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjFFKBy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 06:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbjFFKBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 06:01:48 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FE010D7
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 03:01:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a3e8:6562:a823:d832])
        by albert.telenet-ops.be with bizsmtp
        id 5m1j2A00L1Tjf1k06m1jxG; Tue, 06 Jun 2023 12:01:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q6TVC-005IKf-UG;
        Tue, 06 Jun 2023 12:01:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q6TVX-00Bh5i-NE;
        Tue, 06 Jun 2023 12:01:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <linux@ew.tq-group.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: gpio-delay: Spelling s/curcuit/circuit/
Date:   Tue,  6 Jun 2023 12:01:40 +0200
Message-Id: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Fix misspellings of "circuit".

Fixes: c7239a3da1628767 ("dt-bindings: gpio: Add gpio-delay binding document")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
index 7c16a4e1a768ef72..1cebc4058e272660 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This binding describes an electrical setup where setting an GPIO output
-  is delayed by some external setup, e.g. RC curcuit.
+  is delayed by some external setup, e.g. RC circuit.
 
   +----------+                    +-----------+
   |          |             VCC_B  |           |
@@ -30,7 +30,7 @@ description: |
                            GND
 
   If the input on the consumer is controlled by an open-drain signal
-  attached to an RC curcuit the ramp-up delay is not under control
+  attached to an RC circuit the ramp-up delay is not under control
   of the GPIO controller.
 
 properties:
-- 
2.34.1

