Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625BB320186
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Feb 2021 00:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhBSXGm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 18:06:42 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:44038 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhBSXGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 18:06:42 -0500
X-Greylist: delayed 1598 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Feb 2021 18:06:41 EST
Received: from [77.244.183.192] (port=64500 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lDEQi-009zHK-Hu; Fri, 19 Feb 2021 23:39:20 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mfd: lp87565: remove unused define
Date:   Fri, 19 Feb 2021 23:39:09 +0100
Message-Id: <20210219223910.1831-2-luca@lucaceresoli.net>
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

This define appears incorrect, but it is completely unused so it can be
removed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 include/linux/mfd/lp87565.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mfd/lp87565.h b/include/linux/mfd/lp87565.h
index 2620554f357a..a8799ae50dcf 100644
--- a/include/linux/mfd/lp87565.h
+++ b/include/linux/mfd/lp87565.h
@@ -237,9 +237,6 @@ enum lp87565_device_type {
 #define LP87565_GPIO2_OUT			BIT(1)
 #define LP87565_GPIO1_OUT			BIT(0)
 
-/* Number of step-down converters available */
-#define LP87565_NUM_BUCK		6
-
 enum LP87565_regulator_id {
 	/* BUCK's */
 	LP87565_BUCK_0,
-- 
2.30.0

