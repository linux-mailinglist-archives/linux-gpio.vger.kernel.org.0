Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07802A1208
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Oct 2020 01:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgJaAiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 20:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgJaAiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 20:38:50 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B4AC0613D7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 17:38:49 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o129so6719394pfb.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 17:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yA2UcD5w0CT+PM1DULWZKIc164WCwUoZBWYCRPIo66o=;
        b=cZiDpC6SgpLZbBvy/+Kw5NdQzqs+OZs5fRZm5sL3HtiOGyqOD2VsPGJxx81ZYWF6vo
         +E03rh9hdaXNdr2nAYL/oQPXKKF+gWs53Bmaf1JDgpxh4WbDxQgNwqC5aYdc8FngwgFA
         kpytNyjatvLNd3DcPqplt43hviGVXtxTrQZ8HrNE8aGzk2POD4bDqr1qxb4oiv5IeK/Q
         9qcU54AYfVS8jIy2JosJIIC0YytfJQEAYMnNwIMHFREr8WqitAn8sictDjAIjTI6mI9Z
         YulCbqmeK5VpD0pRgS9brNsvw7PafDMUeouKVimkDWdGzi8LmHJnr+1JCPhulrtZbp1R
         dy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yA2UcD5w0CT+PM1DULWZKIc164WCwUoZBWYCRPIo66o=;
        b=GCV9beFsk62ROFAPnCNFJTlAcGZKurhpDJwPxgC/Iw1ob4l6EWrYHvh9RdwqYA/irP
         47irUeFyojh1Snnp+85WInwNmbM7yH0RV+KebfBeyNRR7IXOS8m53p10S7Yh8f3cCcE4
         cq+IYQBMOiluioquBjESXXD6IAVONkEwdWX0DM5SGaDEpNi1tJI/2diYis0c5ZIvXeX1
         jWXIDKbjvfVJlVcKhCj9o4evNofz0VTU9jJ70BCr7FK4XMMcbC604enQ3TkyazoBYfzi
         UjyolMdbtn3T354ARtzTpTISoSIviygmFN7ENsHznZ2v8yaoZKfzv7UhkdPEOgKVby++
         rRlA==
X-Gm-Message-State: AOAM531eakTmSP8XUK/G5MlVDvrtyGuoCruEnUfnGyxIrSakva5cEr+b
        aBtTdxeB4i7aCpB0yIocqNKdjw==
X-Google-Smtp-Source: ABdhPJynBoHxximDY2NwM66xUqKr1dDz0rODEMnFQ1WcCY9nNQTo3RXNrIXXcCOoX1PCwOaRSNxdBA==
X-Received: by 2002:a62:1686:0:b029:155:3b11:b454 with SMTP id 128-20020a6216860000b02901553b11b454mr11710845pfw.47.1604104729501;
        Fri, 30 Oct 2020 17:38:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id z16sm7074509pfq.33.2020.10.30.17.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:38:48 -0700 (PDT)
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
Subject: [PATCH v5 2/2] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module
Date:   Sat, 31 Oct 2020 00:38:45 +0000
Message-Id: <20201031003845.41137-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201031003845.41137-1-john.stultz@linaro.org>
References: <20201031003845.41137-1-john.stultz@linaro.org>
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
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

