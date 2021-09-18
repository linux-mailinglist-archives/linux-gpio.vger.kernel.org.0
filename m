Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A39841043A
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Sep 2021 07:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhIRFsJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Sep 2021 01:48:09 -0400
Received: from mx24.baidu.com ([111.206.215.185]:32908 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229627AbhIRFsJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Sep 2021 01:48:09 -0400
Received: from BC-Mail-Ex29.internal.baidu.com (unknown [172.31.51.23])
        by Forcepoint Email with ESMTPS id 93716261FD2CCB86037C;
        Sat, 18 Sep 2021 13:46:36 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex29.internal.baidu.com (172.31.51.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 18 Sep 2021 13:46:36 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 18 Sep 2021 13:46:35 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] pinctrl: intel: Kconfig: Add configuration menu to Intel pin control
Date:   Sat, 18 Sep 2021 13:46:29 +0800
Message-ID: <20210918054630.18544-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding a configuration menu to hold many Intel pin control drivers
helps to make the display more concise.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Revert to "select PINCTRL_INTE" for PINCTRL_TIGERLAKE config.
v2->v3: Update commit message.

 drivers/pinctrl/intel/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index fb1495bd77c4..64f8b37fd705 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Intel pin control drivers
-
-if (X86 || COMPILE_TEST)
+menu "Intel pinctrl drivers"
+	depends on X86 || COMPILE_TEST
 
 config PINCTRL_BAYTRAIL
 	bool "Intel Baytrail GPIO pin control"
@@ -168,4 +168,5 @@ config PINCTRL_TIGERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Tiger Lake PCH pins and using them as GPIOs.
 
-endif
+endmenu
+
-- 
2.25.1

