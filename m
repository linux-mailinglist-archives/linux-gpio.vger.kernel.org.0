Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2797F2C2F02
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 18:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390187AbgKXRm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 12:42:29 -0500
Received: from z5.mailgun.us ([104.130.96.5]:42302 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733250AbgKXRm3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 12:42:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606239749; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LDLGWnftuNhuhwXEbFu9jSpsqBYMscUfjOPnE77S6l8=; b=eLC6mgDb/0C+6DUXWFzQxztkeaEeeUNwraf+ywIhKV5mSS/hLNh0ayqDUsU0owdLVAsB8KEQ
 RHyru7IzN0BjeuXuX6gof02Yeb7JXr8ATp31nXEFgsIFvI4o7nXYcm4xhD8kmrV8mHBmCb1L
 G7r7J4QNBrR9/y277jY+QYY1zZ4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fbd45f5d64ea0b703a92ae5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 17:42:13
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF9DAC433C6; Tue, 24 Nov 2020 17:42:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 843C7C433ED;
        Tue, 24 Nov 2020 17:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 843C7C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Doug Anderson <dianders@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <CACRpkdamdXCqZa4=qb5MsJtQMw1v53z5HZVv5SHJv84dtVACqQ@mail.gmail.com>
 <CAD=FV=W9+Wa=0d-Y+kxhqsRVM4TOofTC-C519cLkYOsLSBRZ4A@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org>
Date:   Tue, 24 Nov 2020 23:12:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W9+Wa=0d-Y+kxhqsRVM4TOofTC-C519cLkYOsLSBRZ4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

+	 * When we change types the PDC can give a phantom interrupt.
+	 * Clear it.  Specifically the phantom shows up if a line is already
+	 * high and we change to rising or if a line is already low and we
+	 * change to falling but let's be consistent and clear it always.
+	 *

Can you please hold this change. I am checking with HW folks if above 
commented behaviour is expected/is valid case to set the irq type rising 
edge when the line is already high.

Will keep posting update here.

Thanks,
Maulik

On 11/24/2020 10:25 PM, Doug Anderson wrote:
> Hi,
>
> On Tue, Nov 24, 2020 at 12:28 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Nov 24, 2020 at 1:02 AM Douglas Anderson <dianders@chromium.org> wrote:
>>
>>> We have a problem if we use gpio-keys and configure wakeups such that
>>> we only want one edge to wake us up.  AKA:
>>>    wakeup-event-action = <EV_ACT_DEASSERTED>;
>>>    wakeup-source;
>> I would need Marc's ACK to apply this with the other patches
>> to the pinctrl tree, but I can't really see if maybe it is OK to
>> apply it separately?
> I'll make an explicit note after the cut in the patch, but to also
> respond here: we can apply this patch on its own.  The only reason I
> sent as one series is because they address similar issues, this patch
> stands on its own.  Patch #3 needs #2 but patch #2/#3 don't need patch
> #1.
>
>> Also are these patches supposed to all go in as fixes or
>> for v5.11?
> Wherever it makes sense.
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

