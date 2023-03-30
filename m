Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45416D0776
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Mar 2023 15:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbjC3N65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Mar 2023 09:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjC3N65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Mar 2023 09:58:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588374EC6
        for <linux-gpio@vger.kernel.org>; Thu, 30 Mar 2023 06:58:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y15so24630667lfa.7
        for <linux-gpio@vger.kernel.org>; Thu, 30 Mar 2023 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680184733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27unI8wWC3xyBQDKcEdRsVirNoZHmyXbsED4WP7a6fY=;
        b=R460FUeBKM5rkTRImdau+2e0dozel2XbOR0qZruDlE8L/xUhXFsZRHki7d86pQ+xMu
         zHhjAC7o1JRGVZUyU9ldQmE9oGGkO1Ytd2TOOzQTlwbGbBOUIak/xAYXM3paPpU3nRx4
         YtEuLE2+rMCEMDx+VzoMf+i/lS9ZtklEqlTIRiim22SH6OfDlCCiGUuPOuZQZdNI/9x3
         OU28D00XuvAr60s7wxZgTSGfu4ttOAcODklrWQo3RH06E+D4ENQMS7cZ3r+PKX1CTw12
         XCnA5pAxWfluiwAY/yJgtztiQYsbmZerdzNb75DvbANq12MTLyvzMt+kWhs9YZHlnxGo
         fVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27unI8wWC3xyBQDKcEdRsVirNoZHmyXbsED4WP7a6fY=;
        b=yDZNwdzh9skDKxApjfZ2VnH8pe6j870C3Hi/QPsEsV8izB+G18sry76k/S/tcg915P
         sO9cehLMW7Qzpr5oaanvA1Qy/5Vx83QPxI4OSk/SayH452h96Fz/7feVyOFtD+E3ePoF
         pDNn0qPUfXGQZQRQhxR0p1luLoho1A+VV+QFJkW0c19gJGIQoItvFR4COXf6pCOg78ev
         lV3rHXg269ww+k0MDO8jIDVelTrr6/hH1dVYWm6Ah3CEtkmtSU78vhgFHKfQVZcQJime
         7cRFN1xlkfrqD06q3V8Bs5rxE7hQ6T6v7flxa7MD6VXyNKAW8B+BQqHAV8GFw0ok6pDY
         0ZsA==
X-Gm-Message-State: AAQBX9e+q/oSXs9pu4dP1BAzewpzyHd/5ERGYYNv+WaCMpZrrJE8TVZq
        mUJH8YIF3UOtQkr7GpolgA8kfw==
X-Google-Smtp-Source: AKy350by6kwTXHDqM6Rl2aSlGzj+St4CNnAP2EEj5N8lRCc7Lq7O0jplsZ81SDolQvMQfsI9IvFl6g==
X-Received: by 2002:a19:700e:0:b0:4de:3774:2d97 with SMTP id h14-20020a19700e000000b004de37742d97mr5524564lfc.13.1680184733578;
        Thu, 30 Mar 2023 06:58:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n22-20020a195516000000b004eafac09d8esm3278848lfe.240.2023.03.30.06.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:58:53 -0700 (PDT)
Message-ID: <0b39b19e-e5ee-2751-cd57-68278354da5f@linaro.org>
Date:   Thu, 30 Mar 2023 15:58:51 +0200
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
 <e06977ab-8112-1e45-4392-df36e358e772@linaro.org> <ZCLgEhrQiYHGGZ6S@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZCLgEhrQiYHGGZ6S@orome>
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

On 28/03/2023 14:39, Thierry Reding wrote:
> On Sun, Mar 26, 2023 at 02:19:45PM +0200, Krzysztof Kozlowski wrote:
>> On 23/03/2023 15:11, Thierry Reding wrote:
>>> On Wed, Mar 08, 2023 at 01:24:04PM +0100, Krzysztof Kozlowski wrote:
>>>> On 08/03/2023 12:45, Prathamesh Shete wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Sent: Wednesday, February 8, 2023 5:28 PM
>>>>>> To: Thierry Reding <thierry.reding@gmail.com>
>>>>>> Cc: Prathamesh Shete <pshete@nvidia.com>; Jonathan Hunter
>>>>>> <jonathanh@nvidia.com>; linus.walleij@linaro.org; robh+dt@kernel.org;
>>>>>> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; linux-
>>>>>> tegra@vger.kernel.org; linux-gpio@vger.kernel.org; Suresh Mangipudi
>>>>>> <smangipudi@nvidia.com>
>>>>>> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
>>>>>>
>>>>>> External email: Use caution opening links or attachments
>>>>>>
>>>>>>
>>>>>> On 08/02/2023 12:24, Thierry Reding wrote:
>>>>>>> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:
>>>>>>
>>>>>>
>>>>>>>>> +          type: object
>>>>>>>>> +          additionalProperties:
>>>>>>>>> +            properties:
>>>>>>>>> +              nvidia,pins:
>>>>>>>>> +                description: An array of strings. Each string contains the name
>>>>>>>>> +                  of a pin or group. Valid values for these names are listed
>>>>>>>>> +                  below.
>>>>>>>>
>>>>>>>> Define properties in top level, which points to the complexity of
>>>>>>>> your if-else, thus probably this should be split into two bindings.
>>>>>>>> Dunno, your other bindings repeat this pattern :(
>>>>>>>
>>>>>>> The property itself is already defined in the common schema found in
>>>>>>> nvidia,tegra-pinmux-common.yaml and we're overriding this here for
>>>>>>> each instance since each has its own set of pins.
>>>>>>>
>>>>>>> This was a compromise to avoid too many bindings. Originally I
>>>>>>> attempted to roll all Tegra pinctrl bindings into a single dt-schema,
>>>>>>> but that turned out truly horrible =) Splitting this into per-SoC
>>>>>>> bindings is already causing a lot of duplication in these files,
>>>>>>
>>>>>> What would be duplicated? Almost eveerything should be coming from
>>>>>> shared binding, so you will have only compatible,
>>>>>> patternProperties(pinmux) and nvidia,pins. And an example. Maybe I miss
>>>>>> something but I would say this would create many but very easy to read
>>>>>> bindings, referencing common pieces.
>>>>>>
>>>>>>> though splitting
>>>>>>> off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit
>>>>>>> with that already. Splitting this into per-instance bindings would
>>>>>>> effectively duplicate everything but the pin array here, so we kind of
>>>>>>> settled on this compromise for Tegra194.
>>>>>>
>>>>>> OK, but are you sure it is now readable? You have if:then: with
>>>>>> patternProperties: with additionalProperties: with properties: with
>>>>>> nvidia,pins.
>>>>> This is inline with the existing bindings and I think this is the compromise that was reached during review when the bindings were submitted,
>>>>
>>>> So the code might be totally unreadable, but it is inline with existing
>>>> code, thus it should stay unreadable. Great.
>>>
>>> I'd say this is very subjective. I personally don't find the current
>>> version hard to read, but that's maybe because I wrote it... =)
>>>
>>>>> offer to rework if a better alternative can be found, but that only makes sense if all the other bindings get changed as well, so I think it'd be good if we can merge in the same format as the existing bindings for now and change all of them later on.
>>>>
>>>> Cleanup should happen before adding new bindings.
>>>
>>> I don't recall the exact problems that I ran into last time, but I do
>>> remember that pulling out the common bindings to the very top-level was
>>> the main issue.
>>>
>>> If I understand correctly what you're saying, the main problem that
>>> makes this hard to read is the if and else constructs for AON/MAIN
>>> variants on Tegra194/Tegra234. These should be quite easy to pull out
>>> into separate bindings. I'll do that first and then see if there's
>>> anything that could be done to further improve things.
>>
>> One problem is allowing characters here which are not allowed. Second
>> problem is reluctance to change it with argument "existing bindings also
>> have this problem". It's explanation like "there is already bug like
>> this, so I am allowed to add similar one".
> 
> This is not a bug that we're trying to replicate. We're basing this
> binding on a existing bindings that were already reviewed upstream a
> long time ago. It uses a shared binding that's in use by these other
> bindings, so making any changes to this new binding means either the
> other ones need to be changed as well or we can't reuse the existing
> shared binding.

Are you sure? I did not see here conflict. The specific device binding
can narrow the pattern defined in common binding.

What's more, where do you see this pattern at all in shared binding?

I am sorry, but this does not fit my arguments at all. This pattern is
clearly wrong and argument to keep duplicating it because other (not
common!) binding also has it is by design invalid.

> 
>> Now third is that defining properties in allOf is not the style we want
>> to have, because it does not work with additionalProperties and is
>> difficult to read. Again using argument "existing code also does like
>> this" is a very poor argument.
> 
> As far as I can tell, it does work as expected in this case because
> we're not actually adding any *new* properties in the allOf/if branches.

The if:else: defines type and additionalProperties, so I am sorry but
this is not a readable solution.

> If we were, then yes, we would need to use unevaluatedProperties and
> that can get complicated. But again, in this case we're merely
> overriding existing properties with more specific values, which means
> that both the standard binding applies and then things are narrowed down
> by the values defined for each compatible.


Best regards,
Krzysztof

