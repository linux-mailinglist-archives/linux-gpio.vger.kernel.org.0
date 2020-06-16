Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2D91FA89D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 08:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgFPGNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 02:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgFPGNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 02:13:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD461C03E96A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id d6so1051284pjs.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sjkuZIHgOGWNn0NM6WxaSWNlrL5TYHvrP2K4MQU57Qs=;
        b=z0Ya8NgIc7JGqkE+pEiQxFdlLb1wI+YIdEhjbg63klsr9SrNdiWfoslKkTEk6he3qf
         dTUbIL6TJWmiUS0mE3JJ680pY6mwbVwm9fG095z+akltQXiIt/Tm5YyuCKRkSwJXGNid
         ueARo5vX67GhC0jJKeiZ2O+xPlAIi7b5zjFyw/jrwW3EbNRMWWSbx4GCMJKpWzAcY6s3
         Y8m3moUHonrenxnBYqM8BdukDS/D1MI63FiKaoqHeoenLKaFkHzd09/PJzgJghFTgGx8
         D2F/uagbw34y3bfQlXcZWfvjzd1pHQlziWnls/d601EqJCI2KUVag4SNPvTdFblJyVbx
         GVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sjkuZIHgOGWNn0NM6WxaSWNlrL5TYHvrP2K4MQU57Qs=;
        b=Fe1csdp/4hQjzoBE+qbFrRYoA9rldXNVqeyHBzi0YilPsuNuOad1bJkCEb2kiRbG46
         lRkk2L8wNS+sIrsKK+8r4tc0oJgvnDaQRbLQOXIJOC5it6O77QbCHQeWPf8uF25rCNuV
         t2JSrLt01Cniho5Ls2mRlgyNBaU3hg9zKPiaR1wGN6EBZ6TzIvKT5Mnuwa8o9ZL/qDS7
         GdvLRih7Vxf4MXD9ZpR8/VRz4OOuzPf6sAxe1bna+1yQOKXlamh1kAGpstUqWxoFI0Ab
         q0/bCmEfJ4df/0tRjMZ1x1wq1h8usOh8Zk7fVhjTDjgbioLeQYwrE/2/11FsomBtkcR6
         8bnA==
X-Gm-Message-State: AOAM5331Kuf8c7h8zALC0QLJQD+TikDEbjMgvQ+O8t+YUgAjQoNXnYdM
        uLh1o+uIYURnnqDPMpi/FnSAjQ==
X-Google-Smtp-Source: ABdhPJwYhjtOBdx0zxRParoCjvCJBIOPOU1zn3RHlSdNmeSw/AbOBT8/4UQJOQjCCNZqxbJatymuaQ==
X-Received: by 2002:a17:90b:3004:: with SMTP id hg4mr1670052pjb.208.1592288028324;
        Mon, 15 Jun 2020 23:13:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id i26sm15642032pfo.0.2020.06.15.23.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 23:13:47 -0700 (PDT)
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
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [RFC][PATCH 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module
Date:   Tue, 16 Jun 2020 06:13:38 +0000
Message-Id: <20200616061338.109499-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616061338.109499-1-john.stultz@linaro.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
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

