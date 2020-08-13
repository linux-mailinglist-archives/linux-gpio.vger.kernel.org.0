Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1572434C3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgHMHSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:18:36 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23627 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726593AbgHMHSg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Aug 2020 03:18:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597303115; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1kym1BRXxzdGlj+DXxRYvEYT+hrPHFE3l3KOyzbkWAA=; b=unYnUkYdn8/XJw53Regg/jACqkFOLLWXv9ADNpOHUgTOTFd74nHpVczMxqPmQhKUNY4IXLhJ
 cy0s//U09qedDETc+Lti3pAVwnfplZdt95j+Mr6Hb9j/aZrWbNsZUOk151BkUlU1nBiKAqtX
 9IGNQV9JZeyWBbqnNRtoBa3Cjgw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f34e94bd96d28d61e894458 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 07:18:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D471FC43395; Thu, 13 Aug 2020 07:18:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF63EC433C6;
        Thu, 13 Aug 2020 07:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF63EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and
 irq_resume_one() callbacks
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=XH3183sJiP68v_Ka2+b=rYb8Y=7G=RcdbxdsK+nzyW=g@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <34688fc3-4787-ae49-a017-b24825180f53@codeaurora.org>
Date:   Thu, 13 Aug 2020 12:48:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XH3183sJiP68v_Ka2+b=rYb8Y=7G=RcdbxdsK+nzyW=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Sure, i will take care these comments in v5.

Thanks,
Maulik

On 8/12/2020 1:39 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> From: Douglas Anderson <dianders@chromium.org>
>>
>> The "struct irq_chip" has two callbacks in it: irq_suspend() and
>> irq_resume().  These two callbacks are interesting because sometimes
>> an irq chip needs to know about suspend/resume, but they are a bit
>> awkward because:
>> 1. They are called once for the whole irq_chip, not once per IRQ.
>>     It's passed data for one of the IRQs enabled on that chip.  That
>>     means it's up to the irq_chip driver to aggregate.
>> 2. They are only called if you're using "generic-chip", which not
>>     everyone is.
>> 3. The implementation uses syscore ops, which apparently have problems
>>     with s2idle.
>>
>> Probably the old irq_suspend() and irq_resume() callbacks should be
>> deprecated.
>>
>> Let's introcuce a nicer API that works for all irq_chip devices.  This
> You grabbed my patch (which is great, thanks!) but forgot to address
> Stephen's early feedback from <https://crrev.com/c/2321123>.
> Specifically:
>
> s/introcuce/introduce
>
>
>> --- a/include/linux/irq.h
>> +++ b/include/linux/irq.h
>> @@ -468,10 +468,16 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>>    * @irq_bus_sync_unlock:function to sync and unlock slow bus (i2c) chips
>>    * @irq_cpu_online:    configure an interrupt source for a secondary CPU
>>    * @irq_cpu_offline:   un-configure an interrupt source for a secondary CPU
>> + * @irq_suspend_one:   called on an every irq to suspend it; called even if
>> + *                     this IRQ is configured for wakeup
> s/called on an/called on
>
>> + * @irq_resume_one:    called on an every irq to resume it; called even if
>> + *                     this IRQ is configured for wakeup
> s/called on an/called on
>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

