Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E3A816AF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEKQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:16:21 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49437 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfHEKQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:16:21 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B4D3320002;
        Mon,  5 Aug 2019 10:16:18 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] pinctrl: mvebu: add additional variant for standalone CP115
Date:   Mon,  5 Aug 2019 12:16:07 +0200
Message-Id: <20190805101607.29811-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805101607.29811-1-miquel.raynal@bootlin.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Grzegorz Jaszczyk <jaz@semihalf.com>

With CP115 standalone modules, all MPP configuration are
possible. Handle this new possibility thanks to the new
"marvell,cp115-standalone-pinctrl" compatible property.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
[<miquel.raynal@bootlin.com>: mention the new compatible in the
commit log]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
index 85ade9761885..17491b27e487 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
@@ -32,6 +32,7 @@ enum {
 	V_ARMADA_7K = BIT(0),
 	V_ARMADA_8K_CPM = BIT(1),
 	V_ARMADA_8K_CPS = BIT(2),
+	V_CP115_STANDALONE = BIT(3),
 	V_ARMADA_7K_8K_CPM = (V_ARMADA_7K | V_ARMADA_8K_CPM),
 	V_ARMADA_7K_8K_CPS = (V_ARMADA_7K | V_ARMADA_8K_CPS),
 };
@@ -614,6 +615,10 @@ static const struct of_device_id armada_cp110_pinctrl_of_match[] = {
 		.compatible	= "marvell,armada-8k-cps-pinctrl",
 		.data		= (void *) V_ARMADA_8K_CPS,
 	},
+	{
+		.compatible	= "marvell,cp115-standalone-pinctrl",
+		.data		= (void *) V_CP115_STANDALONE,
+	},
 	{ },
 };
 
@@ -655,16 +660,20 @@ static int armada_cp110_pinctrl_probe(struct platform_device *pdev)
 
 		switch (i) {
 		case 0 ... 31:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_7K_8K_CPS);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_7K_8K_CPS |
+							 V_CP115_STANDALONE));
 			break;
 		case 32 ... 38:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_7K_8K_CPM);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_7K_8K_CPM |
+							 V_CP115_STANDALONE));
 			break;
 		case 39 ... 43:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_8K_CPM);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_8K_CPM |
+							 V_CP115_STANDALONE));
 			break;
 		case 44 ... 62:
-			mvebu_pinctrl_assign_variant(m, V_ARMADA_7K_8K_CPM);
+			mvebu_pinctrl_assign_variant(m, (V_ARMADA_7K_8K_CPM |
+							 V_CP115_STANDALONE));
 			break;
 		}
 	}
-- 
2.20.1

