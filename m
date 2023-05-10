Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 386D26FDB21
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 11:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbjEJJyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbjEJJxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 05:53:40 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76F367EF1;
        Wed, 10 May 2023 02:53:37 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A2C9C8109;
        Wed, 10 May 2023 09:53:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?=82ecki?= <rafal@milecki.pl>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: Allow use of pinconf in addition to pinctrl and pinmux
Date:   Wed, 10 May 2023 12:53:28 +0300
Message-Id: <20230510095330.30742-1-tony@atomide.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some controllers can be just pinconf controllers and we have dts
files using pinconf for the node name already.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux|pinconf)(@[0-9a-f]+)?$"
 
   "#pinctrl-cells":
     description: >
-- 
2.40.1
