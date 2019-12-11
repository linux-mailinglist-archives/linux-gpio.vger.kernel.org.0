Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909AC11A369
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 05:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfLKE2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 23:28:10 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:43648
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726783AbfLKE2K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 23:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576038488;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=gMk9WhWup2884Y7Eo+6uMfgKSR+xyScM8bYv0/IBWzo=;
        b=C4F7mO5R6jt5HkyItD+RlNdRrRcmWnYUZZUadKOZn2hVh54WZDmJC9pZfkoZIFAf
        fkJnJ7Bbr7ACd2Bpvw//sTwp1Ozdta/rXbwZeBWhnyJ1FS17rG7mb+9Lt04BjMQVuoQ
        BOdYHWkVZq9dDlY42SuZaWC1ljiaWjijZH5Z+gnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576038488;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=gMk9WhWup2884Y7Eo+6uMfgKSR+xyScM8bYv0/IBWzo=;
        b=Fxtfaq5Naf79sqyWqcdnegdfwveUJRlOQhj/KWcDRM/arzDNVEb9tRYsZkNnjidI
        hgue9wFQhKqIg+8k1tqr8o0XFC9gTTcFgX3swxvm0IIdxv+dS+DnU76Dx1M8BqGexZh
        ICT9tz/tYeyDIlI7NQq0XmkFFED8/8jiJ/LFlng0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6703AC8F10C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Add new qup functions
To:     Doug Anderson <dianders@chromium.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <0101016eef165cd0-26845355-ff75-416e-99a2-0c4434e18b76-000000@us-west-2.amazonses.com>
 <CAD=FV=XAhSWOOPrHpuhjObi0UpKaeaD4TX1yhTh64cy39E1wyQ@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016ef336d9c4-d9f221c4-bd59-41e0-a2ba-403880da148d-000000@us-west-2.amazonses.com>
Date:   Wed, 11 Dec 2019 04:28:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XAhSWOOPrHpuhjObi0UpKaeaD4TX1yhTh64cy39E1wyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.12.11-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 12/10/2019 11:14 PM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Dec 10, 2019 at 1:14 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> on sc7180 we have cases where multiple functions from the same
>> qup instance share the same pin. This is true for qup02/04/11 and qup13.
>> Add new function names to distinguish which qup function to use.
>>
>> Reported-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-sc7180.c | 60 +++++++++++++++++++++++------------
>>   1 file changed, 40 insertions(+), 20 deletions(-)
> 
> Two overall issues:
> 
> 1. I think you also need to update the device tree bindings, so this
> should be a 2-patch series.  Those list all possible values for
> "function" so you need to update.

yes, I will include the bindings update patch when I repost.

> 
> 2. It would be nice if you mentioned in the commit message that this
> will break i2c usage on these QUPs for anyone using old device tree
> files.  That shouldn't be a problem (AKA no need to provide backward
> compatibility) since I think the main sc7180.dtsi hasn't landed
> anywhere yet, but if anyone pulled an early patch from the list it
> would be good to give them a heads up in your commit message.

Sure, will update the commit msg accordingly.

> 
>> @@ -976,8 +996,8 @@ static const struct msm_pingroup sc7180_groups[] = {
>>          [3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
>>          [4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _),
>>          [5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
>> -       [6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _),
>> -       [7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),
>> +       [6] = PINGROUP(6, NORTH, qup11_i2c, qup11_uart, _, _, _, _, _, _, _),
>> +       [7] = PINGROUP(7, NORTH, qup11_i2c, qup11_uart, ddr_bist, _, _, _, _, _, _),
> 
> You probably have a more complete document than I have.  ...but the
> one I'm looking at shows that for pins 6/7 only i2c is available, not
> UART.  Said another way: I see QUP1_L0[1] and QUP1_L1[1] on Func1 but
> I don't see anything on Func2.  Of course, my document also doesn't
> include "ddr_bist", so maybe it's just incomplete.

yes, I can confirm I do see QUP1_L2[1] and QUP1_L3[1] on Func2 for gpio 6/7
in my doc.

Thanks for the review.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
