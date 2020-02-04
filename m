Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0911151BD2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 15:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgBDOEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 09:04:45 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:28435 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727207AbgBDOEp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 09:04:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580825084; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=AYVm5lWqfJDQUHSM0JeCo9evaNtbla9UOu0fjh+4k6g=; b=H8/oPni/iuZELovygPbVqbgBuRD8/CqxYC/Dcr6GZoZtHy0tQyEecHFhxwYr+3QVTb6uDMZX
 ybWaWW7V3UO+TgBNqK/CRt4jSbzpm2ae1Tv0rR+RtCKKDzclt1M0aQn+sYcoJnAfrp2hzXGG
 0G7nYgcKgcwS3WCsfSKyPtvmYyI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3979f9.7f4c1731c340-smtp-out-n02;
 Tue, 04 Feb 2020 14:04:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CFD0C447A2; Tue,  4 Feb 2020 14:04:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.5] (unknown [122.164.174.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1AD5AC433CB;
        Tue,  4 Feb 2020 14:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1AD5AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V6 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl
 bindings
From:   Sricharan R <sricharan@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        sivaprak@codeaurora.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
 <1579439601-14810-2-git-send-email-sricharan@codeaurora.org>
 <20200127154113.GA6904@bogus>
 <422e31d0-f67f-3b10-5d8f-ccc9d6f7dc70@codeaurora.org>
Message-ID: <9acb9b69-fd44-57db-e974-9fee5a1d871f@codeaurora.org>
Date:   Tue, 4 Feb 2020 19:34:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <422e31d0-f67f-3b10-5d8f-ccc9d6f7dc70@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 1/28/2020 10:07 AM, Sricharan R wrote:
> Hi,
> 
> On 1/27/2020 9:11 PM, Rob Herring wrote:
>> On Sun, 19 Jan 2020 18:43:17 +0530, Sricharan R wrote:
>>> Add device tree binding Documentation details for ipq6018
>>> pinctrl driver.
>>>
>>> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>>> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>>> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>>> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>>> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>>> ---
>>> [V6] 
>>>   * Addressed review comments form Rob.
>>>  .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     | 153 +++++++++++++++++++++
>>>  1 file changed, 153 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
>>>
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> Thanks Rob.
> 
> Hi Linus,
>    The pinctrl driver can now be pulled in.

Any chance this can be taken for 5.6 ?

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
