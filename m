Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095424E8B96
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 03:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbiC1BbX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Mar 2022 21:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbiC1BbX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2022 21:31:23 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 27 Mar 2022 18:29:43 PDT
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B81F115A09
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 18:29:43 -0700 (PDT)
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 28 Mar 2022 10:28:38 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 53BAB2058B50;
        Mon, 28 Mar 2022 10:28:38 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 28 Mar 2022 10:28:38 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id E9EF6B62B7;
        Mon, 28 Mar 2022 10:28:37 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH] dt-bindings: gpio: uniphier: Add hogs parsing
Date:   Mon, 28 Mar 2022 10:28:36 +0900
Message-Id: <1648430916-21988-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow parsing GPIO controller children nodes with GPIO hogs to fix the
following warning:

  uniphier-ld11-ref.dtb: gpio@55000000: 'xirq0-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
      From schema: Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index bcafa494ed7a..b6f5963a2ae6 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -52,6 +52,13 @@ properties:
       <child-interrupt-base parent-interrupt-base length> triplets.
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
 
+patternProperties:
+  "^(.+-hog(-[0-9]+)?)$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg
-- 
2.25.1

