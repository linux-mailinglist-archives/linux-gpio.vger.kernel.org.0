Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E503CE7B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390926AbfFKOT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:19:59 -0400
Received: from hermes.aosc.io ([199.195.250.187]:33453 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389934AbfFKOTn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 10:19:43 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 4543582280;
        Tue, 11 Jun 2019 14:10:45 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/11] dt-bindings: pinctrl: add missing compatible string for V3s
Date:   Tue, 11 Jun 2019 22:09:30 +0800
Message-Id: <20190611140940.14357-2-icenowy@aosc.io>
In-Reply-To: <20190611140940.14357-1-icenowy@aosc.io>
References: <20190611140940.14357-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl driver of V3s is already available and used in the kernel,
but the compatible string of it is forgotten to be added.

Add the missing compatible string.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- Add the ACK tag by Maxime and the review tag by Rob.

 .../devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index cf96b7c20e4d..baba55db864c 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -24,6 +24,7 @@ Required properties:
   "allwinner,sun8i-h3-pinctrl"
   "allwinner,sun8i-h3-r-pinctrl"
   "allwinner,sun8i-r40-pinctrl"
+  "allwinner,sun8i-v3s-pinctrl"
   "allwinner,sun50i-a64-pinctrl"
   "allwinner,sun50i-a64-r-pinctrl"
   "allwinner,sun50i-h5-pinctrl"
-- 
2.21.0

