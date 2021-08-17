Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE303EE928
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 11:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbhHQJHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 05:07:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46517 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234880AbhHQJHQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Aug 2021 05:07:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629191204; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mIIW8dD+P4mwCL6MZnI4H2DUYsR6iFItwspK2nQor6E=;
 b=dQC1WRRpNn5Osvzs8r35HiF56pxFQV38FeJzejIHNNqFMyDcYd47FDWPlt1vQRTBBtn60DLx
 Um5Eplb8kAo60AOLM5qzEf1uHenpo49naI63DD+F+83y3exAbyJZtHaF1Sb7jcF342u4D0wb
 yTjKybLgHH1GHcVRZi62x+oFXm0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 611b7c23105c6568db562eb4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 09:06:43
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A0E0C4360C; Tue, 17 Aug 2021 09:06:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 687D6C4338F;
        Tue, 17 Aug 2021 09:06:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 14:36:42 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec
 translation
In-Reply-To: <CAE-0n53sR12fEa_cNPeT5eGcQVzzL57pd-tYnJbpP0NXkHMTsw@mail.gmail.com>
References: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
 <1628830531-14648-2-git-send-email-skakit@codeaurora.org>
 <CACRpkdZteWY6X+prHeAF0rtPVbCk+X9=ZYgpjgAMH24LhOjhaQ@mail.gmail.com>
 <4af8171aefd6f0387438225666ec1ccc@codeaurora.org>
 <CAE-0n53sR12fEa_cNPeT5eGcQVzzL57pd-tYnJbpP0NXkHMTsw@mail.gmail.com>
Message-ID: <6801879ddd0edf9a8d0e3605f3868e79@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-08-17 02:38, Stephen Boyd wrote:
> Quoting skakit@codeaurora.org (2021-08-15 23:50:37)
>> Hi Linus,
>> 
>> On 2021-08-13 14:27, Linus Walleij wrote:
>> > Hi Satya/David,
>> >
>> > nice work on identifying this bug!
>> >
>> > On Fri, Aug 13, 2021 at 6:56 AM satya priya <skakit@codeaurora.org>
>> > wrote:
>> >>
>> >> From: David Collins <collinsd@codeaurora.org>
>> >>
>> >> pmic_gpio_child_to_parent_hwirq() and
>> >> gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
>> >> spmi-gpio irqspec to an SPMI controller irqspec.  When they do
>> >> this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
>> >> peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
>> >> This translation results in an incorrect irqspec for secondary
>> >> PMICs that don't have a slave ID of 0 as well as for PMIC chips
>> >> which have GPIO peripherals located at a base address other than
>> >> 0xC000.
>> >>
>> >> Correct this issue by passing the slave ID of the pinctrl-spmi-
>> >> gpio device's parent in the SPMI controller irqspec and by
>> >> calculating the peripheral ID base from the device tree 'reg'
>> >> property of the pinctrl-spmi-gpio device.
>> >>
>> >> Signed-off-by: David Collins <collinsd@codeaurora.org>
>> >> Signed-off-by: satya priya <skakit@codeaurora.org>
> 
> Can you please add an appropriate Fixes tag?
> 

Okay.

>> >
>> > Is this a regression or is it fine if I just apply it for v5.15?
>> > I was thinking v5.15 since it isn't yet used in device trees.
>> >
>> 
>> Without this fix, [2/2] Vol+ support is failing. If possible please
>> merge it on current branch.
>> 
> 
> Are there any boards supported upstream that have a gpio block that
> isn't at 0xc000?

yes, all the pmics used in sm8350-mtp.dts board have gpio block at 
addresses different than 0xc000.

Thanks,
Satya Priya
