Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2B62434C8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgHMHUB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:20:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63974 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726499AbgHMHUB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Aug 2020 03:20:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597303200; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xJQv4ioCYHRFYpl/M1NlcDB2kq4XSEa0ukGIZ1zA4L0=; b=gvReQQzfNDFWdggzqTBDM5T7Y5PXz6w74VY9KXAoqfMjROckfMuaJpqtCmmw6iKGeAq+P3f1
 QcljP91gOwx8hNUcuyAlu7IHlV94y6rkShkT/W8+HDoIiRpvnDJ1hLjvDioMGsECdUd0nQE5
 6Uoxzj4b1O4oe5kJpxuSHRzPdiQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f34e993cbcd42bdeec4dd16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 07:19:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B43D8C433C6; Thu, 13 Aug 2020 07:19:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1760FC433C6;
        Thu, 13 Aug 2020 07:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1760FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 4/7] genirq: introduce irq_suspend_parent() and
 irq_resume_parent()
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-5-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=Uvsd3YBK0PS5X4ScAtC1q0Xfh8q=JQ1iTRKi=VVSU4Gw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e9f984a0-a8b2-aa30-ed38-4b9e8bfe4d23@codeaurora.org>
Date:   Thu, 13 Aug 2020 12:49:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Uvsd3YBK0PS5X4ScAtC1q0Xfh8q=JQ1iTRKi=VVSU4Gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/12/2020 1:40 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> From: Douglas Anderson <dianders@chromium.org>
>>
>> This goes with the new irq_suspend_one() and irq_resume_one()
>> callbacks and allow us to easily pass things up to our parent.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   include/linux/irq.h |  2 ++
>>   kernel/irq/chip.c   | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 30 insertions(+)
> Thanks for posting my patch.  Small nit here is that when I saw the
> patches listed together I realized that I forgot to capitalize
> "introduce" in ${SUBJECT}.  The two patches right next to each other
> that both start with "introduce" where one has a capital and one
> doesn't look weird.  Hopefully you can fix in the next version?
>
> Thanks!
>
> -Doug

Sure, i will update subject in v5.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

