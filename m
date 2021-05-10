Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A353797E1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhEJTrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:47:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:3451 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhEJTrl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:47:41 -0400
IronPort-SDR: S/yazZz7i+6+9E4Vvi4fYJ9O0mfnDexH6R2ybKnuQ14rBPkwveeOqNLL+cLP9/Vo3nJ+bts+Gu
 q1SwMpcoA2Kw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="263203738"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="263203738"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:46:35 -0700
IronPort-SDR: AdpFx4UlgHPf6vAd0jzLHCjErUuPp+cPqvtnfZhXnA7ynTyb6T1Nk0JuWV0dsBCrLO8VCbm2hp
 NqBhlc79EA2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="430025425"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2021 12:46:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CDE3812A; Mon, 10 May 2021 22:46:52 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Neeli Srinivas <sneeli@xilinx.com>
Subject: [PATCH v2 2/5] gpio: xilinx: Correct kernel doc for xgpio_probe()
Date:   Mon, 10 May 2021 22:46:30 +0300
Message-Id: <20210510194633.11943-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
References: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
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
Tested-by: Neeli Srinivas <sneeli@xilinx.com>
Reviewed-by: Michal Simek <michal.simek@xilinx.com>
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

