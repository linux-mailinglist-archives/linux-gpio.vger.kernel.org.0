Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0346957E65E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 20:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiGVSTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 14:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiGVSTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 14:19:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C8274DC8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 11:19:32 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id p6so6359260ljc.8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TZ89NCSHpZWO6mCiLEkZnsSyxqredp26c+bp6T/IeXs=;
        b=HV2GeR6BqM1M0qBzVbeUKHIw4fCOt3RQzgcGZy1wqC6IiFpuwgMNPkh0g8Y/uMaKAH
         OPH5AMoUcrCuZ6YLo/Ab1VxkoWQukq698ETcZCSPIdkWcbq7JYIwN09+aApa4lzffA9r
         Bw0mz0Yow33Ut9oatcpEWxyS+qJOZ72yMzlMiouUcy9oQKS1QsCrYtji9b/rl0THTVQT
         gbbAeLCjm0RHR6pxJwZ5uSbTWJuCDhIPDo94gY67qTUO6epy3MqdVwzFgzLqGdvyxe1v
         zHDpKFnIKu4CeGxT84s6GCq3UWLhF70ryWeBAW99BThs4Eg8r1rw/tlGkerAtRCAgo88
         k0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TZ89NCSHpZWO6mCiLEkZnsSyxqredp26c+bp6T/IeXs=;
        b=6OS4gsS/22RhYwG2O2G26ivWBYCo9Kyp2H110q/ZPvjcjSpRKSMakEVhqbwfH0mO5B
         qX58ussO20BbNJ1I6Pia6hQ0j0h+w2yByhzlTszxMbPWLKzxyd6OOeVUSlxthdbO/bBi
         LGSKWc94aRSl8G1Qe5RNiDZLZctsJuGrYgZqsQWPMRFjiMVRgGL+6Y39GllNFF1No6e/
         b16jZ3koIqa5m+0UbtWO7kLpKohbk3k9pxhYa/kF/VfnzeOSxA9ziaMJFvoNUxZqfMPG
         325uMWx76BNJOSDbcA5fFHoikKg3uuCH25l4S0js+STMAjOa8uOClWsgtKXHSJa8xTUM
         d/VQ==
X-Gm-Message-State: AJIora9tY01cQnYB3tpi9NRJ9A4c3fc+xkEfk06AtXmIxb3HfcKSbYdC
        H5yRjoIt/mZlwcJ2utqI6TvXng==
X-Google-Smtp-Source: AGRyM1t9k6EuxFUL5jwICaF3I0/coOUkurh+jWMFDTooiNiiyxUpIROwoEbytIQYZDtIHnlMr6Elbg==
X-Received: by 2002:a2e:3209:0:b0:25d:644e:b9d4 with SMTP id y9-20020a2e3209000000b0025d644eb9d4mr401270ljy.13.1658513971230;
        Fri, 22 Jul 2022 11:19:31 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id k2-20020a2ea262000000b0025d75995a07sm1259660ljm.24.2022.07.22.11.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 11:19:30 -0700 (PDT)
Message-ID: <53d432e9-6715-05c4-d258-896ec38afa4f@linaro.org>
Date:   Fri, 22 Jul 2022 20:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: add pinctrl definition for
 mt8188
Content-Language: en-US
To:     "hui.liu" <hui.liu@mediatek.com>, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com
Cc:     johnson.wang@mediatek.com, zhiyong.tao@mediatek.com,
        sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220718113813.23787-1-hui.liu@mediatek.com>
 <20220718113813.23787-2-hui.liu@mediatek.com>
 <b28dcbe5-d15f-1c4f-9b3d-650d5c39de6b@linaro.org>
 <08a7209fe198839093b3ef729fc97c1a950e1fbc.camel@mediatek.com>
 <35639a59-4a3d-5aa7-946c-22fbd2f25e89@linaro.org>
 <ea7755e599ad8c06bc04b6249c2a6d0ab3b920f3.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ea7755e599ad8c06bc04b6249c2a6d0ab3b920f3.camel@mediatek.com>
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

On 22/07/2022 03:40, hui.liu wrote:
> Hi, Krzysztof
> 
> That's the comment about reg and reg-names description:
>>> +  reg:
>>> +    description: |
>>> +      Physical address base for gpio base registers. There are 8
>>> GPIO
>>> +      physical address base in mt8188.
>>
>> Redundant description, skip it. You should list the instead and
>> describe
>> each of it.
>>
>>> +    maxItems: 8
>>> +
>>> +  reg-names:
>>> +    description: |
>>> +      Gpio base register names.
>>
>> Redundant description, skip it.
>>
>>> +    maxItems: 8
>>
>> You need to list the items instead.
> 
> I plan to update reg and reg-names as the following:
>   reg:
>     description: |
>       Physical address base for gpio base registers. There are 6
> different GPIO physical address bases in mt8188.
>     minItems: 6
>     maxItems: 6

You should rather have here items with description:
items:
 - description: what is it
 - description: what is it
 ....

> 
>   reg-names:
>     items:
>       - const: iocfg0
>       - const: iocfg_rm
>       - const: iocfg_lt
>       - const: iocfg_lm
>       - const: iocfg_rt
>       - const: eint
> 
> Is it right?
> 
> Thanks.
> 


Best regards,
Krzysztof
