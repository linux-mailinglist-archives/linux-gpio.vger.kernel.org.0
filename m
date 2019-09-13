Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB498B27D1
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403934AbfIMWAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 18:00:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59510 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731449AbfIMV7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6192160A00; Fri, 13 Sep 2019 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411984;
        bh=6f0lTQnrx5z1wDAiPKuaRnk5KF6fWCBKtD1ja6XdbS8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CvmO9oXIZENnRUtpeIiLieiwnQ315SnlUgJmIltt6U61JE7hYnijToNkl2TBRYyUp
         zo41uofQCRaf9CvAR96iFDrmMpfPFHNVEUACuERB99hpvN2Gl4P6mSYUqMeaRsFlMe
         0G7NFtrGSiOFi1Z8RoNGqlov5b54PrQkKMw3E7TU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C42460790;
        Fri, 13 Sep 2019 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411983;
        bh=6f0lTQnrx5z1wDAiPKuaRnk5KF6fWCBKtD1ja6XdbS8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XVcCRMi9TpjLkyFd0vQLOh2Wa4zb8VngMPImuZAdAZx8RArDt3VQ9R9PWAP19EdNK
         TA4gK2k54cC19j0K96nx/pEOWjgFHcpB8JlHJWeick1td5KqwKtgWDjA9Afk5QG+1Q
         /pt1YHixaRh9e4d1JcTA8foTnXZ38GHtA9MAk8N0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C42460790
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 02/14] drivers: irqchip: qcom-pdc: update max PDC interrupts
Date:   Fri, 13 Sep 2019 15:59:10 -0600
Message-Id: <1568411962-1022-3-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Newer SoCs have increased the number of interrupts routed to the PDC
interrupt controller. Update the definition of max PDC interrupts.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index faa7d61..b230794 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/err.h>
@@ -18,7 +18,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define PDC_MAX_IRQS		126
+#define PDC_MAX_IRQS		168
 
 #define CLEAR_INTR(reg, intr)	(reg & ~(1 << intr))
 #define ENABLE_INTR(reg, intr)	(reg | (1 << intr))
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

