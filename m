Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B113B3AD
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 13:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389306AbfFJLCC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 07:02:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60568 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389191AbfFJLCC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 07:02:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B6F4E602F3; Mon, 10 Jun 2019 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560164521;
        bh=mRD0HxQRl5qvKBhQoKCxAZoQjXYl9uAGRc+kOHjgp68=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=R1GOxNf+yljtjiwU+Fi0t3WEP0qcYT3squbnT1TdnJPRXEEFZ+Iw+n15K3NuOHWls
         Xs4wSTZDnl9L2L3qUPwuS0kz6M/C7lWPAttdE0tb+QLYhhwcArsSaQDjj4G0Pjpt3X
         YPmdskbpEQ5g9dY7dDo8H010W+42UQxkvtHJluR8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D50060271;
        Mon, 10 Jun 2019 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560164519;
        bh=mRD0HxQRl5qvKBhQoKCxAZoQjXYl9uAGRc+kOHjgp68=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=R1+9C+PIOrIaeixpPyIerEfvdehTjfet+LxQbNBKhChBEx9+0hbBLIGGCkq4NJmOB
         qTAP9KBidpLhnp4Myb41gzmir6AKYZ7pwv9toiPDdlIOgx1EBjOXLKGe/v4kqGv66Y
         /WSehylOGAagYmnO7UwXXof1yn2BXFrqK9lsVj78=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D50060271
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 2/6] dt-bindings: qcom: Add ipq6018 bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linus.walleij@linaro.org, Stephen Boyd <sboyd@kernel.org>,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-3-git-send-email-sricharan@codeaurora.org>
 <20190608032754.GD24059@builder>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <93e5b0c5-f97b-ef62-8c7f-262e80a53b49@codeaurora.org>
Date:   Mon, 10 Jun 2019 16:31:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608032754.GD24059@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/8/2019 8:57 AM, Bjorn Andersson wrote:
> On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:
> 
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: speriaka <speriaka@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index f6316ab..7b19028 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -36,6 +36,7 @@ description: |
>>    	mdm9615
>>    	ipq8074
>>    	sdm845
>> +	ipq6018
> 
> It would be nice if these lists where sorted, but as that's not the
> case, please sort it wrt the other ipq at least.
> 

 ok.

Regards,
 Sricharan


-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
