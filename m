Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38035BBCB1
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Sep 2022 11:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiIRJLX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Sep 2022 05:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiIRJLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2022 05:11:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B54255AD
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 02:11:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z25so42252714lfr.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PWLxzufr2NjsqZjT2Z4UqyU4MmetRmPFlyezmIjAZEM=;
        b=qu1ApYysZcQSSui2tkhTjy42RU3NQtKLqRGGbDeFV2PukaCNx8IwMk5CQLin2+SfhY
         LgvAORveWzR/Oz4hCVyby9ufpokEv0IDfa8/J9dI2ltTfg2LX00DW/1YFgSTUhVJH7pr
         bf9zcc8ApS/OSyOIknFfb0NOoD3W8R3mmTjyL+dTxxHoUcqYatdYpM4NNv4ukTiasNg0
         Nu0Z/SS1pqQ+47vP2Gq+QuXQoCJTwU/eUNfdGOfYDMEpN36WKv+A1lUgzZU5tCC/24pk
         Ou9C8dei3JL8bLqBN1UfGVEik0hX1wOQF8mTN4+C5OFjawOntYS01hDe+q5UGJYeUlyW
         kc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PWLxzufr2NjsqZjT2Z4UqyU4MmetRmPFlyezmIjAZEM=;
        b=72WqxYeWt2DCT3F39GyggmpIHBJV2UdWGe6x8oAkRuTqHi24p/hmwmIN6MXxPUIStX
         t9dEv5V0RVsPx+sAQ+J2QHL12kgY172mpmFjnqH90zMgtiyuGfg+buJ0OhjdmBUezb3e
         ypaKnrMappmrKdYmA40d7jmGYHE5ksPvK/OWuCM1AkuUc1pVeNOhYxhxpsUeeSuSFLW/
         uE7bPQ5X0O3uas0wz+urkVC6v/m57oSAEKnQV2UaS52VQT51NEMVU5YRQ2FOBAUCg+h1
         x9hzCqJP7twPtp4mBKziVIIC9x5bxFu2iEDccbgKJcbceenqOjqeUmKYN/Xo/z7Byk7+
         qgVA==
X-Gm-Message-State: ACrzQf2Z3hrs0V6XT35AnMeMKGz9u7NWkrN4wZdazpwv9HIkZOplYm1W
        lvq/FE17HdhBw1zzuKV8Y9cg7Q==
X-Google-Smtp-Source: AMsMyM7Je7s49J9h+OapaK1GXqDlRYgOd+2etm7QoGdmXfoslCLIL72zrItiXVZHKIMQjdqRmINglg==
X-Received: by 2002:a05:6512:3e23:b0:498:fbf1:c480 with SMTP id i35-20020a0565123e2300b00498fbf1c480mr4640139lfv.473.1663492279148;
        Sun, 18 Sep 2022 02:11:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q4-20020a19a404000000b004947a12232bsm4563329lfc.275.2022.09.18.02.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:11:18 -0700 (PDT)
Message-ID: <4ba497bc-9933-6617-3b1c-12360d664372@linaro.org>
Date:   Sun, 18 Sep 2022 10:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca9570: Add compatible for
 slg7xl45106
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org
Cc:     git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        brgl@bgdev.pl, linus.walleij@linaro.org
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
 <20220915114803.26185-2-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915114803.26185-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/09/2022 12:48, Shubhrajyoti Datta wrote:
> This patch adds compatible string for the SLG7XL45106,
> I2C GPO expander.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
