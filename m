Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD9E320188
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Feb 2021 00:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhBSXIP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 18:08:15 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43814 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhBSXII (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 18:08:08 -0500
Received: from [77.244.183.192] (port=64500 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lDEQi-009zHK-Ux; Fri, 19 Feb 2021 23:39:21 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mfd: lp87565: move LP87565_regulator_id to .c file
Date:   Fri, 19 Feb 2021 23:39:10 +0100
Message-Id: <20210219223910.1831-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210219223910.1831-1-luca@lucaceresoli.net>
References: <20210219223910.1831-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This enum is used only internally to the regulator driver for buck indexes.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 drivers/regulator/lp87565-regulator.c | 11 +++++++++++
 include/linux/mfd/lp87565.h           | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index eeab9d3c824b..d059ae85047a 100644
--- a/drivers/regulator/lp87565-regulator.c
+++ b/drivers/regulator/lp87565-regulator.c
@@ -11,6 +11,17 @@
 
 #include <linux/mfd/lp87565.h>
 
+enum LP87565_regulator_id {
+	/* BUCK's */
+	LP87565_BUCK_0,
+	LP87565_BUCK_1,
+	LP87565_BUCK_2,
+	LP87565_BUCK_3,
+	LP87565_BUCK_10,
+	LP87565_BUCK_23,
+	LP87565_BUCK_3210,
+};
+
 #define LP87565_REGULATOR(_name, _id, _of, _ops, _n, _vr, _vm,		\
 			  _er, _em, _ev, _delay, _lr, _cr)		\
 	[_id] = {							\
diff --git a/include/linux/mfd/lp87565.h b/include/linux/mfd/lp87565.h
index a8799ae50dcf..94cb581af34b 100644
--- a/include/linux/mfd/lp87565.h
+++ b/include/linux/mfd/lp87565.h
@@ -237,17 +237,6 @@ enum lp87565_device_type {
 #define LP87565_GPIO2_OUT			BIT(1)
 #define LP87565_GPIO1_OUT			BIT(0)
 
-enum LP87565_regulator_id {
-	/* BUCK's */
-	LP87565_BUCK_0,
-	LP87565_BUCK_1,
-	LP87565_BUCK_2,
-	LP87565_BUCK_3,
-	LP87565_BUCK_10,
-	LP87565_BUCK_23,
-	LP87565_BUCK_3210,
-};
-
 /**
  * struct LP87565 - state holder for the LP87565 driver
  * @dev: struct device pointer for MFD device
-- 
2.30.0

