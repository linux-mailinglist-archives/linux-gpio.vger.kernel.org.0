Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0978298E0D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2019 10:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732515AbfHVIm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Aug 2019 04:42:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:50447 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731069AbfHVIm4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Aug 2019 04:42:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 01:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="173049819"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2019 01:42:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 65235FC; Thu, 22 Aug 2019 11:42:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dave Hansen <dave.hansen@intel.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Remove staled record for gpio-intel-mid.c
Date:   Thu, 22 Aug 2019 11:42:52 +0300
Message-Id: <20190822084252.61856-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

David Cohen seems left Intel few years back. Remove the staled record in
MAINTAINERS data base. The file is anyway listed under my maintainership.

Reported-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33e6b9e2da9e..3c8cc45c3cc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8446,12 +8446,6 @@ F:	Documentation/x86/intel_txt.rst
 F:	include/linux/tboot.h
 F:	arch/x86/kernel/tboot.c
 
-INTEL-MID GPIO DRIVER
-M:	David Cohen <david.a.cohen@linux.intel.com>
-L:	linux-gpio@vger.kernel.org
-S:	Maintained
-F:	drivers/gpio/gpio-intel-mid.c
-
 INTERCONNECT API
 M:	Georgi Djakov <georgi.djakov@linaro.org>
 L:	linux-pm@vger.kernel.org
-- 
2.23.0.rc1

