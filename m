Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A1A483CE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 15:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfFQNWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 09:22:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47530 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfFQNWc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 09:22:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8324260254; Mon, 17 Jun 2019 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560777750;
        bh=ew/xbajXtVboXMA/g2sJySnJBP6r87Wf7tJKswJnaqs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jMkkk91rJHyKHUc8qdhdkxnNyBUBpMgikXZ9N35782cqteuJ+Xwi7CzdeQq7Zqcqk
         flbAmjU4UdQ4glqfRCTixYWtV1KlJviVUyr+YJnj98lDnOLJj+7ZfdtkZXfJdRe4RI
         wQGHzC1Cs36FFO0PNWaxdndHTc96p4IIiOPWSAMM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.204.78.89] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7624B60265;
        Mon, 17 Jun 2019 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560777750;
        bh=ew/xbajXtVboXMA/g2sJySnJBP6r87Wf7tJKswJnaqs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jMkkk91rJHyKHUc8qdhdkxnNyBUBpMgikXZ9N35782cqteuJ+Xwi7CzdeQq7Zqcqk
         flbAmjU4UdQ4glqfRCTixYWtV1KlJviVUyr+YJnj98lDnOLJj+7ZfdtkZXfJdRe4RI
         wQGHzC1Cs36FFO0PNWaxdndHTc96p4IIiOPWSAMM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7624B60265
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: Fwd: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Tengfei Fan <tengfeif@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, sramana@codeaurora.org
References: <20190611185102.368ED21744@mail.kernel.org>
 <671f87d6-f4a4-6d2c-967b-e1aa0677d83e@codeaurora.org>
 <b0fdbcb1-4d5d-5c60-4150-7762a577cd10@codeaurora.org>
 <CACRpkdahUNNOhQdri3T86jHr+qOBmXH61_AMmoWpv_be2koMrw@mail.gmail.com>
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <e88903a2-9b07-6eee-3776-0fc0ad429a2d@codeaurora.org>
Date:   Mon, 17 Jun 2019 18:52:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdahUNNOhQdri3T86jHr+qOBmXH61_AMmoWpv_be2koMrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the review, Linus.

On 6/17/19 5:20 PM, Linus Walleij wrote:
> On Mon, Jun 17, 2019 at 12:35 PM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:
>
>> Hi Stephen, there is one use case with is not covered by commit
>> b55326dc969e (
>>
>> "pinctrl: msm: Really mask level interrupts to prevent latching"). That
>> happens when
>>
>> gpio line is toggled between i/o mode and interrupt mode :
>>
>> 1. GPIO is configured as irq line. Peripheral raises interrupt.
>>
>> 2. IRQ handler runs and disables the irq line (through wq work).
>>
>> 3. GPIO is configured for input and and data is received from the
>> peripheral.
> There is no distinction between using a GPIO line as input
> and using it for IRQ. All input GPIOs can be used for IRQs,
> if the hardware supports it (has an irqchip).

Ok

>
>> 4. Now, when GPIO is re-enabled as irq, we see spurious irq, and there
>> isn't
>>
>> any data received on the gpio line, when it is read back after
>> configuring as input.
> That's an interesting usecase. Hans Verkuil reworked the
> GPIO irq support very elegantly exactly to support this type
> of usecase (irq switch on and off dynamically), where he
> was even switching the line into output mode between
> the IRQ trains. (one-wire transcactions for CEC).
>
>> Patch https://lkml.org/lkml/2019/6/17/226 tries to cover this use case.
>> Can you please provide your comments?
> What this patch does is clear all pending IRQs at irq
> unmask. This is usually safe, unless there may be cases
> where you *want* to catch any pending IRQs. I guess
> normally you don't so it should be safe?

We want to clear pending status at irq enable. Afaik, no,

we don't normally track these pending irqs. So, should be

fine here.

>
> The corner case is when you start some transaction
> or whatever that gets ACKed by an IRQ and you actually
> get the IRQ back before you had time to execute the code
> enabling the IRQ.
>
> That would be racy and bad code, as you should clearly
> enable the IRQ first, then start the transaction. So I think
> this patch is safe.
>
> But let's see what Bjorn says.
>
> Yours,
> Linus Walleij

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

