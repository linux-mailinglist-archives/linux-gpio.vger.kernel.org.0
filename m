Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7531A25B8
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 17:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgDHPl7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 11:41:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:61153 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727933AbgDHPl7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 11:41:59 -0400
IronPort-SDR: y2XL3LXfzF9LDOTvVFk8sroZcXbrzfGfIiEoEV2+nNJuaC/ijOn1IKICzUYcjxhqgSYfAFHlfN
 /eHGFY8nmkWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 08:41:58 -0700
IronPort-SDR: ucHdZjIn/sj7gpIQoYjUyInEoM6ATIA+3FRZbFsVcT9Og8PUH+SmOE8na+kKxC2bGkQNarduFc
 yK6+qadnfTow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="361874524"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2020 08:41:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 23B61130; Wed,  8 Apr 2020 18:41:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] gpio: merrifield: Switch over to MSI interrupts
Date:   Wed,  8 Apr 2020 18:41:54 +0300
Message-Id: <20200408154155.68310-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devices may support MSI interrupts. Let's at least try to use them
in platforms that provide MSI capability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fix slipped compilation error
 drivers/gpio/gpio-merrifield.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 48918a016cd8..11e6ea70568a 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -473,6 +473,10 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	raw_spin_lock_init(&priv->lock);
 
+	retval = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (retval < 0)
+		return retval;
+
 	girq = &priv->chip.irq;
 	girq->chip = &mrfld_irqchip;
 	girq->init_hw = mrfld_irq_init_hw;
@@ -482,7 +486,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 				     sizeof(*girq->parents), GFP_KERNEL);
 	if (!girq->parents)
 		return -ENOMEM;
-	girq->parents[0] = pdev->irq;
+	girq->parents[0] = pci_irq_vector(pdev, 0);
 	girq->first = irq_base;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
-- 
2.25.1

