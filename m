Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD3982B7C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 08:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731560AbfHFGJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 02:09:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60536 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731540AbfHFGJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 02:09:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3A87B6074F; Tue,  6 Aug 2019 06:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565071764;
        bh=wZcoG9zcx7oPu5yPKEHbjF3L04ndvtLGIQczn3qAEqo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QjX0MuLmufD/DJFzwmFbuvo3PpgoPujwR12W/px/t9AQdSXcZuVkYgH773b5Z/8Lt
         kQGtCspneGFWvmzUVMQWUdC6zEDTvwlCbXmn2u6TUI5BxLqSco2Gp9rvUfV6ON4bAe
         m5wsUi18XfApyOVOPumFKrc36lz6kNGUpx23oJcI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.43.141] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22DB66074F;
        Tue,  6 Aug 2019 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565071763;
        bh=wZcoG9zcx7oPu5yPKEHbjF3L04ndvtLGIQczn3qAEqo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=S5CI0Rb9KUYip0Lt36qMzQ2afynyi51AS+EvikUB6Xups9KekncIaYB+Q8xhqw0Bi
         ATdVmMokFk/4fFVoQ1UVfD4N6SfHiI82ud4SQEa+lmq4WpyX3NT9tM89ruzeCcEWl8
         xcw4KOLkq29F/kBOPdNdzFBWwvHfg5Q53q7S0yd0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22DB66074F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl
 binding
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
References: <20190801100717.23333-1-rnayak@codeaurora.org>
 <CACRpkdYLb-WWSEL8yG3yy8Qq7bOKP9JjUGV51mY6=aEwrQAJvg@mail.gmail.com>
 <CACRpkdaoOuyUmysb3OmErbLJ6zZuHGGt7RRzG9wULDkg=hLCAw@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <d227c2b1-50df-b3e0-ea44-595c5e32fc61@codeaurora.org>
Date:   Tue, 6 Aug 2019 11:39:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaoOuyUmysb3OmErbLJ6zZuHGGt7RRzG9wULDkg=hLCAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/5/2019 5:05 PM, Linus Walleij wrote:
> On Mon, Aug 5, 2019 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Aug 1, 2019 at 12:07 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>> From: Jitendra Sharma <shajit@codeaurora.org>
>>>
>>> Add the binding for the TLMM pinctrl block found in the SC7180 platform
>>>
>>> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
>>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>>> [rnayak: Fix some copy-paste issues, sort and fix functions]
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>
>> Patch applied with Bjorn's ACK.
> 
> Ooops there is v2 and even v3 coming, OK I wait for v3 and
> backed this out.

Hi Linus, I just posted the v3 out with all the ACKs added.
They should be good to pick up now.
thanks,
Rajendra

> 
> Yours,
> Linus Walleij
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
