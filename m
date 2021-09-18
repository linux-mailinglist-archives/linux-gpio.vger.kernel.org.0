Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B505F410337
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Sep 2021 05:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241007AbhIRDSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 23:18:51 -0400
Received: from mx24.baidu.com ([111.206.215.185]:44720 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234698AbhIRDSs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Sep 2021 23:18:48 -0400
Received: from BJHW-Mail-Ex13.internal.baidu.com (unknown [10.127.64.36])
        by Forcepoint Email with ESMTPS id 9080CA91C5D011A57657;
        Sat, 18 Sep 2021 11:17:23 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 18 Sep 2021 11:17:23 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 18 Sep 2021 11:17:23 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] pinctrl: intel: Kconfig: Add config menu to intel pinctrl
Date:   Sat, 18 Sep 2021 11:17:16 +0800
Message-ID: <20210918031717.18297-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex13_2021-09-18 11:17:23:665
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding a config menu to hold many intel pinctrl drivers
helps to make the display more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Revert to "select PINCTRL_INTE" for PINCTRL_TIGERLAKE config.

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

