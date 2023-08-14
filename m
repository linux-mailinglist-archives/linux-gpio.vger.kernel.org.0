Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACAE77B2A8
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 09:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjHNHiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 03:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbjHNHiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 03:38:09 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFDBE4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 00:38:06 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so6511455e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691998685; x=1692603485;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BtaZrQAzMY3C2BNbWsPBhj/MtFtsIGPg278AEO8RQZs=;
        b=oww2Mv8CDKfGb6++dMt9FkLnxFb8+zw4f/tqkCazEJVtd8ckFKV2B71OtHul3caxOd
         l+SnF4TUnI5nmYGzyARMNIZJG72nC/MkSI6Q+Xl6gZ2C56DZ9iA/xfNHKHGEFf3WRxWL
         BAhGoz6yaEvAJ9ILKzNDQx98gQ8FF3LiI+4iLMbs39rPWFpLSI5GD+f9zngSTBa20hNT
         i3F9RBhRU5eWtKKbW+muxAmh1w8Jge7SZVwnX7HjomL1KZjVvlKo8XjBzdb3+emAKfsY
         dXBu4TLNg0h6AnBlU0Eu3ghAJH9VX6UlBeaH5MFqUYpLQF4eucoD6GFe63BVnWip5zXK
         mZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998685; x=1692603485;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtaZrQAzMY3C2BNbWsPBhj/MtFtsIGPg278AEO8RQZs=;
        b=HyqwXDR6MuGEaFIWaJqzy2vwe207JRLjWtdPzllLs86MPue9DiVHYScrVTy06qyOWB
         bls79w1tusHa6ONdLnPQ6V7eetIxUZA8zfeTo4Y2Dt4n0tgzAwhmW5kWIDWrI++9k8l5
         VwwBmCen2UVQnk/B3LYzR0KL7GCZ55ktdd5X9BrfMO4IPTr9BY/1w0fzfo+Q2lNvftQe
         8zxxxl5vCIottEM17dGWxa8iEbaFc3RcN6ssssxBjZB+RvA020fX/7Q7IdG8Ln6FjyG9
         DP38Wmlb+1iBYs10dgVjeMlU0JEFp1CX9mg4JSDn/fxmFwAkJehExGRq358Vd0bB+mDa
         maTQ==
X-Gm-Message-State: AOJu0YyCK5Y3Zpy/lDiaaNBFqHEsJpEvg8U4j3WMhWFDmOMsFdh7E4Qb
        Of4kux6Ek+OuJs6TFdeoE4j6HSVM0mT+N3tjJwfk1Q==
X-Google-Smtp-Source: AGHT+IGGBF9EalQNUGiGQY7O+CRjN8MTlwMZBKosUNjwisqkxL1RRErmSXT+NU1/gd2YA80eBp8CTg==
X-Received: by 2002:a05:600c:215a:b0:3fe:4900:dba8 with SMTP id v26-20020a05600c215a00b003fe4900dba8mr6648865wml.9.1691998684961;
        Mon, 14 Aug 2023 00:38:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id y2-20020adffa42000000b00317e6f06e22sm13577670wrr.77.2023.08.14.00.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:38:04 -0700 (PDT)
Message-ID: <0aea6c90-bae0-4400-5ddd-eb792f92664e@linaro.org>
Date:   Mon, 14 Aug 2023 09:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 0/3] Add binding header file for GPIO interrupt of
 Amlogic Meson-G12A
To:     Linus Walleij <linus.walleij@linaro.org>,
        Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
 <CACRpkdafAWgt9A8km1zLZF9UawXkdqBOEVnMHiRjaF=2SeyhgA@mail.gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdafAWgt9A8km1zLZF9UawXkdqBOEVnMHiRjaF=2SeyhgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/08/2023 15:37, Linus Walleij wrote:
> On Mon, Jul 24, 2023 at 8:02 AM Huqiang Qin <huqiang.qin@amlogic.com> wrote:
> 
>> After adding this binding header file, you can intuitively find
>> the interrupt number corresponding to each GPIO, and apply it
>> in the format of IRQID_XXX where it needs to be used.
> (...)
> 
>> Huqiang Qin (3):
>>    dt-bindings: interrupt-controller: Add header file for Amlogic
>>      Meson-G12A SoCs
>>    pinctrl: Replace the IRQ number in the driver with the IRQID macro
>>      definition
>>    arm64: dts: Replace the IRQ number with the IRQID macro definition
> 
> Neil wrote:
>> What's the best way to apply this patchset ?
> 
> I just applied all three to the pin control tree.
> 
> I could have applied just the two first and then offered an
> immutable branch. But eh... too much work for too low risk.
> Better to just apply it and hope all works out. If it explodes
> I just back out and figure something like the above.

Perfect, thx :-)

Neil

> 
> Yours,
> Linus Walleij

