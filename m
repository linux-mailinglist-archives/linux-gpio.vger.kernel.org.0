Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A301E4254
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730010AbgE0MbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 08:31:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11164 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728746AbgE0MbT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 08:31:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590582678; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=a0pH7dQyq4r9sJKjE/07Ll+1aMct4+PM140OnxeMnLs=; b=a/MbcuNJbd0FJIvRLQmgWNeSY+jLvuUOoOcBZHiE+k/LJRHQ1iy9wWdYGz1ntUEIIir70AcC
 TvY5gHhnyKRyz6CMn2TakHNjhfMToxE1qJifbShBZizbdr5NTEjhr9AGVZIHrJOmWLq8G1md
 lAX2qYmFgYq5w47Qsgv54lkRG3Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ece5d8d2738686126ff3b54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 12:31:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6182C43391; Wed, 27 May 2020 12:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.1.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85F4BC433C6;
        Wed, 27 May 2020 12:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85F4BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: Add msmgpio irqchip flags
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-4-git-send-email-mkshah@codeaurora.org>
 <159057285160.88029.12486371130122290394@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <65c86165-5956-5340-1f40-6426c6aec743@codeaurora.org>
Date:   Wed, 27 May 2020 18:00:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159057285160.88029.12486371130122290394@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/27/2020 3:17 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-05-23 10:11:12)
>> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
>> during suspend and mask before setting irq type.
> Why do we need to mask before setting irq type? Does something go wrong?
> Can you explain in the commit text?

i don't think anything goes wrong but there might be a case where some 
driver changing type at runtime,

masking before changing type should make sure any spurious interrupt is 
not detected during this operation.

>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Does this need a Fixes tag?
Thanks i will add.
>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 2419023..b909ffe 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -1143,6 +1143,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>          pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>>          pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
>>          pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
>> +       pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND
> This is sort of sad. We have to set the IRQCHIP_MASK_ON_SUSPEND flag
> here so that genirq can call the mask op during suspend for the parent
> irqchip (pdc)?
During suspend, suspend_device_irq() will check this flag in msmgpio 
irqchip and then call it to mask if its not marked for wakeup.

in this case, setting this flag will call first invoke gpiolib's 
callback  (we override in first patch of this series), then it goes to 
msmgpio chip's mask callback,

this call will then get forwarded to its parent PDC and then to PDC's 
parent GIC.

This seems the way hierarchical irqchip works. i don't see any issue 
with this.
> Is there some way to not need to do that and instead let
> genirq do mask on suspend at the chip level instead of the irq level?
>
>> +                               | IRQCHIP_SET_TYPE_MASKED;
>>   
>>          np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>>          if (np) {

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

