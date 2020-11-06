Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A162A8E59
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 05:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgKFE1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 23:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKFE1R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 23:27:17 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ACAC0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 20:27:17 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id e21so2959789pgr.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 20:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NUyUANspNtxDV6SxRCRDpb8/aThmojrVXw0zcthEhBk=;
        b=Hu5jg04RZzsiEQNEkfBdU7HvTeClSbA9rbqmuTpj13kO6V2WvZdvCTlRkSjPq6d+JL
         rwyJm4LFVyIzI6qM/IJjtwf2Y6bDJrgU+FSGuIit1HGlJxOSjCMyMF44Gg4UyFUG7qO3
         xJS0t4YYM7RIjwwv/ukdeVzHGljKFPSmfxl3eGcGS51EgrhCGt5LaLCK5wRjh1KedWUb
         5zZdnbWKoSsU9m+RhG56xzrPNLx7NZ3BTIypYAK58JQHiBVaFXrtYc40iqdIyPwMVkVg
         uCBuF/Wu+WPso6v95Q4CbfbJKsSR+3FYzz3JL3DYmMZIZpTsSU2T/HFaWyMxl/0nXhi4
         4d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NUyUANspNtxDV6SxRCRDpb8/aThmojrVXw0zcthEhBk=;
        b=e6JZKPDbtf8enKr5nHUOMA6FRk/PeXxtO+9rLWI8WTJOXSVTGWH9t8WqJ2roTUNyl3
         9+pdMmgosGWkHYWIKKYRFFqIY2Pe7Cv4PxEY34e0WWeoYnB/gGn+vlG30UITHAOw06ib
         hmO2IN/MB1Zf/qkh9+AKIDMCKW/9KnhRe948qP7C4/QOXlotKE+7emWgGZ2Q1c3sFIxu
         eaX1PFmUBXuFf/4EzNQlD1HkHfyBLPeOspWnJVxRhTznaX2ATysaJ9nTPXslqBhdS2Vy
         cg8UuYpD8QqhKniNxaDHvAyobjN0HJcpifVpmkkEb6wp8F7JuYTdyP6PNVuBYZjwyy1q
         qYuQ==
X-Gm-Message-State: AOAM5322AjMB+EB52c8GW9f983ut0u6a2Nq5L7ONB6jhKeeXnh7bVB40
        r6IH2QZASBBuBlG5ZY/M9GjvaA==
X-Google-Smtp-Source: ABdhPJxCgyO1IUphemwtnrgRQaBdpcBmVSqDyVQVBYjefKLrAb/d38xXs4evPD2oZV9TF1NkjAjypg==
X-Received: by 2002:a63:d357:: with SMTP id u23mr161799pgi.106.1604636837005;
        Thu, 05 Nov 2020 20:27:17 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e24sm179864pfl.149.2020.11.05.20.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 20:27:16 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module
Date:   Fri,  6 Nov 2020 04:27:10 +0000
Message-Id: <20201106042710.55979-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106042710.55979-1-john.stultz@linaro.org>
References: <20201106042710.55979-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow the qcom_scm driver to be loadable as a permenent module.

This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
ensure that drivers that call into the qcom_scm driver are
also built as modules. While not ideal in some cases its the
only safe way I can find to avoid build errors without having
those drivers select QCOM_SCM and have to force it on (as
QCOM_SCM=n can be valid for those drivers).

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3:
* Fix __arm_smccc_smc build issue reported by
  kernel test robot <lkp@intel.com>
v4:
* Add "depends on QCOM_SCM || !QCOM_SCM" bit to ath10k
  config that requires it.
v5:
* Fix QCOM_QCM typo in Kconfig, it should be QCOM_SCM
---
 drivers/firmware/Kconfig                | 4 ++--
 drivers/firmware/Makefile               | 3 ++-
 drivers/firmware/qcom_scm.c             | 4 ++++
 drivers/iommu/Kconfig                   | 2 ++
 drivers/net/wireless/ath/ath10k/Kconfig | 1 +
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 3315e3c215864..5e369928bc567 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -235,8 +235,8 @@ config INTEL_STRATIX10_RSU
 	  Say Y here if you want Intel RSU support.
 
 config QCOM_SCM
-	bool
-	depends on ARM || ARM64
+	tristate "Qcom SCM driver"
+	depends on (ARM && HAVE_ARM_SMCCC) || ARM64
 	select RESET_CONTROLLER
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 5e013b6a3692e..523173cbff335 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,7 +17,8 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
+qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7be48c1bec96d..6f431b73e617d 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1280,6 +1280,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
 
 static struct platform_driver qcom_scm_driver = {
 	.driver = {
@@ -1295,3 +1296,6 @@ static int __init qcom_scm_init(void)
 	return platform_driver_register(&qcom_scm_driver);
 }
 subsys_initcall(qcom_scm_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 04878caf6da49..c64d7a2b65134 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -248,6 +248,7 @@ config SPAPR_TCE_IOMMU
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -375,6 +376,7 @@ config QCOM_IOMMU
 	# Note: iommu drivers cannot (yet?) be built as modules
 	bool "Qualcomm IOMMU Support"
 	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on QCOM_SCM=y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU
diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 40f91bc8514d8..741289e385d59 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,6 +44,7 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for integrated WCN3990 chip connected
-- 
2.17.1

