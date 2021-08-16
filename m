Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE58E3ECC47
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 03:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbhHPBU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Aug 2021 21:20:28 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:53254 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhHPBU0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Aug 2021 21:20:26 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 468FFFB822;
        Mon, 16 Aug 2021 09:19:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26933T140041269528320S1629076790609014_;
        Mon, 16 Aug 2021 09:19:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <73d3c2060501bc2f209333a4d959d242>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-RCPT-COUNT: 9
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v8 4/9] dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
Date:   Mon, 16 Aug 2021 09:19:43 +0800
Message-Id: <20210816011948.1118959-5-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816011948.1118959-1-jay.xu@rock-chips.com>
References: <20210816011948.1118959-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the past we only need on clock which name "pclk" for a gpio controller.
In the new version gpio controller, there add some register to change
debounce clock dynamic, so the dt node needs to add the second clock, we
call it "dbclk".

The clock property need 2 items on some rockchip chips such as RK3568
SoCs.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
v8:
 - fix commit author to me
 - add clock-names property but not require
v7:
 - none
v6:
 - add to this serials

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d993e002cebe..0d62c28fb58d 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -22,7 +22,10 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: APB interface clock source
+      - description: GPIO debounce reference clock source
 
   gpio-controller: true
 
-- 
2.25.1



