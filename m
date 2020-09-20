Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F142717E2
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 22:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgITUl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 16:41:28 -0400
Received: from mail1.nippynetworks.com ([91.220.24.129]:57620 "EHLO
        mail1.nippynetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgITUl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2020 16:41:28 -0400
Received: from twocubed.nippynetworks.com (office.nippynetworks.com [46.17.61.232])
        by mail1.nippynetworks.com (Postfix) with SMTP id 4BvfRD21N7zTgZM;
        Sun, 20 Sep 2020 21:33:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1600634012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dTuEJgYM6LNmm/jFqMkJjsE9372TSsB7bhiTsLa2tvw=;
        b=B9nmzHHHkUDdpuavrr5ANVP4mNFUVzIvi/pkKL9CTkMPYwaZL6jQiT0ZRdHjSqzmg7vggT
        RBNHnsmsgzX0dCDU++R9hBzagDuUyyCZAna7GoKT1sxFwOH5uJZKBpNxg5wtQ5Dtr9nheY
        lgqxQOerctxFtHDGh3I7Qwq9s1AimmY=
Received: by twocubed.nippynetworks.com (sSMTP sendmail emulation); Sun, 20 Sep 2020 21:33:23 +0100
From:   Ed Wildgoose <lists@wildgooses.com>
To:     linux-kernel@vger.kernel.org
Cc:     fe@dev.tdt.de, Ed Wildgoose <lists@wildgooses.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: gpio-amd-fch: Fix typo on define of AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
Date:   Sun, 20 Sep 2020 21:32:06 +0100
Message-Id: <20200920203207.25696-1-lists@wildgooses.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Schematics show that the GPIO number is 55 (not 59). Trivial typo.

Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
---
 drivers/platform/x86/pcengines-apuv2.c          | 2 +-
 include/linux/platform_data/gpio/gpio-amd-fch.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 6aff6cf41..c37349f97 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -32,7 +32,7 @@
 #define APU2_GPIO_REG_LED3		AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
 #define APU2_GPIO_REG_MODESW		AMD_FCH_GPIO_REG_GPIO32_GE1
 #define APU2_GPIO_REG_SIMSWAP		AMD_FCH_GPIO_REG_GPIO33_GE2
-#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
+#define APU2_GPIO_REG_MPCIE2		AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
 #define APU2_GPIO_REG_MPCIE3		AMD_FCH_GPIO_REG_GPIO51
 
 /* Order in which the GPIO lines are defined in the register list */
diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h b/include/linux/platform_data/gpio/gpio-amd-fch.h
index 9e46678ed..255d51c9d 100644
--- a/include/linux/platform_data/gpio/gpio-amd-fch.h
+++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
@@ -19,7 +19,7 @@
 #define AMD_FCH_GPIO_REG_GPIO49		0x40
 #define AMD_FCH_GPIO_REG_GPIO50		0x41
 #define AMD_FCH_GPIO_REG_GPIO51		0x42
-#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP0	0x43
+#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0	0x43
 #define AMD_FCH_GPIO_REG_GPIO57		0x44
 #define AMD_FCH_GPIO_REG_GPIO58		0x45
 #define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1	0x46
-- 
2.26.2

