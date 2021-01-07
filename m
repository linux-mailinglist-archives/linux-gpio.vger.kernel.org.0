Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18B82ED71D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 20:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbhAGTDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 14:03:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:62710 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbhAGTDt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 14:03:49 -0500
IronPort-SDR: ZuDDWLugQTlC3m2kvmeMtVKFlkqkre6HxNh6j9WC0YkEahZArCkT9Cpsw1HRtTUgvm4Lrkejba
 WfK44kLgtbww==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="176700863"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="176700863"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 11:02:04 -0800
IronPort-SDR: iMA2RqkTpGhBODB0P6jDwk0pie2IHjQwYcw3XiRtt2cT/0tj4dLeo8Pzethiy1bbXuHrfQH+1N
 cF4aY9z+FF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="362070573"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 07 Jan 2021 11:02:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C8A3D211; Thu,  7 Jan 2021 21:02:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] pinctrl: intel: Convert capability list to features
Date:   Thu,  7 Jan 2021 21:02:00 +0200
Message-Id: <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Communities can have features provided in the capability list.
Traverse the list and convert to respective features.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 41 +++++++++++++++++++++++++--
 drivers/pinctrl/intel/pinctrl-intel.h |  4 +++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 00979acb0203..3d9f22ee987a 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -29,6 +29,16 @@
 #define REVID_SHIFT			16
 #define REVID_MASK			GENMASK(31, 16)
 
+#define CAPLIST				0x004
+#define CAPLIST_ID_SHIFT		16
+#define CAPLIST_ID_MASK			GENMASK(23, 16)
+#define CAPLIST_ID_GPIO_HW_INFO		1
+#define CAPLIST_ID_PWM			2
+#define CAPLIST_ID_BLINK		3
+#define CAPLIST_ID_EXP			4
+#define CAPLIST_NEXT_SHIFT		0
+#define CAPLIST_NEXT_MASK		GENMASK(15, 0)
+
 #define PADBAR				0x00c
 
 #define PADOWN_BITS			4
@@ -1472,7 +1482,7 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		void __iomem *regs;
-		u32 padbar;
+		u32 offset;
 		u32 value;
 
 		*community = pctrl->soc->communities[i];
@@ -1492,11 +1502,36 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 			break;
 		}
 
+		/* Determine community features based on the capabilities */
+		offset = CAPLIST;
+		do {
+			value = readl(regs + offset);
+			switch ((value & CAPLIST_ID_MASK) >> CAPLIST_ID_SHIFT) {
+			case CAPLIST_ID_GPIO_HW_INFO:
+				community->features |= PINCTRL_FEATURE_GPIO_HW_INFO;
+				break;
+			case CAPLIST_ID_PWM:
+				community->features |= PINCTRL_FEATURE_PWM;
+				break;
+			case CAPLIST_ID_BLINK:
+				community->features |= PINCTRL_FEATURE_BLINK;
+				break;
+			case CAPLIST_ID_EXP:
+				community->features |= PINCTRL_FEATURE_EXP;
+				break;
+			default:
+				break;
+			}
+			offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;
+		} while (offset);
+
+		dev_dbg(&pdev->dev, "Community%d features: %#08x\n", i, community->features);
+
 		/* Read offset of the pad configuration registers */
-		padbar = readl(regs + PADBAR);
+		offset = readl(regs + PADBAR);
 
 		community->regs = regs;
-		community->pad_regs = regs + padbar;
+		community->pad_regs = regs + offset;
 
 		if (community->gpps)
 			ret = intel_pinctrl_add_padgroups_by_gpps(pctrl, community);
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index ad34b7a3f6ed..c4fef03b663f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -143,6 +143,10 @@ struct intel_community {
 /* Additional features supported by the hardware */
 #define PINCTRL_FEATURE_DEBOUNCE	BIT(0)
 #define PINCTRL_FEATURE_1K_PD		BIT(1)
+#define PINCTRL_FEATURE_GPIO_HW_INFO	BIT(2)
+#define PINCTRL_FEATURE_PWM		BIT(3)
+#define PINCTRL_FEATURE_BLINK		BIT(4)
+#define PINCTRL_FEATURE_EXP		BIT(5)
 
 /**
  * PIN_GROUP - Declare a pin group
-- 
2.29.2

