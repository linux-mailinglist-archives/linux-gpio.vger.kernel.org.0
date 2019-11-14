Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D251AFCDE1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfKNSfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:35:41 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55714 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfKNSfk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:35:40 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2E6C9613C2; Thu, 14 Nov 2019 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756540;
        bh=0/Uz7FcvwScHpeSWK38veIDpYtyw95icYg5VdTw1P70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VB9ejuNKIzm3jv52T+rd3l7m/JbJzvlFBOGysdN8Ma+AaU4KuEelODOUGDsQOmWSC
         wYQoNiXXghHtOwGXd6oH/Wgbf+xNLM/CrpVKBmKwhM9H48nG1N0v4FHWPa74e9X1HP
         WulIAIfNvIVBR8DhEtF+915aMKBYDP+Qsvs3kdoE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF5A1611AC;
        Thu, 14 Nov 2019 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756537;
        bh=0/Uz7FcvwScHpeSWK38veIDpYtyw95icYg5VdTw1P70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D8chIzwxUAPLJ1xk/nYpHjihiXBp2WhJZ7VdUwIop2VO3/DfQvA/dslbC2SzJRj8W
         zD+HlPJwNhAXpqj9NyxnvqPB2f/RFMZthkXBi5EkiloXMt5Cbh6q4rCMavfNrjBuJ5
         l9epsJWy4CQKk8X3ECR/t3a+5Q5CpG6IQGnRfE70=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF5A1611AC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 02/12] drivers: irqchip: qcom-pdc: update max PDC interrupts
Date:   Thu, 14 Nov 2019 11:35:11 -0700
Message-Id: <1573756521-27373-3-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
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

