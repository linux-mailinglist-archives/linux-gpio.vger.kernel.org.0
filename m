Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4986E21EEA2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 13:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgGNLC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 07:02:28 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:25174 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726431AbgGNLC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 07:02:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594724547; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iZcdgtwphZVxchdYcmxjiWPJYNmsJYjk7e3jHbcFfaA=; b=snSRtwa7UccVaeLT8/FU9MmK/XlSzazzp0mXx1shygm4eiHV1HYNvQ+EH53M5h+UvKIKIhg3
 05V+a8Bv/Z+nEZAdf40AfiMXHGnwKwotPc2Nypd+5Xc2fzEdkm5IM7Qr254Rrshzg4TMynXx
 49kI+EHeyG15ZESE7Sqv8UP+x0I=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f0d90ab8e36ecda30fda1c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 11:02:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25B8EC4339C; Tue, 14 Jul 2020 11:02:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.75.62])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46868C433CA;
        Tue, 14 Jul 2020 11:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46868C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 5/5] irqchip: qcom-pdc: Reset all pdc interrupts during
 init
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
 <1592818308-23001-6-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=X=0yqDMeWSUAM4D6o_6JsOU4hm8Q2XFbOSEVQcRzRN6A@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <6f2939a9-5704-6461-97bc-ee58a192c35f@codeaurora.org>
Date:   Tue, 14 Jul 2020 16:31:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=X=0yqDMeWSUAM4D6o_6JsOU4hm8Q2XFbOSEVQcRzRN6A@mail.gmail.com>
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
> On Mon, Jun 22, 2020 at 2:33 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Clear previous kernel's configuration during init by resetting
>> all interrupts in enable bank to zero.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/irqchip/qcom-pdc.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 8beb6f7..11a9d3a 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>
>> +#define PDC_MAX_IRQS_PER_REG   32
>>   #define PDC_MAX_IRQS           168
>>   #define PDC_MAX_GPIO_IRQS      256
>>
>> @@ -339,6 +340,7 @@ static const struct irq_domain_ops qcom_pdc_gpio_ops = {
>>   static int pdc_setup_pin_mapping(struct device_node *np)
>>   {
>>          int ret, n;
>> +       u32 reg, max_regs, max_pins = 0;
>>
>>          n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
>>          if (n <= 0 || n % 3)
>> @@ -367,8 +369,19 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>                                                   &pdc_region[n].cnt);
>>                  if (ret)
>>                          return ret;
>> +               max_pins += pdc_region[n].cnt;
>>          }
>>
>> +       if (max_pins > PDC_MAX_IRQS)
>> +               return -EINVAL;
>> +
>> +       max_regs = max_pins / PDC_MAX_IRQS_PER_REG;
>> +       if (max_pins % PDC_MAX_IRQS_PER_REG)
>> +               max_regs++;
> nit: max_regs = DIV_ROUND_UP(max_pins, PDC_MAX_IRQS_PER_REG)
>
>
>> +       for (reg = 0; reg < max_regs; reg++)
>> +               pdc_reg_write(IRQ_ENABLE_BANK, reg, 0);
> This doesn't feel correct to me, but maybe I'm misunderstanding the
> hardware (I don't think I have access to a reference manual).  Looking
> at the example in the bindings, I see:
>
> qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>
> In that example we have mappings for PDC ports:
> 0 - 93 (count = 94)
> 94 - 108 (count = 15)
> 115 - 121 (count = 7)
>
> Notice the slight discontinuity there.  I presume that discontinuity
> is normal / allowed?  If so, if there is enough of it then I think
> your math could be wrong, though with the example you get lucky and it
> works out OK.  It's easy to see the problem with a slightly different
> example:  Imagine that you had this:
>
> 0 - 33 (count = 34)
> 94 - 108 (count = 15)
> 115 - 121 (count = 7)
>
> ...now max_pins = 56 and max_regs = 2.  So you'll init reg 0 and 1.
> ...but (IIUC) you actually should be initting 0, 1, 2, and 3.

Right, Thanks for cacthing this. I will fix in next revision.

Thanks,
Maulik

> I have no idea what might be in those discontinuous ranges and if it's
> always OK to clear, but (assuming it is) one fix is to put your
> clearing loop _inside_ the other "for" loop in this function, AKA:
>
> for (reg = pdc_region[n].pin_base / PDC_MAX_IRQS_PER_REG;
>       reg < DIV_ROUND_UP(pdc_region[n].pin_base + pdc_region[n].cnt),
>                          PDC_MAX_IRQS_PER_REG)
>       reg++)
>
> ...or another option is to keep track of the max "pin_base + cnt" and
> loop from 0 to there?  I just don't know your hardware well enough to
> tell which would be right.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

