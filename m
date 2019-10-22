Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D19AE0AAA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388688AbfJVR3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:40 -0400
Received: from mga18.intel.com ([134.134.136.126]:35678 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388216AbfJVR3a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="209761690"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 22 Oct 2019 10:29:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 29040410; Tue, 22 Oct 2019 20:29:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 08/11] gpio: pca953x: Remove redundant variable and check in IRQ handler
Date:   Tue, 22 Oct 2019 20:29:19 +0300
Message-Id: <20191022172922.61232-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We always will have at least one iteration of the loop due to
pending being guaranteed to be non-zero. That is, we may remove
extra variable and check in the IRQ handler.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 10b669b8f27d..5eee66269a0c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -740,7 +740,6 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	struct pca953x_chip *chip = devid;
 	u8 pending[MAX_BANK];
 	u8 level;
-	unsigned nhandled = 0;
 	int i;
 
 	if (!pca953x_irq_pending(chip, pending))
@@ -752,11 +751,10 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
 							level + (BANK_SZ * i)));
 			pending[i] &= ~(1 << level);
-			nhandled++;
 		}
 	}
 
-	return (nhandled > 0) ? IRQ_HANDLED : IRQ_NONE;
+	return IRQ_HANDLED;
 }
 
 static int pca953x_irq_setup(struct pca953x_chip *chip,
-- 
2.23.0

