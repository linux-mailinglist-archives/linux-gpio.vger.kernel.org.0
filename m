Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0531D2717B7
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 21:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgITT7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 15:59:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:45208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITT7L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Sep 2020 15:59:11 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9925D2085B;
        Sun, 20 Sep 2020 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600631950;
        bh=3pMtEfO5GpJ2TBTliAI3qinzN3+C9zV6uhHKe4QnrqY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bjk3ssCZxLnN+qm+lpePR2gSV8JiJdMrQktAW8LrCtUPp8HDOyTEIsPLhA2F2o+yb
         7RFBy2AVQarw6Ni5MGjh4n9rmOhsL0QG+2Ih+XoNlz3USILm4fP4iffku4Sikyjw2d
         dS+lcmr58mWsZ/9CZ8VWgTb+fQT7hOCkGOIemV1M=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: gpio: fsl-imx-gpio: add gpio-line-names
Date:   Sun, 20 Sep 2020 21:58:47 +0200
Message-Id: <20200920195848.27075-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920195848.27075-1-krzk@kernel.org>
References: <20200920195848.27075-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe common "gpio-line-names" property to fix dtbs_check warnings
like:

  arch/arm/boot/dts/imx53-m53menlo.dt.yaml: gpio@53f84000:
    'gpio-line-names' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. None, split from previous patchset using common GPIO schema
---
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index 281cdd34a829..f57d22d1ebd6 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -62,7 +62,7 @@ properties:
     const: 2
 
   gpio-controller: true
-
+  gpio-line-names: true
   gpio-ranges: true
 
   power-domains:
-- 
2.17.1

