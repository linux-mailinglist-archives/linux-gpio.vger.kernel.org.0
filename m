Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E11E647FC8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 12:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfFQKf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 06:35:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55274 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFQKf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 06:35:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6844560770; Mon, 17 Jun 2019 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560767726;
        bh=aTWPLJInIlt+CJHFbSDhIUEcaDKLsK68r/oR8Ij464E=;
        h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
        b=RWJWHyg5ajnUDWx6bqjdQWb5CFqmzzeGIxaUpsbTUD5vg2R2qoPEUZkA0tpmbgkCT
         ujf4B+swG6f6puziwEnGFoS70PAr3ZCJ8bacv6elOJFxupLlqhe0oIHdeMD+2jiIgY
         ihsNWxPR/dXaV2556ke9HfFzD2bwAZq9kWe8cXSo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31BE960237;
        Mon, 17 Jun 2019 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560767725;
        bh=aTWPLJInIlt+CJHFbSDhIUEcaDKLsK68r/oR8Ij464E=;
        h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
        b=ZvuoDROJl7O9qCSp1Wns+yGOQBhfgx/WauQTdhK8Q8Etxrnbua9QqiuamUTSv+mAr
         5Sm4IToZDX/erfRH5BYpwh1sw5tzJdrHDtpymI/j7eWkn0HIHFFeVJNM3J65buu3hE
         Rnpy625qZG/7MJ510us7aKWr6ToPpAgakJjJS1uA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31BE960237
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: Fwd: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
To:     Stephen Boyd <sboyd@kernel.org>, tengfeif@codeaurora.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bjorn.andersson@linaro.org
References: <20190611185102.368ED21744@mail.kernel.org>
 <671f87d6-f4a4-6d2c-967b-e1aa0677d83e@codeaurora.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sramana@codeaurora.org
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <b0fdbcb1-4d5d-5c60-4150-7762a577cd10@codeaurora.org>
Date:   Mon, 17 Jun 2019 16:05:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <671f87d6-f4a4-6d2c-967b-e1aa0677d83e@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> Quoting tengfeif@codeaurora.org (2019-06-11 03:41:26)
>> On 2019-06-10 22:51, Stephen Boyd wrote:
>> > Quoting Linus Walleij (2019-06-07 14:08:10)
>> >> On Fri, May 31, 2019 at 8:52 AM Tengfei Fan 
>> <tengfeif@codeaurora.org> >> wrote:
>> >> >> > The gpio interrupt status bit is getting set after the
>> >> > irq is disabled and causing an immediate interrupt after
>> >> > enablling the irq, so clear status bit on irq_unmask.
>> >> >
>> >> > Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
>> >> >> This looks pretty serious, can one of the Qcom maintainers ACK
>> >> this?
>> >> >> Should it be sent to fixes and even stable?
>> >> >> Fixes: tag?
>> >> > > How is the interrupt status bit getting set after the irq is 
>> disabled?
>> > It looks like this is a level type interrupt? I thought that after
>> > commit b55326dc969e ("pinctrl: msm: Really mask level interrupts to
>> > prevent latching") this wouldn't be a problem. Am I wrong, or is qcom
>> > just clearing out patches on drivers and this is the last one that 
>> > needs
>> > to be upstreamed?
>>
>> Your patch(commit b55326dc969e) can cover our issue, and my patch is 
>> no longer needed.
>> Your patch isn't included in our code, so I submitted this patch.
>
> Alright cool. Sounds like this patch can be dropped then and you can
> pick up the patch from upstream into your vendor kernel.
>

Hi Stephen, there is one use case with is not covered by commit 
b55326dc969e (

"pinctrl: msm: Really mask level interrupts to prevent latching"). That 
happens when

gpio line is toggled between i/o mode and interrupt mode :

1. GPIO is configured as irq line. Peripheral raises interrupt.

2. IRQ handler runs and disables the irq line (through wq work).

3. GPIO is configured for input and and data is received from the 
peripheral.

4. Now, when GPIO is re-enabled as irq, we see spurious irq, and there 
isn't

any data received on the gpio line, when it is read back after 
configuring as input.

This can happen for both edge and level interrupts.

Patch https://lkml.org/lkml/2019/6/17/226 tries to cover this use case. 
Can you please

provide your comments?


Thanks

Neeraj

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

