Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A0B3DD645
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhHBNAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 09:00:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42164 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbhHBNAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 09:00:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627909198; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IYmX3vUPkg+ubeSfl6k4KFsqTWARHNbMrBlR5kA54iw=;
 b=PUHzKyS/fpB9OHZ/25d1zWehvKpw2MUHqzr+ScfaVhnb8Rwxf7Vl/Rty18WRJyR9nJem4wcC
 5dokatkrej+Eii0IG65rCGyoF4ZBSjo57bH05qiov/NAw2Cr4dnxqPe2Sc7ZHQxPQSfjHbv9
 VH9GaR1iSB0RjIoPtrNs6TnxqNc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6107ec3c290ea35ee6030371 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 12:59:40
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2EEA8C43460; Mon,  2 Aug 2021 12:59:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73A54C433F1;
        Mon,  2 Aug 2021 12:59:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 18:29:39 +0530
From:   skakit@codeaurora.org
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V7 0/3] Convert qcom pmic gpio bindings to YAML
In-Reply-To: <CACRpkdYsDNDcCYWOygN+V=1LFBZ6-PHYaePy5truR9ybVzkMUg@mail.gmail.com>
References: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
 <CACRpkdYsDNDcCYWOygN+V=1LFBZ6-PHYaePy5truR9ybVzkMUg@mail.gmail.com>
Message-ID: <c8d6f1cdb64bcaca0f429b4e535d4cad@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2021-07-30 15:28, Linus Walleij wrote:
> Hi Satya,
> 
> On Fri, Jul 23, 2021 at 10:32 AM satya priya <skakit@codeaurora.org> 
> wrote:
>> 
>> satya priya (3):
>>   dt-bindings: mfd: pm8008: Add gpio-ranges and spmi-gpio compatible
>>   dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio 
>> bindings
>>     to YAML
>>   dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property
>> 
>>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  13 +-
>>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 
>> ---------------------
>>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 239 
>> +++++++++++++++++
>>  3 files changed, 249 insertions(+), 291 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> 
> I tried to apply these patches to the pinctrl tree but there is a 
> conflict
> because I merged these patches (I think):
> 0ac2c2aebf82 dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for
> SA8155p-adp
> ffdf4cecac07 dt-bindings: pinctrl: qcom,pmic-gpio: Arrange compatibles
> alphabetically
> 
> Can you please rebase the patches on top of this branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> 

Sure, but I don't see above patches present on this branch, anyway I 
found them on linux-next, will rebase on linux-next.
Hope that's not a problem.

> then resend so I can apply them?
> 
> Include Bhupesh on Cc so we get confirmation that this ends up as 
> intended.
> 

Okay.

Thanks,
Satya Priya

> Thanks,
> Linus Walleij
