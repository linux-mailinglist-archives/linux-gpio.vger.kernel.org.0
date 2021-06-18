Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BCE3AC3D0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 08:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhFRG1t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 02:27:49 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:35648 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhFRG1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 02:27:48 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 43398D1C48;
        Fri, 18 Jun 2021 14:25:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P16485T139919018157824S1623997492865409_;
        Fri, 18 Jun 2021 14:25:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a6e08ae542982fde99a8196d5262c507>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, kever.yang@rock-chips.com,
        Liang Chen <cl@rock-chips.com>
Subject: [PATCH 4/9] dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
Date:   Fri, 18 Jun 2021 14:24:44 +0800
Message-Id: <20210618062449.1067106-5-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618062449.1067106-1-jay.xu@rock-chips.com>
References: <20210618062449.1067106-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

The clock property need 2 items on some rockchip chips.

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
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



