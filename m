Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B73011419E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 14:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbfLENjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 08:39:15 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:59528 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbfLENjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 08:39:15 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id aDfD2100V5USYZQ01DfDka; Thu, 05 Dec 2019 14:39:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrLd-000283-Hy; Thu, 05 Dec 2019 14:39:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrLd-0001aH-GT; Thu, 05 Dec 2019 14:39:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: rcar: Document r8a77961 support
Date:   Thu,  5 Dec 2019 14:39:12 +0100
Message-Id: <20191205133912.6048-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document support for the GPIO controller in the Renesas R-Car M3-W+
(R8A77961) SoC.

Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 41e5fed0f8420d64..10dce84b1545e074 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -18,7 +18,8 @@ Required Properties:
     - "renesas,gpio-r8a7793": for R8A7793 (R-Car M2-N) compatible GPIO controller.
     - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
-    - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
+    - "renesas,gpio-r8a7796": for R8A77960 (R-Car M3-W) compatible GPIO controller.
+    - "renesas,gpio-r8a77961": for R8A77961 (R-Car M3-W+) compatible GPIO controller.
     - "renesas,gpio-r8a77965": for R8A77965 (R-Car M3-N) compatible GPIO controller.
     - "renesas,gpio-r8a77970": for R8A77970 (R-Car V3M) compatible GPIO controller.
     - "renesas,gpio-r8a77980": for R8A77980 (R-Car V3H) compatible GPIO controller.
-- 
2.17.1

