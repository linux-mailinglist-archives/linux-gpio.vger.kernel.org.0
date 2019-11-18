Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0EB1006D5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfKRNxB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:53:01 -0500
Received: from mga14.intel.com ([192.55.52.115]:60016 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbfKRNxB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 08:53:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 05:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; 
   d="scan'208";a="406091366"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2019 05:52:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 246092D5; Mon, 18 Nov 2019 15:52:58 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Replace my email by one @kernel.org
Date:   Mon, 18 Nov 2019 15:52:58 +0200
Message-Id: <20191118135258.37574-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For the repositories we keep on git.kernel.org replace my email
to be on the same domain for sake of consistency.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f11e6ceb244..ec467bf0340f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12864,7 +12864,7 @@ F:	Documentation/devicetree/bindings/pinctrl/fsl,*
 
 PIN CONTROLLER - INTEL
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
-M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+M:	Andy Shevchenko <andy@kernel.org>
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
 S:	Maintained
 F:	drivers/pinctrl/intel/
-- 
2.24.0

