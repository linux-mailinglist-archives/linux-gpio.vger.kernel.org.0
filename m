Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B4E55B11F
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 12:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbiFZK3B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 06:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiFZK3A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 06:29:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E71C11C2F
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 03:28:59 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id cw10so13346118ejb.3
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UryUvcXWPpBXfvIflu4cxT9Q9H+kMYtJGeIQndtNQSc=;
        b=J9tW/hh8Vxxadht/p2/HAMoeJuD8BWvbcQU5buW1oPKBF4wwnwGo/ZM3n8OW6CQXuD
         5mjg0BBbRFeYvbBBswoKiH8Nbz81NRywcdfXpQYOxtZLI1dT8LzI4cFstgjEiZJhz8VM
         driBZpRUvCocFX4X+8w8SS5DlKb/V8wHXD+128Tu9R8bCYuJ8Z/BPKyw8gv//AwYV9/G
         PPhsFg1QKpoAYqdaJVlzvI0T3S9gfR4fwWSd5Us7/0luZ357gQTHlBtZFBOJ7J8YJ+Dr
         fL3wNWwKTak0D+5iZ9XIr1LkoaOR8IHORl3UPQy5QiDc4PoVTaMiT3IuhuLbBuZOnbvF
         6m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UryUvcXWPpBXfvIflu4cxT9Q9H+kMYtJGeIQndtNQSc=;
        b=jlbhvjRVz9lecReU/W6la2v1pJbpo79JsyOvax67AkM1tZXfC3pHMaNBe8hQzDf3bD
         OlmfFadB+QbhMbBBnrIm4+Zn7gvRuon5Nyam9qcZk52d12dQKiG61BZfmzoour+j8l9u
         cKH0blB+f7LQMm3W9UF6N9ZPaMO1WhAe7mDQBPGF5vQN9rFRVYJppFqvfaB+Ne0wZhM1
         7x46sJDDoJUzq95oCjsDTuoOzwqHS3To4pgUoZc8tSkILjEY/sk3cgOoSviuiyqIcCNm
         3d1s01ST1mMsFkxse0No0egMh0RgUlgBJhDqSWLlTyGD8zcg7eJOflWmKhoWdLZscouv
         rerw==
X-Gm-Message-State: AJIora+X88gPbJiMLn+l4tj7h9plAFYaOgp3dEY5acmSP0oYDaTkdf8m
        4aJnjFHhQeCyG7EldJujsRbPag==
X-Google-Smtp-Source: AGRyM1sblJgmEXbxMeGf+RD2dHMi4zVazxPkN9rudj8RaT/bHUJavjCmx8LIYG68F1Q3UPK3+2Rsgg==
X-Received: by 2002:a17:906:7303:b0:722:f008:2970 with SMTP id di3-20020a170906730300b00722f0082970mr7234670ejc.491.1656239337624;
        Sun, 26 Jun 2022 03:28:57 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00705cd37fd5asm3637815eje.72.2022.06.26.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:28:57 -0700 (PDT)
Message-ID: <ec660b83-998e-3a53-ce17-8f7d9d8728cc@linaro.org>
Date:   Sun, 26 Jun 2022 12:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
 <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdYVPeEtKKA9xdiSAP6oJrX5eAKoOVaLnrELTv_ZQOEMUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/06/2022 01:28, Linus Walleij wrote:
> On Thu, Jun 16, 2022 at 2:54 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> gpio-keys schema requires keys to have more generic name.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> OK, do you want me to apply this one patch to the pinctrl tree or
> will you collect a series?

I would prefer if you picked it up. I am not aware of any conflicts.

I am picking up only some left-overs and in general better if the
subsystem maintainer takes these.


Best regards,
Krzysztof
