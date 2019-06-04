Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC0C33FEC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 09:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfFDHUV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 03:20:21 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34694 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfFDHUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 03:20:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id c85so3338206pfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D3XWMIqhXFSeKwJRGJ6IYznTDgg0AaloPMfGvuC80wY=;
        b=X8Atb4xA74DTxVSx/Ukx/fVa0wQKoezZtlxqvBf96Cf95zR2X1FfRXwJesGaQZdL81
         Ki3C59Rptp13xpbiX/YwbAQriKHHYOP8RB57asRp25JOM9bmtIgLSecC3+xGNnzsRB/h
         Xr8W/s+GvDudZP7kUJBeUMf4LPBBKOwKQvyhcIF2pPwUc4M0COinI0f0F9NFxjWqY2y3
         KsN2qiYtNfie3Dyb5EO7qO13QROoyWkuFLfEc7m74O01zBpWkQw0GTg2EdHfBiZeD+d9
         cZDV5H3fJjtubbILssEhG3IOyBv9mAKLCWwsDVQupXFYhQ5+6TLcCZRQv7dhqVJGWL6z
         8CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D3XWMIqhXFSeKwJRGJ6IYznTDgg0AaloPMfGvuC80wY=;
        b=jpExDf1A8xpip7Tf7Wm2w+N+2aOfVyk8VselErY99m118CKE7qqPKtXR2Dr8bS116Z
         AlFGWq8BTC45s+ADIEr1az5bUo9Dj1X19onI23piakkj+Px+KHmFxTqR+Qcx1kDyxuCI
         4n14LtC+TPY4IbPW62uJrRJiwxXV4rHWIhTzgqKeVa8TLclrrTzN3kOx6U5hBQwcEpAE
         cKK84LATYXbuy171FX98A3qUW3Jb9fNLeMpoNlC5IUmL88+15dWggwn3WSVSJ/48J33k
         PGMKxdWN0hxi4JTh1LbsGpit0OFatV26Dd/+aXQuWjeonZRwo4NO6jd3HuQwi/EFyTpZ
         7ZIQ==
X-Gm-Message-State: APjAAAXBECrNCfDBuNQDhtSKeXPPVjhC/kLLF0K0Ny7mI3wL4R3rdXaI
        VAV17ConxG3aULXk/ljsDPvaoQ==
X-Google-Smtp-Source: APXvYqwIp0yPQVLkTzYfOYL8foJhru05lDR4yF3ReVF/y76RzLLNdJInPRCaoMp0xsnrSEllMGMDiQ==
X-Received: by 2002:a17:90a:9504:: with SMTP id t4mr35609032pjo.100.1559632806648;
        Tue, 04 Jun 2019 00:20:06 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d6sm17747446pgv.4.2019.06.04.00.20.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 00:20:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Date:   Tue,  4 Jun 2019 00:20:00 -0700
Message-Id: <20190604072001.9288-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190604072001.9288-1-bjorn.andersson@linaro.org>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Acquire the device-reset GPIO and toggle this to reset the UFS device
during initialization and host reset.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/scsi/ufs/ufshcd.c | 44 +++++++++++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufshcd.h |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8c1c551f2b42..951a0efee536 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -42,6 +42,7 @@
 #include <linux/nls.h>
 #include <linux/of.h>
 #include <linux/bitfield.h>
+#include <linux/gpio/consumer.h>
 #include "ufshcd.h"
 #include "ufs_quirks.h"
 #include "unipro.h"
@@ -6104,6 +6105,25 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	return err;
 }
 
+/**
+ ufshcd_device_reset() - toggle the (optional) device reset line
+ * @hba: per-adapter instance
+ *
+ * Toggles the (optional) reset line to reset the attached device.
+ */
+static void ufshcd_device_reset(struct ufs_hba *hba)
+{
+	/*
+	 * The USB device shall detect reset pulses of 1us, sleep for 10us to
+	 * be on the safe side.
+	 */
+	gpiod_set_value_cansleep(hba->device_reset, 1);
+	usleep_range(10, 15);
+
+	gpiod_set_value_cansleep(hba->device_reset, 0);
+	usleep_range(10, 15);
+}
+
 /**
  * ufshcd_host_reset_and_restore - reset and restore host controller
  * @hba: per-adapter instance
@@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
 	int retries = MAX_HOST_RESET_RETRIES;
 
 	do {
+		/* Reset the attached device */
+		ufshcd_device_reset(hba);
+
 		err = ufshcd_host_reset_and_restore(hba);
 	} while (err && --retries);
 
@@ -7355,6 +7378,18 @@ static void ufshcd_variant_hba_exit(struct ufs_hba *hba)
 	ufshcd_vops_exit(hba);
 }
 
+static int ufshcd_init_device_reset(struct ufs_hba *hba)
+{
+	hba->device_reset = devm_gpiod_get_optional(hba->dev, "device-reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(hba->device_reset)) {
+		dev_err(hba->dev, "failed to acquire reset gpio: %ld\n",
+			PTR_ERR(hba->device_reset));
+	}
+
+	return PTR_ERR_OR_ZERO(hba->device_reset);
+}
+
 static int ufshcd_hba_init(struct ufs_hba *hba)
 {
 	int err;
@@ -7394,9 +7429,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
 	if (err)
 		goto out_disable_vreg;
 
+	err = ufshcd_init_device_reset(hba);
+	if (err)
+		goto out_disable_variant;
+
 	hba->is_powered = true;
 	goto out;
 
+out_disable_variant:
+	ufshcd_vops_setup_regulators(hba, false);
 out_disable_vreg:
 	ufshcd_setup_vreg(hba, false);
 out_disable_clks:
@@ -8290,6 +8331,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 		goto exit_gating;
 	}
 
+	/* Reset the attached device */
+	ufshcd_device_reset(hba);
+
 	/* Host controller enable */
 	err = ufshcd_hba_enable(hba);
 	if (err) {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index ecfa898b9ccc..d8be67742168 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -72,6 +72,8 @@
 #define UFSHCD "ufshcd"
 #define UFSHCD_DRIVER_VERSION "0.2"
 
+struct gpio_desc;
+
 struct ufs_hba;
 
 enum dev_cmd_type {
@@ -706,6 +708,8 @@ struct ufs_hba {
 
 	struct device		bsg_dev;
 	struct request_queue	*bsg_queue;
+
+	struct gpio_desc *device_reset;
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
-- 
2.18.0

