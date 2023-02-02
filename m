Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4323687A68
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 11:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjBBKjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 05:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbjBBKjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 05:39:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9606F72F
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 02:39:10 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r2so1261622wrv.7
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPhYC1ocFq5QQJpaVTOzLcdTeomY74tjmBhXmnXXIeY=;
        b=wNsy3ESBxdq1FnLv0ESqEqE4iP2XzsEzI1Jmyyk4MCTw9Cwei1rKQ9kIY6XpfN0Ynj
         U2c5RRH/s7m43jBx8UhEnt7xegE5jgXxWiKVtbuuTWr08ARRyT8A6mg6YM52UshZ9uPR
         TJfZo9DiUsRnQkVo3nDPD15VlkqAlan1ExtPx1eYZ/maJeCn+5hdd4a7EJBV0CcIxX+j
         7IiVd4a5I5Tq9dloTrfcpNirUz9ffXuRWuyTrefflUQgioStM8NgwpXWg3L9JT5kznNV
         HaQJ+sTPUdVoRrXxgF24aX0U9MPxS8LOagyiFqLYn9NyBUrgyyYshij+FpsWnmeUw8Uh
         GIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPhYC1ocFq5QQJpaVTOzLcdTeomY74tjmBhXmnXXIeY=;
        b=jBRJ6RMnG6gxDNufjOrJzUckRm1jUXjU8PuJWtAfINyjuAvK3iqxhUbNCUDMohlHNF
         n2d/arNEj9sRfjax4lyqQYrdFOwz5Qyky9kagCEopeRBGDhp0onP9srKl6NHcpBe1fc9
         hkfSDv3clKLK+pqzZMujCb4MS5XryBZzoRbSpZIEJcYMUOzB1MS3+wNiea2EVXyJj6/J
         FIz3DxMlRlQhKBCjFwxW2F5jPBWAIj7Rl/D2CPjt2YHkUv6hlHv6Mbkq5qQWhaZ257YG
         OfAGkCCJrifCwBMuFn7WsNkGYhrsYWw4X5amkMT0AjEicXj9hk5apWhF4zHUQVtLp5lX
         0JCg==
X-Gm-Message-State: AO0yUKX2RZMO5qVhWDMyc5quuE3wpZiDmzthzr7eSDzAn3RXAlo7wURO
        3Tu4Io4KSUj/2ffxuLfJMMsztA==
X-Google-Smtp-Source: AK7set9zMb2dJxCvWWhQaIeMEKvJdGBZiHwAdLW5pVwrj8P4IhdOHkyAmDrFqbSXF8UBuwh9hZ65qA==
X-Received: by 2002:adf:e7c4:0:b0:2bf:cab7:cc36 with SMTP id e4-20020adfe7c4000000b002bfcab7cc36mr4566178wrn.23.1675334349270;
        Thu, 02 Feb 2023 02:39:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r6-20020adff106000000b002bfe05bf6dcsm14573620wro.88.2023.02.02.02.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:39:08 -0800 (PST)
Message-ID: <de2a44bd-08ee-12d6-a78e-33e39401b3a2@linaro.org>
Date:   Thu, 2 Feb 2023 11:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/7] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
 <20230201153019.269718-7-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201153019.269718-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/02/2023 16:30, Krzysztof Kozlowski wrote:
> Correct the number of GPIOs in gpio-ranges to match reality.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.yaml        | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml         | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml        | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sdx65-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml | 2 +-
>  .../devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.yaml        | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml | 2 +-

As pointed out by Stephan, this is mostly incorrect and needs fixes.
There will be a v2.

Best regards,
Krzysztof

