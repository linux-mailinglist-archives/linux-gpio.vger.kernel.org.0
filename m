Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B13224AC0
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 12:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgGRKr3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 06:47:29 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:40956 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgGRKr3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jul 2020 06:47:29 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 283D1BC06F;
        Sat, 18 Jul 2020 10:47:23 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     tomasz.figa@gmail.com, krzk@kernel.org, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, kgene@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] pinctrl: samsung: Replace HTTP links with HTTPS ones
Date:   Sat, 18 Jul 2020 12:47:17 +0200
Message-Id: <20200718104717.7493-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/pinctrl/samsung/pinctrl-exynos-arm.c   | 2 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h       | 2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c      | 2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
index 85ddf49a5188..6b3b60157bf9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
@@ -5,7 +5,7 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd.
 //		http://www.samsung.com
 // Copyright (c) 2012 Linaro Ltd
-//		http://www.linaro.org
+//		https://www.linaro.org
 //
 // Author: Thomas Abraham <thomas.ab@samsung.com>
 //
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index b6e56422a700..d96ae32bb66d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -6,7 +6,7 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd.
 //		http://www.samsung.com
 // Copyright (c) 2012 Linaro Ltd
-//		http://www.linaro.org
+//		https://www.linaro.org
 // Copyright (c) 2017 Krzysztof Kozlowski <krzk@kernel.org>
 //
 // This file contains the Samsung Exynos specific information required by the
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 84501c785473..72752cb51771 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -5,7 +5,7 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd.
 //		http://www.samsung.com
 // Copyright (c) 2012 Linaro Ltd
-//		http://www.linaro.org
+//		https://www.linaro.org
 //
 // Author: Thomas Abraham <thomas.ab@samsung.com>
 //
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index da1ec13697e7..aad7b69f1287 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -5,7 +5,7 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  * Copyright (c) 2012 Linaro Ltd
- *		http://www.linaro.org
+ *		https://www.linaro.org
  *
  * This file contains the Exynos specific definitions for the Samsung
  * pinctrl/gpiolib interface drivers.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f26574ef234a..9eac799c541e 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -5,7 +5,7 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd.
 //		http://www.samsung.com
 // Copyright (c) 2012 Linaro Ltd
-//		http://www.linaro.org
+//		https://www.linaro.org
 //
 // Author: Thomas Abraham <thomas.ab@samsung.com>
 //
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 379f34a9a482..c4c5356d696a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -5,7 +5,7 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  * Copyright (c) 2012 Linaro Ltd
- *		http://www.linaro.org
+ *		https://www.linaro.org
  *
  * Author: Thomas Abraham <thomas.ab@samsung.com>
  */
-- 
2.27.0

