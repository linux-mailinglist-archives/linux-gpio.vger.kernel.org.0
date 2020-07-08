Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51256217F15
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 07:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgGHF3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 01:29:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35487 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgGHF3j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jul 2020 01:29:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594186178; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=H1KsZiKBnQeUBGPkmSKwKU0/CScTk+WjfjB+xahfqhQ=; b=Ob7wYewfwrN2/T/k3Pj9lZkmW4zAETVZgyPwFXkFIF/ChLtMqR/P3THAS2hl22p1uEAXhmdb
 ASyyfEuFvW+w3013QNw6RFxO8gdNvOR6EhWyS2//ZlyvcJPudW607vEJ6F4OpX9yx0oGVEbL
 /HEh74OVho0OGKqCOpuT9gdYR08=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f0559c155886724ff59e798 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 05:29:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81348C433C8; Wed,  8 Jul 2020 05:29:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.73.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94AA5C433C6;
        Wed,  8 Jul 2020 05:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94AA5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
To:     Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        LinusW <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
 <20200706203805.GS388985@builder.lan>
 <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
 <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <56fb02df-372d-935a-cc39-c13289d65c0d@codeaurora.org>
Date:   Wed, 8 Jul 2020 10:59:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Xs9Z37hv=CPgLEALoSoX=Uyir0s=ker=YKecA+Lhy1Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/8/2020 4:33 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Jul 6, 2020 at 9:52 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> []..
>>
>>>>> @@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>>>>>
>>>>>    static int sc7180_pinctrl_probe(struct platform_device *pdev)
>>>>>    {
>>>>> +       if (of_machine_is_compatible("google,lazor")) {
>>>>> +               sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
>>>>> +               sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
>>>>> +       }
>>>> As much as I want patches landed and things working, the above just
>>>> doesn't feel like a viable solution.  I guess it could work as a short
>>>> term hack but it's going to become untenable pretty quickly.
>>> I second that.
>>>
>>>> As we
>>>> have more variants of this we're going to have to just keep piling
>>>> more machines in here, right?  ...this is also already broken for us
>>>> because not all boards will have the "google,lazor" compatible.  From
>>>> the current Chrome OS here are the compatibles for various revs/SKUs
>>>>
>>>> compatible = "google,lazor-rev0", "qcom,sc7180";
>>>> compatible = "google,lazor-rev0-sku0", "qcom,sc7180";
>>>> compatible = "google,lazor", "qcom,sc7180";
>>>> compatible = "google,lazor-sku0", "qcom,sc7180";
>>>> compatible = "google,lazor-rev2", "qcom,sc7180";
>>>>
>>>> ...so of the 5 boards you'll only match one of them.
>>>>
>>>>
>>>> Maybe I'm jumping into a situation again where I'm ignorant since I
>>>> haven't followed all the prior conversation, but is it really that
>>>> hard to just add dual edge support to the PDC irqchip driver?  ...or
>> FWIK, this is really a PDC hardware issue (with the specific IP rev that exists
>> on sc7180) so working it around in SW could get ugly.
> Ugh.  I guess it's ugly because the workaround would need to be in the
> PDC driver but to properly do the workaround you need to be able to
> read the state of the pin from the PDC driver?  ...and I guess you
> can't do that with the PDC register space so you'd either need to
> violate a layer or 3 of abstraction and snarf into the GPIO register
> space from the PDC driver or you'd have to provide some sort of API
> access from the PDC back down to the GPIO driver?
>
> --
>
> Actually, though, I'm still not sure why this would need to be in the
> PDC driver.  Sure, you can't just magically re-use the existing
> dual-edge emulation in pinctrl-msm.c, but you can add some new
> dual-edge emulation for when your parent handles your interrupts,
> can't you?  As per usually, I'm talking out of my rear end, but I
> sorta imagine:
>
> 1. At the head of msm_gpio_irq_set_type() if you detect that
> "skip_wake_irqs" is set and you're on an SoC with this hardware errata
> then you do a loop much like the one in
> msm_gpio_update_dual_edge_pos() except that instead of changing the
> polarity with msm_writel_intr_cfg() you change the polarity with
> "irq_chip_set_type_parent()".
>
> 2. At the head of msm_gpio_irq_ack() you make the same function call
> if "skip_wake_irqs" is set and you're on an SoC with this hardware
> errata.
>
> It doesn't feel all that ugly to me, assuming I'm understanding it
> correctly.  ...or maybe you can tell me why it'd be harder than that?
>
>
>>>> maybe it's just easier to change the pinctrl driver to emulate dual
>>>> edge itself and that can work around the problem in the PDC?  There
>>>> seem to be a few samples you could copy from:
>>>>
>>>> $ git log --oneline --no-merges --grep=emulate drivers/pinctrl/
>>>> 3221f40b7631 pinctrl: mediatek: emulate GPIO interrupt on both-edges
>>>> 5a92750133ff pinctrl: rockchip: emulate both edge triggered interrupts
>>>>
>>> pinctrl-msm already supports emulating dual edge, but my understanding
>>> was that the problem lies in that somehow this emulation would have to
>>> be tied to or affect the PDC driver?
>> yes, thats correct, pinctrl-msm already supports it, the problem lies
>> in the fact that PDC does not. This patch, infact was trying to fix the
>> issue by removing all PDC involvement for gpio28 and making pinctrl-msm
>> in charge of it.
> If we're going to try to do this, I think we're stuck with one of these:
>
> 1. A really really long list that we keep jamming more boards into.
>
> 2. Add an entry at the top-level device tree compatible to all
> affected boards _just_ for this purpose.  Seems ugly since we don't
> need it for any other reasons.
>
> 3. Add some sort of property to the pinctrl node on these boards.
> Seems ugly since conceivably this _could_ be worked around in
> software.
>
> I don't really like any of those options, so I'm really hoping we can
> find out how to get a workaround in...
Hi Doug,

The client driver here never uses/needs both the edges at a given time.
Another option (clean & correct IMO) is to update the driver to request 
proper irq type its expecting.

Lets take SD card detect GPIO for example, which uses dual edge interrupt.
one edge (rising type) can be used as a card insert detect interrupt and 
another edge (falling type) may be used for card removal detect.

The sequence of operations, IMO should be..
1. Driver request a rising type irq to start with (the one that detects 
card insertion)
2. once card insertion irq comes in, the driver should change the type 
to falling which is expected (to detect the card removal)
3. once card removal irq comes in, it can change type to rising edge (to 
detect another insertion)
4. above steps (2,3) continues

if above sequence is followed from drivers using dual edge IRQ, we don't 
need any workaround.

Thanks,
Maulik
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

