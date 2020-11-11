Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF12AEFB5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 12:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgKKLet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 06:34:49 -0500
Received: from mga11.intel.com ([192.55.52.93]:3693 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgKKLen (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 06:34:43 -0500
IronPort-SDR: mzuhsxlPeDK1gilIGMa50Hp7ll471t0+JXm2y0PJ3zG/iKAcKMPeErJuLLjDTuOwmIZU3+sZIR
 CtBdSE+k2tlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166622823"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="166622823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 03:34:35 -0800
IronPort-SDR: VpMthXpH50YP+maPjsdaeo4OqlBzTbofruPomQHMLK00esJCxe4yZd9hZB3OTcXqOvNkVl5kP0
 FjU0qV0+kPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="339044942"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2020 03:34:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2F2D2A7; Wed, 11 Nov 2020 13:34:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] pinctrl: lynxpoint: Enable pin configuration setting for GPIO chip
Date:   Wed, 11 Nov 2020 13:34:32 +0200
Message-Id: <20201111113432.35641-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
References: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that pin configuration for GPIO chip hasn't been enabled yet
due to absence of ->set_config() callback.

Enable it here for Intel Lynxpoint PCH.

Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 2e9670fc479a..0a48ca46ab59 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -874,6 +874,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->direction_output = lp_gpio_direction_output;
 	gc->get = lp_gpio_get;
 	gc->set = lp_gpio_set;
+	gc->set_config = gpiochip_generic_config;
 	gc->get_direction = lp_gpio_get_direction;
 	gc->base = -1;
 	gc->ngpio = LP_NUM_GPIO;
-- 
2.28.0

