Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C11573C870
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jun 2023 10:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjFXIDC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jun 2023 04:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbjFXICr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Jun 2023 04:02:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B31F2951
        for <linux-gpio@vger.kernel.org>; Sat, 24 Jun 2023 01:02:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98e0c1d5289so2237766b.2
        for <linux-gpio@vger.kernel.org>; Sat, 24 Jun 2023 01:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593762; x=1690185762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaGxY+NnkNtbiINqgZVIrn7LMLj+M5ushBYs/d6ygok=;
        b=wqE78Bjpv1t5dKFhHhDhMoV92aYtCYguhWZl46HmIFMY/ZYzcQ7nxZMVPgCUgGB8xg
         iEYx7lVP7Dh+5WNSPUcyPx3XUZtjuz1PKQ/7vup1QbkdYdyxiJFZQ78lEtuLCrJnlqzZ
         ogwVFrABwuW93fytr1BdboR07q3DiERXys4iP9Xd2S+9gtE6BZEkuX0OOnulaSmEknOR
         bb4dEcYg51TVvI0TN1VqycWE5eX6gP9xuB51AuUVCy2TD1yfN2Kowa0XBnrxBlP/+rEZ
         Wyc8CHxadG5JMLVAOsXqHZ53ZWZxJr7WyTvXZ0MuPxgWt2EG+GtX7XHYBQ+aZaSKTevV
         TssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593762; x=1690185762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaGxY+NnkNtbiINqgZVIrn7LMLj+M5ushBYs/d6ygok=;
        b=imt+gs1O7C9/aXFjzw24c3L8aIkUgq+TEJeTqmKeeOlTTA//sNq7CCtHqSp/HxQfEZ
         Ub51F9LgdJJjKR+IKnB6zCdKXgTR2a9h8r/V/jQAv4IpPpU2OhR5DRNxWKhnQbMSULgf
         T+1wHMQslYmqOBMaiQaI0VRNOlov51+Lms26Ci7qiw62X1oR3jF4ZKDw0HtJU4smcXLw
         todIJOMjVBpPJv1oe9YOoWOH4BQETIz+nk2MrqxG2UvQiD9Jip80KYOmUMgEZ3r9q8cO
         pxRXVlt/B8JHLVlefjEWIs0aGHtQ5q0l2IbPRfGpbGsx1RmL0ssrg8InAt0zq43dfe2V
         lbCw==
X-Gm-Message-State: AC+VfDwLJNfgioUSmcyFqT8vwqR6Iai/el0mL1UEqn4SO2lsrsErzHhx
        BG2edLe/BLdg3CVNELwp0rp/UQ==
X-Google-Smtp-Source: ACHHUZ6vL+lt0p59DekkavEVRdH+VurtmvBUx/CDPLLIsizULEgMBaYfOxG9eWuvaLpHLjFTBqHNMQ==
X-Received: by 2002:a17:906:5d0d:b0:988:cbf5:3a80 with SMTP id g13-20020a1709065d0d00b00988cbf53a80mr15099774ejt.62.1687593762629;
        Sat, 24 Jun 2023 01:02:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a2-20020a1709065f8200b009878b0b5302sm619453eju.98.2023.06.24.01.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:40 -0700 (PDT)
Message-ID: <2d3f27ba-62ce-b37f-3672-df8ee58cdcc0@linaro.org>
Date:   Sat, 24 Jun 2023 10:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7 compatible
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> index 43d04702ac2d..d53addbcd41b 100644
> --- a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> @@ -18,7 +18,10 @@ description:
>  
>  properties:
>    compatible:
> -    const: atmel,sama5d2-classd
> +    oneOf:
> +      - items:
> +          - const: atmel,sama5d2-classd
> +          - const: microchip,sam9x7-classd

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.

Best regards,
Krzysztof

