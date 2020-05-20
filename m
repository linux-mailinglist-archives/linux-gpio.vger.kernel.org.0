Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEDAA1DB2C1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 14:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETMKA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 08:10:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:13474 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETMJ7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 May 2020 08:09:59 -0400
IronPort-SDR: 3tJTlDTcmPH0Xb3CAMmd5eKvMr9FmuM7FZM4gpYRZRM9/vi/n4yhZbOH5cmjyFwVen8U91ZJEQ
 bm7zZYFVgW6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 05:09:59 -0700
IronPort-SDR: Hz/nHdxZcFWE4bN1Y+ZoCTkGFWM9g/x83V/BAy9iL6n3DUhqjUY54II22baERzixBGOT1wNWyN
 uwl3hHamXmUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="264663466"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 20 May 2020 05:09:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 35253101; Wed, 20 May 2020 15:09:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: [PATCH v1] MAINTAINERS: Fix file name for DesignWare GPIO DT schema
Date:   Wed, 20 May 2020 15:09:55 +0300
Message-Id: <20200520120955.68427-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit 657a06df993c
  ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")
missed MAINTAINERS update.

Fixes: 657a06df993c ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 146dba1e3b53..e372dc9c6e40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16370,7 +16370,7 @@ M:	Hoan Tran <hoan@os.amperecomputing.com>
 M:	Serge Semin <fancer.lancer@gmail.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+F:	Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
 F:	drivers/gpio/gpio-dwapb.c
 
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
-- 
2.26.2

