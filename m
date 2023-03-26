Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8596C942A
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Mar 2023 14:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjCZMUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Mar 2023 08:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbjCZMUF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Mar 2023 08:20:05 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8421A76B8
        for <linux-gpio@vger.kernel.org>; Sun, 26 Mar 2023 05:19:48 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x3so25010806edb.10
        for <linux-gpio@vger.kernel.org>; Sun, 26 Mar 2023 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679833187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IfSw2r9l6b89lopg9LLMNXb7FdQOCZOmyoAvbxtqm4=;
        b=ICgUV56vJG7JvicQ1to2mtKiPShhd0VBIO0jiWPe2V3YS/q3rol+M1E1zzGXk/XPNP
         +W1qo4xda1Lzl4nPbMJVO5Hhw/HP9QrgJEhZGek4acCxCZmg5+wmt0tqSHTgSXUBidk+
         cJFFpDy7WYYw1gtHrufleBzx5Id6xgsu9xDtMzOiPWjV50ZrD1Z8F76MGBjzSlya3X6F
         XeJUKCrBAkiz9z3C8j1tmZVY63B/u3Lim3OlHt4qNTcxBEghauXDqNj+DJhE2IHofTxQ
         N/yNC/PmdtDcbAOpQJO+XMjjPPj8GCAFAAwGW+CK2+k7X2wTMs0qJvglfC++etLedY9T
         fz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679833187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IfSw2r9l6b89lopg9LLMNXb7FdQOCZOmyoAvbxtqm4=;
        b=GuDATNMPcfa+oDUxZAmwJVgDQVygVUZvyp0uOX1W8of+14sd5hxgcoU1hg0kiNSmbT
         SylgRNuVsmkQi/VY0vsOJBcPB5htPZRrN5ynbBNy/w+h6euRPKWftHqjVA/ERPFjeGm/
         F+Xs4VWXroYXEHdl8lstY9AfQDIKyEFZeU73vMYWInZXJ5PaCqH281WXfDSw1mzwhKFc
         d2f4bYyX/RC23qotrYUkxQ8QHCA//GpYjgQoXzFnjbEfssaYe1z3E9SmVJxUTiB4QC2o
         OZX0+g/xLizOSwjEePl4kNDhWLaMgnA9tgC72ovYthXr1pXtD0AcRsZL4M+R/hw5KueN
         VlCA==
X-Gm-Message-State: AAQBX9dMOl5N0iX9DfV17RjuHPyLVWu1rHzFM//zUgGMbGDJAyceG3Xg
        0KlHWKbFDiYcbMjOpW+wJZbuSA==
X-Google-Smtp-Source: AKy350a1XLCkbinF5XRxjdf3OkRhCOO6OmHKr8keL9ZpWl+WeR/eP/VXicf+cpUc0OZlO78BUWT3zA==
X-Received: by 2002:a17:907:1c21:b0:8dd:5710:a017 with SMTP id nc33-20020a1709071c2100b008dd5710a017mr11870314ejc.4.1679833187018;
        Sun, 26 Mar 2023 05:19:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6cac:926d:a4f2:aa09? ([2a02:810d:15c0:828:6cac:926d:a4f2:aa09])
        by smtp.gmail.com with ESMTPSA id k7-20020a1709062a4700b008b176df2899sm12856711eje.160.2023.03.26.05.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 05:19:46 -0700 (PDT)
Message-ID: <e06977ab-8112-1e45-4392-df36e358e772@linaro.org>
Date:   Sun, 26 Mar 2023 14:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org> <Y+OGdMFQkL9Dtaq/@orome>
 <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
 <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
 <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org> <ZBxeLIXJDbM2ebyt@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZBxeLIXJDbM2ebyt@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/03/2023 15:11, Thierry Reding wrote:
> On Wed, Mar 08, 2023 at 01:24:04PM +0100, Krzysztof Kozlowski wrote:
>> On 08/03/2023 12:45, Prathamesh Shete wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Wednesday, February 8, 2023 5:28 PM
>>>> To: Thierry Reding <thierry.reding@gmail.com>
>>>> Cc: Prathamesh Shete <pshete@nvidia.com>; Jonathan Hunter
>>>> <jonathanh@nvidia.com>; linus.walleij@linaro.org; robh+dt@kernel.org;
>>>> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; linux-
>>>> tegra@vger.kernel.org; linux-gpio@vger.kernel.org; Suresh Mangipudi
>>>> <smangipudi@nvidia.com>
>>>> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 08/02/2023 12:24, Thierry Reding wrote:
>>>>> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:
>>>>
>>>>
>>>>>>> +          type: object
>>>>>>> +          additionalProperties:
>>>>>>> +            properties:
>>>>>>> +              nvidia,pins:
>>>>>>> +                description: An array of strings. Each string contains the name
>>>>>>> +                  of a pin or group. Valid values for these names are listed
>>>>>>> +                  below.
>>>>>>
>>>>>> Define properties in top level, which points to the complexity of
>>>>>> your if-else, thus probably this should be split into two bindings.
>>>>>> Dunno, your other bindings repeat this pattern :(
>>>>>
>>>>> The property itself is already defined in the common schema found in
>>>>> nvidia,tegra-pinmux-common.yaml and we're overriding this here for
>>>>> each instance since each has its own set of pins.
>>>>>
>>>>> This was a compromise to avoid too many bindings. Originally I
>>>>> attempted to roll all Tegra pinctrl bindings into a single dt-schema,
>>>>> but that turned out truly horrible =) Splitting this into per-SoC
>>>>> bindings is already causing a lot of duplication in these files,
>>>>
>>>> What would be duplicated? Almost eveerything should be coming from
>>>> shared binding, so you will have only compatible,
>>>> patternProperties(pinmux) and nvidia,pins. And an example. Maybe I miss
>>>> something but I would say this would create many but very easy to read
>>>> bindings, referencing common pieces.
>>>>
>>>>> though splitting
>>>>> off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit
>>>>> with that already. Splitting this into per-instance bindings would
>>>>> effectively duplicate everything but the pin array here, so we kind of
>>>>> settled on this compromise for Tegra194.
>>>>
>>>> OK, but are you sure it is now readable? You have if:then: with
>>>> patternProperties: with additionalProperties: with properties: with
>>>> nvidia,pins.
>>> This is inline with the existing bindings and I think this is the compromise that was reached during review when the bindings were submitted,
>>
>> So the code might be totally unreadable, but it is inline with existing
>> code, thus it should stay unreadable. Great.
> 
> I'd say this is very subjective. I personally don't find the current
> version hard to read, but that's maybe because I wrote it... =)
> 
>>> offer to rework if a better alternative can be found, but that only makes sense if all the other bindings get changed as well, so I think it'd be good if we can merge in the same format as the existing bindings for now and change all of them later on.
>>
>> Cleanup should happen before adding new bindings.
> 
> I don't recall the exact problems that I ran into last time, but I do
> remember that pulling out the common bindings to the very top-level was
> the main issue.
> 
> If I understand correctly what you're saying, the main problem that
> makes this hard to read is the if and else constructs for AON/MAIN
> variants on Tegra194/Tegra234. These should be quite easy to pull out
> into separate bindings. I'll do that first and then see if there's
> anything that could be done to further improve things.

One problem is allowing characters here which are not allowed. Second
problem is reluctance to change it with argument "existing bindings also
have this problem". It's explanation like "there is already bug like
this, so I am allowed to add similar one".

Now third is that defining properties in allOf is not the style we want
to have, because it does not work with additionalProperties and is
difficult to read. Again using argument "existing code also does like
this" is a very poor argument.

Best regards,
Krzysztof

