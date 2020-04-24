Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720941B7057
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 11:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgDXJNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 05:13:21 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:37154 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgDXJNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 05:13:21 -0400
Received: from localhost (unknown [192.168.167.209])
        by lucky1.263xmail.com (Postfix) with ESMTP id 630A9B1E84;
        Fri, 24 Apr 2020 17:13:15 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [113.57.152.160])
        by smtp.263.net (postfix) whith ESMTP id P17634T139992827418368S1587719594268319_;
        Fri, 24 Apr 2020 17:13:15 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b887aa9ef3120df775ab07e15fb52640>
X-RL-SENDER: caizhaopeng@uniontech.com
X-SENDER: caizhaopeng@uniontech.com
X-LOGIN-NAME: caizhaopeng@uniontech.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   caizhaopeng@uniontech.com
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhangyueqian <zhangyueqian@uniontech.com>,
        Zhangshuang <zhangshuang@uniontech.com>,
        Hualet Wang <wangyaohua@uniontech.com>,
        Zhanglei <zhanglei@uniontech.com>,
        Caicai <caizhaopeng@uniontech.com>
Subject: [PATCH 1/1] pinctrl: add IRQF_EARLY_RESUME flags with gpio irq for elan touchpad.
Date:   Fri, 24 Apr 2020 17:12:01 +0800
Message-Id: <20200424091201.568-1-caizhaopeng@uniontech.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Caicai <caizhaopeng@uniontech.com>

I had tested two Notebook machines, the Intel i5(or amd ryzen)
with elan touchpad, and there's a probability that the touchpad
won't work after going to the S3/S4 to wake up, that it would
appear no more than 15 times. I found that there's no interrupt
to check for /proc/interrupt. It was found that the gpio
interrupt of i2c was also not on top. By adding the gpio
interrupt flags with IRQF_EARLY_RESUME, now the touchpad tested
200 + times works well.

Signed-off-by: Caicai <caizhaopeng@uniontech.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 drivers/pinctrl/pinctrl-amd.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8fb6c9668c37..a350dade6aa0 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1189,7 +1189,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	 * controllers share the same interrupt line.
 	 */
 	ret = devm_request_irq(pctrl->dev, irq, intel_gpio_irq,
-			       IRQF_SHARED | IRQF_NO_THREAD,
+			       IRQF_SHARED | IRQF_NO_THREAD | IRQF_EARLY_RESUME,
 			       dev_name(pctrl->dev), pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "failed to request interrupt\n");
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 977792654e01..70c37f4da2b1 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -937,7 +937,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
-			       IRQF_SHARED, KBUILD_MODNAME, gpio_dev);
+			       IRQF_SHARED | IRQF_EARLY_RESUME | IRQF_NO_THREAD, KBUILD_MODNAME, gpio_dev);
 	if (ret)
 		goto out2;
 
-- 
2.20.1



