Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5893E8A25
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 08:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbhHKGR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 02:17:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12298 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbhHKGR6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 02:17:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628662655; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FQZkSZe1h4Zy65xkKu3P5x1Lb3t+16QZpUVBCSFj4hs=;
 b=m5znBkNBfNlp9xOYBCTj/aOWjgSdmD1LRALT2veVH2f7MQEjKvrS3ulHaByuvzjzIf+DDRom
 Fn4cpaiy8j2Pm7gqLkQycimAJDRVLv/Op4jU+5brtH9CEfU1ipOHNSNq3xAOxJpO1T9lGI1A
 iQXa5vU1YPkKLOjPQMwx/kZcDyU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61136b73b14e7e2ecb65e2a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 06:17:23
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95D7CC4338A; Wed, 11 Aug 2021 06:17:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93975C433D3;
        Wed, 11 Aug 2021 06:17:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 11:47:22 +0530
From:   skakit@codeaurora.org
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     bhupesh.sharma@linaro.org, Das Srinagesh <gurus@codeaurora.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH V7 0/3] Convert qcom pmic gpio bindings to YAML
In-Reply-To: <1627910464-19363-1-git-send-email-skakit@codeaurora.org>
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org>
Message-ID: <182fc9a13b78d114bd209f9658274f0c@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Can you pls merge these patches? I have rebased them on linux-next.

Thanks,
Satya Priya

On 2021-08-02 18:51, satya priya wrote:
> Hi,
> 
>  I've rebased this series on linux-next. Patch [1/3] of this series is
>  already applied but I'm resending it just to avoid Bot errors.
> 
> Thanks,
> Satya Priya
> 
> satya priya (3):
>   dt-bindings: mfd: pm8008: Add gpio-ranges and spmi-gpio compatible
>   dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings
>     to YAML
>   dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property
> 
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  13 +-
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 290 
> ---------------------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 239 
> +++++++++++++++++
>  3 files changed, 249 insertions(+), 293 deletions(-)
>  delete mode 100644 
> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>  create mode 100644
> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
