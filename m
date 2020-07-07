Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E38C21658F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 06:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgGGEwk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 00:52:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35403 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727800AbgGGEwj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jul 2020 00:52:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594097559; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OcoyeThPIlWtWC0r6guscQL9dK0UlTUWXTYaHWIEOww=; b=p3138WDkAZ4uxPnfJqg+gDfuKplshFLuGBwT7ZEAESj9e+WePXEdYb8oYiprdB/ROOHx+SIL
 yynSVXvsgbayNxi6PTCi916nFeCSX1CG8AdxzfoWFLV7gcI4bg/kmoPqdjpRDltm2fvn82f6
 HRa17QLgMM1XK6JJbDZksoA4Wh4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5f03ff92bca1ed3155a6556c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 04:52:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43B86C433CA; Tue,  7 Jul 2020 04:52:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.11] (unknown [61.3.20.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D6E4C433C8;
        Tue,  7 Jul 2020 04:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D6E4C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
 for google,lazor
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     LinusW <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=WyhJ6g0DZS=ysT-AyXJoiRX=UFE9fXY2NEHfuUHYUXCQ@mail.gmail.com>
 <20200706203805.GS388985@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c747043d-c69e-4153-f2ca-16f1fc3063c2@codeaurora.org>
Date:   Tue, 7 Jul 2020 10:22:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706203805.GS388985@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


[]..

>>> @@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>>>
>>>   static int sc7180_pinctrl_probe(struct platform_device *pdev)
>>>   {
>>> +       if (of_machine_is_compatible("google,lazor")) {
>>> +               sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
>>> +               sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
>>> +       }
>>
>> As much as I want patches landed and things working, the above just
>> doesn't feel like a viable solution.  I guess it could work as a short
>> term hack but it's going to become untenable pretty quickly.
> 
> I second that.
> 
>> As we
>> have more variants of this we're going to have to just keep piling
>> more machines in here, right?  ...this is also already broken for us
>> because not all boards will have the "google,lazor" compatible.  From
>> the current Chrome OS here are the compatibles for various revs/SKUs
>>
>> compatible = "google,lazor-rev0", "qcom,sc7180";
>> compatible = "google,lazor-rev0-sku0", "qcom,sc7180";
>> compatible = "google,lazor", "qcom,sc7180";
>> compatible = "google,lazor-sku0", "qcom,sc7180";
>> compatible = "google,lazor-rev2", "qcom,sc7180";
>>
>> ...so of the 5 boards you'll only match one of them.
>>
>>
>> Maybe I'm jumping into a situation again where I'm ignorant since I
>> haven't followed all the prior conversation, but is it really that
>> hard to just add dual edge support to the PDC irqchip driver?  ...or

FWIK, this is really a PDC hardware issue (with the specific IP rev that exists
on sc7180) so working it around in SW could get ugly.

>> maybe it's just easier to change the pinctrl driver to emulate dual
>> edge itself and that can work around the problem in the PDC?  There
>> seem to be a few samples you could copy from:
>>
>> $ git log --oneline --no-merges --grep=emulate drivers/pinctrl/
>> 3221f40b7631 pinctrl: mediatek: emulate GPIO interrupt on both-edges
>> 5a92750133ff pinctrl: rockchip: emulate both edge triggered interrupts
>>
> 
> pinctrl-msm already supports emulating dual edge, but my understanding
> was that the problem lies in that somehow this emulation would have to
> be tied to or affect the PDC driver?

yes, thats correct, pinctrl-msm already supports it, the problem lies
in the fact that PDC does not. This patch, infact was trying to fix the
issue by removing all PDC involvement for gpio28 and making pinctrl-msm
in charge of it.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
