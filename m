Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42146B0701
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 13:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjCHMY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 07:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjCHMYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 07:24:35 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190D878CA5
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 04:24:09 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cw28so64992544edb.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 04:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678278246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrgWrk3dZKhkeXjhTVbygFyU6N5ZEhFA1MFGMqhJHD4=;
        b=cTe4i25a84OVZmPPW/YeLDoDt8rMLIqEdbmzixp2iQhpqAfCus4SvBFa45/ErqN1OY
         hmeRTyAAAygPBD5/yQEJEFtM+UXes8GpcgUT1hpKdXD938JS47ajyue32V5G2axU3Wvg
         hE/Y9gXuXKbjOx00Xw31cGDhhFoBCSm+og7Aa0xjlMYjE0yCWyEe1e3ZyhYKZuns/0gM
         d192zZIxVMc1RZGgMYyc9GxYp48gzE71oDl5MqRvJ5y++L6hKTkJaLibHUOSmuOKLK1h
         9xJnAFNlWANhU/9DqMTivhChCKZdz80tSjVQsqLkFFVpimBWoh1AW/FKHwelGsENhKRS
         AGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678278246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrgWrk3dZKhkeXjhTVbygFyU6N5ZEhFA1MFGMqhJHD4=;
        b=QnVlaBZNYhVIDM66FT96wCiNOvi6rn8+9zBE+eA1R+zAksnQqiu+crGeOqBgPI73kV
         ByE0Yx7eo63v13PrlxH2S0u6Ei/ItYuoe/xBxGH/ljx4P7co3qvmdUc4M6s+2Dmw0pZB
         Rl/X/FGlWnY3RodeEPXrlJIPRkm86iVS1XmdgHWz/CpeauG1Es5ZlCZ7Cdk4x+PONXsd
         fb8RDXVBi45cuC+uu127cOWavWGslAWgINkeFjAoO4lKUeQuVUMAoSGPEMwS3dhkSUYM
         1RumR7AztTkvFCiCbVDSKutUlKk0lhYrqVdhnFWCzenQG2ClJpjpz/7gJih79uym1iDm
         r+hA==
X-Gm-Message-State: AO0yUKViUIMrGcEK91yQsp3Fw6Ddmb/BoZqzoxuAgcN4ud/AR+vzJvs/
        RBbu0tqSwSrpLLy7qH1/ROMG/g==
X-Google-Smtp-Source: AK7set9K3Ungk/7m/CPUknJLuqONq7ZTiknTAhV9W/Rqd9pMQfcVtMc3f4edAgXxj2gbPR97lGjUmw==
X-Received: by 2002:aa7:dccb:0:b0:4ae:eae1:946a with SMTP id w11-20020aa7dccb000000b004aeeae1946amr20888010edu.13.1678278246126;
        Wed, 08 Mar 2023 04:24:06 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id s30-20020a508d1e000000b004c5d1a15bd5sm4074427eds.69.2023.03.08.04.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:24:05 -0800 (PST)
Message-ID: <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org>
Date:   Wed, 8 Mar 2023 13:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/03/2023 12:45, Prathamesh Shete wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, February 8, 2023 5:28 PM
>> To: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Prathamesh Shete <pshete@nvidia.com>; Jonathan Hunter
>> <jonathanh@nvidia.com>; linus.walleij@linaro.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; linux-
>> tegra@vger.kernel.org; linux-gpio@vger.kernel.org; Suresh Mangipudi
>> <smangipudi@nvidia.com>
>> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 08/02/2023 12:24, Thierry Reding wrote:
>>> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:
>>
>>
>>>>> +          type: object
>>>>> +          additionalProperties:
>>>>> +            properties:
>>>>> +              nvidia,pins:
>>>>> +                description: An array of strings. Each string contains the name
>>>>> +                  of a pin or group. Valid values for these names are listed
>>>>> +                  below.
>>>>
>>>> Define properties in top level, which points to the complexity of
>>>> your if-else, thus probably this should be split into two bindings.
>>>> Dunno, your other bindings repeat this pattern :(
>>>
>>> The property itself is already defined in the common schema found in
>>> nvidia,tegra-pinmux-common.yaml and we're overriding this here for
>>> each instance since each has its own set of pins.
>>>
>>> This was a compromise to avoid too many bindings. Originally I
>>> attempted to roll all Tegra pinctrl bindings into a single dt-schema,
>>> but that turned out truly horrible =) Splitting this into per-SoC
>>> bindings is already causing a lot of duplication in these files,
>>
>> What would be duplicated? Almost eveerything should be coming from
>> shared binding, so you will have only compatible,
>> patternProperties(pinmux) and nvidia,pins. And an example. Maybe I miss
>> something but I would say this would create many but very easy to read
>> bindings, referencing common pieces.
>>
>>> though splitting
>>> off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit
>>> with that already. Splitting this into per-instance bindings would
>>> effectively duplicate everything but the pin array here, so we kind of
>>> settled on this compromise for Tegra194.
>>
>> OK, but are you sure it is now readable? You have if:then: with
>> patternProperties: with additionalProperties: with properties: with
>> nvidia,pins.
> This is inline with the existing bindings and I think this is the compromise that was reached during review when the bindings were submitted,

So the code might be totally unreadable, but it is inline with existing
code, thus it should stay unreadable. Great.

> offer to rework if a better alternative can be found, but that only makes sense if all the other bindings get changed as well, so I think it'd be good if we can merge in the same format as the existing bindings for now and change all of them later on.

Cleanup should happen before adding new bindings.



Best regards,
Krzysztof

