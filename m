Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1748E1CA6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 15:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389786AbfJWNcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 09:32:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:6610 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389224AbfJWNcH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Oct 2019 09:32:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 06:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="349394460"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 23 Oct 2019 06:32:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8FB9B1CC; Wed, 23 Oct 2019 16:32:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: cherryview: Fix spelling mistake in the comment
Date:   Wed, 23 Oct 2019 16:32:03 +0300
Message-Id: <20191023133203.61681-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

One spelling mistake is being fixed: benerate -> generate.
It is a complimentary fix to the commit 505485a83c55 ("pinctrl:
cherryview fixed typo in comment").

Fixes: 47c950d10202 ("pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index c31266e70559..5af6b20f7334 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -377,7 +377,7 @@ static const struct chv_community southwest_community = {
 	.gpio_ranges = southwest_gpio_ranges,
 	.ngpio_ranges = ARRAY_SIZE(southwest_gpio_ranges),
 	/*
-	 * Southwest community can benerate GPIO interrupts only for the
+	 * Southwest community can generate GPIO interrupts only for the
 	 * first 8 interrupts. The upper half (8-15) can only be used to
 	 * trigger GPEs.
 	 */
-- 
2.23.0

