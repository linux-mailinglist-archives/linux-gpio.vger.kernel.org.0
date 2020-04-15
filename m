Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2F01AA9AF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636537AbgDOOQ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:43702 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636539AbgDOOPl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:41 -0400
IronPort-SDR: kkfOFbchQt/g4jVW7J13BUURN1eSCqM/8dE0fRs5xBDBKsSht7A+ICF4xDfEzTWaIXkyU3n+LM
 lccAoJbra7hA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:38 -0700
IronPort-SDR: J5qQDhVsezmxea/Fk2X1ovJ/bXOqmxPzLAi1xZGG4fZC6XGvaswuY0bbsDZXfQXCy3d2gwV3O9
 NubxjPdrmvbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="277627679"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 07:15:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A29CF638; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 03/14] gpio: dwapb: Use chained IRQ prologue and epilogue
Date:   Wed, 15 Apr 2020 17:15:23 +0300
Message-Id: <20200415141534.31240-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor IRQ handler in order to enter and exit chained IRQ by using
respective prologue and epilogue calls.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e89a3c6877aa..f61139f787d9 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -215,10 +215,9 @@ static void dwapb_irq_handler(struct irq_desc *desc)
 	struct dwapb_gpio *gpio = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
+	chained_irq_enter(chip, desc);
 	dwapb_do_irq(gpio);
-
-	if (chip->irq_eoi)
-		chip->irq_eoi(irq_desc_get_irq_data(desc));
+	chained_irq_exit(chip, desc);
 }
 
 static void dwapb_irq_enable(struct irq_data *d)
-- 
2.25.1

