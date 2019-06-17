Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F8E48CCF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfFQSlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35253 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbfFQSlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:37 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MhUDl-1iFYm80Vff-00eexp; Mon, 17 Jun 2019 20:41:15 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     thloh@altera.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 01/30] include: linux: platform_device: more helpers for declaring platform drivers
Date:   Mon, 17 Jun 2019 20:40:42 +0200
Message-Id: <1560796871-18560-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:vh3WgaKAfp/7utsDwGStG8lhMEJOLPpqeqqOIPZUy69iRDhMgUT
 YLO0VVH9+WSHOOP9Z9lTkwLZQut5VFowC3UxPBimZV2gDZsASGuddTCo4Ns+x279im1k6P6
 DvVmuitj/sUJGSikRzupru9N53/CfW5itFY6p4aDEVz9PvxnW7pBVq3Fmi/cVgqMjBnVHGa
 GhxJ055QzOASmoYXb/xGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pncoYwVZfPU=:I4jSkF7FQyUU1Sq0ZMKvoJ
 hrJzfvo2len4wsFtN0hwymlMcBge1MDGz+loqbRkJ8CW/uRDselgl9z8OUHkvxhAJwTUPCoK2
 5LRdxHWKDEVzf+MuRQjoI+ISMzc40B9oTOcQXNJn3uxLp24Zf0lG++O4eNVoKQJk32AVy3b6T
 7z80l+YlX2u6QXjMp2DzSlFJ5FwvWeJ2nTmoWP8EpQeg8OoAf/ecvdpSWa7ZjRgf3udyWH7Fm
 YTcg2Rho7x7lehyZlIG+aFWHsQqBlWWsAa2cKA0/W8Nlk4QHva+ZiPenQ4qo+tavkhrew/M1J
 99WAeRqb8RxlmqjxXqIVewncVfPRIbnHN4lm53x1O4kYrdlRETFiqL3wsiLhsU6pb7OhSpcke
 H01Gpa7OSgdd+7tbdwfSE2dnCuhFHgxdI9iP2KiBrO08v6ihVnsWKvCjCdsBr0wd0c/vmqaaD
 cOC+hxmoLR4uO7790+Uwko4cRo813Uc1adwb/A7nrMNIWc3D1yWASdCxy0X14MJ5ewLUt3EMS
 04MllSWdEijwsXKnH9zr+YctR/GxkORREQwZab5xab0l6k+QY4bGbB1FH1I6l1cMBHHJ0EYMf
 xUbRGtlHTBwRBpR7kHDfTij/AkHg00n1c4hTwOWu7/YHW1ud65SgcWkdAVvYU8Mr1ylUhXiUU
 1LeCBRSQvuBLsKgKGHNygUZdlvOtR7m3hQ+MhrZslo8e24+3/0fbPcwoAc1RtbmIk3gFaYxiZ
 TlsWX1yXNmkScOxTVP7Gxd5Jxz50lkfGbbRVwQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Add more helper macros for trivial driver init cases, similar to the
already existing module_platform_driver()+friends - now for those which
are initialized at other stages. Lots of drivers couldn't use the existing
macros, as they need to be called at different init stages, eg. subsys,
postcore, arch.

This helps to further reduce driver init boilerplate.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/platform_device.h | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index beb25f2..5f3a967 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -259,6 +259,57 @@ static inline void platform_set_drvdata(struct platform_device *pdev,
 } \
 module_exit(__platform_driver##_exit);
 
+/* postcore_platform_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces postcore_initcall() and module_exit()
+ */
+#define postcore_platform_driver(__platform_driver) \
+static int __init __platform_driver##_init(void) \
+{ \
+	return platform_driver_register(&(__platform_driver)); \
+} \
+postcore_initcall(__platform_driver##_init); \
+static void __exit __platform_driver##_exit(void) \
+{ \
+	platform_driver_unregister(&(__platform_driver)); \
+} \
+module_exit(__platform_driver##_exit);
+
+/* subsys_platform_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces subsys_initcall() and module_exit()
+ */
+#define subsys_platform_driver(__platform_driver) \
+static int __init __platform_driver##_init(void) \
+{ \
+	return platform_driver_register(&(__platform_driver)); \
+} \
+subsys_initcall(__platform_driver##_init); \
+static void __exit __platform_driver##_exit(void) \
+{ \
+	platform_driver_unregister(&(__platform_driver)); \
+} \
+module_exit(__platform_driver##_exit);
+
+/* arch_platform_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces arch_initcall() and module_exit()
+ */
+#define arch_platform_driver(__platform_driver) \
+static int __init __platform_driver##_init(void) \
+{ \
+	return platform_driver_register(&(__platform_driver)); \
+} \
+arch_initcall(__platform_driver##_init); \
+static void __exit __platform_driver##_exit(void) \
+{ \
+	platform_driver_unregister(&(__platform_driver)); \
+} \
+module_exit(__platform_driver##_exit);
+
 /* builtin_platform_driver_probe() - Helper macro for drivers that don't do
  * anything special in device init.  This eliminates some boilerplate.  Each
  * driver may only use this macro once, and using it replaces device_initcall.
-- 
1.9.1

