Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7092F13559E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 10:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgAIJVi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 04:21:38 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:43041 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729375AbgAIJVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 04:21:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578561697; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HENFk0Bwme4xX25T8XYjrsnqX3dO66gOl56uwR9piXs=; b=S1Slievj2qko2Fc//+wVOdtjw7S77e/95jqfZOszrHklliuX9EJxqxOnkAXPQ+ZSHWW2sBXY
 WKERJj3ZH7+3X8JtOukuF6jo/WqFZLK89DWg8yT4j6gTugrhggRyIvgfqBwCi9zwqMCfMefi
 MGjaJ8hDNXTxaLsUaA6NbR3hkPE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e16f09f.7f01651f0e30-smtp-out-n02;
 Thu, 09 Jan 2020 09:21:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC6B8C4479F; Thu,  9 Jan 2020 09:21:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A050C433A2;
        Thu,  9 Jan 2020 09:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A050C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V3 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl
 bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, sivaprak@codeaurora.org
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
 <1578052177-6778-2-git-send-email-sricharan@codeaurora.org>
 <CACRpkdbjjzwdEgsDV2tGea0t3AMM_FRSd-Um3+2BrYDTGKoNxw@mail.gmail.com>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <ca9baad3-8065-4647-c6c5-7449b96f4f71@codeaurora.org>
Date:   Thu, 9 Jan 2020 14:51:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdbjjzwdEgsDV2tGea0t3AMM_FRSd-Um3+2BrYDTGKoNxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 1/7/2020 5:25 PM, Linus Walleij wrote:
> On Fri, Jan 3, 2020 at 12:49 PM Sricharan R <sricharan@codeaurora.org> wrote:
> 
>> Add device tree binding Documentation details for ipq6018
>> pinctrl driver.
>>
>> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  [v3] Fixed the example dt node, inherited properties
> 
> Once you are done with patches 1 & 2, can I merge these
> separately to the pinctrl tree?

Yeah, that should be fine. Posted a V4 and waiting for approval
from Rob on the pinctrl bindings for Patch 1.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
