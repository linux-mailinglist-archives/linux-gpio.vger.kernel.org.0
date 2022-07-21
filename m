Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9882257C779
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 11:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbiGUJXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 05:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbiGUJXC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 05:23:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817B87F51C
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 02:23:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n18so1845783lfq.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rSVG5RXgIgM5NvFYOzp6NmV4cF2lN0/Ef9ot41gAaRs=;
        b=B4LLzm60t1rlt4QV36ZL3Qy4hANoL2STwfayVbO6iAwK/p2NlSCys/OGU/QYeDxGNR
         faW/V/w1CXEK4qlqeYgputuTIGDFaQWHM0lCALr16CAd8cqhajRhBSZOWYvO9ajgtcCU
         kf2mag4LqDklhmQC2sDqC+ZUbYbQzLla6QuiJif28PodirPI9qY8XNCvBpG7gmJdRskG
         b30/3AOtn8paAvktFrCVh2M4rbTe+TY29Jiugt9liWHCHSCo7AxWOq1RKUFDZrEpvSaG
         /0UU2a/h0ISQAFmY34OfhYd4UWi8GkbcJ+ltl1F8c8fcgVoxYo0Q9U6mHODrGxDLQUQM
         mBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rSVG5RXgIgM5NvFYOzp6NmV4cF2lN0/Ef9ot41gAaRs=;
        b=NrrPB+f7clyH3xAfFU2+IKVrGMfm4766vUDEMmcC4ETFpgaqRBPSocRwZD4SnWExo6
         v901EnWjnjQtO/H27YK7jr18bR+0g8GQ64ig2WP6y5+J+iJ6Piv8eqhqTl/o/ja4cZBH
         iH5ly4UGTdV/6n1uq0pD86xqa5LzM9pm7f38xoWjFVDl/AEUiDAZEGcycL5SRsgy1JZM
         EOa+EOineIG3PpqxvJcvIvl2xB5i5nFFQ+BpLq1gwULhqUjtIBkyFuEDaUT3Jvcck+26
         i6bkPWguK9sjElZSbEPk4K2WM7O/0BXhadGr4ewHsFVH42IIO41vEY5s2nLEby1t4GjV
         canw==
X-Gm-Message-State: AJIora8BLGtIzCUJE8upZ51j1R/7MOyS5qIa7qyFtZ24EFbVUnl03t0q
        Dezdyq7sAA/zkbGMpSBgMGsYqQ==
X-Google-Smtp-Source: AGRyM1u7eazfJf+qhDvnqRuzjsgcpGetJIrfeJnZOZ1R+WaUrZnXTWFfJyCPPnz6568ACBugGP8L4A==
X-Received: by 2002:a05:6512:e83:b0:489:e7de:56ea with SMTP id bi3-20020a0565120e8300b00489e7de56eamr23820154lfb.591.1658395378678;
        Thu, 21 Jul 2022 02:22:58 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id g19-20020a2eb5d3000000b0025a739ce2b8sm373440ljn.29.2022.07.21.02.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 02:22:57 -0700 (PDT)
Message-ID: <3b51e8c3-6ab4-373e-2c7d-29c02ffddfed@linaro.org>
Date:   Thu, 21 Jul 2022 11:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
 binding
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
 <20220713135528.1386594-2-biju.das.jz@bp.renesas.com>
 <24903621-358d-d380-76f4-6515c6313bbd@linaro.org>
 <OS0PR01MB5922CE20E15959AEF89C36D4868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <1c96a873-81f7-02c4-56cc-f33a283329eb@linaro.org>
 <OS0PR01MB5922CD0716DF83F92BA63B5F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922CD0716DF83F92BA63B5F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/07/2022 15:13, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
>> binding
>>
>> On 15/07/2022 12:17, Biju Das wrote:
>>> Hi Krzysztof Kozlowski,
>>>
>>> Thanks for the feedback.
>>>
>>>> Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L
>>>> POEG binding
>>>>
>>>> On 13/07/2022 15:55, Biju Das wrote:
>>>>> Add device tree bindings for the RZ/G2L Port Output Enable for GPT
>>>> (POEG).
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>> ---
>>>>> REF->v1:
>>>>>  * Modelled as pincontrol as most of its configuration is intended
>>>>> to
>>>> be
>>>>>    static.
>>>>>  * Updated reg size in example.
>>>>> ---
>>>>>  .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 65
>>>>> +++++++++++++++++++
>>>>>  1 file changed, 65 insertions(+)
>>>>>  create mode 100644
>>>>> Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
>>>>> b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..7607dd87fa68
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.y
>>>>> +++ am
>>>>> +++ l
>>>>> @@ -0,0 +1,65 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>>> +---
>>>>> +$id:
>>>>> +
>>>>> +title: Renesas RZ/G2L Port Output Enable for GPT (POEG)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Biju Das <biju.das.jz@bp.renesas.com>
>>>>> +
>>>>> +description: |
>>>>> +  The output pins of the general PWM timer (GPT) can be disabled by
>>>>> +using
>>>>> +  the port output enabling function for the GPT (POEG).
>>>>> +Specifically,
>>>>> +  either of the following ways can be used.
>>>>> +  * Input level detection of the GTETRGA to GTETRGD pins.
>>>>> +  * Output-disable request from the GPT.
>>>>
>>>> Shouldn't this all be part of GPT? Is this a real separate device in
>>>> the SoC?
>>>
>>> No, It is separate IP block, having its own register block, interrupts
>> and resets.
>>>
>>> Please see RFC discussion here[1]
>>>
>>> [1]
>>>
>>>>
>>>>> +  * Register settings.
>>>>
>>>> This is confusing... so you can use POEG to mess up registers of GPT
>>>> independently, so GPT does not know it?
>>>
>>> POEG does not mess up registers of GPT. It is basically for protection.
>>>
>>> Using POEG register, it is possible to disable GPT output without the
>> knowledge of GPT, after configuring the Output disable source select in
>> the GTINTAD (General PWM Timer Interrupt Output Setting Register)
>> register present in GPT.
>>
>> Then what does it mean:
>> "...following ways can be used. Register settings."
>> I cannot parse it.
> 
> Threre 3 methods mentioned in chapter 19.3 of RZ/G2L HW manual for Output-Disable Control Operation. 
> "Register settings" referred to the 3rd method as mentioned below.
> 
> 19.3 Output-Disable Control Operation
> The output of the GTIOCxA and GTIOCxB pins can be disabled when any of the following conditions are satisfied.
> 
> 1) Input level or edge detection of the GTETRGn pins
> 	When POEGGn.PIDE is 1, the POEGGn.PIDF flag is set to 1.
> 
> 2) Output-disable request from the GPT
> When POEGGn.IOCE is 1, the POEGGn.IOCF flag is set to 1.
> The output-disable requests enabled by GRPDTE, GRPABH, and GRPABL bits of the GTINTAD register in the
> GPT are applied to the group selected by GRP[1:0] bits of the GTINTAD register.
> 
> 3) SSF bit setting
> When POEGGn.SSF is set to 1.
> 
> The state of the GTIOCxA and the GTIOCxB pins when the output is disabled is controlled by the GPT module.
> 
> Please let me know if you need any info.

Yes, more info is needed in your patch. The "...following ways can be
used. (...) Register settings." does not explain anything.

Best regards,
Krzysztof
