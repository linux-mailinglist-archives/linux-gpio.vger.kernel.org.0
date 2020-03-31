Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B96199981
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 17:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbgCaPYd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 11:24:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:3924 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730521AbgCaPYc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 11:24:32 -0400
IronPort-SDR: ul8Nv2c8mdwp1DKo867dbvtd1JsPMyOsTMYSI4r1Z6Jic3DPzxXVyDwnec5s8Di+GfrWnstE59
 qCdNZah733Ww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 08:24:32 -0700
IronPort-SDR: Tklf92seofkrhXckWfBN73bM2Ltjkj0TUmqF72HdMoKRC/qTxfNGHFraaYR4o5tHYe/vPUVVgo
 7LDeEK8wo+aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="240160890"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 31 Mar 2020 08:24:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D8A8A202; Tue, 31 Mar 2020 18:24:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: baytrail: Enable pin configuration setting for GPIO chip
Date:   Tue, 31 Mar 2020 18:24:28 +0300
Message-Id: <20200331152428.33951-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that pin configuration for GPIO chip hasn't been enabled yet
due to absence of ->set_config() callback.

Enable it here for Intel Baytrail.

Fixes: c501d0b149de ("pinctrl: baytrail: Add pin control operations")
Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b409642f168d..9b821c9cbd16 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1286,6 +1286,7 @@ static const struct gpio_chip byt_gpio_chip = {
 	.direction_output	= byt_gpio_direction_output,
 	.get			= byt_gpio_get,
 	.set			= byt_gpio_set,
+	.set_config		= gpiochip_generic_config,
 	.dbg_show		= byt_gpio_dbg_show,
 };
 
-- 
2.25.1

