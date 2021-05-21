Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B332B38C283
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 11:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbhEUJDa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 05:03:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:46108 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234424AbhEUJD3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 05:03:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 16978AAA6;
        Fri, 21 May 2021 09:02:06 +0000 (UTC)
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: bcm2835: Accept fewer than expected IRQs
Date:   Fri, 21 May 2021 12:01:58 +0300
Message-Id: <20210521090158.26932-1-iivanov@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Phil Elwell <phil@raspberrypi.com>

The downstream .dts files only request two GPIO IRQs. Truncate the
array of parent IRQs when irq_of_parse_and_map returns 0.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 1d21129f7751..2c87af1180c4 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1274,9 +1274,13 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		char *name;
 
 		girq->parents[i] = irq_of_parse_and_map(np, i);
-		if (!is_7211)
+		if (!is_7211) {
+			if (!girq->parents[i]) {
+				girq->num_parents = i;
+				break;
+			}
 			continue;
-
+		}
 		/* Skip over the all banks interrupts */
 		pc->wake_irq[i] = irq_of_parse_and_map(np, i +
 						       BCM2835_NUM_IRQS + 1);
-- 
2.31.1

