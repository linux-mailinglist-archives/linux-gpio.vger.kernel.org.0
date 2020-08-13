Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4762433B2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 07:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgHMFrg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 01:47:36 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:42166 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbgHMFrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Aug 2020 01:47:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597297655; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=b0DJcUHjzFWq9ObgzTOR68emrB/phIhPyW57gsGau7g=; b=jowLIS51shkTF9sc/BtPZJ5C/CDEwgDSHJspmhHqn8WGtf3L8kZHgFDDtmoDT5vCMh2nBp4Q
 yCeMtPhhBbs91TIPJUqFPtcsflEBX68Okw1G5yoGLf4oTwj7SLK6+EYbLICSlJbsGGDEkKE5
 Yz29qxl4RpW2YCKYA4CAQJ7YkjA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f34d3f61e4d3989d458c6ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 05:47:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 330DFC433C9; Thu, 13 Aug 2020 05:47:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98AE7C433C6;
        Thu, 13 Aug 2020 05:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98AE7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 1/7] pinctrl: qcom: Add msmgpio irqchip flags
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
 <159717432398.1360974.1005323166939228511@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <7a0a6fcd-33ed-0427-6b42-b5d467f743f5@codeaurora.org>
Date:   Thu, 13 Aug 2020 11:17:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159717432398.1360974.1005323166939228511@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/12/2020 1:02 AM, Stephen Boyd wrote:
> Can the subject be more specific? "pinctrl: qcom: Set IRQCHIP_SET_TYPE_MASKED flag"?

Sure i can update subject in v5.

Thanks,
Maulik

>
> Quoting Maulik Shah (2020-08-10 04:20:54)
>> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
>> during suspend and mask before setting irq type.
>>
>> Masking before changing type should make sure any spurious interrupt
>> is not detected during this operation.
>>
>> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

