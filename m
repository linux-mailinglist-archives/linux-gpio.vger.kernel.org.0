Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903515F8BE7
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Oct 2022 17:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiJIPRH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Oct 2022 11:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJIPRG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Oct 2022 11:17:06 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9554A29CA0
        for <linux-gpio@vger.kernel.org>; Sun,  9 Oct 2022 08:17:05 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id m6so399370qkm.4
        for <linux-gpio@vger.kernel.org>; Sun, 09 Oct 2022 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BL4JcwH1BlRKSaTgiWa7XnjgnxHiKgi2LESv8tz4pQc=;
        b=S9qa8hsBVXQ5Wa9ivzeKnrF+utOFKYvTcRw5ht9qe1pf33nZkeHef7bOPazbUoM4Z1
         L1U2VI1+NovXH2sWunMrQW+a4sGbroPvBlYrHuuybNMOxluCnxSarwAFvZr7K1B9TZKJ
         7XB6VDvHfYd6OLci8MfKV7a0y/c5tBBuDd7Wc1dIntKr78vhgdqcVvUnG58df1HA0LrX
         i83xYrRE7iI/u7HGNFtICWvlTudnlRqtMQC71sZYFzMzrl71fjK0P8P3kLNV5izPEyFr
         TePLTVZLHBkKc2IIX9WmHOkg1h3e87nTNYrKnZf6oQOq9oM9KYpogZry6LdEkkKAMzFR
         66gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BL4JcwH1BlRKSaTgiWa7XnjgnxHiKgi2LESv8tz4pQc=;
        b=jm72+wd78y3oFpLkc8T3seSEXhl8+uMmlFKhM0EeGcM2Ok8430j431KgUHyh2oBpDN
         APuR6VPshZZyD5Iq3MUiytetRPliX6jw75WrzyiIE85n9C8ERoL935ujhMWZcX9ysiiw
         yUPtPrksHZrIzqnoLiQGP0vEtugn2MQe+sSmFEhQJhfHGGyl1qbVIA4FBHzck9F/aHfZ
         azVTA2Q3g1cluuh5zZT8fwHv9v3RAwhnv9n/rEdgYOS+NbyXSfiO17Uf1yT3cC0oVutX
         f90P1XoNuUHnB04hs8XTaNA214P5swHHh6qe9O/O4iYbOnKcI0ebjDIzYpZ07mQNinyt
         wgtw==
X-Gm-Message-State: ACrzQf3XwfFC4b0k1HubUK90SJIgzcqB7LHe+/xU4+Fn/vylguZApS1r
        2dlX8+UxOwJBCdoy8uJCU37BgA==
X-Google-Smtp-Source: AMsMyM48598dwVSzpKD3PGz7P0JYzUO8QVxlhEllywy9x1o+yQGHTuYmtfTS71hXXXsBsbNKrlZ+5w==
X-Received: by 2002:a05:620a:254f:b0:6bc:5763:de4b with SMTP id s15-20020a05620a254f00b006bc5763de4bmr9889170qko.207.1665328624785;
        Sun, 09 Oct 2022 08:17:04 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id 1-20020ac85741000000b003998bb7b83asm1383567qtx.90.2022.10.09.08.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 08:17:03 -0700 (PDT)
Message-ID: <e0d69843-4b37-2e0d-66c7-fc8fd09ed385@linaro.org>
Date:   Sun, 9 Oct 2022 17:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH V2 2/3] dt-bindings: gpio: Convert Unisoc EIC controller
 binding to yaml
Content-Language: en-US
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20220930082405.1761-1-zhang.lyra@gmail.com>
 <20220930082405.1761-3-zhang.lyra@gmail.com>
 <727a540d-0ca9-ade3-894d-f1774d10a681@linaro.org>
 <CAAfSe-u4y84kjjksv-Y7=zyosV=34M-=_wrDQC9884znvx9V4Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAfSe-u4y84kjjksv-Y7=zyosV=34M-=_wrDQC9884znvx9V4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/10/2022 04:57, Chunyan Zhang wrote:
>>> +        eic_debounce: gpio@40210000 {
>>> +            compatible = "sprd,sc9860-eic-debounce";
>>> +            reg = <0 0x40210000 0 0x80>;
>>> +            gpio-controller;
>>> +            #gpio-cells = <2>;
>>> +            interrupt-controller;
>>> +            #interrupt-cells = <2>;
>>> +            interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
>>> +        };
>>> +    };
>>> +
>>> +    sc2730_pmic {
>>
>> If you insisted to keep it, at least should be correct, so just pmic.
>>
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        pmic_eic: gpio@300 {
>>
>> It's exactly the same example as above - all same properties. Drop it or
>> bring some differences.
> 
> The differences are on #address-cells and #size-cells.
> 

Which don't really matter...

Best regards,
Krzysztof

