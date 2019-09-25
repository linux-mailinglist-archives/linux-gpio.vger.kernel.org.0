Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5FEBDA19
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 10:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442854AbfIYIqI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 04:46:08 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33787 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442828AbfIYIqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 04:46:08 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F39941C001B;
        Wed, 25 Sep 2019 08:46:05 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 1/5] dt-bindings: Add Xylon vendor prefix
Date:   Wed, 25 Sep 2019 10:45:51 +0200
Message-Id: <20190925084555.147771-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
References: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Xylon is an electronics company that produces FPGA hardware block designs
optimized for Xilinx FPGAs.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 29dcc6f8a64a..6c9913244e4c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1036,6 +1036,8 @@ patternProperties:
     description: Xilinx
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
+  "^xylon,.*":
+    description: Xylon
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
   "^ysoft,.*":
-- 
2.23.0

