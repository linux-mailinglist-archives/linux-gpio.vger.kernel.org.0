Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274E62A8E56
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 05:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgKFE1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 23:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgKFE1Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 23:27:16 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FEDC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 20:27:16 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q10so172954pfn.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 20:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6GAtoi0gVMYIKFbxsRQ9yjVpGK0SYChEDBpydmhHoW4=;
        b=riyHAwyPJJRJ3tCsc6zGAB3UC/1B1HExo9jctZcDGkiQmEILAD4mHJnvIqCCBXsvag
         jmfG8D9uSkGQY5+U2dsPWpj61pnEDFVn3HAkearWhUl2K5jBqcYRyV1sMGmx1oMDtfJF
         mZskj0bXc/q19E8VUxQVa9P99B87zbTMnHhmECAccREzO65Y0/1GcgzKjoQ28tFJ5VX7
         bvEwiRT2+RSKz3UmFe0PnrJYENQCJnTJFycA35xYumjVo2SSQxPr00KUvDDy374cBc/M
         aB+jrtSAyl9KqJF/B/rDyLrazqv8iK1yQu2v0qI3g+VlLpz3+kM6bTedAeO/xxSQ/6aG
         ZJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6GAtoi0gVMYIKFbxsRQ9yjVpGK0SYChEDBpydmhHoW4=;
        b=iojrAN1ZdBU09cgiohGCMCwVuZ22edvIvfGqbao5zAEja+aFOGZpAHLhPRFfesM9vo
         gNuonyq1vJEHkCVf91jpzx3JlTJSaZIGvan9UgMy3hJHpZ1KBEpK13qUF8Qlg4Zp5apf
         RltzjHpkXdEsFoRnTWLHjuXVdHnkU4L1Y9fkdRR/KEa4JwRym0MvcI6GIUZpXtILaSju
         +x4VjM0BNsMLJ/gesthPTGSbBa5JGhvOdSSrISSEYZEXcNlHnHBzhQi05f7gKwWz6HVa
         sm9xDHnjvrjdt/bx7ZdSbs8HfIZdju0sh92Kv+6uqNhMY+FtDu62BrLWh+GBOOH4UZLn
         +OVQ==
X-Gm-Message-State: AOAM533TKg5m0PTswTw76VFqR5B7l3KRMYYdTNPOcqNrLs6KFOC3YX5W
        BB3JVeGdxNwUe0oAWVR0UMqQGQ==
X-Google-Smtp-Source: ABdhPJwIfqzQs0Hz0ONJ2Cwc9narnnGapHKO01mr7EPFz2YXkckIhaGBz/VTvcX3yWfrD8ZnI2B/Lw==
X-Received: by 2002:a17:90b:602:: with SMTP id gb2mr387639pjb.12.1604636835693;
        Thu, 05 Nov 2020 20:27:15 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e24sm179864pfl.149.2020.11.05.20.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 20:27:15 -0800 (PST)
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
Subject: [PATCH v6 2/3] pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
Date:   Fri,  6 Nov 2020 04:27:09 +0000
Message-Id: <20201106042710.55979-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106042710.55979-1-john.stultz@linaro.org>
References: <20201106042710.55979-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tweaks to allow pinctrl-msm code to be loadable as a module.

This is needed in order to support having the qcom-scm driver,
which pinctrl-msm calls into, configured as a module.

This requires that we tweak Kconfigs selecting PINCTRL_MSM to
also depend on QCOM_SCM || QCOM_SCM=n so that we match the
module setting of QCOM_SCM.

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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Module description and whitespace fixes suggested by Bjorn
* Added QCOM_SCM || QCOM_SCM=n bits on Kconfigs selecting
  PINCTRL_MSM. Reported by both Todd and Bjorn.
v3:
* Make sure the QCOM_SCM || QCOM_SCM=n trick is commented
v4:
* Rework "select PINCTRL_MSM" to "depends on PINCTRL_MSM"
  to consolidate the QCOM_SCM dependency.
v5:
* Add PINCTRL_MSM to arm64 defconfig
v6:
* Split PINCTRL_MSM dependency bit out into its own patch
---
 drivers/pinctrl/qcom/Kconfig       | 3 ++-
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index c9bb2d9e49d47..8bb786ed152dd 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -2,7 +2,8 @@
 if (ARCH_QCOM || COMPILE_TEST)
 
 config PINCTRL_MSM
-	bool "Qualcomm core pin controller driver"
+	tristate "Qualcomm core pin controller driver"
+	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index c4bcda90aac4a..988343ac49b92 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1443,3 +1443,5 @@ int msm_pinctrl_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. TLMM driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

