Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0F248BCE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfFQSVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:21:33 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33719 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbfFQSVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:21:33 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOiLv-1hz7Zu2SKd-00QDnE; Mon, 17 Jun 2019 20:21:29 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] include: linux: siox: more for declaring siox drivers
Date:   Mon, 17 Jun 2019 20:21:27 +0200
Message-Id: <1560795688-10496-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:7vJ2wmrYmI0W61NHnr71bP7yY7E8eVO9YdLHqHSjhdkXZiNtYsb
 +8TGp7y/lXo+Wipqdrmr2v5k+SYlBo+t0bEWlrvOsL1AK2CM4uat3gBdMZIl6etlpVzhIKf
 jNrxVMUfdRsMgRyw5Cy62zrWeidUjpzzkfZfLT8Ncv6tPH2AueDdnc6cMPVHkuHIyq9uBC7
 E1Rd+MZRBnRtYXLH+Ytlg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8DuedVSRE1A=:KWUGVJkw3ZcjpE1Yj1toIN
 7170cXlAl2oWnaM6EUXEsaYNJDOXocPc6YWzEI+TrLtCAQMeeZIQh9PJo3JId7sYgKWpt9fYY
 1QTyNs0Ex8fGHLw4FSZ390w6XHCeML7umYIEwFkkA3zGN7+CeIWEWejX8Hhs+EEIzen4AP7CX
 8WrVOhiPV270wDd12w1oz6e4Acg6kWpFRaEuz7/3SyK+giPsSWONJM4sfCuIH3mFKqjphQHEw
 QDoAVOSv0pkxUQy4Hp03nUjJZV4IoX2lQMiu9xr7s89AGtNDWX8jDK5YgcjCfSJ/o7snEVINm
 JP1yGGeRiKdGCaslaC0OdpX1AcUQ4x1130JbFbvha7YWcDWkUtIWcUUFKpVUzKxIACiAju4do
 OkwhHvnUML+buGtoygw6uedu5/TeO34Huz9WKnAboAtwYgJNeK+mdY5+q00zlVGxAuk4pj5te
 MKE66RK2ydLBYtM71oAkYuzsJ0sF1S4Rl8y8T+FQ6kneQTq4vomvRLza25LV3EfDJ6zz8BbFJ
 KB5rh/ENVzpwSw4x7znYv+bF/PtEdXaRW3PMhRKo12Cq7M1SnXSUXAFtqTkgSkbIk/WP2v8L4
 PCgg6ZeYelF66xdx+/m1ZPaYkAyjET9zJtHwZ3umXlTil/ich13JQZDeeZ6f9QbYCH2VAghB8
 WVa/cmREWy7VTvUcB1354/PS7KWhoI26Q0oKSnupyN3+/c7MmnBSMpHVvVV4CZikg8to9tfLo
 Pzf2MLTHb70LZoQByL48oZ95uQBOvOkZ7vA/Pg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Add more helper macros for trivial driver init cases, similar to the
already existing module_platform_driver or module_i2c_driver().

This helps to reduce driver init boilerplate.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/siox.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/siox.h b/include/linux/siox.h
index d79624e..d53b2b2 100644
--- a/include/linux/siox.h
+++ b/include/linux/siox.h
@@ -75,3 +75,12 @@ static inline void siox_driver_unregister(struct siox_driver *sdriver)
 {
 	return driver_unregister(&sdriver->driver);
 }
+
+/* module_siox_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces module_init() and module_exit()
+ */
+#define module_siox_driver(__siox_driver) \
+	module_driver(__siox_driver, siox_driver_register, \
+			siox_driver_unregister)
-- 
1.9.1

