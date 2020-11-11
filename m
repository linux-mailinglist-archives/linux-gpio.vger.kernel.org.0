Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DC72AF03D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 13:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgKKMGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 07:06:12 -0500
Received: from mga07.intel.com ([134.134.136.100]:45707 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgKKMGM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 07:06:12 -0500
IronPort-SDR: JmIBS0NtO0WwMqxFYzWTV/IOQMJHLjOZO8k7cTH15FOe6jAeTCaU6jiEa4QVq0pM+LKxR0b2Vi
 pvGegrIq2Aug==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="234301703"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="234301703"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 04:06:08 -0800
IronPort-SDR: iQ3StTC6gxNLiI2It0d6PNWE1/WUVbd46zetql/gxs/DwLrBtYweNx/sZhdsu/ph6jyjPgeyOa
 0985jCUM+yeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="308802075"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2020 04:06:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D329AB1; Wed, 11 Nov 2020 14:06:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: merrifield: Set default bias in case no particular value given
Date:   Wed, 11 Nov 2020 14:06:05 +0200
Message-Id: <20201111120605.50881-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When GPIO library asks pin control to set the bias, it doesn't pass
any value of it and argument is considered boolean (and this is true
for ACPI GpioIo() / GpioInt() resources, by the way). Thus, individual
drivers must behave well, when they got the resistance value of 1 Ohm,
i.e. transforming it to sane default.

In case of Intel Merrifield pin control hardware the 20 kOhm sounds plausible
because it gives a good trade off between weakness and minimization of leakage
current (will be only 50 uA with the above choice).

Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-merrifield.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index e4ff8da1b894..3ae141e0b421 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -745,6 +745,10 @@ static int mrfld_config_set_pin(struct mrfld_pinctrl *mp, unsigned int pin,
 		mask |= BUFCFG_Px_EN_MASK | BUFCFG_PUPD_VAL_MASK;
 		bits |= BUFCFG_PU_EN;
 
+		/* Set default strength value in case none is given */
+		if (arg == 1)
+			arg = 20000;
+
 		switch (arg) {
 		case 50000:
 			bits |= BUFCFG_PUPD_VAL_50K << BUFCFG_PUPD_VAL_SHIFT;
@@ -765,6 +769,10 @@ static int mrfld_config_set_pin(struct mrfld_pinctrl *mp, unsigned int pin,
 		mask |= BUFCFG_Px_EN_MASK | BUFCFG_PUPD_VAL_MASK;
 		bits |= BUFCFG_PD_EN;
 
+		/* Set default strength value in case none is given */
+		if (arg == 1)
+			arg = 20000;
+
 		switch (arg) {
 		case 50000:
 			bits |= BUFCFG_PUPD_VAL_50K << BUFCFG_PUPD_VAL_SHIFT;
-- 
2.28.0

