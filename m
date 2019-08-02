Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9B37ECEC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 08:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731644AbfHBGx0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 02:53:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50492 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389148AbfHBGx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 02:53:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E39A96043F; Fri,  2 Aug 2019 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564728804;
        bh=FnKA06X8S6Ar0MBJG65ZgJ8cP/xxJCbs0ty010kJAKY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Z8NG6myPRhpG9MDO0fmAIhzqorMKp2CFCvv9hO8pXiU9OYfCrb8W6x0pWnV5c6jRC
         7ot9snFXFT1cZ2WHNW5hMbCVPuRTneUHNJi1OZs3bk1V+DKvsHyScLdL6pYAmZNFHi
         4N/J012B7KUt/4Fe0N4gqnAHqc8zF/me43rV7/vQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F282601F6;
        Fri,  2 Aug 2019 06:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564728804;
        bh=FnKA06X8S6Ar0MBJG65ZgJ8cP/xxJCbs0ty010kJAKY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Z8NG6myPRhpG9MDO0fmAIhzqorMKp2CFCvv9hO8pXiU9OYfCrb8W6x0pWnV5c6jRC
         7ot9snFXFT1cZ2WHNW5hMbCVPuRTneUHNJi1OZs3bk1V+DKvsHyScLdL6pYAmZNFHi
         4N/J012B7KUt/4Fe0N4gqnAHqc8zF/me43rV7/vQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F282601F6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl
 binding
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
References: <20190802041507.12365-1-rnayak@codeaurora.org>
 <20190802063317.GB12733@vkoul-mobl.Dlink>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <b468e53a-d010-d95f-de9a-62ef60083074@codeaurora.org>
Date:   Fri, 2 Aug 2019 12:23:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802063317.GB12733@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/2/2019 12:03 PM, Vinod Koul wrote:
> On 02-08-19, 09:45, Rajendra Nayak wrote:
>> From: Jitendra Sharma <shajit@codeaurora.org>
>>
>> Add the binding for the TLMM pinctrl block found in the SC7180 platform
>>
>> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> [rnayak: Fix some copy-paste issues, sort and fix functions]
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
> 
> changes since v1: ..?
> 
>> +- reg-names:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Defintiion: names for the cells of reg, must contain "north", "south"
> 
> s/Defintiion/Definition
> 
>> +Example:
>> +
>> +	tlmm: pinctrl@3000000 {
> 
> this should be: pinctrl@3500000
> 
> with these two nitpicks fixed:

Thanks Vinod for the review. I will fix these and respin, after I wait
a while to see if there is any more feedback :)

> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
