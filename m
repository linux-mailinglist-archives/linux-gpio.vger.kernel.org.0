Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3937875C3B2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 11:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbjGUJvx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 05:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjGUJvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 05:51:38 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E583C12
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 02:50:01 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso15165885e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689932987; x=1690537787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iU+7OOSQzQMFHjSzk+losa/DYpmzV3td0QjmbD8OzcE=;
        b=CU38tSUuiwOoek4v2FL5CQsijSX/aSA9/ovM080GsgYpu59cWWddJwgrt5Gcqg4c4I
         mPn30/D+E/oPCyr7WH5la3RTuGyALf1Vub7QevSbh82rVRGaALwiPyJWqYPNfwS7PlPA
         BgAqTdEEnpYu6akL3LWskEnPD7wXpDAIvZP07rqWg/IDZ+T7ssK+P52h7mFBkjE1vhef
         mIh3MH32yRpGvPBMHyb5MtbdZceIKwBA9NcIqDscdevVkB9kovoTGcNuS3+FDf/lqFD2
         pOWrgITn4Vq9g8dxYYKVE9J6L63RrEIe6xj4EDXLHCHqzgH2FXvr2y6cGlz7qeN8jBw3
         OinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689932987; x=1690537787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iU+7OOSQzQMFHjSzk+losa/DYpmzV3td0QjmbD8OzcE=;
        b=V28pYy/R+3FKmYipyf8rwN4WMC7KRtE92TbTjpZ4SYjW/REhqR1b+gfbKt85+EIbqc
         +BCapzqriNaWv7V7Y6WR0yD5dswbFUAB2GS3ha4iFLzu2aJB3U0B1A2hl6wAjWsxO0mz
         x1E7/vWZDE6tHt6G7rMcf+CDi3MF5OQoaR282hkPVUbIyq+RowsNxZvN42kYWrvucOZh
         UWuG8YaaNT5Tl8Fqm3OwqbhpmBGxWVRg7AgEqKADZF9PVxJPBPX6wgZS76sGEJo2XPt5
         C7yLsH5+Ho86kbmi8Q9XYwMJ9YECXi2YxE1eG5e8ZsR6vNG8+g/bSGHHq3Y9gA7xoYp2
         Pk/A==
X-Gm-Message-State: ABy/qLZMBtTmMBEB1EyQl8hQ+vETno6YTTllV4PMLeQ2cNyYQnAAL9L5
        KOVkLna/zFVny/vo0Ttdrlk1yA==
X-Google-Smtp-Source: APBJJlGL4iXmvdaweLqokx1Qb8W7E+7GdMaLV9cDNq0ZjTqEAMEWtatDIFOG4pZNJXsA2SFLZRqSrA==
X-Received: by 2002:a05:600c:ac6:b0:3fc:5606:c243 with SMTP id c6-20020a05600c0ac600b003fc5606c243mr1078931wmr.13.1689932986828;
        Fri, 21 Jul 2023 02:49:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b003fbe561f6a3sm5832321wmq.37.2023.07.21.02.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 02:49:46 -0700 (PDT)
Message-ID: <3cf3319b-d071-fc49-031b-befc09ffdc32@linaro.org>
Date:   Fri, 21 Jul 2023 11:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add gpio-line-names to PCA9532
 GPIO
Content-Language: en-US
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
 <20230721090618.1211081-2-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721090618.1211081-2-alexander.stein@ew.tq-group.com>
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
>  Documentation/devicetree/bindings/leds/nxp,pca953x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> index edf6f55df685..973c5fccaf4e 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> @@ -28,6 +28,7 @@ properties:
>      maxItems: 1
>  
>    gpio-controller: true
> +  gpio-line-names: true

Missing constraints. Different chips have different amount of GPIOs.

Best regards,
Krzysztof

