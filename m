Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE8560F801
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 14:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbiJ0MvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 08:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235843AbiJ0MvJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 08:51:09 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6531065031
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 05:51:07 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id d13so757725qko.5
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKBan++e/NKax5xPM6ts6YDMCYkxx2wZgg2+258oy2g=;
        b=fHGo9BLkiTQpvnUec+fj7FSHRvyDJ9uXdmZl0UzkG5d4qSJZiJ5DTFF0aln6DCJCHT
         /uRVOl95RZcmeQ6mZQO0PuFqmA6X/ktKFilYOeJ6G9+opG7aVYrY+l3U/v+JcgMa6wpS
         Z2t147S0OXvKR/8qg47EyqfylCsLaExxePcK47WuR4m2kFlYPIOlsFtiDAc5abkg+yCd
         +LSzoreO5YDkakJMgC4OsS5aQdrRUR/k7gyo7esuWXwACW8HSagqZdOBqZ1m2KIpfvAh
         qMD8pefwgbSuidfxg8XwveSXfxZV30NM7GqZYo5KrnIgGi66lRqTXaXaK6RMaof2DA41
         FDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKBan++e/NKax5xPM6ts6YDMCYkxx2wZgg2+258oy2g=;
        b=gmHOIuaU/qTbf9M6yuKQA6UKdSKjgZCsE5/XT9WOTw2J9vmeiKqk6moaZAMxaayjDX
         88EhdyCN9EOmPtoeM0Nxwux+P+qV/pH0cohEGQC1f0LCfHkgEQDCewvycKQuExOf3g8c
         vAqvQNUCU7M+diYMJp9keVA47hg1Qld+o391aTfq6NQQJEX5XqmvnGHQ3ROpS5l1TQ4G
         AY3r5CGKtbqZMv7AtWiYYLk5ziEvqLEO8dQNDm8ohCSgZVmDj68v5VAhazc9gel9Docc
         0zs/DaJXDZlaWhb/hW90pjiYhBZ13Ehyn7h6FC2E/tlTAJ7JItbBhRJ3oBhSRZqHYy26
         Raow==
X-Gm-Message-State: ACrzQf0t9s38jrG8Smywg3nEoJhoS94hK/tG4szcdpron4l0vOA1Y2TH
        Hsy3vv6VaJd3Oxdp1nMXfKbWww==
X-Google-Smtp-Source: AMsMyM7pB0Ni8X+GM/aAPnQjU8pdUglL+U/akOBY2eleP1/ME1c2sv5RPtw2y2WaXFxVkVg95lrBiw==
X-Received: by 2002:a37:5482:0:b0:6f8:4c19:8697 with SMTP id i124-20020a375482000000b006f84c198697mr8442590qkb.709.1666875066337;
        Thu, 27 Oct 2022 05:51:06 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id s71-20020a37454a000000b006ecf030ef15sm904301qka.65.2022.10.27.05.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:51:05 -0700 (PDT)
Message-ID: <7fbbb805-f215-f079-5e8e-8f5e085da6e9@linaro.org>
Date:   Thu, 27 Oct 2022 08:51:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH next 2/2] dt-bindings: gpio: add entry for
 hisilicon,gpio-ascend910
Content-Language: en-US
To:     chenweilong <chenweilong@huawei.com>, f.fangjian@huawei.com,
        linus.walleij@linaro.org, yangyicong@hisilicon.com,
        xuwei5@huawei.com, robh+dt@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221026034219.172880-1-chenweilong@huawei.com>
 <20221026034219.172880-2-chenweilong@huawei.com>
 <30b95e7b-b902-babc-ea78-a2112c80ec7e@linaro.org>
 <050ab042-d51c-1e9a-eb85-8fbec8020211@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <050ab042-d51c-1e9a-eb85-8fbec8020211@huawei.com>
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

On 27/10/2022 03:47, chenweilong wrote:
>> Convention for counting is to use decimal numbers.
>>
>>> +      gpio-controller;
>>> +      #gpio-cells = <2>;
>>> +      interrupts = <0x0 33 0x4>;
>> This looks like standard IRQ flags, so use respective defines.
> 
> Sorry, I don't get this, you mean like this? :
> 
> interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;

Yes.

Best regards,
Krzysztof

