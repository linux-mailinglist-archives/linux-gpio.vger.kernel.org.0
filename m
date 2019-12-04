Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCD1112B7F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 13:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfLDMbj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 07:31:39 -0500
Received: from mga07.intel.com ([134.134.136.100]:17013 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbfLDMbj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 07:31:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 04:31:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; 
   d="scan'208";a="201385330"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2019 04:31:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E96DA132; Wed,  4 Dec 2019 14:31:35 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Append missed file to the database
Date:   Wed,  4 Dec 2019 14:31:35 +0200
Message-Id: <20191204123135.81630-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When gpiolib.h internal header had been split to few, the commit 77cb907abe6c
("gpiolib: acpi: Split ACPI stuff to gpiolib-acpi.h") in particular missed
the MAINTAINERS database update. Do it here.

Fixes: 77cb907abe6c ("gpiolib: acpi: Split ACPI stuff to gpiolib-acpi.h")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 28b1a500476d..b135f6233ff8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6973,6 +6973,7 @@ L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
 F:	drivers/gpio/gpiolib-acpi.c
+F:	drivers/gpio/gpiolib-acpi.h
 
 GPIO IR Transmitter
 M:	Sean Young <sean@mess.org>
-- 
2.24.0

