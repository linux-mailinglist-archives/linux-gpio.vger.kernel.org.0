Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A18F3F189B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 13:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239217AbhHSLy0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 07:54:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40237 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239163AbhHSLyZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Aug 2021 07:54:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629374029; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mkA2F+FTNtNLRSJkai7J0ZCwEz0oeJaaKKqE+ELjbCg=; b=c/rlvBsDsMZrSP4jYtz6G008JahJP3yzPfxSkj4Jnu92HKOlt+8Nh4N7xrPZDSfSwIMQRuSb
 EFJxLfOmUD15B70pTQNVq/JoiSFZ8WIO2tk/eUXcE4jfjrkI2WnsVYHln5GsX/ThOxMJIxeK
 QeFeN6RzMm1f5zL0bVVxcHBE41I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 611e463566ff1079048f7663 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 11:53:25
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7AC15C43617; Thu, 19 Aug 2021 11:53:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 964B7C43460;
        Thu, 19 Aug 2021 11:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 964B7C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 0/3] Start getting rid of the GPIO_NO_WAKE_IRQ
Date:   Thu, 19 Aug 2021 17:23:10 +0530
Message-Id: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

Maulik Shah (2):
  irqdomain: Export irq_domain_disconnect_hierarchy()
  irqdomain: Fix irq_domain_trim_hierarchy()

 drivers/irqchip/qcom-pdc.c | 75 +++++++++++-----------------------------------
 kernel/irq/irqdomain.c     |  6 ++--
 2 files changed, 22 insertions(+), 59 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

