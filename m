Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D1D49E69
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 12:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbfFRKke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 06:40:34 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40627 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729203AbfFRKke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 06:40:34 -0400
Received: from orion.localdomain ([95.114.66.109]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MJm8N-1hsv0I1KbB-00K4yK; Tue, 18 Jun 2019 12:40:31 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/2] include: linux: siox: more for declaring siox drivers
Date:   Tue, 18 Jun 2019 12:40:26 +0200
Message-Id: <1560854427-27537-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560854427-27537-1-git-send-email-info@metux.net>
References: <1560854427-27537-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:EkSkVpDgp4UTN6kI5aXE5wb6bJNvAzVW1Wd7WHb7iqb27uBomDM
 Ghkr1Hn3Ry9cd37Yf0f3wUbpQb+kUF7anIUaItGDM52S1oqr0uoBR3OZW48X5gJc3eEqkHQ
 SL65tVimHDLR23LbWy+UqtijqP4TXu0K8YEA65i1eRbvMKfQ7GuQcvcTBLAhJxnDyR0+dRk
 2tll6TWBz2vpuoLsqqKSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wniqpdYrzPY=:qghauUcVf1uINJZCbgn5ZD
 082M5EA+7ChW3FfSnNp+fx2amzAqp/w4kMLnDTOBgAtCC4W5zHGv3kPjAMIsDaiLInrGCpeBF
 x8+SbAlYbC4iMVPe4Ix9ulLmdmbapvg83AfyegJdolinlUDJr34aOhseYF3MAa/kCDoj7PMPw
 VDw7JhNPhKdPx3458gQYzscAmCiL3Gw1qM4itQZA5gtiK6VBTx/ux7DHkaRzS6mM2k0kdweLo
 uNR7En7Hvwz80M7hR4wv7QHTPEjwOoLStCbfuKxiVsvzxmekDjRLAf49lrh6lZ+mK71rmzWXA
 BVJV9IPoiutIcW01PjJo4jVJPuIYk7oVosV8wTH1B9hyzNQ1mZHcJx7and39HZCWtRurwMXwE
 Gs5MYKitDGZMvDJaCQpVnV6OcKFCWli5X+ubAKfxyGB53mWKPbRHNp3pSXsa0ky12fVte/qPI
 IiVqREuxrVENrnxdvXLJ02uSfgf/3zMj/yvkxIIk9n/tBhlsokm4aOWePVE9MNPCDhMymaFXz
 IOC90Va4EOOhUVdv86wjLHM0FoBueNayJDJKJKmzl+2MQUAk+g2w3Nd1c6G7DAq7lfYsHGUhH
 vfavYYu6o8MO4zTfPFNTR8jL3A8BrsBx2QDOPWw4rKVKkPE4hbx67EKkieF76NDWxW5IXBks8
 5yPykMYQdQoEVRRgxxu3lUz4Drg7upQCfgZiGnA7HjEGuBf9aHWcqz7TZLhyN4IOq8jenVwol
 cjFZc12GrCDgCmXNFNOaxXGomgXTH4evN9LSCA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Add more helper macros for trivial driver init cases, similar to the
already existing module_platform_driver() or module_i2c_driver().

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

