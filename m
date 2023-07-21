Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C1275C39F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 11:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbjGUJuT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 05:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjGUJtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 05:49:40 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7983C22
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 02:48:44 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso14280685e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689932914; x=1690537714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2aY4Xg/9Uh173A94JU4dqfm2DBiw/beAAiUkYe934cQ=;
        b=kRxBi4nr899aGHDrPjiiZi9U1nuP9VX0l5v19OWwKVoakv56kXBve/kDBWOyQyiCnG
         yhcLWDiLImh2lx1iX02pn0IDG7z3ca1enOv/JYPIMV33u3aLKweGB9R4CfwqAMCMO/wF
         jzUHsyskF93/PTee9U94sbYqk/2yokfhz7fzSM/7hQnta/+XUz2/tW8lCkFduW/qbXLN
         MvKSIJd/ZJBwaEcJxcLdZk0CYjncqNyqYFuGxWPRihDBavgaUg2rAdaaAVkpcW5wP3Hh
         3jiw+2NngjtjNEiTXLMOGnNxwe5M+Znz7v9lQqkw/pe61x4Gr8S3J9o8yzpMjLhEcO2+
         aO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689932914; x=1690537714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aY4Xg/9Uh173A94JU4dqfm2DBiw/beAAiUkYe934cQ=;
        b=DB+ZcBpBGKzNW/utwXIHAM1XGJcpZrXJUZUBwnEpsdCqiI0AiF8PuV72ZcANDzSd6I
         hd/eCEHlYGvQQN9v2CItKEYyuzRF0tQ1cwt4bKfk8oqlWzdyaHSx/Wl91HU7yQDs9AF1
         0dUifwmOUm6S3VmDLfoALXRaFTAy8m0Y7Mn0ghKiDf9GPlsl5yLB8kdsCJmBuQpZV/mZ
         YlC8/Rg5ulKTB+/TdPLbX6EwCWPkSOyk8I7FUkimZK2XomZ//08/1pMYozSzFyVcrRiX
         Y9szBFiNuLRzquoezOB+L/XTsm53QL5NgK8mdCNJDPFjM2vTfs4kKpQ0Dj95yH8adZEa
         DT8g==
X-Gm-Message-State: ABy/qLbbhLrCkG74HRgPIFIug8D4atYHUJynYg4GRO0uhbVSldFtvuQR
        TXXgO3ETn5m7ZNUYF1B/Vw/Ibg==
X-Google-Smtp-Source: APBJJlGtcO9n/J6kiaUVyGrHaarvzjPAzYeLnvmIRvKMEN/+BYIh02pDh7a2rCHgc+kFXm3C17vADQ==
X-Received: by 2002:a7b:c856:0:b0:3fb:dd5d:76b with SMTP id c22-20020a7bc856000000b003fbdd5d076bmr960439wml.7.1689932914641;
        Fri, 21 Jul 2023 02:48:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fb225d414fsm5736048wml.21.2023.07.21.02.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 02:48:34 -0700 (PDT)
Message-ID: <a90e2f38-1308-cfa2-740c-02869f923171@linaro.org>
Date:   Fri, 21 Jul 2023 11:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE GPIO
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/07/2023 11:06, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> index 22c0cae73425..b226a8892f8a 100644
> --- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -27,6 +27,7 @@ properties:
>      const: 2
>  
>    gpio-controller: true
> +  gpio-line-names: true

min/maxItems

Best regards,
Krzysztof

