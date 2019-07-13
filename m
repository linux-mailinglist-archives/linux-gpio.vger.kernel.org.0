Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED1A677E3
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 05:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbfGMDrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jul 2019 23:47:52 -0400
Received: from hermes.aosc.io ([199.195.250.187]:42710 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727466AbfGMDrw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jul 2019 23:47:52 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id A2E4E6EAE7;
        Sat, 13 Jul 2019 03:47:46 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/8] dt-bindings: clk: sunxi-ccu: add compatible string for V3 CCU
Date:   Sat, 13 Jul 2019 11:46:29 +0800
Message-Id: <20190713034634.44585-4-icenowy@aosc.io>
In-Reply-To: <20190713034634.44585-1-icenowy@aosc.io>
References: <20190713034634.44585-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Despite Allwinner V3 and V3s shares the same die, one peripheral (I2S)
is only available on V3, and thus the clocks is not declared for V3s
CCU.

Add a V3 CCU compatible string to the binding to prepare for a CCU
driver that provide I2S clock on V3, but not on V3s.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No changes since v3.

Changes in v2:
- Adapt to YAML binding document in linux-next.

 .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index c935405458fe..1bde87fc94c5 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -31,6 +31,7 @@ properties:
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
+      - allwinner,sun8i-v3-ccu
       - allwinner,sun8i-v3s-ccu
       - allwinner,sun9i-a80-ccu
       - allwinner,sun50i-a64-ccu
-- 
2.21.0

