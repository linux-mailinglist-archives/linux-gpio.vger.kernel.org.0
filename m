Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833742D7094
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 08:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgLKHIe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 02:08:34 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:41457 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389522AbgLKHI1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 02:08:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607670485; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z7mHPQnuYGiJE84GUdzV++hVWDsyC/pRvuOApR2yw0w=; b=YaXOBQjoPpnqRrqkijiJzBfcIiyPlq0gEkyo3ukr8qC5r/8kadL0chICzGtcNYJZwmcQdXcS
 QYQz4xpgYWnbrltBe1NGzoH5vmiSPWdY2nUaAyqUnGb2G1PdHXTkUbXWafNCs9Y+DXFXpJRJ
 8Uu2EnIo+VkXgPKGYJjizUAkjOA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fd31abb3a8ba2142a955c7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Dec 2020 07:07:39
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 752B3C43462; Fri, 11 Dec 2020 07:07:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.67.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB76EC433C6;
        Fri, 11 Dec 2020 07:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB76EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
 <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org>
 <CAD=FV=UOSkHQMcSV8Zq5qPfBoUu5xYzfNZqUPmymvD7PXUAN4w@mail.gmail.com>
 <b84d5bb4-e413-ad20-a19a-c7420abd5d5d@codeaurora.org>
 <CAD=FV=UXo3RPuVSYwOrHJMxF38K-ynoaPv4ZVQ6N2ok_zcoOFw@mail.gmail.com>
 <5f24ec87-6d91-dfd9-0f4f-6687f37c60ac@codeaurora.org>
 <CAD=FV=Wm_q60w34LmbtC88BkfS0aKp_a=AjnuYFL=g-DX_-=yQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <92c61a18-0a1d-099e-4a11-b33a052b4ec2@codeaurora.org>
Date:   Fri, 11 Dec 2020 12:37:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wm_q60w34LmbtC88BkfS0aKp_a=AjnuYFL=g-DX_-=yQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On 12/10/2020 6:13 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Dec 8, 2020 at 9:54 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>>>> but as long as its IRQ is in disabled/masked state it
>>>> doesn't matter.
>>> ...but there's no requirement that someone would need to disable/mask
>>> an interrupt while switching the muxing, is there?  So it does matter.
>>>
>>>
>>>> its only when the GPIO is again set to IRQ mode with set_mux callback,
>>>> the phantom IRQ needs clear to start as clean.
>>>>
>>>> So we should check only for if (i == pctrl->soc->gpio_func) then clear
>>>> phantom IRQ.
>>>>
>>>> The same is case with .direction_output callback, when GPIO is used as
>>>> output say as clock, need not clear any phantom IRQ,
>>>>
>>>> The reason is with every pulse of clock it can latch as pending IRQ in
>>>> GIC_ISPEND as long as it stay as output mode/clock.
>>>>
>>>> its only when switching back GPIO from output direction to input & IRQ
>>>> function, need to clear the phantom IRQ.
>>>>
>>>> so we do not require clear phantom irq in .direction_output callback.
>>> I think all the above explanation is with the model that the interrupt
>>> detection logic is still happening even when muxed away.  I don't
>>> believe that's true.
>> Its not the interrupt detection logic that is still happening when muxed
>> away, but the GPIO line is routed to GIC from PDC.
>> The GPIO line get forwarded when the system is active/out of system
>> level low power mode to GIC irrespective of whether GPIO is used as
>> interrupt or not.
>> Due to this it can still latch the IRQ at GIC after switching to lets
>> say Rx mode, whenever the line has any data recive, the line state
>> toggles can be latched as error interrupt at GIC.
>  From my tests, though, I strongly believe that the pin is only visible
> to the PDC if it's muxed as GPIO.  Specifically, in my tests I did
> this (with all my patches applied so there were no phantom interrupts
> when remuxing):
>
> a) Muxed the pin away from GPIO to special function, but _didn't_ mask
> the interrupt.
>
> b) Toggled the line a whole bunch.  These caused no interrupts at all.
>
> c) Muxed back to GPIO.
>
> To me this is quite strong evidence that the muxing is "earlier" in
> the path than the connection to the PDC.  In other words, if you
> change the mux away from GPIO then the PDC stops seeing it and thus
> the GIC also stops seeing it.  The GIC can't latch what it can't see.
> This means while you're in "Rx mode" it can't be latched.
>
>
> OK, so just in case this somehow only happens in S3, I also tried this
> (with my patch from https://crrev.com/c/2556012):
>
> a) Muxed away from GPIO ("bogus" pinmux)
>
> b) Enter S3.
>
> c) Toggle the GPIO a whole bunch ("wp enable / wp disable" on Cr50).
>
> d) Wake from S3.
>
> e) Check to see if the interrupt fired a bunch.  It didn't fire at all
>
>
> In my test code the interrupt is not masked, only muxed away.  That
> means that if, somehow, the PDC was still observing it then we'd see
> the interrupt fire.  We don't.
>
>
> Unless I messed up in my tests (always possible, though by this point
> I've run them a number of times) then it still feels like your mental
> model is wrong, or it's always possible I'm still misunderstanding
> your model.  Regardless, rather than trying to re-explain your model
> can you please confirm that you've written test code to confirm your
> mental model?  If so, can you please provide this test code?  I've
> provided several test patches proving out my mental model.
Its not a mental model, its how the line is connected to GIC.
GPIO follows the path, TLMM to PDC to GIC.
PDC donot know if the line is muxed away from GPIO to some other 
function, so it can stop forwarding to GIC.

I have slightly modified your test case (see at 
https://crrev.com/c/2584729) which is as per what i used in my testing.

Here is what i am doing, setting GPIO to a fixed function (function 2 here)
Note that function 0 is the GPIO (interrupt mode).

1) Pull up the GPIO in function 2
2) Pull down the GPIO in function 2

Repeat above steps, and you will see fake interrupt every time pull down/up.
This proves that if you mux away from GPIO then still PDC sees the line 
and can latch the interrupt at GIC.

Thanks,
Maulik

>> As the interrupt is in disabled state it won't be sent to CPU.
>> Its only when the driver chooses to switch back to interrupt mode we
>> want to clear the error interrupt latched to start as clean. same is the
>> case when used as output direction.
>>
>> Hope above is clear.
> Unfortunately, it's still not.  :(  Can I convince you to provide a
> test patch and a set of steps that will demonstrate the problem you're
> worried about?  Specifically:
>
> a) Maybe you're talking about the initial switch from a plain GPIO
> input to making it an interrupt for the first time?  Are you worried
> about a phantom interrupt in this case?  After patch #1 I think we're
> safe because pdc_gic_set_type() will always clear the interrupt,
> right?
>
>
> b) You say "switch back to interrupt mode".  Are you imagining that a
> driver does something like this:
>
> request_irq();
> ...
> free_irq();
> ...
> request_irq();
>
> If you're worried about that then we can implement irq_shutdown() for
> PDC and then make sure we clear on the first enable after a shutdown,
> I guess?
>
>
> c) Maybe when you say "switch back to interrupt mode" you mean
> something else?  If you are talking about muxing away and then muxing
> back then I think we already have this covered.  If you are talking
> about masking/unmasking then the whole point is that we _do_ want
> interrupts latched while masked, right?
>
>
> OK, I'm going to send out a v3 just to get the already-identified
> problems fixed and also to allow landing of patch #1 in the series,
> which I think is all agreed upon.  My request to you is that if you
> think my code misses a specific case to provide some test patches to
> demonstrate that case.
>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

