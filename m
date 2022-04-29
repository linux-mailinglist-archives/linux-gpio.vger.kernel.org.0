Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2B6514223
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Apr 2022 08:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354372AbiD2GGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Apr 2022 02:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354351AbiD2GGj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2022 02:06:39 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EF1B82EE
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 23:03:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i27so13451124ejd.9
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 23:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2UVF1UzLTvXwjMuXjHk4vSsZBF8/xezWpjHU9KjaHyI=;
        b=r4vPB+6VJeu8RIvrpfY3kIQQQjSlQs/o0234SVjt6pPhaCqx793Kmv1nmXZui80rWZ
         Hg9w6CPZYYvkm0wlSZGRc9VZpOJYZU9CPuHml5XVyH3bP0giIoyYv+B0pEqYYnR7hrhP
         Hb3YvlURM4kmTr6LCPbYSbVV16PG7a4ZuLsw39Rh81MV9rEOYlTrHK9yDMzg+CNO8hRX
         XW992Ey9bFAZmHMC0+dgHuqAz4AVk9LLHU/BjBTf5/dIEF8ERi48fUEfVA26rfjRuA4R
         D/vDS+5uy/V5qGtCC84SzqifWrFWDdDLSeApuMBzpu5Lr6Oyf1cwHzL8MI0kV17sg7Oc
         eTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2UVF1UzLTvXwjMuXjHk4vSsZBF8/xezWpjHU9KjaHyI=;
        b=JepKVyv6665nFnjEpeCORWPECBSDFjPhtP4p1CO2m98+DKRhWTLrKyzPJlvdk3cJZT
         2ahs3Cm5YmIE1vDqWJUvm+UUGiVaDZVOJw/dK3XnTwcVBOd8soR47E4gVtgPNnN05UcV
         FgcxCIp+w6rSFO0EvJ0zfgIrb3CZtxrGJ3F3kk4z/ylOeg3tGn0+7mi/IUoPvfR7dMXA
         q9wKK0/0X9jJ6dno4G2TRHujueZU/8UntBj2nAKjWriUEm+0LqBAz1vnCJkaa4fHRmal
         0sTNv1Hn+3bdN+nLbHOpxG3r6zBzXJK4KVY4dnlcfCInyTzy1CdXBtnR042kFLh9QMRn
         Nskg==
X-Gm-Message-State: AOAM533cxM5NLso0q54Eq+sPu5/FT/cVoJj/4DOmNu9z6+aDGpqGokFM
        CUEAfrxWaxMGM2bNcYLtDIv+Fg==
X-Google-Smtp-Source: ABdhPJzibkdFBoDF+cIhDOCqeeWmKmks/LjPu/SUPeRXPpTGCICXJ32FXdpt2PTlJmb2ApJRyQ4AYQ==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id fj2-20020a1709069c8200b006e11d6c914cmr33826027ejc.769.1651212200588;
        Thu, 28 Apr 2022 23:03:20 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ra48-20020a17090769b000b006f3ef214e69sm318162ejc.207.2022.04.28.23.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 23:03:20 -0700 (PDT)
Message-ID: <064f5758-a3ae-d116-fe72-9f52b4cbea78@linaro.org>
Date:   Fri, 29 Apr 2022 08:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: Fix irq_of_parse_and_map()
 return value
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
 <20220423094142.33013-2-krzysztof.kozlowski@linaro.org>
 <CACRpkdY8LJ5xMW0eDsL-ycrqV8io2zXJrT6RfZj=KxaE9rvcvA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdY8LJ5xMW0eDsL-ycrqV8io2zXJrT6RfZj=KxaE9rvcvA@mail.gmail.com>
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

On 29/04/2022 00:52, Linus Walleij wrote:
> On Sat, Apr 23, 2022 at 11:41 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>>
>> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Changes since v1:
>> 1. Correct the return value passed further.
> 
> This doesn't apply to my tree neither for fixes or devel, can you rebase it?
> I'd like to queue it on devel for non-urgent fixes.

Sure, I will rebase. The issue was because of Andy's commit
https://lore.kernel.org/all/20220401103604.8705-9-andriy.shevchenko@linux.intel.com/
which was in next but not in your tree.

Including such development branches in next, bypassing maintainer, makes
it difficult for everyone else to develop patches... :(


Best regards,
Krzysztof
