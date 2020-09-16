Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1221726C731
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 20:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgIPSM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 14:12:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgIPSKo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:10:44 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25FC822A83;
        Wed, 16 Sep 2020 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273412;
        bh=4AabZbuK+N6lbfohVlt0qp5YZ6D+w3XFtXgytzSRvZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ry5eMM1sk6xj8SaN1XwXiOiVGXXo7SiTroZv+tK+y9Y1ZtK4Mx4N1hWFJkgf0Nqnw
         dWqQKjD4sMsuXz5SoDhAbTVmA4PY95mqyBhOfaDZFQZjLclYs3V1e7nGR42gLsaOsF
         Z0q/1pmCK4WkeMNVV6RLSXBVA1MBoe5ZofX0Tr5o=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/8] dt-bindings: gpio: pl061: add missing properties and include common schema
Date:   Wed, 16 Sep 2020 18:22:45 +0200
Message-Id: <20200916162250.16098-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe all GPIO controller properties and include the common GPIO
schema to be sure all common properties are properly validated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/gpio/pl061-gpio.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 313b17229247..6cbf10d8e120 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -19,6 +19,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
@@ -51,7 +54,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names: true
+
   gpio-ranges:
+    minItems: 1
     maxItems: 8
 
 required:
-- 
2.17.1

