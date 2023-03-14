Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C896B9FEE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 20:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjCNTqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 15:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjCNTqJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 15:46:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1242B28EA2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 12:46:02 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o12so66639232edb.9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678823160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhnhusYpso9h8+/nIXY/oJLXEHrnKb2XiVlsQ9b08H4=;
        b=ONDiRQagLTVyvzhrwFbGYhO7MweGA6aPWx0XzV66MsRpmOqC6Koe729Wn1HCEVWNFQ
         D3o27iD9GCWZfCNB4KhCIsODlMZxTigsYuoteSZOS9Y7p11mUUaRrQkvKBvltukPpzuR
         YwCcPUUdHntD26Vgi/eXntOrEzlV/zygRL/d/wkxClarxgzUrqu3sWTkkYcHVspsILbB
         SN36+f4tzy7P6L/PCVmwVJ3s6mm8+I4nLQ4z+4q9fzE6weT6jOG+/nwCjMV7AAEJdvVD
         rBzagmtkh6wwMMixWUcbRj32wjyYdywdmT0HdUzyUQWa7C4uGFnVNmvmVH9wGDf434Tw
         iD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhnhusYpso9h8+/nIXY/oJLXEHrnKb2XiVlsQ9b08H4=;
        b=ALrzXsXp9fQ7y6DRki7HXlxxDveiDxbHIx1OIAkcENHQfuu4NFjdEN1o7xrUT20mDp
         8GNnCPWrk/7+gd7Ou5KCjryjRbyCmTOqzq95XvKO63nn3AfGTO8WC4ZjlOhX5+K3iUnt
         VC1KpFQ4u1t676XuiNnTCpiA9LWkSOCcwEjtYx+6CrrzjUrSR+37MBYEFmoZfLDoMbJ4
         Yzssw4j/aFZe+sfvJw/0hsW0a3FahoYzbRUVh4I1IS82ktfpwtZVtDOtYYD8dw5DejZf
         QltQgB3eMMGjgtCjm3RpIKf1BQqEQcbcI1NgBN7/6+rFooErxCQYzchjBjGptCI7IQj/
         SuDQ==
X-Gm-Message-State: AO0yUKVQ6KVkOag9q/m9fR9daii6irJ00LFUOJpBnfG1Ie8amwpqukZq
        Lojaqro10eUwBBL70FePWCu0IA==
X-Google-Smtp-Source: AK7set8dJIX6MG0tfCB9Nt2ztaf3oOfZDw/JWQK995BqtVEHbWKwofAbRL4CvEuHlmwte2N8XPGQCA==
X-Received: by 2002:a17:906:32d4:b0:878:7f6e:38a7 with SMTP id k20-20020a17090632d400b008787f6e38a7mr3667050ejk.44.1678823160567;
        Tue, 14 Mar 2023 12:46:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id hb12-20020a170907160c00b008d9ddd2da88sm1533268ejc.6.2023.03.14.12.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 12:46:00 -0700 (PDT)
Message-ID: <a7fbaea5-927a-e4e8-d990-66b53d586d47@linaro.org>
Date:   Tue, 14 Mar 2023 20:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
 <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
 <3c19e6d2-4df2-6187-36d5-98ceef07235a@seco.com>
 <ad56ca5e-03f7-5e3d-6547-91c64fdb08d3@linaro.org>
 <7c7311ad-fbdf-3c7e-dab5-28a562fb7e8d@seco.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7c7311ad-fbdf-3c7e-dab5-28a562fb7e8d@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/03/2023 19:50, Sean Anderson wrote:
> On 3/14/23 14:32, Krzysztof Kozlowski wrote:
>> On 14/03/2023 19:09, Sean Anderson wrote:
>>> On 3/14/23 13:56, Krzysztof Kozlowski wrote:
>>>> On 13/03/2023 17:11, Sean Anderson wrote:
>>>> +  reg-names:
>>>>> +    minItems: 1
>>>>> +    maxItems: 5
>>>>> +    items:
>>>>> +      enum:
>>>>
>>>> Why this is in any order? Other bindings were here specific, your 'reg'
>>>> is also specific/fixed.
>>>
>>> Some devicetrees have dirout first, and other have dat first. There is no
>>> mandatory order, and some registers can be included or left out as is
>>> convenient to the devicetree author.
>>>
>>> reg is not specific/fixed either. It is just done that way for
>>> convenience (and to match the names here).
>>
>> The items have order and usually we require strict order from DTS,
>> unless there is a reason. If there is no reason, use fixed order and
>> then fix the DTS.
> 
> The items do not have order. That is the whole point of having a
> separate names property. The DTs are not "broken" for taking advantage
> of a longstanding feature. There is no advantage to rewriting them to
> use a fixed order, especially when there is no precedent. This is just
> an area where json schema cannot completely validate devicetrees.

I don't understand "there is no precedent". There is - we rewrite
hundreds of DTS. Just look at mine and other people commits. The
reg-names are helper and entries were always expected to be ordered. On
the other hand if different devices use different order, then it cannot
be changed obviously (as the order is fixed).

Best regards,
Krzysztof

