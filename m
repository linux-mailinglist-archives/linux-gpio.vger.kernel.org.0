Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456141FBABC
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 18:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730857AbgFPQNu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 12:13:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:29197 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731920AbgFPQNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 12:13:49 -0400
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jun 2020 12:13:47 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592324028; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=MD92WfPRgR/jkFLJAG2o5YhCjEHFWsLDGTiEaMXk+O4=; b=bk6w68bOp8tUx8zWBNm29Xa8VCXbz1vhUjnF2N+cO2L1bPtWEraQIfnipDUBhLqVcCNMmh8m
 57s0BrwL4M0omKe3UfOlW4kod4Gf9Ns8HayBVccgL0jGZQhLOlbjFWHjth2qlCBiNYoHSYmv
 +tnn4BgHDJLZzub01bTDBxSKmRk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ee8ee75bfb34e631cae2c63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 16:08:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9B68C433AD; Tue, 16 Jun 2020 16:08:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2594BC433CA;
        Tue, 16 Jun 2020 16:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2594BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 16 Jun 2020 10:08:18 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: Re: [RFC][PATCH 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 perment module
Message-ID: <20200616160818.GD12942@codeaurora.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-4-john.stultz@linaro.org>
 <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16 2020 at 05:30 -0600, Maulik Shah wrote:
>Hi,
>
>On 6/16/2020 11:43 AM, John Stultz wrote:
>>Allows qcom-pdc driver to be loaded as a permenent module
>
>typo: permanent
>
>>Also, due to the fact that IRQCHIP_DECLARE becomes a no-op when
>>building as a module, we have to add the platform driver hooks
>>explicitly.
>>
>>Thanks to Saravana for his help on pointing out the
>>IRQCHIP_DECLARE issue and guidance on a solution.
>>
>>Cc: Andy Gross <agross@kernel.org>
>>Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>Cc: Joerg Roedel <joro@8bytes.org>
>>Cc: Thomas Gleixner <tglx@linutronix.de>
>>Cc: Jason Cooper <jason@lakedaemon.net>
>>Cc: Marc Zyngier <maz@kernel.org>
>>Cc: Linus Walleij <linus.walleij@linaro.org>
>>Cc: Lina Iyer <ilina@codeaurora.org>
>>Cc: Saravana Kannan <saravanak@google.com>
>>Cc: Todd Kjos <tkjos@google.com>
>>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>Cc: linux-arm-msm@vger.kernel.org
>>Cc: iommu@lists.linux-foundation.org
>>Cc: linux-gpio@vger.kernel.org
>>Signed-off-by: John Stultz <john.stultz@linaro.org>
>>---
>>  drivers/irqchip/Kconfig    |  2 +-
>>  drivers/irqchip/qcom-pdc.c | 30 ++++++++++++++++++++++++++++++
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>>index 29fead208cad..12765bed08f9 100644
>>--- a/drivers/irqchip/Kconfig
>>+++ b/drivers/irqchip/Kconfig
>>@@ -425,7 +425,7 @@ config GOLDFISH_PIC
>>           for Goldfish based virtual platforms.
>>  config QCOM_PDC
>>-	bool "QCOM PDC"
>>+	tristate "QCOM PDC"
>>  	depends on ARCH_QCOM
>>  	select IRQ_DOMAIN_HIERARCHY
>>  	help
>>diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>>index 6ae9e1f0819d..98d74160afcd 100644
>>--- a/drivers/irqchip/qcom-pdc.c
>>+++ b/drivers/irqchip/qcom-pdc.c
>>@@ -11,7 +11,9 @@
>>  #include <linux/irqdomain.h>
>>  #include <linux/io.h>
>>  #include <linux/kernel.h>
>>+#include <linux/module.h>
>>  #include <linux/of.h>
>>+#include <linux/of_irq.h>
>please move this include in order after of_device.h
>>  #include <linux/of_address.h>
>>  #include <linux/of_device.h>
>>  #include <linux/soc/qcom/irq.h>
>>@@ -430,4 +432,32 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>>  	return ret;
>>  }
>>+#ifdef MODULE
>>+static int qcom_pdc_probe(struct platform_device *pdev)
>>+{
>>+	struct device_node *np = pdev->dev.of_node;
>>+	struct device_node *parent = of_irq_find_parent(np);
>>+
>>+	return qcom_pdc_init(np, parent);
>>+}
>>+
>>+static const struct of_device_id qcom_pdc_match_table[] = {
>>+	{ .compatible = "qcom,pdc" },
>>+	{}
>>+};
>>+MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
>>+
>>+static struct platform_driver qcom_pdc_driver = {
>>+	.probe = qcom_pdc_probe,
>>+	.driver = {
>>+		.name = "qcom-pdc",
>>+		.of_match_table = qcom_pdc_match_table,
>
>can you please set .suppress_bind_attrs = true,
>
>This is to prevent bind/unbind using sysfs. Once irqchip driver module 
>is loaded, it shouldn't get unbind at runtime.
>
That is a good point. We probably should do that to RPMH RSC driver as well.

>Thanks,
>Maulik
>>+	},
>>+};
>>+module_platform_driver(qcom_pdc_driver);
>>+#else
>>  IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
>>+#endif
>>+
>>+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
>>+MODULE_LICENSE("GPL v2");
>
>-- 
>QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>
