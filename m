Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAA83F462C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 09:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbhHWH46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 03:56:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10976 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235263AbhHWH44 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Aug 2021 03:56:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629705374; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=B1gMTIHDe63Hd6Huni5qoSBnGb8WqgIMHUY1HklXe2M=; b=AbiorFna54ld0HteP423f8o73AP4FKvEniEqH9ZQWHfJ3MUQ8faH+ASRHXHQ6mv5tGXmO2iP
 tSOzzyTGZCoNIO0oE+k8S96HosJwaXT9txBJpu/8ZhEZYCMzPM1an0ktvNWqpWTOhdmZTxZC
 CXAyt1Zb9zpVyidDybNiiVU06qM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6123549534bfa76979b6f109 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 07:56:05
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 19259C4360D; Mon, 23 Aug 2021 07:56:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.85.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CCAAEC4338F;
        Mon, 23 Aug 2021 07:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CCAAEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 3/3] irqchip/qcom-pdc: Start getting rid of the
 GPIO_NO_WAKE_IRQ
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        tkjos@google.com, lsrao@codeaurora.org
References: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
 <1629373993-13370-4-git-send-email-mkshah@codeaurora.org>
 <87k0kgqg6s.wl-maz@kernel.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <92b37bf7-654f-14c0-1f1c-64a1cd12427a@codeaurora.org>
Date:   Mon, 23 Aug 2021 13:25:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87k0kgqg6s.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/20/2021 9:08 PM, Marc Zyngier wrote:
> On Thu, 19 Aug 2021 12:53:13 +0100,
> Maulik Shah <mkshah@codeaurora.org> wrote:
>> From: Marc Zyngier <maz@kernel.org>
>>
>> gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non
>> wakeup capable GPIOs that do not have dedicated interrupt at GIC.
>>
>> Since PDC irqchip do not allocate irq at parent GIC domain for such
>> GPIOs indicate same by using irq_domain_disconnect_hierarchy() for
>> PDC and parent GIC domains.
>>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> [mkshah: Add loop to disconnect for all parents]
>> Tested-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/irqchip/qcom-pdc.c | 75 +++++++++++-----------------------------------
>>   1 file changed, 18 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 32d5920..696afca 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -53,26 +53,6 @@ static u32 pdc_reg_read(int reg, u32 i)
>>   	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
>>   }
>>   
>> -static int qcom_pdc_gic_get_irqchip_state(struct irq_data *d,
>> -					  enum irqchip_irq_state which,
>> -					  bool *state)
>> -{
>> -	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -		return 0;
>> -
>> -	return irq_chip_get_parent_state(d, which, state);
>> -}
>> -
>> -static int qcom_pdc_gic_set_irqchip_state(struct irq_data *d,
>> -					  enum irqchip_irq_state which,
>> -					  bool value)
>> -{
>> -	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -		return 0;
>> -
>> -	return irq_chip_set_parent_state(d, which, value);
>> -}
>> -
>>   static void pdc_enable_intr(struct irq_data *d, bool on)
>>   {
>>   	int pin_out = d->hwirq;
>> @@ -91,38 +71,16 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>   
>>   static void qcom_pdc_gic_disable(struct irq_data *d)
>>   {
>> -	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -		return;
>> -
>>   	pdc_enable_intr(d, false);
>>   	irq_chip_disable_parent(d);
>>   }
>>   
>>   static void qcom_pdc_gic_enable(struct irq_data *d)
>>   {
>> -	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -		return;
>> -
>>   	pdc_enable_intr(d, true);
>>   	irq_chip_enable_parent(d);
>>   }
>>   
>> -static void qcom_pdc_gic_mask(struct irq_data *d)
>> -{
>> -	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -		return;
>> -
>> -	irq_chip_mask_parent(d);
>> -}
>> -
>> -static void qcom_pdc_gic_unmask(struct irq_data *d)
>> -{
>> -	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> -		return;
>> -
>> -	irq_chip_unmask_parent(d);
>> -}
>> -
>>   /*
>>    * GIC does not handle falling edge or active low. To allow falling edge and
>>    * active low interrupts to be handled at GIC, PDC has an inverter that inverts
>> @@ -159,14 +117,10 @@ enum pdc_irq_config_bits {
>>    */
>>   static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
>>   {
>> -	int pin_out = d->hwirq;
>>   	enum pdc_irq_config_bits pdc_type;
>>   	enum pdc_irq_config_bits old_pdc_type;
>>   	int ret;
>>   
>> -	if (pin_out == GPIO_NO_WAKE_IRQ)
>> -		return 0;
>> -
>>   	switch (type) {
>>   	case IRQ_TYPE_EDGE_RISING:
>>   		pdc_type = PDC_EDGE_RISING;
>> @@ -191,8 +145,8 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
>>   		return -EINVAL;
>>   	}
>>   
>> -	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
>> -	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
>> +	old_pdc_type = pdc_reg_read(IRQ_i_CFG, d->hwirq);
>> +	pdc_reg_write(IRQ_i_CFG, d->hwirq, pdc_type);
>>   
>>   	ret = irq_chip_set_type_parent(d, type);
>>   	if (ret)
>> @@ -216,12 +170,12 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
>>   static struct irq_chip qcom_pdc_gic_chip = {
>>   	.name			= "PDC",
>>   	.irq_eoi		= irq_chip_eoi_parent,
>> -	.irq_mask		= qcom_pdc_gic_mask,
>> -	.irq_unmask		= qcom_pdc_gic_unmask,
>> +	.irq_mask		= irq_chip_mask_parent,
>> +	.irq_unmask		= irq_chip_unmask_parent,
>>   	.irq_disable		= qcom_pdc_gic_disable,
>>   	.irq_enable		= qcom_pdc_gic_enable,
>> -	.irq_get_irqchip_state	= qcom_pdc_gic_get_irqchip_state,
>> -	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
>> +	.irq_get_irqchip_state	= irq_chip_get_parent_state,
>> +	.irq_set_irqchip_state	= irq_chip_set_parent_state,
>>   	.irq_retrigger		= irq_chip_retrigger_hierarchy,
>>   	.irq_set_type		= qcom_pdc_gic_set_type,
>>   	.flags			= IRQCHIP_MASK_ON_SUSPEND |
>> @@ -282,7 +236,7 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
>>   
>>   	parent_hwirq = get_parent_hwirq(hwirq);
>>   	if (parent_hwirq == PDC_NO_PARENT_IRQ)
>> -		return 0;
>> +		return irq_domain_disconnect_hierarchy(domain->parent, virq);
>>   
>>   	if (type & IRQ_TYPE_EDGE_BOTH)
>>   		type = IRQ_TYPE_EDGE_RISING;
>> @@ -314,22 +268,29 @@ static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
>>   	irq_hw_number_t hwirq, parent_hwirq;
>>   	unsigned int type;
>>   	int ret;
>> +	struct irq_domain *parent;
>>   
>>   	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (hwirq == GPIO_NO_WAKE_IRQ) {
>> +		for (parent = domain; parent; parent = parent->parent) {
>> +			ret = irq_domain_disconnect_hierarchy(parent, virq);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +		return 0;
>> +	}
>> +
> No, this is wrong. Please read the documentation for
> irq_domain_disconnect_hierarchy(): the disconnect can only take place
> *once* per interrupt, right at the point where you need to terminate
> the hierarchy.
>
> irq_domain_trim_hierarchy() should already do the right thing by
> iterating over the domains and free the unused irq_data.
>
> 	M.
Thanks for the review. Seems we need disconnect only once per interrupt.
with this i see patch 2 in this series also of no use since it already 
takes care of removing irq_data for all the parents.

Addressed in v3 series.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

