Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D2D5FB20C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 14:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJKMIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 08:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJKMIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 08:08:22 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2950D57BE4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 05:08:20 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id f22so4093922qto.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7sQGgcfeLetHsYqqAQzwhlkQO31idzHL2CtdWtj7pI=;
        b=fFpMQBJU+KIup5rqPl5HSkr/RGGMV7irnqdmJssu6pEBstzv0l8cg2Yyh4W0MSrMjS
         1UHEW48g9iVzieWXgwHcY2sYLOt8PGh7CZUX15ojxeZ8yjvBxSHv2WSDFYFUduWYP9nw
         FCg96WFT2ulQ3hmp+VnOAjxmLC62pNPaUoyRZaduPPyWuVZSCJxfQDpFWFu7r13xNirS
         IKWsSZyCLPIsSGgpTaS94qvR6G4n+kY0wFKw9Gg0jspinDQ/WolzwqymbY8U1sloEBA9
         A+IPAE5NrQeJUa3snTIDBFMzGx3H7TLwRCa6tpNRmjgaH4XwOlPnKAepUx7845XuTUAP
         2G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7sQGgcfeLetHsYqqAQzwhlkQO31idzHL2CtdWtj7pI=;
        b=b867NWutdrZtuGfks2B767WWsaj0iRev+SIlagixqcm+PHDk7sNJ/4pIxgB3HbrUAS
         jjEh0T8RiTWQSxhRfnBTwTjz1ZKCgZCViNY0oCB6JoMAQ0GhXCTsDY8gCTOehsJjg7nu
         WtpcBWZ8dwnbby3BuNPlV1zRcoYXX8Yh93Q6IpPozXO0yhNmsIM02IZtGQic3qKlGmhp
         vFuv5gvx22lPKMg2tRiH0Q6mE9ic5HhuGwnlBG69+T+R+Xrh8SDGKpQNyNejc8XS6ODx
         S7sy9l0bm+eCEAl1bWJglPZU0dBgzEhW4eJ0ESrvlm3Ev5W5vxskMiAU2/G48XrHlT6m
         j4pA==
X-Gm-Message-State: ACrzQf3eIn061NayOmBMuPwFvltc0OK/zpSQTdURlC+5xU5b1nW9EUGz
        wwbYFeluuNA67T592QEDJxicKg==
X-Google-Smtp-Source: AMsMyM4eGhDDIfVAL6kaolpL8+jGYieCca2y9hJwcftMhjyac5scT6NHJ1gngHvyVO3MwMBzC9Cc2A==
X-Received: by 2002:ac8:7f93:0:b0:35b:bbdd:5699 with SMTP id z19-20020ac87f93000000b0035bbbdd5699mr18616407qtj.46.1665490099267;
        Tue, 11 Oct 2022 05:08:19 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id c2-20020ac87dc2000000b0039a8b075248sm3987764qte.14.2022.10.11.05.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:08:18 -0700 (PDT)
Message-ID: <e64594f9-e5dc-9a79-8240-fa0e749b9655@linaro.org>
Date:   Tue, 11 Oct 2022 08:08:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/8] dt-bindings: ingenic: Add support for the JZ4755 SoC
Content-Language: en-US
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221009181338.2896660-1-lis8215@gmail.com>
 <20221009181338.2896660-2-lis8215@gmail.com>
 <84b6dae0-d503-bbd2-d483-80462917afa4@linaro.org>
 <CAKNVLfZmjfmKb5ybY8NDhV-bQCQn7o_bSVK=aM4byftasW6dLg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAKNVLfZmjfmKb5ybY8NDhV-bQCQn7o_bSVK=aM4byftasW6dLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/10/2022 16:18, Siarhei Volkau wrote:
> пн, 10 окт. 2022 г. в 17:55, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>:
> 
>> How do you plan to merge it? Usually these go via subsystem trees...
> 
> It's a new case for me, could you explain the problem a bit more?
> What things should I bother with in the next patchset version?
> Thanks in advance.

Each binding goes via subsystem maintainer, not via DT bindings tree, so
keeping all in one patch messes with that.

Best regards,
Krzysztof

