Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CFDD2BA2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 15:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbfJJNpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 09:45:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37890 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726237AbfJJNpI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Oct 2019 09:45:08 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2663CC7C4C3D4A6B3ACC;
        Thu, 10 Oct 2019 21:45:06 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 21:44:58 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <andriy.shevchenko@linux.intel.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <linux-gpio@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH] gpio: merrifield: Remove set but not used variable 'irq_base'
Date:   Thu, 10 Oct 2019 21:52:09 +0800
Message-ID: <1570715529-110344-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpio/gpio-merrifield.c: In function mrfld_gpio_probe:
drivers/gpio/gpio-merrifield.c:402:17: warning: variable irq_base set but not used [-Wunused-but-set-variable]

It is not used since commit 8f86a5b4ad67 ("gpio: merrifield:
Pass irqchip when adding gpiochip")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpio/gpio-merrifield.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 4f27ddf..8d62e0a 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -399,7 +399,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	const char *pinctrl_dev_name;
 	struct gpio_irq_chip *girq;
 	struct mrfld_gpio *priv;
-	u32 gpio_base, irq_base;
+	u32 gpio_base;
 	void __iomem *base;
 	unsigned int i;
 	int retval;
@@ -416,7 +416,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id

 	base = pcim_iomap_table(pdev)[1];

-	irq_base = readl(base);
+	readl(base);
 	gpio_base = readl(sizeof(u32) + base);

 	/* Release the IO mapping, since we already get the info from BAR1 */
--
2.7.4

