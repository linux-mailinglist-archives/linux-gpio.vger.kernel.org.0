Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10F66E94FF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 14:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbjDTMrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 08:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbjDTMrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 08:47:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2757AB7;
        Thu, 20 Apr 2023 05:47:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 495736494F;
        Thu, 20 Apr 2023 12:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56348C4339E;
        Thu, 20 Apr 2023 12:47:07 +0000 (UTC)
Message-ID: <4302b66b-ca20-0f19-d2aa-ee8661118863@xs4all.nl>
Date:   Thu, 20 Apr 2023 14:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rpi-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] pinctrl-bcm2835.c: fix race condition when setting gpio dir
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the past setting the pin direction called pinctrl_gpio_direction()
which uses a mutex to serialize this. That was changed to set the
direction directly in the pin controller driver, but that lost the
serialization mechanism. Since the direction of multiple pins are in
the same register you can have a race condition, something that was
in fact observed with the cec-gpio driver.

Add a new spinlock to serialize writing to the FSEL registers.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 1a4541b68e25 ("pinctrl-bcm2835: don't call pinctrl_gpio_direction()")
---
Changes since v1:
- use 'goto unlock' as per Stefan's suggestion
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 8e2551a08c37..7435173e10f4 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -90,6 +90,8 @@ struct bcm2835_pinctrl {
 	struct pinctrl_gpio_range gpio_range;

 	raw_spinlock_t irq_lock[BCM2835_NUM_BANKS];
+	/* Protect FSEL registers */
+	spinlock_t fsel_lock;
 };

 /* pins are just named GPIO0..GPIO53 */
@@ -284,14 +286,19 @@ static inline void bcm2835_pinctrl_fsel_set(
 		struct bcm2835_pinctrl *pc, unsigned pin,
 		enum bcm2835_fsel fsel)
 {
-	u32 val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
-	enum bcm2835_fsel cur = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
+	u32 val;
+	enum bcm2835_fsel cur;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pc->fsel_lock, flags);
+	val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
+	cur = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;

 	dev_dbg(pc->dev, "read %08x (%u => %s)\n", val, pin,
-			bcm2835_functions[cur]);
+		bcm2835_functions[cur]);

 	if (cur == fsel)
-		return;
+		goto unlock;

 	if (cur != BCM2835_FSEL_GPIO_IN && fsel != BCM2835_FSEL_GPIO_IN) {
 		/* always transition through GPIO_IN */
@@ -309,6 +316,9 @@ static inline void bcm2835_pinctrl_fsel_set(
 	dev_dbg(pc->dev, "write %08x (%u <= %s)\n", val, pin,
 			bcm2835_functions[fsel]);
 	bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
+
+unlock:
+	spin_unlock_irqrestore(&pc->fsel_lock, flags);
 }

 static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -1248,6 +1258,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	pc->gpio_chip = *pdata->gpio_chip;
 	pc->gpio_chip.parent = dev;

+	spin_lock_init(&pc->fsel_lock);
 	for (i = 0; i < BCM2835_NUM_BANKS; i++) {
 		unsigned long events;
 		unsigned offset;
-- 
2.39.2

