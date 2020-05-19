Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362491D9746
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 15:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgESNMk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 09:12:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:10267 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728945AbgESNMi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 May 2020 09:12:38 -0400
IronPort-SDR: 0YmVRXfBSuxxeea/Nkae2tVCwVaSNT+VwST+Z22eaDE8WccEAixqY3I8EmaPtix2PpcBmN9dw6
 zX6z9jpkk+jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 06:12:37 -0700
IronPort-SDR: GXyJHo0OZg+0iA1K6TGdWhCVLUn45IR1AkhcYU7rDi/zv6DEers5bhVSedogKpWnGP8JoNKq1q
 rDuBfeCTpTZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="439613509"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 19 May 2020 06:12:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9BA24BD; Tue, 19 May 2020 16:12:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v3 2/4] gpio: dwapb: avoid error message for optional IRQ
Date:   Tue, 19 May 2020 16:12:31 +0300
Message-Id: <20200519131233.59032-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
References: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

platform_get_irq() will generate an error message if the requested IRQ
is not present. Use platform_get_irq_optional() to avoid the error message
being generated.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
v3: appended tags (Serge)

 drivers/gpio/gpio-dwapb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e5d844304f8d..944dae80d687 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -549,7 +549,7 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 		if (np)
 			pp->irq[j] = of_irq_get(np, j);
 		else if (has_acpi_companion(dev))
-			pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
+			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
 
 		if (pp->irq[j] >= 0)
 			pp->has_irq = true;
-- 
2.26.2

