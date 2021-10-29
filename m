Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1F843FA9D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 12:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhJ2KWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 06:22:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26546 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhJ2KWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 06:22:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635502779; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fRFHHpvUsFN1nn8W1Rx5ytaxnlA8Vq5UjIPp2pUj+P0=; b=mP0hy+20f5/NJT9rU6wRpIzr061/fMziyNBmwIUKARzTjz6ag7TUsGtgmtiYMHJdSNNJS9K7
 pHf3jR+fh2WT7YhBNzM4c0EmYKoALv0IC0JAlDTHyhg91+mLWrrTH5jgyKVr9WaoXSWZJZj2
 hbtyiNCXNEoThpA29bgi9SM7M4c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 617bca9f900d71ea1e48083e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 10:19:11
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AF6DC4360D; Fri, 29 Oct 2021 10:19:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7575C4338F;
        Fri, 29 Oct 2021 10:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B7575C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
 <CAE-0n50E2dmQeDaiggEgMgykrkGB3H38sbkTXDX3avR7XtSizw@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <40fa13cd-f24c-e3a9-9b49-23ad26507bfe@codeaurora.org>
Date:   Fri, 29 Oct 2021 15:49:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50E2dmQeDaiggEgMgykrkGB3H38sbkTXDX3avR7XtSizw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/29/2021 12:24 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-10-26 05:07:35)
>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>
>> egpio is a scheme which allows special power Island Domain IOs
>> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
>> TLMM functions with Island Domain functions.
>> With this scheme, an IO can be controlled both by the cpu running
>> linux and the Island processor. This provides great flexibility to
>> re-purpose the Island IOs for regular TLMM usecases.
>>
>> 2 new bits are added to ctl_reg, egpio_present is a read only bit
>> which shows if egpio feature is available or not on a given gpio.
>> egpio_enable is the read/write bit and only effective if egpio_present
>> is 1. Once its set, the Island IO is controlled from Chip TLMM.
>> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>>
>> To support this we add a new function 'egpio' which can be used to
>> set the egpio_enable to 0, for any other TLMM controlled functions
>> we set the egpio_enable to 1.
>>
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
> 
> Does this supersede adding support for lpass pinctrl in this series[1]?

No, the driver in [1] actually manages the LPASS TLMM instance, while this patch
makes it possible for the 'same' pins to be managed by the SoC TLMM instance.
On sc7280 SoC for instance GPIO144-158 maps to LPI-GPIO-0-14, and GPIO159-174
maps to SSC-GPIO-0-15.

> [1] https://lore.kernel.org/r/1635342097-2726-1-git-send-email-srivasam@codeaurora.org
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
