Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA1320976B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 02:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388800AbgFYAKz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 20:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388754AbgFYAKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 20:10:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8490AC0617B9
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:10:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r18so2346885pgk.11
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kiF3eDPsXk3VmmQHETFrF9xdJnTYDdY6wfkANtzZV7Q=;
        b=ghZjuyMCSqi6r/mP067i7gCCgDQ8CIvlmDUdYveGV/ywVVimKDCeQ48DCqYYxQSjv9
         iDNFglxfH3peOAoYUQPNAkiMHqAIm/FyhMAoxcQnurpZTvXzwm+YvCEBYam5e8nuO4DO
         WrPB7kyWF1cQoKHIr3ognTMQSkn3Z6j9z3vAbbFotbvg4H2H5EFrU7+uBHNjHD3B/F50
         XentXKhlzSBPKX50y8DNOnd653kbzN5Fe5fdAVvx565On7xBqCG60bcAqXA6Ix+dmzGM
         m6sFFEExLUBhOWg/Y1v2SVbfCRQrV4/eRYbsYNY9yMkarE050yR98fHFteqEu+o1tLl+
         br3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kiF3eDPsXk3VmmQHETFrF9xdJnTYDdY6wfkANtzZV7Q=;
        b=LDRfTEJ+JmK2czo9M1he6dE4emdrN7YC90cMIErq/+JV2gt3cd3fsOcexYNJJEHi4P
         k29AvX8QqK9y8rnnZoYJ/yPI5asP1s9saNGyZUeiioQpWb7EL9WvyTnxE0skrIiJbB+P
         h54bxMG53fGtQaqqaLjW8TauGRgDXuwXRqtW7tRQN9knAFKJd4xBWLdKsZmMhKIEGmvf
         ebB43BxnrtpuOUhhs5V/y2H6M9U2aJVP0QhqsmwkdNDNeFkFG6FcMxCJGXjA1Fx0xTyw
         JJSSFKzG+PxpVspb1UhTFCv9Q0ROqX029gva5nv3h0H6OuJruxqp9PK8Ko8FyfFFjR7W
         /eqQ==
X-Gm-Message-State: AOAM533pUeVoxHZYw/jOKa/U6wo/2c2zar3siXAEvPKTvhrKFCypHnD8
        qElN3ldRz5v9gGl9Rfu7S0aKsA==
X-Google-Smtp-Source: ABdhPJxM85T0FzOYq+u8F9o4EsXhOA/DjOfUfncdRKLbnKazJufGF2ZhCsN8URE01mtnSZ5QoFjk5g==
X-Received: by 2002:a63:4d5a:: with SMTP id n26mr25014355pgl.85.1593043850074;
        Wed, 24 Jun 2020 17:10:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n19sm17458671pgb.0.2020.06.24.17.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:10:49 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module
Date:   Thu, 25 Jun 2020 00:10:39 +0000
Message-Id: <20200625001039.56174-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625001039.56174-1-john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow the qcom_scm driver to be loadable as a
permenent module.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/firmware/Kconfig    | 2 +-
 drivers/firmware/Makefile   | 3 ++-
 drivers/firmware/qcom_scm.c | 4 ++++
 drivers/iommu/Kconfig       | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index fbd785dd0513..9e533a462bf4 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -236,7 +236,7 @@ config INTEL_STRATIX10_RSU
 	  Say Y here if you want Intel RSU support.
 
 config QCOM_SCM
-	bool
+	tristate "Qcom SCM driver"
 	depends on ARM || ARM64
 	select RESET_CONTROLLER
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 99510be9f5ed..cf24d674216b 100644
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
index 0e7233a20f34..b5e88bf66975 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1155,6 +1155,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
 
 static struct platform_driver qcom_scm_driver = {
 	.driver = {
@@ -1170,3 +1171,6 @@ static int __init qcom_scm_init(void)
 	return platform_driver_register(&qcom_scm_driver);
 }
 subsys_initcall(qcom_scm_init);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SCM driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b510f67dfa49..714893535dd2 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
 config ARM_SMMU
 	tristate "ARM Ltd. System MMU (SMMU) Support"
 	depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
+	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU if ARM
@@ -500,6 +501,7 @@ config QCOM_IOMMU
 	# Note: iommu drivers cannot (yet?) be built as modules
 	bool "Qualcomm IOMMU Support"
 	depends on ARCH_QCOM || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on QCOM_SCM=y
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
 	select ARM_DMA_USE_IOMMU
-- 
2.17.1

