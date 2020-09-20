Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0801D2717B3
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 21:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgITT7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 15:59:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITT67 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Sep 2020 15:58:59 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A80312085B;
        Sun, 20 Sep 2020 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600631939;
        bh=qE/XNWOxN2w9q5YVj7knCuVoes9uF5n3abGxzM2Z+W4=;
        h=From:To:Cc:Subject:Date:From;
        b=Ha8P/imBl3wD1AWwjK3A7QC8+fabyc9+n2hkGToE0oI4/70U+xYAHRInRgDNNntwd
         KoUZrm+DbHQxl6meWzKWsrDk3rhpYORqNi4UDAUj277nFMatb8Y9TnfmWwVTg7CIqE
         FLgjjokJ1hHgQwP+bUWXaz0bGE5hTnn51x77HDEY=
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
Subject: [PATCH v3 1/4] dt-bindings: gpio: pl061: add gpio-line-names
Date:   Sun, 20 Sep 2020 21:58:45 +0200
Message-Id: <20200920195848.27075-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe common "gpio-line-names" property to fix dtbs_check warnings
like:

  arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dt.yaml: gpio@e8a0b000:
    'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Common GPIO goes to dt-schema
---
 Documentation/devicetree/bindings/gpio/pl061-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 313b17229247..bd35cbf7fa09 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -51,7 +51,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names: true
+
   gpio-ranges:
+    minItems: 1
     maxItems: 8
 
 required:
-- 
2.17.1

