Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44BAFE785
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfKOWRq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:17:46 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47084 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfKOWRp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:45 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D03356110D; Fri, 15 Nov 2019 22:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856264;
        bh=H7EIuSj3inAEWMh8l92XUYSE0NT9quVn5kYYn9WSNeM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=deSp+3nUWvpF1cYsIZYkHSFsPsKZTs+7HRr4c5CgrL8rh8VqXvK5vP1Ub/+xapvRb
         H9t644yX1/D3uAQOMiBGxnNzkaUypjO1+/t83CxaPagsKgvx3whj3LC1kYuzA6bPoc
         anknIwvIkivj4SS58zBR/bKrnfMS2iJjHDsk0sfs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DA4661015;
        Fri, 15 Nov 2019 22:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856264;
        bh=H7EIuSj3inAEWMh8l92XUYSE0NT9quVn5kYYn9WSNeM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=deSp+3nUWvpF1cYsIZYkHSFsPsKZTs+7HRr4c5CgrL8rh8VqXvK5vP1Ub/+xapvRb
         H9t644yX1/D3uAQOMiBGxnNzkaUypjO1+/t83CxaPagsKgvx3whj3LC1kYuzA6bPoc
         anknIwvIkivj4SS58zBR/bKrnfMS2iJjHDsk0sfs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DA4661015
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 02/12] drivers: irqchip: qcom-pdc: update max PDC interrupts
Date:   Fri, 15 Nov 2019 15:11:45 -0700
Message-Id: <1573855915-9841-3-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Newer SoCs have increased the number of interrupts routed to the PDC
interrupt controller. Update the definition of max PDC interrupts.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/irqchip/qcom-pdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index c175333..690cf10 100644
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

