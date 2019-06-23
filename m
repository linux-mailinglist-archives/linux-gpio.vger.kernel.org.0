Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89FE44FA07
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jun 2019 06:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfFWEkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 00:40:23 -0400
Received: from hermes.aosc.io ([199.195.250.187]:52284 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbfFWEkX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 Jun 2019 00:40:23 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 3F8806B5D5;
        Sun, 23 Jun 2019 04:40:19 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 8/9] dt-bindings: arm: sunxi: add binding for Lichee Zero Plus core board
Date:   Sun, 23 Jun 2019 12:38:00 +0800
Message-Id: <20190623043801.14040-9-icenowy@aosc.io>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Lichee Zero Plus is a core board made by Sipeed, with a microUSB
connector on it, TF slot or WSON8 SD chip, optional eMMC or SPI Flash.
It has a gold finger connector for expansion, and UART is available from
reserved pins w/ 2.54mm pitch. The board can use either SoChip S3 or
Allwinner V3L SoCs.

Add the device tree binding of the basic version of the core board --
w/o eMMC or SPI Flash, w/ TF slot or WSON8 SD, and use S3 SoC.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
No changes in v3.

Patch introduced in v2.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 000a00d12d6a..48c126a7a848 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -353,6 +353,11 @@ properties:
           - const: licheepi,licheepi-zero
           - const: allwinner,sun8i-v3s
 
+      - description: Lichee Zero Plus (with S3, without eMMC/SPI Flash)
+        items:
+          - const: sipeed,lichee-zero-plus
+          - const: allwinner,sun8i-s3
+
       - description: Linksprite PCDuino
         items:
           - const: linksprite,a10-pcduino
-- 
2.21.0

