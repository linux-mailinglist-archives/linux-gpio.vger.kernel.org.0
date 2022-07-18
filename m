Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC77578308
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 15:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbiGRNDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 09:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235158AbiGRNDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 09:03:39 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8580EBF53
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:03:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u19so10357676lfs.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=80XUMnISBGpN/g+0WtMKW/2KdDo4w9aenz6MZvdkjys=;
        b=nhUIUkMzZLJekrgJbmvSAAiaS3lBg4K6kT/9o/IIMPBh1Iplb9MjatPZ61rYldru1q
         TKKlWqE/dnRB2farHBR5nLxILFdnM820hx5P7lc0727qL7Buq9IFV0IlwO3CboHP+ggJ
         IlfIbLgo2xyGH49yiiiZYdeMVoMaRkg+kZXOdXqvJs3gnQa9VPZMuGcgCzOdnZDZlkhX
         l4IAtfp5Qa9up+9YyT1FA3EYkVL+SN4XvC+v7H52t4988ylhxwFdN5hfwKpgY6e5HD7t
         rjNnHhZ6wB8o4E+OCNPxja4TxjQHJjnDnpWYU4ON8r/5W7JHcurcV5y2DTcQiQtqoSQ+
         bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=80XUMnISBGpN/g+0WtMKW/2KdDo4w9aenz6MZvdkjys=;
        b=0UMUWEcHwDFPZE0lAd2J50xUx28d9mDrWAY7GjVCQnz0eVne67PHUfB0EdVeqhyDj6
         LC9VbckxrbRh6DrIwwAqDmJOsMAa1GJgmjYpXaPvDom1rKM0zCbGIXtM4z3TLBXp2PKX
         d3Taptexh6Vel8gGooOcMAOqHrtEAUYJqVrBGnE9CV5tGjP0tGsBuzi8AakCEg7+3ltF
         kGnYSwfIWBvy+mNuTzzKm4rhTfwApwkbfh1dN+lqATX5k++xWElHooU9izZQ6q0hosLF
         xl0ZAcUN2mEuvLXPAtPsuZnGNi8QHWU+JOo/yOdN4JlhGtcJKttvKTo/lmYcUnF6o/U1
         UiSw==
X-Gm-Message-State: AJIora9jvjNmljvO6Rh/gjj3IdrUvy4DX8PU7rG63xQzqxRX1ypyWaGJ
        7EiTOtOiRHI1Pa/U0HwQkdxTnIvdc8GFYH4d
X-Google-Smtp-Source: AGRyM1uWLpAKU6M48TF9Aap6DE7t0O0xppczTxzCbjd/1Rc2HdNP52LCXQYg9yPTRoM1zz+bQZyboQ==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id p36-20020a05651213a400b00477a28a2280mr14491105lfa.689.1658149415742;
        Mon, 18 Jul 2022 06:03:35 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512028a00b00481010eb312sm2584965lfp.295.2022.07.18.06.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:03:35 -0700 (PDT)
Message-ID: <1c96a873-81f7-02c4-56cc-f33a283329eb@linaro.org>
Date:   Mon, 18 Jul 2022 15:03:33 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922CE20E15959AEF89C36D4868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On 15/07/2022 12:17, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
>> binding
>>
>> On 13/07/2022 15:55, Biju Das wrote:
>>> Add device tree bindings for the RZ/G2L Port Output Enable for GPT
>> (POEG).
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>> REF->v1:
>>>  * Modelled as pincontrol as most of its configuration is intended to
>> be
>>>    static.
>>>  * Updated reg size in example.
>>> ---
>>>  .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 65
>>> +++++++++++++++++++
>>>  1 file changed, 65 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
>>> b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
>>> new file mode 100644
>>> index 000000000000..7607dd87fa68
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yam
>>> +++ l
>>> @@ -0,0 +1,65 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +
>>> +title: Renesas RZ/G2L Port Output Enable for GPT (POEG)
>>> +
>>> +maintainers:
>>> +  - Biju Das <biju.das.jz@bp.renesas.com>
>>> +
>>> +description: |
>>> +  The output pins of the general PWM timer (GPT) can be disabled by
>>> +using
>>> +  the port output enabling function for the GPT (POEG). Specifically,
>>> +  either of the following ways can be used.
>>> +  * Input level detection of the GTETRGA to GTETRGD pins.
>>> +  * Output-disable request from the GPT.
>>
>> Shouldn't this all be part of GPT? Is this a real separate device in the
>> SoC?
> 
> No, It is separate IP block, having its own register block, interrupts and resets.
> 
> Please see RFC discussion here[1]
> 
> [1] https://lore.kernel.org/linux-renesas-soc/20220517210407.GA1635524-robh@kernel.org/
> 
>>
>>> +  * Register settings.
>>
>> This is confusing... so you can use POEG to mess up registers of GPT
>> independently, so GPT does not know it?
> 
> POEG does not mess up registers of GPT. It is basically for protection.
> 
> Using POEG register, it is possible to disable GPT output without the knowledge of GPT, after configuring the Output disable source select in the GTINTAD (General PWM Timer Interrupt Output Setting Register) register present in GPT.

Then what does it mean:
"...following ways can be used. Register settings."
I cannot parse it.


Best regards,
Krzysztof
