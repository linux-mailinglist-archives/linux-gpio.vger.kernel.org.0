Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E1921EE31
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 12:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgGNKno (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 06:43:44 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26801 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726375AbgGNKno (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 06:43:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594723423; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tRdAbZo3R01ks+KVQQD/t8o7o2T01LJHhULszvC+t1g=; b=veoJ8LEujFJP19grxgRjS94+j9pZ5R9cqmYyeQe70aCd/dw1t29LQvODDKPswDqphYOGUR8B
 vNdRfvQnOvPZ3hZ5mW6Uywu0MOseif9/juzjTxuatZbUOf+9MGuD23Z/gRzA3elZpPAdT9Ae
 V0q72FqqDnTgFdlE/RCrvve+xWo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f0d8c5ec9bd2efa2ecb0767 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 10:43:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58C71C433A0; Tue, 14 Jul 2020 10:43:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.75.62])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D7C5C43387;
        Tue, 14 Jul 2020 10:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D7C5C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 2/5] pinctrl: qcom: Add msmgpio irqchip flags
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
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
 <1592818308-23001-3-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=WcKB0AbcYNymAbfvDac-8c3uGgOn3B1Q-U4d3ZrvGuag@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <5f6c3eec-5c2c-d546-ac3c-65e7d25c9031@codeaurora.org>
Date:   Tue, 14 Jul 2020 16:13:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WcKB0AbcYNymAbfvDac-8c3uGgOn3B1Q-U4d3ZrvGuag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/14/2020 3:47 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
>> during suspend and mask before setting irq type.
>>
>> Masking before changing type should make sure any spurious interrupt
>> is not detected during this operation.
>>
>> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
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
> I haven't tested it, but with my suggestion in patch #4 to use
> irq_suspend and irq_resume, I presume adding IRQCHIP_MASK_ON_SUSPEND
> is no longer needed?
it will still be needed, to let the non wakeup capable IRQ masked during 
suspend.
>
>
>> +                               | IRQCHIP_SET_TYPE_MASKED;
> IIUC adding "IRQCHIP_SET_TYPE_MASKED" is unrelated to the rest of this
> series, right?

Right, but since we are adding missing flags, i added it together.

Thanks,
Maulik

>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

