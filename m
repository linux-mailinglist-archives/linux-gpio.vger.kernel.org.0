Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1E41FAF2C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 13:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgFPLa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 07:30:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30480 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgFPLaX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 07:30:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592307022; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RTLcSYYKGCznp62vlVdfOr6g6s60R3IwkNGZ7WpqjjY=; b=ZF/5DYdqupv7zpk0jFvyF/pc1dF7YEJL42s2XEk9A4eqfSVHiMMKxZUgAStkueUK8q4zev8w
 BVXWURZi5hy+3iUdRIjKCKNoI2SWhG6XTLYRgPFTKERWh0O4M05yx+DCuG6qFPR8MCn87B/t
 Qdk/w26jdtzDPaJCgRL/nd6+gik=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ee8ad43567385e8e7c150fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 11:30:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65EC4C433A1; Tue, 16 Jun 2020 11:30:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.0.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A225C433C9;
        Tue, 16 Jun 2020 11:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A225C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFC][PATCH 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 perment module
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-4-john.stultz@linaro.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <55e5982a-1e73-7013-e02d-5d1d30815fba@codeaurora.org>
Date:   Tue, 16 Jun 2020 16:59:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616061338.109499-4-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 6/16/2020 11:43 AM, John Stultz wrote:
> Allows qcom-pdc driver to be loaded as a permenent module

typo: permanent

> Also, due to the fact that IRQCHIP_DECLARE becomes a no-op when
> building as a module, we have to add the platform driver hooks
> explicitly.
>
> Thanks to Saravana for his help on pointing out the
> IRQCHIP_DECLARE issue and guidance on a solution.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/irqchip/Kconfig    |  2 +-
>   drivers/irqchip/qcom-pdc.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 29fead208cad..12765bed08f9 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -425,7 +425,7 @@ config GOLDFISH_PIC
>            for Goldfish based virtual platforms.
>   
>   config QCOM_PDC
> -	bool "QCOM PDC"
> +	tristate "QCOM PDC"
>   	depends on ARCH_QCOM
>   	select IRQ_DOMAIN_HIERARCHY
>   	help
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 6ae9e1f0819d..98d74160afcd 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -11,7 +11,9 @@
>   #include <linux/irqdomain.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_irq.h>
please move this include in order after of_device.h
>   #include <linux/of_address.h>
>   #include <linux/of_device.h>
>   #include <linux/soc/qcom/irq.h>
> @@ -430,4 +432,32 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>   	return ret;
>   }
>   
> +#ifdef MODULE
> +static int qcom_pdc_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *parent = of_irq_find_parent(np);
> +
> +	return qcom_pdc_init(np, parent);
> +}
> +
> +static const struct of_device_id qcom_pdc_match_table[] = {
> +	{ .compatible = "qcom,pdc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
> +
> +static struct platform_driver qcom_pdc_driver = {
> +	.probe = qcom_pdc_probe,
> +	.driver = {
> +		.name = "qcom-pdc",
> +		.of_match_table = qcom_pdc_match_table,

can you please set .suppress_bind_attrs = true,

This is to prevent bind/unbind using sysfs. Once irqchip driver module 
is loaded, it shouldn't get unbind at runtime.

Thanks,
Maulik
> +	},
> +};
> +module_platform_driver(qcom_pdc_driver);
> +#else
>   IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
> +#endif
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
> +MODULE_LICENSE("GPL v2");

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

