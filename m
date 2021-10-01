Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E9641E73A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 07:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351940AbhJAFgU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 01:36:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15741 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351929AbhJAFgT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Oct 2021 01:36:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633066475; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Dg9UyJAGvh1utQRxDwx+mgOUXPzyBeM2J8AXutvknM0=; b=QngNJ9l69IfLMI4jPa8nQMltCOLN3EmgOK8s6KuTFdfnH/Kj6imjVRlkL6Llvpe9/izqv1l8
 R5h6QZVfT2ebezYNZBUxJ7/jeqclYuYJsyd5c6LJcg8EjarwUvVIX6shmrI8IMOGPghrTS6C
 5UXkmxqZ4I+8TLBCbF5+0wQPXmo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61569deb713d5d6f96e7aa5e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 05:34:35
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82BABC4360C; Fri,  1 Oct 2021 05:34:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.222.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F83CC4338F;
        Fri,  1 Oct 2021 05:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3F83CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
 <YUfZbsf3MX1aQJ2+@builder.lan>
 <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
 <YUoHr0F9qjr2Toeb@ripper>
 <2d2891e2-0cdf-1938-f9a1-77135066f5de@codeaurora.org>
 <YVXP46FvzmZ1xDvY@ripper>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <bc194561-d9f9-ed13-ead1-1a7252d7a5fe@codeaurora.org>
Date:   Fri, 1 Oct 2021 11:04:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YVXP46FvzmZ1xDvY@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 9/30/2021 8:25 PM, Bjorn Andersson wrote:
> On Thu 30 Sep 02:46 PDT 2021, Rajendra Nayak wrote:
> 
>>
>>
>> On 9/21/2021 9:56 PM, Bjorn Andersson wrote:
>>> On Tue 21 Sep 03:39 PDT 2021, Rajendra Nayak wrote:
>>>
>>>>
>>>>
>>>> On 9/20/2021 6:14 AM, Bjorn Andersson wrote:
>>>>> On Fri 17 Sep 01:37 CDT 2021, Rajendra Nayak wrote:
>>>>>
>>>>>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>>>>>
>>>>>> egpio is a scheme which allows special power Island Domain IOs
>>>>>> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
>>>>>> TLMM functions with Island Domain functions.
>>>>>> With this scheme, an IO can be controlled both by the cpu running
>>>>>> linux and the Island processor. This provides great flexibility to
>>>>>> re-purpose the Island IOs for regular TLMM usecases.
>>>>>>
>>>>>> 2 new bits are added to ctl_reg, egpio_present is a read only bit
>>>>>> which shows if egpio feature is available or not on a given gpio.
>>>>>> egpio_enable is the read/write bit and only effective if egpio_present
>>>>>> is 1. Once its set, the Island IO is controlled from Chip TLMM.
>>>>>> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>>>>>>
>>>>>> The support exists on most recent qcom SoCs, and we add support
>>>>>> for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
>>>>>>
>>>>>
>>>>> I was under the impression that this feature would allow you to
>>>>> repurpose pins for use either by the remote island or by apps.
>>>>
>>>> thats right, you can repurpose the pins for usage by apps by setting
>>>> the egpio_enable to 1, when set to 0 its owned by the island processor.
>>>
>>> Good.
>>>
>>>>>
>>>>> But if I understand your proposal, you check to see if the pin is
>>>>> "egpio capable" for a pin and if so just sets the bit - muxing it to
>>>>> apps (or the island?).
>>>>
>>>> Right, so if there is a request for a egpio-capable pin, the driver
>>>> flips the ownership. Are you suggesting having some kind of checks to determine
>>>> who should own it?
>>>>
>>>
>>> I see, I missed that nuance. So Linux will steal any pins that are
>>> mentioned in DT. But that would mean that you're relying on someone else
>>> to ensure that this bit is cleared for the other pins and you would not
>>> be able to explicitly flip the state back to island mode in runtime.
>>>
>>> I would prefer that this was more explicit.
>>>
>>>>> It seems reasonable that this would be another pinmux state for these
>>>>> pins, rather than just flipping them all in one or the other direction.
>>>>
>>>> hmm, I don't understand. This is not a pinmux state, its a switch to decide
>>>> the ownership.
>>>
>>> But does it mux the pin to the island, or does it state that the island
>>> is now in charge of the associated TLMM registers?
>>
>> The island processor does not access the APPS TLMM register space, it has its
>> own TLMM register space that it configures. APPS TLMM registers control its
>> mux/conf settings and Island TLMM registers controls its mux/conf. So essentially
>> there are 2 sets of registers to control the same pin.
>> This bit is more like a top level mux which decides what register settings
>> take affect.
>>
> 
> "One mux to rule them all" :)
> 
> When we switch this mux towards the Island TLMM, do we need to configure
> the APPS TLMM in a particular way, or does the state of that not matter?

No APPS TLMM settings should be needed, the state of that does not matter.

> Would it be reasonable to say that when muxed towards the island the
> apps should always be in gpio mux with some predetermined properties, to
> save power?

No, the the register settings in APPS TLMM are nop/dont care when egpio_enable is 0.

> To reiterate, as proposed, mentioning a egpio-capable pin in the apps
> DTS will cause it to be muxed to the APSS TLMM. But I'm not convinced
> that we don't have scenarios where one might want to dynamically mux the
> pin between island and apss tlmm.
> 
> My suggestion is that even that it's two independent muxes controlled in
> the apps tlmm, we'd express them in the same pinmux, i.e. we'd have
> something like:
> 
> some-local-state {
> 	pins = "gpio1";
> 	function = "gpio";
> 	output-high;
> };

so this would set the function to gpio in the APPS TLMM and set the egpio_enable = 1?
which was also what the original $SUBJECT patch did.

> some-remote-state {
> 	pins = "gpio1";
> 	function = "island"; /* or just egpio... ? */
> };

Here we add a new function to the pin and that's used to set the egpio_enable to 0?

> One case I imaging where this could be useful is to allow Linux to
> configure a known state of pins when the island isn't running, from the
> remoteproc driver and then flip it over to island mode before booting
> the remote.

So we save power during boot up until the island processor comes up?
So fwik when we boot linux its either configured to boot the island processor
or not. Are you talking about some scenario where the island processor comes
up on demand and goes down when not used?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
