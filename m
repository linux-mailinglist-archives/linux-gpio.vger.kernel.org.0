Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 068D97EA56
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 04:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfHBCaj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 22:30:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33094 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfHBCaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 22:30:39 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 176CF60CED; Fri,  2 Aug 2019 02:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564713038;
        bh=OZ0F8RORaUhH2iVexwHKq9tgLEmJGbcN3e+e3jjLA1I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kiufhAOmCEiVcEp97nEuTYC2w1MGipbICKkEQIdgiLFyR1No3s7yUTkeDqvcr8/oO
         aBYmxBtCq1UST+hKFViRiw9+jVavDYCRlPNaL/Bqv+6VVoO2Ml6qGAq7jhNZiSOTSh
         T1gjWhQ7mhiw9k+AOGKZH9vzUVfRtNjDH9fgx2Sc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A305461FE0;
        Fri,  2 Aug 2019 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564713036;
        bh=OZ0F8RORaUhH2iVexwHKq9tgLEmJGbcN3e+e3jjLA1I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Mdlrqe1U7jv3NXPMi3YJzB7dSTLfVwftvLyVTVU2F+eszwTmqpI8MOP4Mv4N/0rQh
         5DIb/5GmekgB+l3I3kLsd9/enQbi/l1ndeRhPkd1uiiWz/0Cskl9MzoFnNx1ffyLfN
         +nEZOA7rz1rtsy3yRUiObJMALYn50Qax/FRdS67Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A305461FE0
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SC7180 pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
References: <20190801100717.23333-1-rnayak@codeaurora.org>
 <20190801100717.23333-2-rnayak@codeaurora.org>
 <20190801143637.GY7234@tuxbook-pro>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <2f530ba7-684b-156b-5fe3-3577d574a03d@codeaurora.org>
Date:   Fri, 2 Aug 2019 08:00:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801143637.GY7234@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/1/2019 8:06 PM, Bjorn Andersson wrote:
> On Thu 01 Aug 03:07 PDT 2019, Rajendra Nayak wrote:
> 
> [..]
>> +static const struct msm_pingroup sc7180_groups[] = {
>> +	[0] = PINGROUP(0, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
>> +	[1] = PINGROUP(1, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
>> +	[2] = PINGROUP(2, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
>> +	[3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
>> +	[4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _), [5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
>> +	[6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _), [7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),
> 
> 5 and 7 deserve to be on their own line :)

Oops, looks like some formatting mess, I'll fix and resend.

> 
> Apart from that:
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

thanks for the review.

> 
> Regards,
> Bjorn
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
