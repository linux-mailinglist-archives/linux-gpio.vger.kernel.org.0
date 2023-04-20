Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF2756E9A6E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 19:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjDTRRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 13:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjDTRRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 13:17:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF192D5A
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 10:17:01 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ud9so7979159ejc.7
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682011020; x=1684603020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td92zwa4kSQS7e5AlxT7UCYb1G8fMt886tztEhEVdsU=;
        b=C1bDPQ38ULCnRvBJ6TwMW1VywGtheq8FNeGyijoYGFb2lJWRRWhHyybiZQcFRis/yF
         O6OB8L3PclxtKqrDBmPGOeB6JYQkL7TdKoff26OsJqPxtMgBVxoT6aVD900Xro8hPk9B
         oxkftMoYmqn8+I1tgp+K49RHFtAnACQOGH+E0I/vLxgGJav3K680iei0SQo9OnNah/Dx
         O1jEzKxk5C/748ZBXtyEhjzpEVyWXcZMxTdcWvCEJhPb4yMOJRmwgT7dKXRpuTk4LMgx
         J56js0KDzqbZKWLFJxTumGZzSZSaU+3Iek+Wn8UrBmUgrBzDDOpXlPcuypahWnHCFWIy
         qTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011020; x=1684603020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Td92zwa4kSQS7e5AlxT7UCYb1G8fMt886tztEhEVdsU=;
        b=Z/eq7cIiGUfgA94YpAuwFTS2oVkNzoybfA/R3XrfRX/MvfiPNpC8INKuVxrFBxKeVK
         iNTRyndzsHZ724IVaVAh1gIlLYPKxk1EPXtXzdvwxpp/35m9PNHVT+jp36gCT2SObxEx
         dStQI6Xza7KV1ruwUygOZ5Vtnb/xBosVQ0zBvEsfT63gF0cLghaNggW3cobIK1QLwc7A
         Je0CAMVVMGsmhpe19BC9diVttY92DV694YxD30Ko6Ljy81/JcT6sMJCknS9WVpnlJ6Km
         zh4jDj03Zn2Rq5mPTEGJGIaUErYV9qJ/dRKqaFSQhW77BnGur3a9qLrVqKHmaU/lx/rT
         OaFw==
X-Gm-Message-State: AAQBX9edH8RhtMUOrkgOZSzUFOSbMDSTE1EDOnTifGc5bnvKTdQTLwiT
        wkwjys+EaqHl6JtgXsoQQYDaCw==
X-Google-Smtp-Source: AKy350bHAeOwxLTHc3puTC6QyfD/u9QdgZsETO87TDXEQsjH933UjZ/XF7y1KojzOBq2NQci5SyK2w==
X-Received: by 2002:a17:906:b4f:b0:895:58be:957 with SMTP id v15-20020a1709060b4f00b0089558be0957mr2352583ejg.2.1682011019824;
        Thu, 20 Apr 2023 10:16:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id lw26-20020a170906bcda00b0094f185d82dcsm954886ejb.21.2023.04.20.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:16:59 -0700 (PDT)
Message-ID: <bc4f2151-017f-8f28-8970-5b53b86eaff4@linaro.org>
Date:   Thu, 20 Apr 2023 19:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
References: <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
 <Y+OGdMFQkL9Dtaq/@orome> <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
 <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
 <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org> <ZBxeLIXJDbM2ebyt@orome>
 <e06977ab-8112-1e45-4392-df36e358e772@linaro.org> <ZCLgEhrQiYHGGZ6S@orome>
 <0b39b19e-e5ee-2751-cd57-68278354da5f@linaro.org> <ZCW5nuHXt7G1ety7@orome>
 <ZEFxBp2S-B6mbOMG@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZEFxBp2S-B6mbOMG@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/04/2023 19:06, Thierry Reding wrote:
>>>
>>>> If we were, then yes, we would need to use unevaluatedProperties and
>>>> that can get complicated. But again, in this case we're merely
>>>> overriding existing properties with more specific values, which means
>>>> that both the standard binding applies and then things are narrowed down
>>>> by the values defined for each compatible.
>>
>> Okay, so I'm starting to get a bit lost here, so maybe it's time for
>> another proposal. I've tried splitting this up more so that we avoid
>> the if/else block. Would you mind taking another look to see if the
>> patch below is any more readable to you?
>>
>> Thierry
> 
> Krzysztof,
> 
> any thoughts on this proposal?

I did not check the code thoroughly, but approach, assuming it works,
looks fine.

Best regards,
Krzysztof

