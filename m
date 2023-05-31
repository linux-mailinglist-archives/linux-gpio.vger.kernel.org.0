Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6220B71898A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 20:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjEaSrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 14:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjEaSrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 14:47:46 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36881101
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 11:47:45 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96f850b32caso1123260966b.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685558863; x=1688150863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
        b=Dr9eYiT0+tPGiV4cJWgJBzYxHisIPzvGdRaeBvXzFbXDAWwDWZqX2tBeJu1GMHQYsP
         TrqLX2rTOFV0lVnp8KF0y+0S/uTh3GW/T1ZcbzNT6X7Rfvhk/FkEEndypJFsVcX6WRUa
         YrZ3CnJvOcDkpZxCdUtPrjfP5QUv5a4auH4XesAtFkPAQ7D4y++w2FVPb3Ps68wg0OdQ
         lA6ZttjcO3LvcsrfkWUNSJYNElYAE8p0RV1Fk3l93eHZ1XJKY1qrY6Lwns5T0MTHLPnI
         2P0Wp0Lbb2le4SDBdusdmieqbgeAqv8h3C8LB4ILN6kj8rSz/Z1oUrpuSPW9efL8lQHE
         zvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558864; x=1688150864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
        b=NWyigezPrRnM5ylpCw114NUr2W/r9z1740TvflSOS1EvqcokKpsJTHIVkVe0y+FBqm
         O/Dx330N1G9BwSGFWWurm5X8roUpdITHoLZAJGVCBMAPvtccTi1mZBoKnViyeQ7RfXBT
         mRVgk5yt4j6hVVU1AYArbTnY6ooOIUd+cnkbghoYjbmqe/P3LYljgiVvrPo110WISy7d
         42XuIMG2RW8G1/Ftfr0mIVaozj7+++f9PJIpmxD70ENg1zdJaIQ3s68bvAGZ/WaPdvsj
         KL4AQn8rOmhuBwwwT9xra++daxh/7sU3vq8AUQiWqccFG7VRIHF5jzWzS7eVg4L5CtDZ
         gkhg==
X-Gm-Message-State: AC+VfDx1YRqzoCeoWjaLvZ4j9unMwy0Z7rX9udZLIT+x3HmBsV1MhsZS
        2AMxYM7Ks3w9mVSgoOD98kGqwOfWbj/hB2/aL6w=
X-Google-Smtp-Source: ACHHUZ5OHEWC/l7SwXXG0Ex4UcYj5G95i7V5T07Yf+NXLS4ZzBYzSv6/qXcHJtcqP3+UJEQM/h4YDQ==
X-Received: by 2002:a17:907:7dab:b0:970:1bc9:2eeb with SMTP id oz43-20020a1709077dab00b009701bc92eebmr6064275ejc.30.1685558863716;
        Wed, 31 May 2023 11:47:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id lv17-20020a170906bc9100b0095707b7dd04sm9258501ejb.42.2023.05.31.11.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 11:47:43 -0700 (PDT)
Message-ID: <25d61668-0b79-8565-0de8-dad7e80e3798@linaro.org>
Date:   Wed, 31 May 2023 20:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/11] dt-bindings: stm32: add st,stm32mp25 compatibles to
 the stm32 family
Content-Language: en-US
To:     Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Conor Dooley <conor@kernel.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
 <20230529-backlit-dealing-b099e4eb5210@spud>
 <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/05/2023 10:39, Alexandre TORGUE wrote:
> Hi Conor
> 
> On 5/29/23 20:05, Conor Dooley wrote:
>> On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
>>> STM32 family is extended by the addition of the STM32MP25 SoCs. It is composed
>>> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> index 4af5b8f4f803..7d7ca33d2e61 100644
>>> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> @@ -161,6 +161,15 @@ properties:
>>>             - const: phytec,phycore-stm32mp157c-som
>>>             - const: st,stm32mp157
>>>   
>>> +      - items:
>>> +          - const: st,stm32mp251
>>> +      - items:
>>> +          - const: st,stm32mp253
>>> +      - items:
>>> +          - const: st,stm32mp255
>>> +      - items:
>>> +          - const: st,stm32mp257
>>
>> I assume the slightly odd format is just to avoid churn when adding
>> the board compatibles.
> 
> Yes, exactly.
> 

I don't get it. How are you going to extend it? Or rather - what are you
documenting here? If these are SoCs, then this is not valid. We do not
allow these alone.

No, please drop it.

Best regards,
Krzysztof

