Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147C01E1A78
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 06:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgEZEpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 00:45:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:20461 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbgEZEpr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 May 2020 00:45:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590468346; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=pOqLTEYmcv/1WZ4CUindBKPntxB4V+2joT4aCQzD+kc=; b=bh4WBNHCUaFV1nP7s7LvZzNw525+shifY2LGvCGmkSA7DP4unc8PAQ/FXSahrb+beFfvF2qa
 GRIBuDh8xVMTJWKd7D4jaMpwENjg+0+llJNj51BACIQnG2jzALTAxJRy2Jcn1Ve4BOTNr9ni
 4V0seQlqLb2vx067T5Xel7yyHCk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ecc9eedb4f0a9ae22756c4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 04:45:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14837C43395; Tue, 26 May 2020 04:45:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [157.32.229.212])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56C60C433C9;
        Tue, 26 May 2020 04:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56C60C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
 <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
 <e4ebd476-1c34-0c58-bba0-14dfd4d31941@xs4all.nl>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8bae16f8-2f03-0d44-fe29-ee9451c4be23@codeaurora.org>
Date:   Tue, 26 May 2020 10:15:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e4ebd476-1c34-0c58-bba0-14dfd4d31941@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/25/2020 5:52 PM, Hans Verkuil wrote:
> On 25/05/2020 13:55, Linus Walleij wrote:
>> On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>>
>>> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
>>> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
>>> callback is implemented then genirq takes unlazy path to disable irq.
>>>
>>> Underlying irqchip may not want to implement irq_disable callback to lazy
>>> disable irq when client drivers invokes disable_irq(). By overriding
>>> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>>>
>>> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
>>> if irqchip implemented irq_disable. In cases where irq_disable is not
>>> implemented irq_mask is overridden. Similarly override irq_enable callback
>>> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>>>
>>> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> I definitely want Hans Verkuils test and review on this, since it
>> is a usecase that he is really dependent on.
> Maulik, since I am no longer subscribed to linux-gpio, can you mail the
> series to me?
>
> I have two use-cases, but I can only test one (I don't have access to the
> SBC I need to test the other use-case for the next few months).
>
> Once I have the whole series I'll try to test the first use-case and at
> least look into the code if this series could affect the second use-case.
>
> Regards,
>
> 	Hans

Hi Hans,

Mailed you the entire series.

Thanks,
Maulik
>
>> Also the irqchip people preferredly.
>>
>> But it does seem to mop up my mistakes and fix this up properly!
>>
>> So with some testing I'll be happy to merge it, even this one
>> patch separately if Hans can verify that it works.
>>
>> Yours,
>> Linus Walleij
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

