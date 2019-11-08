Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A73F5BAC
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Nov 2019 00:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfKHXOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 18:14:39 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:59216 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfKHXOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 18:14:39 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6655161152; Fri,  8 Nov 2019 23:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573254854;
        bh=IDArQ3miDu7Zqw4xXWBNZx2KTGjzXaYXHVTJFeSlNEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UhfCwh86YrYvf4a9y8pw/eXJonzuoiJ1B0x0DOueZ+QEX5Gid1vauuh+uzta/3wiI
         1dwA8MawEXRrlFEsMjnBDhMQA5U7+VvK092JLz9t/udljC7zsy/A9qB4/G7Su0E3SU
         leDobC433TvJreumIV0Gw540ZJJ97oVagVqxkbhc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4ACF661152;
        Fri,  8 Nov 2019 23:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573254853;
        bh=IDArQ3miDu7Zqw4xXWBNZx2KTGjzXaYXHVTJFeSlNEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TpwbFIzBYwcPZCx1/6DzdirP2TBGzZ2NPDxB/MoqnrhqV0P7d4VcmCYyj9ybtLBY5
         h6BYuiQmUyS/Z7eU19cQg3C/4QfwUGCtEsmzCaHCPex+/c1Niv76LYhEiP8AJLL6rb
         0rkfh9EY83V/iBlmMuR+1ylu81r5DTX5vfIRNUaA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4ACF661152
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 8 Nov 2019 16:14:12 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>, maz@kernel.org,
        LinusW <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RFC v2 04/14] drivers: irqchip: add PDC irqdomain for
 wakeup capable GPIOs
Message-ID: <20191108231412.GI16900@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-5-git-send-email-ilina@codeaurora.org>
 <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
 <20191108215424.GG16900@codeaurora.org>
 <20191108221636.GH16900@codeaurora.org>
 <CAD=FV=V_hieLP-qqU23=shM0PdeXpu=Spe3O6a-WHur7w+AnAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAD=FV=V_hieLP-qqU23=shM0PdeXpu=Spe3O6a-WHur7w+AnAQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 08 2019 at 15:57 -0700, Doug Anderson wrote:
>Hi,
>
>On Fri, Nov 8, 2019 at 2:16 PM Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> On Fri, Nov 08 2019 at 14:54 -0700, Lina Iyer wrote:
>> >On Fri, Nov 08 2019 at 14:22 -0700, Doug Anderson wrote:
>> >>Hi,
>> >>
>> >>On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
>> >>>
>> >>>diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
>> >>>new file mode 100644
>> >>>index 0000000..85ac4b6
>> >>>--- /dev/null
>> >>>+++ b/include/linux/soc/qcom/irq.h
>> >>>@@ -0,0 +1,19 @@
>> >>>+/* SPDX-License-Identifier: GPL-2.0-only */
>> >>>+
>> >>>+#ifndef __QCOM_IRQ_H
>> >>>+#define __QCOM_IRQ_H
>> >>>+
>> >>
>> >>I happened to be looking at a pile of patches and one of them added:
>> >>
>> >>+#include <linux/irqdomain.h>
>> >>
>> >>...right here.  If/when you spin your patch, maybe you should too?  At
>> >>the moment the patch I was looking at is at:
>> >>
>> >>https://android.googlesource.com/kernel/common/+log/refs/heads/android-mainline-tracking
>> >>
>> >>Specifically:
>> >>
>> >>https://android.googlesource.com/kernel/common/+/448e2302f82a70f52475b6fc32bbe30301052e6b
>> >>
>> >>
>> >Sure, will take care of it in the next spin.
>> >
>> Checking for this, it seems like it would not be needed by this header.
>> There is nothing in this file that would need that header. It was
>> probably a older version that pulled into that tree.
>>
>> Is there a reason now that you see this need?
>
>From the note in the commit I found I'd assume that Maulik Shah (who
>is CCed here) has history?
>
>...but looking at it, I see that your header file refers to
>"IRQ_DOMAIN_FLAG_NONCORE" which is defined in "linux/irqdomain.h".
Ah, ok. That would need the file. Will add.

>That means it's good hygiene for you to include the header, right?
>Otherwise all your users need to know that they should include the
>header themselves, which is a bit ugly.
>
>-Doug
