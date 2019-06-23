Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2E14FA05
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jun 2019 06:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfFWEkN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 00:40:13 -0400
Received: from hermes.aosc.io ([199.195.250.187]:52268 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbfFWEkN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 Jun 2019 00:40:13 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 30D106B5D5;
        Sun, 23 Jun 2019 04:40:08 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 7/9] dt-bindings: vendor-prefixes: add Sipeed
Date:   Sun, 23 Jun 2019 12:37:59 +0800
Message-Id: <20190623043801.14040-8-icenowy@aosc.io>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Shenzhen Sipeed Technology Co., Ltd. is a company focused on development
kits, which also contains rebranded Lichee Pi series.

Add its vendor prefix binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v3:
- Rebased because of the addition of sinlinx and sinovoip.

Patch introduced in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 92f50cac1055..bbbce4c9cc4e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -847,6 +847,8 @@ patternProperties:
     description: Sinlinx Electronics Technology Co., LTD
   "^sinovoip,.*":
     description: SinoVoip Co., Ltd
+  "^sipeed,.*":
+    description: Shenzhen Sipeed Technology Co., Ltd.
   "^sirf,.*":
     description: SiRF Technology, Inc.
   "^sis,.*":
-- 
2.21.0

