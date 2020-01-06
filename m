Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D98130CD6
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 06:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgAFFCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 00:02:46 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13351 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726338AbgAFFCq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 00:02:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578286965; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=CX/VHEJpV4no3LnvxpQFy1wS7PVPnmsZ8jU3trASlSQ=; b=Yxs6EI0XleqHx0FcAiwM2ksiyaG4kd2wH3IXi1vEmc6PYu1t7NIWs92z453e8RHTYpuMOlzw
 2E3HOZFbB78IN+5AOo4/xBibBm007AhxbX+Zr1STXA5do1I/QheKHzJTUN1opOEIl3oYu/N6
 eGpq3+tK4gQu0Jfclg+ugAzkRVA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e12bf74.7f9ba3b66998-smtp-out-n03;
 Mon, 06 Jan 2020 05:02:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF8D8C433A2; Mon,  6 Jan 2020 05:02:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E84CC43383;
        Mon,  6 Jan 2020 05:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E84CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 0/2] Add Global clock controller support for IPQ6018
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org,
        sivaprak@codeaurora.org
References: <1578050744-3761-1-git-send-email-sricharan@codeaurora.org>
 <20200105065919.4A548207FD@mail.kernel.org>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <4b4b9f0b-5473-aea8-9ebb-7a2c4fecea07@codeaurora.org>
Date:   Mon, 6 Jan 2020 10:32:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200105065919.4A548207FD@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stephen,

On 1/5/2020 12:29 PM, Stephen Boyd wrote:
> Quoting Sricharan R (2020-01-03 03:25:42)
>> The IPQ6018 is Qualcomm\u2019s 802.11ax SoC for Routers,
>> Gateways and Access Points.
>>
>> This series adds Global clock controller support for ipq6018.
> 
> Can you fold the fixes in?
> 

 Sure, will do and resend.

>>
>> The patches were a part of https://patchwork.kernel.org/cover/11303075/,
>> now moved it outside based on Stephen's suggestion.
> 
> Thanks, but I still got the other pinctrl patches :(
> 

 ho, will remove you from CC on those.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
