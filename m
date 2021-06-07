Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D131839D5BA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhFGHRr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:17:47 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:35917 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhFGHRq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:17:46 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15771Yca056319;
        Mon, 7 Jun 2021 15:01:34 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 15:15:19 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <steven_lee@aspeedtech.com>, <Hongweiz@ami.com>,
        <ryan_chen@aspeedtech.com>, <billy_tsai@aspeedtech.com>
Subject: [PATCH v4 2/7] dt-bindings: aspeed-sgpio: Add ast2600 sgpio compatibles.
Date:   Mon, 7 Jun 2021 15:15:07 +0800
Message-ID: <20210607071514.11727-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607071514.11727-1-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15771Yca056319
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibles
and update descriptions to introduce the max number of available gpio
pins that AST2600 supported.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index b2ae211411ff..0e42eded3c1e 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -10,9 +10,10 @@ maintainers:
   - Andrew Jeffery <andrew@aj.id.au>
 
 description:
-  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
-  featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
-  support the following options
+  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
+  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
+  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
+  GPIO pins can be programmed to support the following options
   - Support interrupt option for each input port and various interrupt
     sensitivity option (level-high, level-low, edge-high, edge-low)
   - Support reset tolerance option for each output port
@@ -25,6 +26,8 @@ properties:
     enum:
       - aspeed,ast2400-sgpio
       - aspeed,ast2500-sgpio
+      - aspeed,ast2600-sgpiom-80
+      - aspeed,ast2600-sgpiom-128
 
   reg:
     maxItems: 1
-- 
2.17.1

