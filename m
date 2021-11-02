Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9828442C0B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 12:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhKBLE7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 07:04:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14710 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230519AbhKBLEx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Nov 2021 07:04:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635850939; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=IpKhFFpSXVkoCKRyilQIeCbftdYn9GKYLGgEPw7+VzM=; b=mBKEFjM0LNtlV19KR/fMhliwgJKop7CAOWN4emDsP1wHgUb2CJhiIRDpVmRkTGsjhe+w5wXF
 KFBoZcYj7fMcPC2TgcjO7LL1JYEFfuWWkE3qOrAiihMgONCVxZ6x7uyI/7B2tZYPdgwGJ9BE
 +mqvaEj8ZqyLLKEk5aRusQTcCaA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61811ab1900d71ea1e5db5b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 11:02:09
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C41FC43617; Tue,  2 Nov 2021 11:02:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8290CC43460;
        Tue,  2 Nov 2021 11:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8290CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=UoTFzZn5h_VNrwrt2E5P2k9WmqZ7nXFLDHyMzUvSzhUA@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <27bf8521-f4d2-13b1-8e14-ceacbbeabb1b@codeaurora.org>
Date:   Tue, 2 Nov 2021 16:32:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UoTFzZn5h_VNrwrt2E5P2k9WmqZ7nXFLDHyMzUvSzhUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/2021 2:34 AM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 26, 2021 at 5:09 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>
>> egpio is a scheme which allows special power Island Domain IOs
>> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
>> TLMM functions with Island Domain functions.
>> With this scheme, an IO can be controlled both by the cpu running
>> linux and the Island processor. This provides great flexibility to
>> re-purpose the Island IOs for regular TLMM usecases.
>>
>> 2 new bits are added to ctl_reg, egpio_present is a read only bit
>> which shows if egpio feature is available or not on a given gpio.
>> egpio_enable is the read/write bit and only effective if egpio_present
>> is 1. Once its set, the Island IO is controlled from Chip TLMM.
>> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>>
>> To support this we add a new function 'egpio' which can be used to
>> set the egpio_enable to 0, for any other TLMM controlled functions
>> we set the egpio_enable to 1.
>>
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c | 17 +++++++++++++++--
>>   drivers/pinctrl/qcom/pinctrl-msm.h |  4 ++++
>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 8476a8a..bfdba3a 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -185,6 +185,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>          unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>>          struct irq_data *d = irq_get_irq_data(irq);
>>          unsigned int gpio_func = pctrl->soc->gpio_func;
>> +       unsigned int egpio_func = pctrl->soc->egpio_func;
>>          const struct msm_pingroup *g;
>>          unsigned long flags;
>>          u32 val, mask;
>> @@ -218,8 +219,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>          raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>>          val = msm_readl_ctl(pctrl, g);
>> -       val &= ~mask;
>> -       val |= i << g->mux_bit;
>> +
>> +       if (egpio_func && i == egpio_func) {
>> +               if (val & BIT(g->egpio_present))
>> +                       val &= ~BIT(g->egpio_enable);
>> +               else
>> +                       return -EINVAL;
>> +       } else {
>> +               val &= ~mask;
>> +               val |= i << g->mux_bit;
>> +               /* Check if egpio present and enable that feature */
>> +               if (egpio_func && (val & BIT(g->egpio_present)))
>> +                       val |= BIT(g->egpio_enable);
>> +       }
>> +
>>          msm_writel_ctl(val, pctrl, g);
>>
>>          raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
>> index e31a516..b7110ac 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
>> @@ -77,6 +77,8 @@ struct msm_pingroup {
>>          unsigned drv_bit:5;
>>
>>          unsigned od_bit:5;
>> +       unsigned egpio_enable:5;
>> +       unsigned egpio_present:5;
>>          unsigned oe_bit:5;
>>          unsigned in_bit:5;
>>          unsigned out_bit:5;
>> @@ -119,6 +121,7 @@ struct msm_gpio_wakeirq_map {
>>    *                            to be aware that their parent can't handle dual
>>    *                            edge interrupts.
>>    * @gpio_func: Which function number is GPIO (usually 0).
>> + * @egpio_func: Which function number is eGPIO
> 
> nit: in the above, document that this is actually a _virtual_ number.
> In other words it doesn't actually map to any real hardware register
> setting. Also maybe document 0 here means that eGPIO isn't supported
> on this SoC. ...and lastly, all the other entries in this docstring
> end with a ".". Something roughly like this:
> 
>   * @egpio_func: If non-zero then this SoC supports eGPIO. Even though in
>                  hardware this is a mux 1-level above the TLMM, we'll treat
>                  it as if this is just another mux state of the TLMM. Since
>                  it doesn't really map to hardware, we'll allocate a virtual
>                  function number for eGPIO and any time we see that function
>                  number used we'll treat it as a request to mux away from
>                  our TLMM towards another owner.

Thanks Doug, this sounds perfect, I'll copy-paste it :)

> Thinking about this made me look a little closer at your virtual
> function number, though. On sc7280 (in the next patch) you chose
> function "9" as GPIO. Things smell a little strange, though.
> Apparently sc7280 was already setup for a non-virtual "function 9"
> since "nfuncs" was 10. Was this just a fortunate bug that kept you
> from having to touch all the sc7280 PINGROUP definitions in the next
> patch, or is there actually a true "function 9" somewhere in the
> hardware that we might want to someday add to Linux? If so, should we
> pick eGPIO as 10?

Right, I did start off thinking I would need to add a new function, and
deal with changing all the PINGROUP definitions, and worry about all the
stuff that you mentioned below, but then I realized function 9 was actually
unused on all sc7280 pins (and I did look at the couple other SoCs usptream
which support egpio which also had the same pattern) so decided to just reuse
function 9 and avoid dealing with all the mess that would result
with adding a new virtual function ¯\_(ツ)_/¯

> ...and then, looking further, what would happen if we picked eGPIO 10?
> Should "nfuncs" include this virtual number, or not? If "nfuncs"
> _does_ include this number and it bumps you over to the next
> "order_base_2" then the mask calculated by msm_pinmux_set_mux() will
> be wrong. If "nfuncs" _doesn't_ include this number then we should
> probably document that fact, and (I suppose) change sc7280's "nfuncs"
> down to 9?
> 
> 
> -Doug
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
