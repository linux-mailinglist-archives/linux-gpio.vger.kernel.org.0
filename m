Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0EB27B4B7
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 20:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgI1SpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 14:45:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:51100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgI1SpX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 14:45:23 -0400
Received: from localhost.localdomain (unknown [194.230.155.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33B43207D8;
        Mon, 28 Sep 2020 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601318723;
        bh=+1kWXGqPRWewGw6lgPlIyrOjL10V4xjvWu8IzX1LIlk=;
        h=From:To:Cc:Subject:Date:From;
        b=efEWLNn4rPrhOp6tVuPG4+q45becCK0nLjT6CPN559S1Idx92p43RcMkJ2aMD5Ju3
         1YtN0h4u0AEYGmNvL5mKyDEYxKtHyH+JsyLthxIujbHc7a9K2Rttbrgvr+OrYOj/Cy
         KHFbmm1iuiKlGY/a1l8cwXsSLIxGio0NvaYiXEVY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: renesas,pfc: align example GPIO hog name with dtschema
Date:   Mon, 28 Sep 2020 20:45:15 +0200
Message-Id: <20200928184515.7345-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The convention for node names is to use hyphens, not underscores.
dtschema expects GPIO hogs to end with 'hog' suffix.  Adjust the example
DTS in the binding.  No changes to binding itself.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 4efe117550bd..5b5b1b9d2ec7 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -148,7 +148,7 @@ examples:
                 <&irqpin3 4 0>, <&irqpin3 5 0>, <&irqpin3 6 0>, <&irqpin3 7 0>;
             power-domains = <&pd_c5>;
 
-            lcd0_mux {
+            lcd0-mux-hog {
                     /* DBGMD/LCDC0/FSIA MUX */
                     gpio-hog;
                     gpios = <176 0>;
-- 
2.17.1

