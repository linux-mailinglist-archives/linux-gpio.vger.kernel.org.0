Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EBB2EF098
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 11:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbhAHKVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 05:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbhAHKVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 05:21:53 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CF6C0612FD
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 02:20:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id EALU2400S4C55Sk01ALUrP; Fri, 08 Jan 2021 11:20:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-001zdk-Qv; Fri, 08 Jan 2021 11:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxosd-008Ufj-Dc; Fri, 08 Jan 2021 11:20:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 1/3] dt-bindings: gpio: rcar: Add r8a779a0 support
Date:   Fri,  8 Jan 2021 11:20:24 +0100
Message-Id: <20210108102026.2024478-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108102026.2024478-1-geert+renesas@glider.be>
References: <20210108102026.2024478-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the compatible value for the GPIO block in the Renesas R-Car
V3U (R8A779A0) SoC.

While this GPIO block is mostly compatible with GPIO blocks on R-Car
Gen3 SoCs, there are small differences, and one of the new registers
needs to be configured differently from its initial reset state.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 5026662e45081b6c..f2541739ee3b9f7c 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -48,6 +48,9 @@ properties:
               - renesas,gpio-r8a77995     # R-Car D3
           - const: renesas,rcar-gen3-gpio # R-Car Gen3 or RZ/G2
 
+      - items:
+          - const: renesas,gpio-r8a779a0  # R-Car V3U
+
   reg:
     maxItems: 1
 
-- 
2.25.1

