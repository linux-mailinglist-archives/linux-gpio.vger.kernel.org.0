Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC7F25296E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 12:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfFYK3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 06:29:20 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36912 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbfFYK3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 06:29:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9143B6028D; Tue, 25 Jun 2019 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561458558;
        bh=BCA2m2EDttizL1A7WMCfrSo2P/383TvoBmUFUGVg/ZU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Syd3W+CIctgNf4j9/Jyu09VjziFwHSAzzZ4OWTV/cNVSgN7q8/Ei6igMA3HeuCNrF
         kBES8tsru1ZVUwAdTYT5gdSO3IwW7Jrgnt3VDCGjh5x4srhKmP99vdT0Eg8PDFK99N
         xZAFpSlJ7sQe39Uy3pgj+ik11mcvWgSPnWdmQBI0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9CB060255;
        Tue, 25 Jun 2019 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561458558;
        bh=BCA2m2EDttizL1A7WMCfrSo2P/383TvoBmUFUGVg/ZU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Syd3W+CIctgNf4j9/Jyu09VjziFwHSAzzZ4OWTV/cNVSgN7q8/Ei6igMA3HeuCNrF
         kBES8tsru1ZVUwAdTYT5gdSO3IwW7Jrgnt3VDCGjh5x4srhKmP99vdT0Eg8PDFK99N
         xZAFpSlJ7sQe39Uy3pgj+ik11mcvWgSPnWdmQBI0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9CB060255
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: [PATCH v2] pinctrl: qcom: Add irq_enable callback for msm gpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Timur Tabi <timur@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>
References: <1560764090-22740-1-git-send-email-neeraju@codeaurora.org>
 <CACRpkdZ4BoZzX7pVw4HYBzSMvhnyu_oVNoiiLk3ME05nnG1T3Q@mail.gmail.com>
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <c9eb6bfc-a8d1-75df-159b-3f2304fdb8ea@codeaurora.org>
Date:   Tue, 25 Jun 2019 15:59:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ4BoZzX7pVw4HYBzSMvhnyu_oVNoiiLk3ME05nnG1T3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/25/19 2:28 PM, Linus Walleij wrote:
> On Mon, Jun 17, 2019 at 11:35 AM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:
>
>> From: Srinivas Ramana <sramana@codeaurora.org>
>>
>> Introduce the irq_enable callback which will be same as irq_unmask
>> except that it will also clear the status bit before unmask.
>>
>> This will help in clearing any erroneous interrupts that would
>> have got latched when the interrupt is not in use.
>>
>> There may be devices like UART which can use the same gpio line
>> for data rx as well as a wakeup gpio when in suspend. The data that
>> was flowing on the line may latch the interrupt and when we enable
>> the interrupt before going to suspend, this would trigger the
>> unexpected interrupt. This change helps clearing the interrupt
>> so that these unexpected interrupts gets cleared.
>>
>> Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
>> Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
> Overall this looks good to me, waiting for Bjorn's review.
>
>> Changes since v1:
>> - Extracted common code into __msm_gpio_irq_unmask().
> Please don't name functions __like __that.
>
>> -static void msm_gpio_irq_unmask(struct irq_data *d)
>> +static void __msm_gpio_irq_unmask(struct irq_data *d, bool status_clear)
> Instead of __unclear __underscore __semantic use something
> really descriptive like
>
> static void msm_gpio_irq_clear_irq()
>
> That is what it does, right?

Is below ok? as it clears (if status_clear set) and then unmasks irq

static void msm_gpio_irq_clear_unmask()

>
> Other than that it looks fine.
>
> Yours,
> Linus Walleij

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

