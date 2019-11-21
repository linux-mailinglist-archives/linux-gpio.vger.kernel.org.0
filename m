Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B861A104C6C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 08:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfKUH0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 02:26:52 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:31177 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUH0u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 02:26:50 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20191121072645epoutp0319f3761807ef49e7a23df5481bfa2679~ZHMuutFSx0727207272epoutp03G
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 07:26:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20191121072645epoutp0319f3761807ef49e7a23df5481bfa2679~ZHMuutFSx0727207272epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1574321205;
        bh=YsTaWrnYuPE+nSvB9034rabATwnBllVGPJEPtYRvGts=;
        h=From:To:Cc:Subject:Date:References:From;
        b=oto53DyeFRstJ2LdX0n/WzflZ4yxmtrMsa+CWTVVrm0CF0hG+USn37aROQCKPPM1D
         BbstKlUUE808MbjwgX+aQuKDlBvE8UoCURPr4utU8uxM9i7bud2ksuT5T8jPmivdzc
         0UE6F8XW54jR1Iks4e9MVlii7DWoEm8le+Tb1NTw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20191121072644epcas2p225a1376f4896c2b016c5120bb9d3ad10~ZHMtvNFml0470504705epcas2p2S;
        Thu, 21 Nov 2019 07:26:44 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.186]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 47JWMl3tZDzMqYkl; Thu, 21 Nov
        2019 07:26:43 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        F0.EB.04167.33C36DD5; Thu, 21 Nov 2019 16:26:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20191121072643epcas2p452071a503725c7764acf5084d24425b1~ZHMsFQ8X22611326113epcas2p4h;
        Thu, 21 Nov 2019 07:26:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191121072643epsmtrp12e454369ef4fbade077456d7c9685604~ZHMsEUqo81170011700epsmtrp1Z;
        Thu, 21 Nov 2019 07:26:43 +0000 (GMT)
X-AuditID: b6c32a48-729ff70000001047-39-5dd63c332f65
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        EC.92.03814.23C36DD5; Thu, 21 Nov 2019 16:26:42 +0900 (KST)
Received: from KORNO0023990000 (unknown [12.36.165.128]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191121072642epsmtip26444404fff96837cc6b2f91e983f4283~ZHMr7nkEA0371103711epsmtip2g;
        Thu, 21 Nov 2019 07:26:42 +0000 (GMT)
From:   =?ks_c_5601-1987?B?sbjH9rHi?= <hyunki00.koo@samsung.com>
To:     <tomasz.figa@gmail.com>, <krzk@kernel.org>,
        <s.nawrocki@samsung.com>, <linus.walleij@linaro.org>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: samsung: modularize samsung pinctrl driver
Date:   Thu, 21 Nov 2019 16:26:42 +0900
Message-ID: <001001d5a03d$05de1f70$119a5e50$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdWgPNfGyY1I2d3/QaCPtklWsPGNTg==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTYRD127bbBa1ZK+rYeNT1CBLBttq6KBiNRzYBI16JUQmuZaVgr3QL
        Ef+AmoAQFOttJaKRaKwHUA5rAypHPKICRq0RRaJ4gUc8glEDxtYPk/57c7x5bzJDSZSVpIrK
        tDoFh5U3M2SktL5lJhs7JyGQqgk8VbHt7VVy9tDAOYL19gRkbE35AGIf+stI9lj7NYJt+Vgo
        Yz3+AbSI4q66u+Sc11NEcs8DDSRXU5HH7av1IO67d1IKucGcYBL4dMGhFqxGW3qmNSORSVqT
        tiRNb9BoY7Xx7DxGbeUtQiKzNDkldnmmOeiHUefw5uxgKoUXRWb2wgSHLdspqE020ZnICPZ0
        s12rtceJvEXMtmbEGW2W+VqNRqcPdm42m+72lyB7Q9z2O+35RD6qii5GERTQc2H36XtEMYqk
        lLQPwYHj92Q4+Ibg/a+9JA5+ICitqJb+p5yt2ifFhUYEVxsrEA4+Iaga+BmkUBRJL4SLrvEh
        QhS9FQY7KlEIS2gXAv+DLSE8ml4KxW2vZSEspafDwZ6mfwIKOh7qCq/LMR4Fd46/lmKuDiou
        lBMYT4Yrn8ok2JAafPc/IKwVB329l4a0ouBEUYEk5A3obhICRS+IkDcICj/eNRtzR0PfrVo5
        xiroLS0YwnlwrcAlx9wSBL++vJHhwhxwvy1EeM5UaO0c8jYS9rQMynFaAXsKlLh7Blz+8Z7A
        eAJcfOMfGs/B+cFuyX40xR22pTtsS3fYlu6wbU4hqQeNFeyiJUMQdfa54df2on/PGsP50I22
        5GZEU4gZoTBFP05VyvgcMdfSjICSMFGKhiePUpWKdD53h+CwpTmyzYLYjPTBK7gkqjFGW/D1
        rc40rV5nMGji9azeoGOZcQrv8KeblHQG7xS2CYJdcPznEVSEKh/N/JOaFdPHrZte2l82Yfiu
        BZ9bam73Tuz/kyedamRvnv6yvrKHWXngiTGzqW6VZ8UCWn2EXVTn3jguL2lSw4qSyWd8j6JO
        NhK3xny90PaOOjxyWWdk9aqXPn/utFe2Wa3yrOcjttd3LTZ0DFNwlP6hMHGtq/Lood87Vz8b
        zEH7V57oLWekoonXxkgcIv8Xx3pwVMIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJXtfI5lqswYEXVhbnz29gt5jyZzmT
        xabH11gtNs//w2hxedccNosZ5/cxWRx+085qsWrXH0YHDo+ds+6ye2xa1cnmcefaHjaPzUvq
        Pfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvj9NcexoI9ehUnzzcwNTBu0Ohi5OSQEDCRWLah
        j6WLkYtDSGA3o8SBLfPYIRIyEhNeLGGGsIUl7rccYYUoes0oceT0aqAODg42ATuJNRMlQUwR
        gSyJB2e8QUqYBSYDzfmxhQ2kV1jARaLr3BNWEJtFQFVi8uODLCA2r4ClxNb2/ewQtqDEyZlP
        wOLMQAc1Hu6GsuUltr+dA3WDgsSOs68ZQWwRAT2JVy/XMkLUiEjM7mxjnsAoOAvJqFlIRs1C
        MmoWkpYFjCyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGC40VLawfjiRPxhxgFOBiV
        eHgzNK7GCrEmlhVX5h5ilOBgVhLh3XP9SqwQb0piZVVqUX58UWlOavEhRmkOFiVxXvn8Y5FC
        AumJJanZqakFqUUwWSYOTqkGRq6zn2P0s3o+Prnc/OTIyZ9dXWmB5tf+Kivvs6kQ7JmhXGE6
        78zxjh17Ljke5qmYt1J/xl679V8Nlx+xecjotninpvKjs3nL1hWqrSitWXxu2U12IaPVPgyr
        X7K3i+s/ld+svUsn5U5QS5BkkeuJJtOtH1s3L7rckc38SMGYO2eVpfa36l6p30osxRmJhlrM
        RcWJADccW7KTAgAA
X-CMS-MailID: 20191121072643epcas2p452071a503725c7764acf5084d24425b1
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191121072643epcas2p452071a503725c7764acf5084d24425b1
References: <CGME20191121072643epcas2p452071a503725c7764acf5084d24425b1@epcas2p4.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable samsung pinctrl driver to be compiled as modules.

Change-Id: I92a9953c92831a316f7f50146898ff19831549ec
Signed-off-by: Hyunki Koo <hyunki00.koo@samsung.com>
---
 drivers/pinctrl/samsung/Kconfig                |  5 +----
 drivers/pinctrl/samsung/Makefile               | 13 +++++++------
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c   |  2 ++
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  2 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c       |  2 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c      | 13 +++++++++++++
 6 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/samsung/Kconfig
b/drivers/pinctrl/samsung/Kconfig
index 425fadd6c346..25e16984ef23 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -3,14 +3,13 @@
 # Samsung Pin control drivers
 #
 config PINCTRL_SAMSUNG
-	bool
+	tristate "Pinctrl driver data for Samsung SoCs"
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_EXYNOS
 	bool "Pinctrl driver data for Samsung EXYNOS SoCs"
 	depends on OF && GPIOLIB && (ARCH_EXYNOS || ARCH_S5PV210)
-	select PINCTRL_SAMSUNG
 	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
 	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
 
@@ -25,9 +24,7 @@ config PINCTRL_EXYNOS_ARM64
 config PINCTRL_S3C24XX
 	bool "Samsung S3C24XX SoC pinctrl driver"
 	depends on ARCH_S3C24XX && OF
-	select PINCTRL_SAMSUNG
 
 config PINCTRL_S3C64XX
 	bool "Samsung S3C64XX SoC pinctrl driver"
 	depends on ARCH_S3C64XX
-	select PINCTRL_SAMSUNG
diff --git a/drivers/pinctrl/samsung/Makefile
b/drivers/pinctrl/samsung/Makefile
index ed951df6a112..b3ac01838b8a 100644
--- a/drivers/pinctrl/samsung/Makefile
+++ b/drivers/pinctrl/samsung/Makefile
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # Samsung pin control drivers
 
-obj-$(CONFIG_PINCTRL_SAMSUNG)	+= pinctrl-samsung.o
-obj-$(CONFIG_PINCTRL_EXYNOS)	+= pinctrl-exynos.o
-obj-$(CONFIG_PINCTRL_EXYNOS_ARM)	+= pinctrl-exynos-arm.o
-obj-$(CONFIG_PINCTRL_EXYNOS_ARM64)	+= pinctrl-exynos-arm64.o
-obj-$(CONFIG_PINCTRL_S3C24XX)	+= pinctrl-s3c24xx.o
-obj-$(CONFIG_PINCTRL_S3C64XX)	+= pinctrl-s3c64xx.o
+obj-$(CONFIG_PINCTRL_SAMSUNG)	+= pinctrl-samsung-super.o
+pinctrl-samsung-super-$(CONFIG_PINCTRL_SAMSUNG)	+= pinctrl-samsung.o
+pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS)	+= pinctrl-exynos.o
+pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS_ARM)	+= pinctrl-exynos-
arm.o
+pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS_ARM64)	+= pinctrl-exynos-
arm64.o
+pinctrl-samsung-super-$(CONFIG_PINCTRL_S3C24XX)	+= pinctrl-s3c24xx.o
+pinctrl-samsung-super-$(CONFIG_PINCTRL_S3C64XX)	+= pinctrl-s3c64xx.o
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
index 85ddf49a5188..28906bf213c4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
@@ -14,6 +14,7 @@
 // external gpio and wakeup interrupt support.
 
 #include <linux/device.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/err.h>
@@ -891,3 +892,4 @@ const struct samsung_pinctrl_of_match_data
exynos5420_of_data __initconst = {
 	.ctrl		= exynos5420_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos5420_pin_ctrl),
 };
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index b6e56422a700..2b19476ad5ff 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -14,6 +14,7 @@
 // external gpio and wakeup interrupt support.
 
 #include <linux/slab.h>
+#include <linux/module.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
 #include "pinctrl-samsung.h"
@@ -422,3 +423,4 @@ const struct samsung_pinctrl_of_match_data
exynos7_of_data __initconst = {
 	.ctrl		= exynos7_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c
b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ebc27b06718c..630d606330f1 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -18,6 +18,7 @@
 #include <linux/irqdomain.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/slab.h>
@@ -713,3 +714,4 @@ exynos_retention_init(struct samsung_pinctrl_drv_data
*drvdata,
 
 	return ctrl;
 }
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
b/drivers/pinctrl/samsung/pinctrl-samsung.c
index de0477bb469d..4483eaed27f8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -15,6 +15,7 @@
 // but provides extensions to which platform specific implementation of
the gpio
 // and wakeup interrupts can be hooked to.
 
+#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
@@ -1275,6 +1276,7 @@ static const struct of_device_id
samsung_pinctrl_dt_match[] = {
 #endif
 	{},
 };
+MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
 
 static const struct dev_pm_ops samsung_pinctrl_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(samsung_pinctrl_suspend,
@@ -1296,3 +1298,14 @@ static int __init samsung_pinctrl_drv_register(void)
 	return platform_driver_register(&samsung_pinctrl_driver);
 }
 postcore_initcall(samsung_pinctrl_drv_register);
+
+static void __exit samsung_pinctrl_drv_unregister(void)
+{
+	platform_driver_unregister(&samsung_pinctrl_driver);
+}
+module_exit(samsung_pinctrl_drv_unregister);
+
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Hyunki Koo <hyunki00.koo@samsung.com>");
+MODULE_DESCRIPTION("Samsung Exynos PINCTRL driver");
-- 
2.15.0.rc1


