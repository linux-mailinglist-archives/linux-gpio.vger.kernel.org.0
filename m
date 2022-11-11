Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EE7626198
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 19:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbiKKSnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 13:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233938AbiKKSnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 13:43:15 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4B5F3C;
        Fri, 11 Nov 2022 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668192194; x=1699728194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lkVyJF5CFttda/7RqQwpuCpSUsjtTkmBgPQ7kL5ajWk=;
  b=Fq4jrCYNR1jP51SJZdvHux3SxNYbV+/gkSNwmb/1uMgl5hUygqKCTwyl
   8/Y/0cvPsMLScGQ32z+Ojt1O1yIJ9L+tWXBxzaStPPVpIFiQagDIjm/y1
   u9zE8A7TG/FDHYQEvSGSrhPEqy1dczWHw1SH5UHp/E323JSaU1sdFhvO3
   GsDpP1BpHp1b2cykt64qDCr4nWFCBOsso9RRP0dDtROkrxJhVwFkHXAt/
   p46nuSJy8oBlCLonOO1u6rbYoBwFDSJ4ZXtr3/XQ+C0YLrFVf5UqFkxa1
   UK0LFNAAyIJK2iFd5L5N6wJvcbZXjZ9ql+jaqRkFismfCG7CAmHtD7I6X
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="309274056"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; 
   d="scan'208";a="309274056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 10:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="632103063"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; 
   d="scan'208";a="632103063"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Nov 2022 10:43:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 490CB2B7; Fri, 11 Nov 2022 20:43:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pwm@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 5/6] pwm: lpss: Add pwm_lpss_probe() stub
Date:   Fri, 11 Nov 2022 20:43:27 +0200
Message-Id: <20221111184328.58108-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111184328.58108-1-andriy.shevchenko@linux.intel.com>
References: <20221111184328.58108-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case the PWM LPSS module is not provided, allow users to be
compiled with the help of the pwm_lpss_probe() stub.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Thierry Reding <thierry.reding@gmail.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 include/linux/platform_data/x86/pwm-lpss.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/platform_data/x86/pwm-lpss.h b/include/linux/platform_data/x86/pwm-lpss.h
index 296bd837ddbb..c868b396ed2c 100644
--- a/include/linux/platform_data/x86/pwm-lpss.h
+++ b/include/linux/platform_data/x86/pwm-lpss.h
@@ -4,6 +4,8 @@
 #ifndef __PLATFORM_DATA_X86_PWM_LPSS_H
 #define __PLATFORM_DATA_X86_PWM_LPSS_H
 
+#include <linux/err.h>
+#include <linux/kconfig.h>
 #include <linux/types.h>
 
 struct device;
@@ -27,7 +29,16 @@ struct pwm_lpss_boardinfo {
 	bool other_devices_aml_touches_pwm_regs;
 };
 
+#if IS_REACHABLE(CONFIG_PWM_LPSS)
 struct pwm_lpss_chip *pwm_lpss_probe(struct device *dev, void __iomem *base,
 				     const struct pwm_lpss_boardinfo *info);
+#else
+static inline
+struct pwm_lpss_chip *pwm_lpss_probe(struct device *dev, void __iomem *base,
+				     const struct pwm_lpss_boardinfo *info)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif	/* CONFIG_PWM_LPSS */
 
 #endif	/* __PLATFORM_DATA_X86_PWM_LPSS_H */
-- 
2.35.1

