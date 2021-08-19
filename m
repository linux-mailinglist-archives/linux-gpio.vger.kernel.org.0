Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FBE3F21BA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 22:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbhHSUkh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 16:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39843 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235310AbhHSUkh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Aug 2021 16:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629405599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=c58jGoMKtMKL80DiaKHPNZ0/KDbrU7uGcaG4GNpRulU=;
        b=JoKglsAt3HtZ1XX/DRTSi18fPcZYB3KS0VbJlOZpCC0Qx0aeF/m6eHdNJEvfJMSbNlZ0fE
        H1jQ3/C9DRvTywqVomiJZsQtOJX5q9/LgD84su9BbZoIHuztLtQ/rEPuQ2ldOZDqyL7wQD
        0UirKLr2NfvZlDCo6seh+X2ablN3vgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-3X_slzprMH-gZc18003JMQ-1; Thu, 19 Aug 2021 16:39:57 -0400
X-MC-Unique: 3X_slzprMH-gZc18003JMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80487802B9E;
        Thu, 19 Aug 2021 20:39:56 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6691970E;
        Thu, 19 Aug 2021 20:39:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: baytrail: Pick first supported debounce value larger then the requested value
Date:   Thu, 19 Aug 2021 22:39:52 +0200
Message-Id: <20210819203952.785132-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bay Trail pin control only supports a couple of discrete debounce timeout
values. Instead of returning -EINVAL for other values, pick the first
supported debounce timeout value larger then the requested timeout.

E.g. on a HP ElitePad 1000 G2, where the ACPI tables specify a timeout of
20 ms for various _AIE ACPI event sources, this will result in a timeout
of 24 ms instead of returning -EINVAL to the caller.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 59 ++++++++----------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 394a421a19d5..fb3f84c1c136 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -981,6 +981,8 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			      unsigned long *configs,
 			      unsigned int num_configs)
 {
+	/* See BYT_DEBOUNCE_REG definitions */
+	const unsigned int db_timeouts[] = { 0, 375, 750, 1500, 3000, 6000, 12000, 24000 };
 	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
 	unsigned int param, arg;
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
@@ -988,7 +990,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 	void __iomem *db_reg = byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG);
 	unsigned long flags;
 	u32 conf, val, debounce;
-	int i, ret = 0;
+	int i, j, ret = 0;
 
 	raw_spin_lock_irqsave(&byt_lock, flags);
 
@@ -1048,50 +1050,25 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 
 			break;
 		case PIN_CONFIG_INPUT_DEBOUNCE:
-			debounce = readl(db_reg);
-
-			if (arg)
-				conf |= BYT_DEBOUNCE_EN;
-			else
+			if (!arg) {
 				conf &= ~BYT_DEBOUNCE_EN;
-
-			switch (arg) {
-			case 375:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_375US;
-				break;
-			case 750:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_750US;
-				break;
-			case 1500:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_1500US;
-				break;
-			case 3000:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_3MS;
-				break;
-			case 6000:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_6MS;
-				break;
-			case 12000:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_12MS;
-				break;
-			case 24000:
-				debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
-				debounce |= BYT_DEBOUNCE_PULSE_24MS;
-				break;
-			default:
-				if (arg)
-					ret = -EINVAL;
 				break;
 			}
 
-			if (!ret)
-				writel(debounce, db_reg);
+			conf |= BYT_DEBOUNCE_EN;
+
+			for (j = 0; arg > db_timeouts[j]; j++) {
+				if ((j + 1) == ARRAY_SIZE(db_timeouts)) {
+					dev_dbg(vg->dev,
+						"pin %u requested timeout of %u exceeds max timeout of %u\n",
+						offset, arg, db_timeouts[j]);
+					break;
+				}
+			}
+			debounce = readl(db_reg);
+			debounce &= ~BYT_DEBOUNCE_PULSE_MASK;
+			debounce |= j;
+			writel(debounce, db_reg);
 			break;
 		default:
 			ret = -ENOTSUPP;
-- 
2.31.1

