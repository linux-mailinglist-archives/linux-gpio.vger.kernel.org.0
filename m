Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B878A0DA
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Aug 2023 20:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjH0SE2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Aug 2023 14:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjH0SET (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Aug 2023 14:04:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E44139
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 11:04:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5007c8308c3so3884259e87.0
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 11:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693159453; x=1693764253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVnsqblWQkwO3gPfAsGjnlwJGNuNWvof44bXfeUPon4=;
        b=XthCKJDJ+miNktFmTB1qst8pbgiWx0eJCLyU8/bHE4iCC8KJFOYek3vgneXmUjj8yd
         F3CwGFiQhUlB9/kd5gOGzHLBgR1GaNjeHpMdsZDzyowmOqwB+KTRodgPnsJ0ek2x5M4i
         Y6hbdWFXyNWdb2ce8hBxAysNOjlQ77WWNIPSTrJHhhH/dbl1H2MflI33yGAQ4yNQ3uG9
         WLAPOyl9e6XfRnx/nfkvvCRGYWxlwkOc29d3mDyd8/OQB6PDFOVofEsL+k4BpgrePySH
         qjGEsT8KbV8rIaIr1MfE+fgEbCodJEJ/cvblk1BVy5IvUjujPSZz/QjV4HJNlaUMfwZQ
         2a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693159453; x=1693764253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVnsqblWQkwO3gPfAsGjnlwJGNuNWvof44bXfeUPon4=;
        b=fEh245RDQsUdV50ZDhjwVZtxGI1rQ5eNCO1C7gNmzK/Npt5JSESb2zHAjHPfMWf7A4
         JthcWHrfEgWUwbXcyJW75baI8UChnKByIFZvX3MJQXhmt64YLujyShBfUX96fESRfAdM
         3zUtR7TDNxQWKVmhH1lVqICWX/7WfPj3Tfv+JGgdekGmJhA+HQdkYCQUuwrHe6g42mf9
         dEn3CMbEKVdy7yhEjKWpNWhXketCfwIAX9FT37/4d3z3c/gsByPp/4MDnZfc2euJiO60
         lsZEB6AfwxBy8WZSc6bSxyvRXPbqCC7BL/+am5hFI7gI5OyDxiWGuU+Kzx2cVVxyIBo+
         5law==
X-Gm-Message-State: AOJu0Yw/QyMMJKOs9AkQ9p7hfdZav4VUERid5H5ry3xJiHoaJdqoWCNC
        5eHhUhEyl/d+qHHrw9LxaJxjgA==
X-Google-Smtp-Source: AGHT+IG30d/KpP8cEvTO0ka59sjlKPUk+qeSYW9X0JaYYBH5ESIkTjswQQdnDXTO1zf7kJFi6SmaKw==
X-Received: by 2002:a05:6512:1042:b0:4fe:d0f:1f1e with SMTP id c2-20020a056512104200b004fe0d0f1f1emr20474537lfb.25.1693159453433;
        Sun, 27 Aug 2023 11:04:13 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id l5-20020a056402124500b005222c6fb512sm3586828edw.1.2023.08.27.11.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 11:04:12 -0700 (PDT)
Message-ID: <ddaa0a85-111b-5289-b8eb-afae5e5ab1df@linaro.org>
Date:   Sun, 27 Aug 2023 20:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RESEND v5 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl
 and GPIO documentation
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, linus.walleij@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230809185722.248787-1-tmaimon77@gmail.com>
 <20230809185722.248787-2-tmaimon77@gmail.com>
 <20230821170941.GA1915730-robh@kernel.org>
 <CAP6Zq1i+P8Jh2_G9gJMdtCKcVF6m9vkWAP5rJXBCJ1aNfc2Bvw@mail.gmail.com>
 <53987f0f-dfda-3572-1545-755072328be4@linaro.org>
 <CAP6Zq1gcWHXUL=uuzkYkJ6VWwoS-9G_aEK2HizfAWr6oZZdzWQ@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1gcWHXUL=uuzkYkJ6VWwoS-9G_aEK2HizfAWr6oZZdzWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/08/2023 17:30, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comment
> 
> On Sun, 27 Aug 2023 at 14:13, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 27/08/2023 11:44, Tomer Maimon wrote:
>>>>> +      pinctrl: pinctrl@f0800260 {
>>>>> +        compatible = "nuvoton,npcm845-pinctrl";
>>>>> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <1>;
>>>>> +        nuvoton,sysgcr = <&gcr>;
>>>>> +
>>>>> +        gpio0: gpio@f0010000 {
>>>>
>>>> unit-address should be 0.
>>>>
>>>> Otherwise,
>>> The unit-address is correct f0010000
>>
>> Then how does it pass W=1 builds? How unit address can be f0010000 but
>> reg is 0? Really...
> Maybe because the ranges are ranges = <0x0 0x0 0xf0010000 0x8000>?

And how does this mapping should cause the unit address to not match the
reg? What type of rule is it?

Except also incorrect address in pinctrl node.. but your DTS
nuvoton-common-npcm8xx.dtsi has so many other bugs (duplicated nodes,
not matching, unit addresses), that I don't wonder that you do not see
other errors. But that's not a reason to add more. Rob gave you quite
specific advice, so I really do not understand why do you keep arguing
with it?


> I didn't get any warning regarding the unit-address
> bash-4.2$ make ARCH=arm64 dt_binding_check W=1

DTS, not binding.

BTW, your patches have errors. Please fix them:
patch:226: new blank line at EOF.
warning: 1 line adds whitespace errors.


Best regards,
Krzysztof

