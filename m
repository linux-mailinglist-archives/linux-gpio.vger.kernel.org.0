Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DB93F1898
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 13:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239187AbhHSLyY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 07:54:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26266 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239106AbhHSLyX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Aug 2021 07:54:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629374027; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TBLu8AEqhlSORszkH6UpNxhU0wkdOYkWH/VG0IJnv8M=; b=F5lJjUuo2hg+8yoAHZYggsL0xy/ATGwwSiHAjIdiXawgEThOctAsxdx6tepJMyo26FaV36zQ
 rbkmspos+pw34elNAhZgs3ls8/Ypp4E3NFpewUTlSzY22J+3ZtWVg9kQ1YtVVcKjYigExIp0
 tGg5QMcLbEUNzL49OY1vGHEY0fI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 611e463d9507ca1a34f7dc0f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 11:53:33
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC0FBC43616; Thu, 19 Aug 2021 11:53:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC269C4361B;
        Thu, 19 Aug 2021 11:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BC269C4361B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 2/3] irqdomain: Fix irq_domain_trim_hierarchy()
Date:   Thu, 19 Aug 2021 17:23:12 +0530
Message-Id: <1629373993-13370-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
References: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently tail marker is moving along with parent domain
irq data. Fix this to initialize only once from where all
parent domain needs trimming.

Also correct the valid irq chip check.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 kernel/irq/irqdomain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 19e83e9..9f6187b 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1235,7 +1235,7 @@ static int irq_domain_trim_hierarchy(unsigned int virq)
 	 */
 	for (irqd = irq_data->parent_data; irqd; irq_data = irqd, irqd = irqd->parent_data) {
 		/* Can't have a valid irqchip after a trim marker */
-		if (irqd->chip && tail)
+		if (!IS_ERR(irqd->chip) && tail)
 			return -EINVAL;
 
 		/* Can't have an empty irqchip before a trim marker */
@@ -1247,7 +1247,8 @@ static int irq_domain_trim_hierarchy(unsigned int virq)
 			if (PTR_ERR(irqd->chip) != -ENOTCONN)
 				return -EINVAL;
 
-			tail = irq_data;
+			if (!tail)
+				tail = irq_data;
 		}
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

