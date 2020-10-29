Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C9029EA57
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 12:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgJ2LRf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 07:17:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:37724 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727468AbgJ2LRd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 07:17:33 -0400
IronPort-SDR: sryxUj1OFy/wT9KkR3xqrfAuAES8BAPJsUetZ2eEFD23q8E7vuPwHHsrA+vaBGv4XEOyBcwKsC
 HbJDGi+pf04A==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168514049"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="168514049"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 04:17:31 -0700
IronPort-SDR: QwMMVjFf+VsEdVA/DtGUc4tcodVczIMmzVMs2JuTIw0pCVNHIMCgvdk2Xeuh7SB6wbu0e8Mx7s
 37Dqhu3Ao+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="304403615"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 29 Oct 2020 04:17:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2ACA8567; Thu, 29 Oct 2020 13:17:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Add blank line before endif in Kconfig
Date:   Thu, 29 Oct 2020 13:17:28 +0200
Message-Id: <20201029111728.70196-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a blank line before endif directive in Kconfig for better readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 015f59df4d38..c619097c25b9 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -174,4 +174,5 @@ config PINCTRL_TIGERLAKE
 	help
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Tiger Lake PCH pins and using them as GPIOs.
+
 endif
-- 
2.28.0

