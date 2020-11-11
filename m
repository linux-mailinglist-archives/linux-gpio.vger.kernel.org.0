Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877352AFB4D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgKKWUh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:20:37 -0500
Received: from mga03.intel.com ([134.134.136.65]:26046 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727147AbgKKWUf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 17:20:35 -0500
IronPort-SDR: nDXlKyBZMnK12gRzeTMRYUWamjFk3IivtQsQU5TFtNdWnml1m+Ll6rNwfK+fGjPCgYIsOooqbV
 0+Qls82ecXQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170334870"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="170334870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 14:20:34 -0800
IronPort-SDR: cYd9p43t+UcNluNsT2E8aEm8Ini4oD1PWC8y7FX53/7sX1yUtFB/Yfh03C411koSQKBcqRQHXO
 7gnRryVSPYKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="308629839"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 11 Nov 2020 14:20:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2A742765; Thu, 12 Nov 2020 00:20:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v7 18/18] gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
Date:   Thu, 12 Nov 2020 00:20:08 +0200
Message-Id: <20201111222008.39993-19-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make Intel GPIO tree official for GPIO ACPI work.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..53236b2ea0af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7483,6 +7483,7 @@ M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
 F:	drivers/gpio/gpiolib-acpi.c
 F:	drivers/gpio/gpiolib-acpi.h
-- 
2.28.0

