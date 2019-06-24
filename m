Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1049D50110
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 07:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfFXFkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 01:40:41 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52767 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfFXFkl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 01:40:41 -0400
Received: from orion.localdomain ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRmwM-1i8Ktz3dWc-00TFa1; Mon, 24 Jun 2019 07:40:37 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        t.scherer@eckelmann.de
Subject: [PATCH 1/2] siox: add helper macro to simplify driver registration
Date:   Mon, 24 Jun 2019 07:40:33 +0200
Message-Id: <1561354834-22617-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561354834-22617-1-git-send-email-info@metux.net>
References: <1561354834-22617-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:pu61IGV/1q4lpgLp+aBNG7OE4lWm55EcChTDsjKrvIxqyTLMk2a
 GfOtCtSvGCs8/+p+nGl64iadCag1mbmjMQHYwLaE1FSEN1yJGqOqGgG3uuYD2Bzi+4fEi0/
 f6kEYFyuKBvLSB00KYmoCAkK0jw3RFC862q35TOCVpvOhQ/ZRsGd7SfTnNFQpFZr0VBLXth
 q54oVYhPOGEnBNpG4bcEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5J8Hxi1ig1U=:5zv9ddOpsP1G1dUVB1bMr+
 K8M1NQzf/63jmBJMFl7vCZ/2VmBjGVZPM8RQhzd1pGmYqwlyJRh5JI1c9fPQBlQJ+4Zk1YG0p
 2vjJ5sq1+hrgAboxoJ/bMVs7VI6Lr73xLBbssS7oYeV4DxnxkqQc8DWcOQp+hUvr5JFNIZuvj
 vwb8oWtZoEwXV9WmZBwh5aqBDytAM98jOlxJSy18QO84YJTuDHs5qWyVd2grtlUKitW2AiMAC
 L6RO/IaNZak2i/+dCrGspKDEmtI7tgTf7uYWyqBIF9SGUweFN5w5k6wC+Stew4ikP2ZZtf+3J
 T02bsnViOXIOTppVNgbOKyRgTPmxKJOK+sBKOfIDmKIUo4Z1+aVbQ8x7HDhWX3LbsSjqk/+qv
 iydugXEycHJ3dAx4fHuQVQ5KryM/0R4p/s80SghWO0wt5zD9+G8wAYeAjDGPegsW08iWhvtz3
 k/y1ppXn4j2lROyOXO8kgyvUxYQjoQZ1SjlcldeaeF6MRY0ta7Ei2j3yOuAAwtpB64FMRRvl9
 KVwk/9Y1pJplg4XTL6a/4g8M/Umyamd5gdulTah3vyxV9x6NFHLs80JNBSpl2OZhqNzk8dlWR
 XTCKovFEJgtLhDityIk69YcaXmsRu41kaw5lNCS7WbTKk/0sGRe0IMZD5OMzARVtV/Sbrp65I
 6t1ayUGeYJopMsSZpBgbokDDlm1KHXsUAhUh9t6amuEgJHbC0eD00fgvbrDxzB39Och2q86id
 bgj69DT0jaMJ/TWBBFe+offc1EA16NpkL44cew==
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
 include/linux/siox.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/siox.h b/include/linux/siox.h
index a860cb8..da7225b 100644
--- a/include/linux/siox.h
+++ b/include/linux/siox.h
@@ -72,3 +72,13 @@ static inline void siox_driver_unregister(struct siox_driver *sdriver)
 {
 	return driver_unregister(&sdriver->driver);
 }
+
+/*
+ * module_siox_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces module_init() and module_exit()
+ */
+#define module_siox_driver(__siox_driver) \
+	module_driver(__siox_driver, siox_driver_register, \
+			siox_driver_unregister)
-- 
1.9.1

