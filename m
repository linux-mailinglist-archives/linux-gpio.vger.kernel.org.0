Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795026BA7D6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 07:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjCOGcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 02:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjCOGcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 02:32:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E1861ABE
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 23:32:47 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x3so71278996edb.10
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678861966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvFKljKO0WMF10425trbTqfWVjsV5fmlF9IxkwLDpAQ=;
        b=qNA4JejxVNs9t+Gh7Hf+Qj5kfknpfiv/6cR6xDvH2K/IKalKT/Y3J0793KIx/D1NJY
         pgvNrTZQkGqGt/Z8XdiJtPBpl7+7aemYQgFNIax++hJFJbffoAtDQRcOL1adIBDoVyg3
         DBq18A7g+37/8hCbK8jUigRLjJ2bhK+jw43wLT8e95fdTFSQZGCa1IWp4ATfX9o4SaeI
         K2QWaYlcePsZIv7z06WgfXykM197rcY2NpzEILKyouYsvzwnqLqQjjCCxsfhJeySGjzC
         kLIf502IyP3BMNVZjg7kF4Jek20Q69Ny619Yt4R1PqmnfM1WJ17kCRTkL4/HN7EmkpOa
         WQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678861966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvFKljKO0WMF10425trbTqfWVjsV5fmlF9IxkwLDpAQ=;
        b=L9r32f0J/FzKwLqG0ovXVy4ZnFPym8pjD3dwtxXupKHLfmmixGDH3DaPyCgeQaXFHz
         SaSMwwcsVvsZTHV9D6Jwf6w3wBQX8YpY4qiYDY6P1XHZzpWICcPaCy+dxCI4f2qk6vBB
         HA8zhF4yh0SxHDVAc7n1Y4VP6XYm75WACwjbvGdresHGBfzBftCtBgSzFo0tmAR7OZmS
         Tfi/+MSEFXBLDmng+6uqgtkIdu+NT4rdxMTF3Jmn2xweL94tGiS4G0otNS1EWxQPBdwZ
         GrNRNSrzHDiJ8uM3nJqOpp0WsaCUU/Eh0pE96NRgZLlGxRELs6BgUvTts/ee8VIxNY54
         RG5w==
X-Gm-Message-State: AO0yUKVN6jV3yyMaBnllaoT863/lShCe06qO4EfrTOU0BAWokkU7DzSE
        s8IDtdc0Zfc6w2Vd/kOByG91Ug==
X-Google-Smtp-Source: AK7set/Zh8cjRrDKfOLXp5lqghOjBaoH4KoRkWd6HaXgr8CUCFLcU31eQkh01dDJ/9XZZaJYSQzDoA==
X-Received: by 2002:a17:906:60d2:b0:877:8a55:2a26 with SMTP id f18-20020a17090660d200b008778a552a26mr4596388ejk.60.1678861966182;
        Tue, 14 Mar 2023 23:32:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id m22-20020a170906259600b008f883765c9asm2026303ejb.136.2023.03.14.23.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:32:45 -0700 (PDT)
Message-ID: <57c42604-38b0-61ce-2fc4-2284fbb9d708@linaro.org>
Date:   Wed, 15 Mar 2023 07:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] p54spi: convert to devicetree
To:     Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Kalle Valo <kvalo@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Felipe Balbi <balbi@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230314163201.955689-1-arnd@kernel.org>
 <4ac809d2-3924-3839-479f-0b4be9f18a1f@linaro.org>
 <e19fd8bc-5944-409d-a4a1-3a3d53691634@app.fastmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e19fd8bc-5944-409d-a4a1-3a3d53691634@app.fastmail.com>
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

On 14/03/2023 22:40, Arnd Bergmann wrote:

>>> +
>>> +  power-gpios:
>>
>> If this is GPIO driving some power pin, then it should be
>> "powerdown-gpios" (like in /bindings/gpio/gpio-consumer-common.yaml)
> 
> As far as I can tell, it's the opposite: the gpio turns the power on
> in 'high' state. I could make it GPIO_ACTIVE_LOW and call it powerdown,
> if you think that's better, but I don't think that is how it was
> meant.

Whether this is active low or high, I think does not matter. If this is
pin responsible to control the power, then we use the name
"powerdown-gpios". Effectively powerup GPIO is the same as powerdown,
just reversed.



Best regards,
Krzysztof

