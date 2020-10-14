Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5CB28DF4B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 12:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgJNKqm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 06:46:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:31115 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbgJNKqm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 06:46:42 -0400
IronPort-SDR: qh2mYOuYQsk6a4h5bG+VluO/EILkzSCoNGf/Jevhidl0kdU4hxkaFRpcLsZfkUmv0EhE6oQJs7
 KmJo0bQ8hCjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="227716291"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="227716291"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:46:41 -0700
IronPort-SDR: SvNSsts5gCV/a0HB+paiIVMnCBdqlAGcm9gLdyXcnX3dhiVJcKfON65snCjRe8R8exnyBCdN3S
 4qy9lpn0yDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="357340666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2020 03:46:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1967511E; Wed, 14 Oct 2020 13:46:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: [PATCH v1 2/2] pinctrl: intel: Set default bias in case no particular value given
Date:   Wed, 14 Oct 2020 13:46:38 +0300
Message-Id: <20201014104638.84043-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
References: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
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

In case of Intel pin control hardware the 5 kOhm sounds plausible
because on one hand it's a minimum of resistors present in all
hardware generations and at the same time it's high enough to minimize
leakage current (will be only 200 uA with the above choice).

Fixes: e57725eabf87 ("pinctrl: intel: Add support for hardware debouncer")
Reported-by: Jamie McClymont <jamie@kwiius.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index df626643f9e4..6d23137489c1 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -693,6 +693,10 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 
 		value |= PADCFG1_TERM_UP;
 
+		/* Set default strength value in case none is given */
+		if (arg == 1)
+			arg = 5000;
+
 		switch (arg) {
 		case 20000:
 			value |= PADCFG1_TERM_20K << PADCFG1_TERM_SHIFT;
@@ -715,6 +719,10 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		value &= ~(PADCFG1_TERM_UP | PADCFG1_TERM_MASK);
 
+		/* Set default strength value in case none is given */
+		if (arg == 1)
+			arg = 5000;
+
 		switch (arg) {
 		case 20000:
 			value |= PADCFG1_TERM_20K << PADCFG1_TERM_SHIFT;
-- 
2.28.0

