Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CA6D1492
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731451AbfJIQv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:51:26 -0400
Received: from mga12.intel.com ([192.55.52.136]:59348 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731432AbfJIQvZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="198062689"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 09 Oct 2019 09:51:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9FB7516A; Wed,  9 Oct 2019 19:51:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/5] gpio: merrifield: Restore use of irq_base
Date:   Wed,  9 Oct 2019 19:50:52 +0300
Message-Id: <20191009165056.76580-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During conversion to internal IRQ chip initialization the commit
  8f86a5b4ad67 ("gpio: merrifield: Pass irqchip when adding gpiochip")
lost the irq_base assignment.

drivers/gpio/gpio-merrifield.c: In function ‘mrfld_gpio_probe’:
drivers/gpio/gpio-merrifield.c:405:17: warning: variable ‘irq_base’ set but not used [-Wunused-but-set-variable]

Assign the girq->first to it.

Fixes: 8f86a5b4ad67 ("gpio: merrifield: Pass irqchip when adding gpiochip")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 4f27ddfe1e2f..9596024c9161 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -455,6 +455,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	if (!girq->parents)
 		return -ENOMEM;
 	girq->parents[0] = pdev->irq;
+	girq->first = irq_base;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 
-- 
2.23.0

