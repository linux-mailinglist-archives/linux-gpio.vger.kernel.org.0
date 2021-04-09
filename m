Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E76359794
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 10:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbhDIIUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 04:20:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64347 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232454AbhDIIUk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Apr 2021 04:20:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617956428; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w6dPhZf528MpJVmtXWaO9JlPwrAlz6eGv9cUCZJ3hDk=;
 b=rJ9k8+6jqjTzrPBUK4zf0q2maaK40rWskEWN67Fq8DRwraSNh9ZLA6bbKu9D/DpYOF7YV0X7
 C97Ia5mrfP9kYz9L0YkOSyyhMEtidgK6fGuMGiQLTyB9UJGaFLWg+Xerj2FuwMTJ6+AC5X3V
 nIi4ARXjKVPLeFNKx3hj/q19OvM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60700e488166b7eff7157e61 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 08:20:24
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60EE1C43461; Fri,  9 Apr 2021 08:20:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8D67C433CA;
        Fri,  9 Apr 2021 08:20:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 09 Apr 2021 13:50:22 +0530
From:   skakit@codeaurora.org
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V2 0/3] Add GPIO support for PM7325, PM8350c, PMK8350 and
 PMR735A
In-Reply-To: <CACRpkdbD6E3PY_JCEbwNiVfb8LoT6F5DzV7x71Us3Z7U3BaX=Q@mail.gmail.com>
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
 <CACRpkdbD6E3PY_JCEbwNiVfb8LoT6F5DzV7x71Us3Z7U3BaX=Q@mail.gmail.com>
Message-ID: <f035f30845abdc45363c30348ac5cae8@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-04-08 19:18, Linus Walleij wrote:
> On Thu, Apr 1, 2021 at 2:36 PM satya priya <skakit@codeaurora.org> 
> wrote:
> 
>> satya priya (3):
>>   pinctrl: qcom: spmi-gpio: Add support for four variants
>>   dt-bindings: pinctrl: qcom-pmic-gpio: Update the binding to add four
>>     new variants
>>   dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio 
>> bindings
>>     to YAML
> 
> Please collect the ACKs and rebase like Björn says, sort stuff 
> alphabetically
> and resend so I can try to apply it! The YAML conversion may need a nod 
> from
> the DT people as well.
> 

Sure, will address the comments and resend.

> Yours,
> Linus Walleij

Thanks,
Satya Priya
