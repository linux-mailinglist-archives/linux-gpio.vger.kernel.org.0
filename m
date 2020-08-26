Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D023252AC4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Aug 2020 11:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgHZJxE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Aug 2020 05:53:04 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54893 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728070AbgHZJxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Aug 2020 05:53:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598435582; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ev2LMeIqc88r/l6TuJddWcgSSo6NoXnUMGqZE8WEPUg=; b=Zk8JZqFxMjw7QLOgH+/DqJAngJ7SuWU4KoULIreyJd3Au08lvmcFNi2FPzKYcRxwgEixKRpA
 nF87OnRqsyk1GflpBTdgHld8DfYtfo6dvdEfBiOfC7Wq/gOMlaNdSr85ISzChpECKMeS1cIa
 l1HlKwZF7Hbje2PYnLyCplenRWc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f4630fdca327a6430dc8268 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 09:53:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BABF2C433A0; Wed, 26 Aug 2020 09:53:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.73.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFE8AC433C6;
        Wed, 26 Aug 2020 09:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFE8AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce
 IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
To:     Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
 <1598113021-4149-4-git-send-email-mkshah@codeaurora.org>
 <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
 <874koqxv6t.fsf@nanos.tec.linutronix.de>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org>
Date:   Wed, 26 Aug 2020 15:22:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <874koqxv6t.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/26/2020 3:08 AM, Thomas Gleixner wrote:
> On Tue, Aug 25 2020 at 03:12, Stephen Boyd wrote:
>> Quoting Maulik Shah (2020-08-22 09:16:58)
>>> diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
>>> index c6c7e18..2cc800b 100644
>>> --- a/kernel/irq/pm.c
>>> +++ b/kernel/irq/pm.c
>>> @@ -69,12 +69,17 @@ void irq_pm_remove_action(struct irq_desc *desc, struct irqaction *action)
>>>   
>>>   static bool suspend_device_irq(struct irq_desc *desc)
>>>   {
>>> +       unsigned long chipflags = irq_desc_get_chip(desc)->flags;
>>> +
>>>          if (!desc->action || irq_desc_is_chained(desc) ||
>>>              desc->no_suspend_depth)
>>>                  return false;
>>>   
>>>          if (irqd_is_wakeup_set(&desc->irq_data)) {
>>>                  irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
>>> +
>>> +               if (chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND)
>>> +                       irq_enable(desc);
>> Where is the corresponding change to resume_irq()? Don't we need to
>> disable an irq if it was disabled on suspend and forcibly enabled here?
I should have added comment explaining why i did not added.
I thought of having corresponding change to resume_irq() but i did not 
kept intentionally since i didn't
observe any issue in my testing.

Actually the drivers which called (disable_irq() + enable_irq_wake()), 
are invoking enable_irq()
in the resume path everytime. With the driver's call to enable_irq() 
things are restoring back already.

If above is not true in some corner case, then the IRQ handler of driver 
won't get invoked, in such case,
why even to wake up with such IRQs in the first place, right?

However If we don't want to rely on the drivers doing things correctly, 
state can be restored in resume_irq()
I explored this, During suspend,

1. Some IRQs are unmasked/enabled + marked for wakeup
2. Some IRQs are masked/disabled + marked for wakeup

So have to track and restore only IRQs in category (2).
With current patch we don't have way to track IRQ is in (1) or (2).
It may be done with the new IRQD flag saying like 
IRQD_IRQ_ENABLED_ON_SUSPEND

During suspend,
First check if the IRQ was in disabled/masked state to invoke 
irq_enable() only for category (2) and set the new flag.

     if (irqd_irq_disabled(&desc->irq_data) && (chipflags & 
IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND)) {
         irq_enable(desc);
         irq_state_set_enabled_on_suspend(desc); => this will set new 
IRQD_IRQ_ENABLED_ON_SUSPEND
     }

During resume,
Simply calling irq_disable(desc); don't work in resume_irq(), since by 
default this API tries to lazily disable at HW, which won't quite 
restore the state,
So instead of adding below

     if (irqd_irq_disabled(&desc->irq_data) && (chipflags & 
IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND)
     && (irqd_is_enabled_on_suspend(desc)))
     {
         irq_disable(desc);
         irq_state_clear_enabled_on_suspend(desc); => clear flag
     }

we can replicate the irq_disable() with removal of lazy part, something 
like,

     if (irqd_irq_disabled(&desc->irq_data) && (chipflags & 
IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND) &&
     (irqd_is_enabled_on_suspend(desc))) { ==> The new flag used to 
determine if IRQ was enabled during suspend path, then only restore.
         irq_state_set_disabled(desc);
         if (desc->irq_data.chip->irq_disable) {
desc->irq_data.chip->irq_disable(&desc->irq_data);
             irq_state_set_masked(desc);
         } else {
         mask_irq(desc);
     }
     irq_state_clear_enabled_on_suspend(desc);
}

which is matching exactly reverse of what is done in suspend entry.
Let me know if above is good i can include this in v6.

Thanks,
Maulik

> That part was below the POC code I provided in the fine print:
>
>   "plus the counterpart in the resume path. This also ensures that state is
>    consistent."
>
> Who reads the fine print? :)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

