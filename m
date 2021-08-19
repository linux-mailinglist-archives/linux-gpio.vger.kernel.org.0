Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65D03F1848
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 13:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbhHSLga (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 07:36:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13017 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231210AbhHSLga (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Aug 2021 07:36:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629372954; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LSA27YI11nF9almuzKmNI0Ji45SpKxB4HyfCjj3+coA=; b=jLkhal+9YZTog0UjDoqpqg9mfj1/QE4Few+o/AYmeK/EvNRcCf8wEOV6ckGSMjpbf7TWzs3V
 T3q/2u3D55eKr1/bqpDpyrwQJAJXLs+eip4L/89fliD8Bq8io8h3rOGUDgH2Wm2lWg6yGcON
 ldTNbVGQU2nDN0BnYNiQ47hNNvk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 611e42119507ca1a34e80df0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 11:35:45
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2DC8BC43460; Thu, 19 Aug 2021 11:35:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.81.12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 376F0C4338F;
        Thu, 19 Aug 2021 11:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 376F0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/2] irqchip: qcom-pdc: Disconnect domain hierarchy for
 GPIO_NO_WAKE_IRQs
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        tkjos@google.com, lsrao@codeaurora.org
References: <1629195546-27811-1-git-send-email-mkshah@codeaurora.org>
 <1629195546-27811-2-git-send-email-mkshah@codeaurora.org>
 <87tujnrtev.wl-maz@kernel.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <34072951-db93-0fc7-9477-bda4d4afdd8a@codeaurora.org>
Date:   Thu, 19 Aug 2021 17:05:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87tujnrtev.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

On 8/18/2021 3:01 PM, Marc Zyngier wrote:
> Hi Maulik,
>
> In the future, please always add a cover-letter email if sending a
> series that has more than a single patch. This considerably helps the
> tracking, and gives you an opportunity to explain what you are doing.
sure. i included same in v2 now.
>
> On Tue, 17 Aug 2021 11:19:06 +0100,
> Maulik Shah <mkshah@codeaurora.org> wrote:
>> gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non wakeup
>> capable GPIOs that do not have dedicated interrupt at GIC.
>>
>> Since PDC irqchip do not allocate irq at parent GIC domain for such GPIOs
>> indicate same by using irq_domain_disconnect_hierarchy().
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/irqchip/qcom-pdc.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 32d5920..0ba0461 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -324,8 +324,11 @@ static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (hwirq == GPIO_NO_WAKE_IRQ)
>> +	if (hwirq == GPIO_NO_WAKE_IRQ) {
>> +		if (domain->parent)
>> +			irq_domain_disconnect_hierarchy(domain->parent, virq);
>>   		return 0;
>> +	}
>>   
>>   	parent_hwirq = get_parent_hwirq(hwirq);
>>   	if (parent_hwirq == PDC_NO_PARENT_IRQ)
> It feels like you are papering over the core of the problem, which is
> that most of the GPIO_NO_WAKE_IRQ stuff should simply go away now that
> we have a way to drop parts of the hierarchy.
ok makes sense to disconnect from PDC domain itself instead only 
disconnecting for parent GIC domain.
>
> I had a go at that a few months back, but never had the opportunity to
> actually test the resulting code[1]. Could you please give it a go and
> let me know what breaks?
Thanks for the patch [1]. i tested and found below issues.

1.
For GPIO_NO_WAKE_IRQ case, The patch disconnects hierarchy for current 
domain (PDC)
However for parent domain (GIC) its don't call disconnect.
This leads to irq_domain_trim_hierarchy() still complain the error at 
parent domain.
To fix this, whenever irqchip disconnects hierarchy at its domain, it 
has to disconnect for all its parent domains too.

something like this works in qcom_pdc_gpio_alloc()

         if (hwirq == GPIO_NO_WAKE_IRQ) {
-               if (domain->parent) {
- irq_domain_disconnect_hierarchy(domain->parent, virq);

+               for (parent = domain; parent; parent = parent->parent) {
+                       ret = irq_domain_disconnect_hierarchy(parent, virq);
+                       if (ret)
+                               return ret;
                 }
                 return 0;
         }

2.  irq_domain_trim_hierarchy() has two issues.

     The first is tail is moving along with irqd of domain.
     so trimming do not start at correct parent domain.
     tails has to be initialized only once, starting from which we want 
to trim all the parent domains hierarchy.

     The second is the below check is not proper to find valid irq chip.
     say for both (PDC and GIC) domains the irqd->chip is set to -ENOTCONN.
     then irqd->chip check will still pass for domain (even if its 
-ENOTCONN) and if tail is set it will false complain.

     /* Can't have a valid irqchip after a trim marker */
-               if (irqd->chip && tail)
+               if (!IS_ERR(irqd->chip) && tail) {


I have picked up your change in v2 and added above mentioned issue fixes.
please take a look on v2.

Thanks,
Maulik
>
> Thanks,
>
> 	M.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/qcom-pdc-nowake&id=331b2ba388a4a79b5c40b8addf56cbe35099a410
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

