Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F70DF5AB7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 23:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfKHWQk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 17:16:40 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57500 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfKHWQk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 17:16:40 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9299F609EF; Fri,  8 Nov 2019 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573251398;
        bh=NHLqhu3lBLa2cW4RgrQ6UYgyY+0N7hfT2ycG75uhyXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ew2au96ev9JvlKbyA2nsvPhukZFE5v52MuRPR6/qN0SaShCVVwhh3l9pkRnUnMf3p
         pnW35bM3evRrN+ElX7fmvta6NE2dW/I2lxRaRfTU/bFvf6VnMMMq9Rdifz/8CTVeMX
         eLMUQo+nyK7zSwNXPvXs9IDa11MK6WDOpy5Am4B8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 886D160AD9;
        Fri,  8 Nov 2019 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573251397;
        bh=NHLqhu3lBLa2cW4RgrQ6UYgyY+0N7hfT2ycG75uhyXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jV1A3uZAgYLchlChqAFcX1FWlWGyIPn2+HV74H9/CUtAd6je6U1yUsCrVmUboZSuh
         T2OEPNWOpYttsF7kdwzd11eOZeMIx4Tr53/tSJsHPuGncx/lfLDqHGmRDnyeRTZdoK
         PpRZvULo8cEsD2Cq48NS6qXfhrF/x+ZLQYA//RFU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 886D160AD9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 8 Nov 2019 15:16:36 -0700
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
Message-ID: <20191108221636.GH16900@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-5-git-send-email-ilina@codeaurora.org>
 <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
 <20191108215424.GG16900@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191108215424.GG16900@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 08 2019 at 14:54 -0700, Lina Iyer wrote:
>On Fri, Nov 08 2019 at 14:22 -0700, Doug Anderson wrote:
>>Hi,
>>
>>On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
>>>
>>>diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
>>>new file mode 100644
>>>index 0000000..85ac4b6
>>>--- /dev/null
>>>+++ b/include/linux/soc/qcom/irq.h
>>>@@ -0,0 +1,19 @@
>>>+/* SPDX-License-Identifier: GPL-2.0-only */
>>>+
>>>+#ifndef __QCOM_IRQ_H
>>>+#define __QCOM_IRQ_H
>>>+
>>
>>I happened to be looking at a pile of patches and one of them added:
>>
>>+#include <linux/irqdomain.h>
>>
>>...right here.  If/when you spin your patch, maybe you should too?  At
>>the moment the patch I was looking at is at:
>>
>>https://android.googlesource.com/kernel/common/+log/refs/heads/android-mainline-tracking
>>
>>Specifically:
>>
>>https://android.googlesource.com/kernel/common/+/448e2302f82a70f52475b6fc32bbe30301052e6b
>>
>>
>Sure, will take care of it in the next spin.
>
Checking for this, it seems like it would not be needed by this header.
There is nothing in this file that would need that header. It was
probably a older version that pulled into that tree.

Is there a reason now that you see this need?

--Lina
