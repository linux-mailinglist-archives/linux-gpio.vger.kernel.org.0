Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613343B3A1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 13:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389256AbfFJLBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 07:01:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59498 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389191AbfFJLBI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 07:01:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BB26C6087F; Mon, 10 Jun 2019 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560164466;
        bh=3trH4tk+FpSyNWsSjAcyso4X8iKz3q8bkwkkDW6kp0c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=i8tCth4CABKcWpiDev0U4v9Cd0hlZ2e6aN4vxx7m5ErpM6rGgwy5QBYdBSJtDvF5U
         j8bzacfJIq/qf06qk7YwR/Gp6vzz5q8/TOC1wawsnW0cDxcjP6b/p3ehn5lkSO0Vpy
         3iwXiU1dhYnMx0jz2KBnZnY34TruF0R1BQl+q66U=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3A9060271;
        Mon, 10 Jun 2019 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560164465;
        bh=3trH4tk+FpSyNWsSjAcyso4X8iKz3q8bkwkkDW6kp0c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Zs7bRIFkXPtBEcVN0IE3hG8C/WidjWXVwfjfZUssqzofuOtu47AoMtEwzeR2ie/QY
         GGAv5OEPk1Xt899aW9drGqPiVD2eARuuAaZU03W5qIMRxlGDvUZTBFZiaCM/1+kM6K
         AGqozjHVsq4h9oAHisZKzuUAsj48PMm85Iz6xaCY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3A9060271
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 1/6] pinctrl: qcom: Add ipq6018 pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linus.walleij@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-2-git-send-email-sricharan@codeaurora.org>
 <20190608032613.GC24059@builder>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <1766bee3-e4da-7c7c-9881-4a58885640dc@codeaurora.org>
Date:   Mon, 10 Jun 2019 16:30:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608032613.GC24059@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bjorn,

On 6/8/2019 8:56 AM, Bjorn Andersson wrote:
> On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:
> 
>> Add initial pinctrl driver to support pin configuration with
>> pinctrl framework for ipq6018.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Signed-off-by: speriaka <speriaka@codeaurora.org>
> 

 Thanks for the review !!

> These should start with the author, then followed by each person that
> handled the patch on its way to the list - so your name should probably
> be last.  If you have more than one author add Co-developed-by, in
> addition to the Signed-off-by.
> 
> And please spell our speriaka's first and last name.
> 
 
  ok, will fix it.

> [..]
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
> [..]
>> +- #gpio-cells:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be 2. Specifying the pin number and flags, as defined
>> +		    in <dt-bindings/gpio/gpio.h>
> 
> You're missing the required "gpio-ranges" property.
> 

 ok, will add.

>> +
> [..]
>> +- function:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Specify the alternative function to be configured for the
>> +		    specified pins. Functions are only valid for gpio pins.
>> +		    Valid values are:
>> +	adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,
> 
> Please indent these.
> 

 ok.

> [..]
> 
> The rest should be in a separate patch from the binding.
> 
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> [..]
>> +enum ipq6018_functions {
> [..]
>> +	msm_mux_NA,
> 
> I like when these are sorted, and if you make the last entry msm_mux__
> the msm_pingroup array becomes easier to read.
> 

 ok.

>> +};
> [..]
>> +static const struct msm_function ipq6018_functions[] = {
> [..]
>> +	FUNCTION(gcc_tlmm),
> 
> As above, please sort these.
> 

 ok.

>> +};
>> +
>> +static const struct msm_pingroup ipq6018_groups[] = {
>> +	PINGROUP(0, qpic_pad, wci20, qdss_traceclk_b, NA, burn0, NA, NA, NA,
>> +		 NA),
> 
> Please ignore the 80-char and skip the line breaks.
> 

 ok.

>> +	PINGROUP(1, qpic_pad, mac12, qdss_tracectl_b, NA, burn1, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(2, qpic_pad, wci20, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(3, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(4, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(5, qpic_pad4, mac21, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
> 
> Is there a reason to keep qpic_padN as separate functions from qpic_pad?
> 
  Hmm, the auto-gen scripts needs to be fixed. Will correct it.

> [..]
>> +static struct platform_driver ipq6018_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "ipq6018-pinctrl",
>> +		.owner = THIS_MODULE,
> 
> .owner is populated automagically by platform_driver_register, so please
> omit this.
> 

 ok, missed it. will fix. 

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
