Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEED358798
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhDHO4F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:56:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:31802 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231630AbhDHO4D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 10:56:03 -0400
IronPort-SDR: uOo1kMmi3yOSA+hixSM7/2r7ALftnR7X91qtJD+vUzeQjtGqUNPjDU8z5upzG621lfgU2wyqFb
 YWF48vzic5xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278832332"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="278832332"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:55:52 -0700
IronPort-SDR: xLnxC6AVhroBeVuXPsCn8pBUA58qZJNQdg7tO32LBdcgIIPOhroycBeWwjKQsvSReo/JJDNBiv
 7aGJB7DrDP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="530626168"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 08 Apr 2021 07:55:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 15ED3567; Thu,  8 Apr 2021 17:56:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: [PATCH v1 2/5] gpio: xilinx: Correct kernel doc for xgpio_probe()
Date:   Thu,  8 Apr 2021 17:55:58 +0300
Message-Id: <20210408145601.68651-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel doc validator complains:

.../gpio-xilinx.c:556: warning: expecting prototype for xgpio_of_probe(). Prototype was for xgpio_probe() instead

Correct as suggested by changing the name of the function in the doc..

Fixes: 749564ffd52d ("gpio/xilinx: Convert the driver to platform device interface")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index b411d3156e0b..136557e7dd3c 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -542,7 +542,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 }
 
 /**
- * xgpio_of_probe - Probe method for the GPIO device.
+ * xgpio_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
  *
  * Return:
-- 
2.30.2

