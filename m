Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C943F1891
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 13:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbhHSLyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 07:54:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40237 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238105AbhHSLyK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Aug 2021 07:54:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629374014; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WcCFdH5JEmFHqMKvWJSTXib1yDiU97/7LOIWNYewueE=; b=vg3klUaKZn1rGfJ0xi/TjJVQR87510hCHcHX2IAzHV1QeNwVuPi6FT07Jh2TQQOn46bhjhE7
 sL7NQ+7lGoHyOtUIw4WEaL8I66w5JR2hYxRHx3Nc5D/tHOOgoIiJfaRiHz/2ENdRg6bVVdwT
 eh5VCmDphrOVc6ZohI1ewbohVGI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 611e46399507ca1a34f7cea4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 11:53:29
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1C46C43617; Thu, 19 Aug 2021 11:53:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ACE1AC43619;
        Thu, 19 Aug 2021 11:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org ACE1AC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 1/3] irqdomain: Export irq_domain_disconnect_hierarchy()
Date:   Thu, 19 Aug 2021 17:23:11 +0530
Message-Id: <1629373993-13370-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
References: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export irq_domain_disconnect_hierarchy() so irqchip module drivers
can use it.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 0eee481..19e83e9 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1216,6 +1216,7 @@ int irq_domain_disconnect_hierarchy(struct irq_domain *domain,
 	irqd->chip = ERR_PTR(-ENOTCONN);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(irq_domain_disconnect_hierarchy);
 
 static int irq_domain_trim_hierarchy(unsigned int virq)
 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

