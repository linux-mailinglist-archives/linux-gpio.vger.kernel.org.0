Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0C42B99D8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 18:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgKSRl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 12:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729329AbgKSRl5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 12:41:57 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7D4C0613D4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 09:41:57 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p22so7998104wmg.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 09:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQUWOoiI6bOe1ETVFAiJ1IEFbDftrIAgtdBtSTmelXk=;
        b=fIUybtb1nU6ankjCHjGK13flZBoSmWxeNcYR3umeGKa8rkF8WtCF3RUAUCEkpPUv6i
         5DMnG+emCAsYHKIRn18Ehg4OOf41Z1Vmwiou8UEQyqKiSXNYkwymJX8Vt0iu93s5E2p1
         BniebEK8dmA/DjvmvRLMelr1ru4ZV6vNZZZ32AkCrwZHOvRyDCiLH0KnXDf4TskzW9XX
         QEokgl6aEUjjfWtk/3JjwjecJgY6KusqD+T9lP+sQ4GL1/J6ggPCPn2kJeoFH8+Dm6Cr
         fohDVSFgPbJhzh7whI2l+/5Anijrg+20U+zEhVWb/JyCxAP5SdOQhjsJd+xksIEjvMw9
         iMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQUWOoiI6bOe1ETVFAiJ1IEFbDftrIAgtdBtSTmelXk=;
        b=pjHtBTTn5OQx32RiTA7YmFQor8Ha/k2xR14z/+WoAUYLFklczizpNCdgFec1vwEjov
         +1Hxu9vB5Ig3sgs8jIAxgSDtblSUFQ3UKjBKWqq2H6nauYvIS/1DGmXMh82ySdKi+QO/
         Ifrxe7/6LsXRKzKYjZ34xyri6L7WoLCUvhec7uLQ5oVA7gWLDAhIlbeSjV+yTSCJYqvo
         /utOs5bfHXEKzZNIp15MH7xFOcugA2ViRJm+j8No0ABkKdOO9dcnZGneb7ZSkSwyAK8R
         Pv8HIkK5XKvca+mp0Ob5Rbj4hM9pQcTjL8X4mI3VvChPM103EIBSF5S1OUEh9Rchv9ar
         DNKQ==
X-Gm-Message-State: AOAM5322kbY3cAQOlQZaAsQScLZugWLpzi5riNJHY8Y4j+N0zlZRPbWk
        rKsSrDbrDIHL2lP2uVYjtKlqvMZ/ChY=
X-Google-Smtp-Source: ABdhPJx+jRgKtyN8Y1m4R3VDH+IPYoG5JkZJ1TrKW9qYXOAStroq9C1EkBuNHT7gJs4mPv/UzKN8Cg==
X-Received: by 2002:a1c:328a:: with SMTP id y132mr5634984wmy.134.1605807715410;
        Thu, 19 Nov 2020 09:41:55 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v16sm998812wml.33.2020.11.19.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 09:41:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Will Deacon <will@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
Subject: [PATCH] Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module"
Date:   Thu, 19 Nov 2020 18:41:49 +0100
Message-Id: <20201119174149.3860883-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit d0511b5496c0 ("firmware: QCOM_SCM: Allow qcom_scm driver to be
loadable as a permenent module") causes the ARM SMMU driver to be built
as a loadable module when using the Aarch64 default configuration. This
in turn causes problems because if the loadable module is not shipped
in an initial ramdisk, then the deferred probe timeout mechanism will
cause all SMMU masters to probe without SMMU support and fall back to
just plain DMA ops (not IOMMU-backed).

Once the system has mounted the rootfs, the ARM SMMU driver will then
be loaded, but since the ARM SMMU driver faults by default, this causes
a slew of SMMU faults for the SMMU masters that have already been set
up with plain DMA ops and cause these devices to malfunction.

Revert that commit to unbreak things while we look for an alternative
solution.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/Kconfig                | 4 ++--
 drivers/firmware/Makefile               | 3 +--
 drivers/firmware/qcom_scm.c             | 4 ----
 drivers/iommu/Kconfig                   | 2 --
 drivers/net/wireless/ath/ath10k/Kconfig | 1 -
 5 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 5e369928bc56..3315e3c21586 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -235,8 +235,8 @@ config INTEL_STRATIX10_RSU
 	  Say Y here if you want Intel RSU support.
 
 config QCOM_SCM
-	tristate "Qcom SCM driver"
-	depends on (ARM && HAVE_ARM_SMCCC) || ARM64
+	bool
+	depends on ARM || ARM64
 	select RESET_CONTROLLER
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 523173cbff33..5e013b6a3692 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,8 +17,7 @@ obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
-qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 6f431b73e617..7be48c1bec96 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1280,7 +1280,6 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
 
 static struct platform_driver qcom_scm_driver = {
 	.driver = {
@@ -1296,6 +1295,3 @@ static int __init qcom_scm_init(void)
 	return platform_driver_register(&qcom_scm_driver);
 }
 subsys_initcall(qcom_scm_init);
-
-MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c64d7a2b6513..04878caf6da4 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -248,7 +248,6 @@ config SPAPR_TCE_IOMMU
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -376,7 +375,6 @@ config QCOM_IOMMU
 	# Note: iommu drivers cannot (yet?) be built as modules
 	bool "Qualcomm IOMMU Support"
 	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
-	depends on QCOM_SCM=y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU
diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 741289e385d5..40f91bc8514d 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -44,7 +44,6 @@ config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for integrated WCN3990 chip connected
-- 
2.29.2

