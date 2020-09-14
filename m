Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE8126975C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 23:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgINVEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 17:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgINVEf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 17:04:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1568C061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 14:04:35 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y6so122889plt.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 14:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B+yZcshbsoNrjw9/GyoZ6sfB8u3DeY+uiG54+fPG2CA=;
        b=QIZLLxWuhPfcEVva2nJ767qbObasCjM9V8Jb31/dgJYJjdusHNi8YJsv5gLnNFQ7Yc
         rLHu37Wddk1sIpLHa0uP3I2h9zA71vHPOqj0TBgvBDuJtNcIpUFN3mpmixq4QM8rTCJd
         5RQ6lPaeIlVGNC4K+e1WheYhHnFTvAshW+15lTv/zvbez9g3zYXzhh8MmXmOP/82L8EE
         Kf9PqYHd0cb8gb3Y/GDOZ4tGCV6XOqLSlkPmMblYk+Rl4KQkPGqxbCFqXTzaLci5PVLj
         WJx4XXmmmHz8fepTSyu12BiVF7duEd/kPijfysMl56mAUi9m8XaYBKLjFDMSCx0duFR3
         9e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B+yZcshbsoNrjw9/GyoZ6sfB8u3DeY+uiG54+fPG2CA=;
        b=EM04lGvoLs/h04/FpSF2apln00UFOBaQp2D700kMjjiAsBkzFForEVkKe88689YurS
         4XLRUhrZl3nO94eY56Ttpr0AxaOHvvrKitRaZy8uPX7pdCSWKMR1wNyn3jC4rEYK9oUu
         jyOEq6/kcPmbg63koNla9pfr2XlhPNprj2orSNPeZ4zHGeyyyn1z0Qz0tITg52XKM2sr
         ImRSkhQh2p36zCSuUIUjaR1wjbhRWylXvveX4uCvcgoThf4oB16LDVHq4EYaWyuxxreK
         BriGdPzsn2qA7NyFbiQznMOLQsh+5yehTbwUcKhBQB1foWOVMOPowdZLbLL4GsSxliCV
         mSrg==
X-Gm-Message-State: AOAM530dO9om8SXFgMX3mDG3p8aj6yHY5O6JBOTeqKM/e/SMb9IrOj1+
        ipNvFjkGD+mq1C6bByqVm2sm3w==
X-Google-Smtp-Source: ABdhPJw4meDLhT1GWDTqYGlWuh5s5sZygb+syXL21fk3JYEchsaLbg8+bnuLLk7x6vlu2XvHtk24cQ==
X-Received: by 2002:a17:90a:e513:: with SMTP id t19mr1080297pjy.137.1600117475340;
        Mon, 14 Sep 2020 14:04:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n9sm11222480pfu.163.2020.09.14.14.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 14:04:34 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     linux-kernel@vger.kernel.org
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
Subject: [PATCH] irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a permanent module
Date:   Mon, 14 Sep 2020 21:04:23 +0000
Message-Id: <20200914210423.67579-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912125148.1271481-7-maz@kernel.org>
References: <20200912125148.1271481-7-maz@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allows qcom-pdc driver to be loaded as a permanent module.

An earlier version of this patch was merged in a larger patchset
but was reverted entirely when issues were found with other
drivers, so now that Marc has provided a better solution in his
Hybrid probing patch set, I wanted to re-submit this change.

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
 drivers/irqchip/Kconfig    | 2 +-
 drivers/irqchip/qcom-pdc.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bfc9719dbcdc..bb70b7177f94 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -425,7 +425,7 @@ config GOLDFISH_PIC
          for Goldfish based virtual platforms.
 
 config QCOM_PDC
-	bool "QCOM PDC"
+	tristate "QCOM PDC"
 	depends on ARCH_QCOM
 	select IRQ_DOMAIN_HIERARCHY
 	help
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 8543fa23da10..59eb3c8473b0 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -433,3 +433,5 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 IRQCHIP_HYBRID_DRIVER_BEGIN(qcom_pdc)
 IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
 IRQCHIP_HYBRID_DRIVER_END(qcom_pdc)
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

