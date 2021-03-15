Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0373C33C316
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 18:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbhCOQ7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 12:59:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:55510 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235668AbhCOQ7m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 12:59:42 -0400
IronPort-SDR: sJIeE9euBofcomPq9yUs+EL9vFV/YjmsR2pcHQoEpmxzdNc+ERvHkF6ZWryclYCzsTiCV2N3kX
 es3Mlb6APMHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="185762519"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="185762519"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 09:59:35 -0700
IronPort-SDR: O1KgmCu6J0NYNnGJsugDJFrFULa6LymUokuMP5YVccGNvzMcEFU2VygNegs39X7ir8R/SitPD3
 ydtPj/ieXPmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="388161101"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 15 Mar 2021 09:59:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0C34D11C; Mon, 15 Mar 2021 18:59:45 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v1 1/1] gpio: mockup: Adjust documentation to the code
Date:   Mon, 15 Mar 2021 18:59:40 +0200
Message-Id: <20210315165940.90055-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

First of all one of the parameter missed 'mockup' in its name,
Second, the semantics of the integer pairs depends on the sign
of the base (the first value in the pair).

Update documentation to reflect the real code behaviour.

Fixes: 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/admin-guide/gpio/gpio-mockup.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
index 9fa1618b3adc..493071da1738 100644
--- a/Documentation/admin-guide/gpio/gpio-mockup.rst
+++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
@@ -17,17 +17,18 @@ module.
     gpio_mockup_ranges
 
         This parameter takes an argument in the form of an array of integer
-        pairs. Each pair defines the base GPIO number (if any) and the number
-        of lines exposed by the chip. If the base GPIO is -1, the gpiolib
-        will assign it automatically.
+        pairs. Each pair defines the base GPIO number (non-negative integer)
+        and the first number after the last of this chip. If the base GPIO
+        is -1, the gpiolib will assign it automatically. while the following
+        parameter is the number of lines exposed by the chip.
 
-        Example: gpio_mockup_ranges=-1,8,-1,16,405,4
+        Example: gpio_mockup_ranges=-1,8,-1,16,405,409
 
         The line above creates three chips. The first one will expose 8 lines,
         the second 16 and the third 4. The base GPIO for the third chip is set
         to 405 while for two first chips it will be assigned automatically.
 
-    gpio_named_lines
+    gpio_mockup_named_lines
 
         This parameter doesn't take any arguments. It lets the driver know that
         GPIO lines exposed by it should be named.
-- 
2.30.2

