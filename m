Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D258401A41
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 12:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240396AbhIFK7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 06:59:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32290 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240404AbhIFK7U (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Sep 2021 06:59:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630925895; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vsOcnMr2wpiwvzUcC8f61q76ivDkmYdEEI0Rs1N9cVE=;
 b=tWnLLBcer4ahKFBZKflFNR1FqbbxDfTkPOu3jwEGsbpXj6EPBoJ2OoXLHkndjsDjIJePa/QC
 IgOowgkQufjThdat/sPNA1d4bYRWlRslfjYLQYce7B82WoWDo2+IaXTjqvkzyEeMi0a5n6U8
 E9i4+Qoy8A/68WvrBGgyago0s6U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6135f44740d2129ac15e150e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 10:58:15
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D75D9C4360D; Mon,  6 Sep 2021 10:58:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FF9AC4338F;
        Mon,  6 Sep 2021 10:58:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 06 Sep 2021 16:28:14 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arm64: dts: sc7280: Add volume up support for
 sc7280-idp
In-Reply-To: <CAE-0n52VOzjexezuEe449vT_crB_zVkn5Bnrkh6-RcJfWGTQ9w@mail.gmail.com>
References: <1630574106-3394-1-git-send-email-skakit@codeaurora.org>
 <1630574106-3394-3-git-send-email-skakit@codeaurora.org>
 <CAE-0n52VOzjexezuEe449vT_crB_zVkn5Bnrkh6-RcJfWGTQ9w@mail.gmail.com>
Message-ID: <9137f113e0cdd718edaa3d32b30bf043@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-09-03 23:42, Stephen Boyd wrote:
> Quoting satya priya (2021-09-02 02:15:06)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 371a2a9..52bcbbc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -199,6 +199,37 @@
>>         modem-init;
>>  };
>> 
>> +&soc {
> 
> 's' comes after 'p' so this is in the wrong place.
> 

Okay will move it accordingly.

>> +       gpio_keys {
>> +               compatible = "gpio-keys";
>> +               label = "gpio-keys";
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&key_vol_up_default>;
>> +
>> +               vol_up {
>> +                       label = "volume_up";
>> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
>> +                       linux,input-type = <1>;
>> +                       linux,code = <KEY_VOLUMEUP>;
>> +                       gpio-key,wakeup;
>> +                       debounce-interval = <15>;
>> +                       linux,can-disable;
>> +               };
>> +       };
>> +};
>> +
>> +&pm7325_gpios {
>> +       key_vol_up_default: key_vol_up_default {
> 
> Please move this to the "PINCTRL - additions to nodes defined in
> sc7280.dtsi" section and then sort alphabetically on node naem.
> 

Okay.

>> +               pins = "gpio6";
>> +               function = "normal";
>> +               input-enable;
>> +               bias-pull-up;
>> +               power-source = <0>;
>> +               qcom,drive-strength = <3>;
>> +       };
>> +};
>> +
>>  &pmk8350_vadc {
>>         pmk8350_die_temp {
>>                 reg = <PMK8350_ADC7_DIE_TEMP>;
