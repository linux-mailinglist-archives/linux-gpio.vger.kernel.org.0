Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8F03F4654
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 10:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbhHWIFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 04:05:39 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56455 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbhHWIFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Aug 2021 04:05:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629705896; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UbeUnIaewsJMuXqIc2FtMBAKVs1ca4S21rjIADsGJvA=; b=G9yHyWApqaDLV+qpSaPMwI4IBiQO/MKDKQQnJ65ROWckI5XHpSLKGxw46QpltmKW3V/zZ1J9
 UZugMsGEeRLEaFdk/gogRxoBAYHhUWtD3TXf76R9Yvcdii0+DbwUISa2PPoekwGEmMntAmNg
 mldJjhrqpeMBFz8Tzk1XT4iRs90=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 612356a72b9e91b6888bba01 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 08:04:55
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2842AC43617; Mon, 23 Aug 2021 08:04:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4399CC4338F;
        Mon, 23 Aug 2021 08:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4399CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v3 0/2] Start getting rid of the GPIO_NO_WAKE_IRQ
Date:   Mon, 23 Aug 2021 13:34:38 +0530
Message-Id: <1629705880-27877-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v3:
- Address comment to call irq_domain_trim_hierarchy() once on v2 patch 3.
- Remove patch2 of v2 as seen no more needed.

v2:
- Use fix from marc [1] and drop v1 patch 2
- Add new patch for fixes irq_domain_trim_hierarchy()

gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non wakeup
capable GPIOs that do not have dedicated interrupt at GIC.

Since PDC irqchip do not allocate irq at parent GIC domain for such GPIOs
indicate same by using irq_domain_disconnect_hierarchy() for it own domain
and all its parent domains.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/qcom-pdc-nowake&id=331b2ba388a4a79b5c40b8addf56cbe35099a410
[2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=532669


Marc Zyngier (1):
  irqchip/qcom-pdc: Start getting rid of the GPIO_NO_WAKE_IRQ

Maulik Shah (1):
  irqdomain: Export irq_domain_disconnect_hierarchy()

 drivers/irqchip/qcom-pdc.c | 68 ++++++++--------------------------------------
 kernel/irq/irqdomain.c     |  1 +
 2 files changed, 12 insertions(+), 57 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

