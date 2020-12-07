Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C70B2D1AB5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 21:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgLGUku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 15:40:50 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:34607 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGUkt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 15:40:49 -0500
Received: from orion.localdomain ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQPVR-1kZVFY2h73-00MHAf; Mon, 07 Dec 2020 21:38:17 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3] drivers: gpio: put virtual gpio device into their own submenu
Date:   Mon,  7 Dec 2020 21:38:16 +0100
Message-Id: <20201207203816.18269-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:eI/5m4FrSEirjVdlYJ1a8RaLSFyfKPxQtHZQk6VK3JLE3YdIRH6
 HdmFavy3rUyMw/5DrJH+DnQ9ZfHJwCyzUqM/DvUwDYej8LYSz+1ABBF77Yxf5MKKxnqBB6W
 Eei9ifbabkHaU/taqDM0/mKiNiyOXMHUk2QQwRslvflyjPV0oeETBrreQCL/AzjGwRrFi+b
 YcIuQa4dn1qebwEGOI27Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/y4/O1rS4+s=:rSFSrUlEZSwgHF4i6CthdQ
 MXb28Z2T3JJftMFGWmtetS4mCX2QEX16g0Lo86R5MWG6t1P0M3PuSlZbgEZQ6q3uHjKYh89fL
 6H0uDUH8fuwr5boPWO4rfFjVd/D/YVnJlfNB18bEFnGGFJ83HM3RCSfHaKk8oNFPSrk3WJ2ft
 rTwUo6BnhaPNhaRolBD3d6JfzMYcnRHOGgbHcUrJhcq6pgF5x9YyGRBqpXyxOaLkozUIsMDzT
 ytoUNlIkwVEi0NwHbt+Lyy1VIoumGoAMG1B/2wEovOqeR5SKveidHb8pyupSt4Ut2qFkVd37C
 mA0crfrAumpgSPZ/yxsp9xL1upkYPTjIREs4LzlNCesgrYWMPDix53W24YmCXG9T1FNDuLhTm
 9n3++3LeQ7w7/MQdC+yDnC7yEcN8Ra43Juq7gQhLRDN+AunBf3/Xf20wX+PEQ
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we already have a few virtual GPIO drivers, and more to come,
this category deserves its own submenu.

changes v2: fixed menu title (replaced "devices" by "drivers")
changes v3: added patch changelog

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..8596f9320971 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+menu "Virtual GPIO drivers"
+
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
 	help
@@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+endmenu
+
 endif
-- 
2.11.0

