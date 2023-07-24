Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 204FC75F8A3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 15:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjGXNis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 09:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbjGXNiX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 09:38:23 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB8D3C04
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 06:36:43 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5221b90f763so3265319a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690205767; x=1690810567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUZQpPdIT858egNmU25ruQR94eOxPvH6ltaodarNd9g=;
        b=uz3c1UnB5ZXJhSrBInto1AcNQVdonbA1zngvwd1fUOakUAKuUGuZ9tef8/jNk+qC8o
         cPm3O6xdgYS3r2j422yCFMDvg81CqPMOkgBBwJ2M2zf82HkUE1fmhoX2IY67ngeGApGF
         iW+wE1ghO7KbnzIl+y6FcBSqURnEzI/YIVsBBDvuJNYj/t324Ubx168t1tiNFzaOFfFp
         9m0zZCAJr+xrz+WRx64Q0GhDZChKBKWya4Onl+zWI8bvZNlF5w438dyx48yK7VsGplkv
         IVXo3kOfUWLMO1MtRM5omsRMYpgvg74H/grqZF8UlrI+B4I/dGOUP5vnDzOcYOac15WX
         56mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690205767; x=1690810567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUZQpPdIT858egNmU25ruQR94eOxPvH6ltaodarNd9g=;
        b=CY5XvIEtbEZMqXQuzyb94BH+pRvQSse4SNJO/IxCWyeQB43DiGI6h7x7ZHtiLzytBr
         FrDcW+9RlxlV1KnnPrVVGCkrIH8y2kdiEc1BfhuI1QCRTNcryJvsKWk9nCF1830TqCDm
         hD2wtszRJ4b6ad5WNdRvOOK8IxMu7sLXcjkqY2qpbDnBBRXyuL43Anl8N1JxEid/vZ0e
         c0xT0g6a5qYQ2eZgLlU/IwKZ4tLB+B+2GEXRBpMBClqus/f6vRjDrKpL/reRquYYMkwg
         RSnx497jL3yRa1ACEu1Th4CA4e/I2XMyryNNTyfLwUO/2gFsMaXpOoHAbK+U3qrfkP2P
         QEkw==
X-Gm-Message-State: ABy/qLY7KOc1al2ycViqdWrMYMcXIAHA8FT+EwqpSWSdUgtHkmgYbI6f
        tsWr96oHpBfU8HcwQCVVlTWqEw==
X-Google-Smtp-Source: APBJJlEFZc2GAnLQ7Chh6jd7HJTFUIs3C1+QLUm3qcXM4djlWORHjq2OVwXgSuJWE+3KbN4PA5mQ5Q==
X-Received: by 2002:a17:906:778f:b0:994:3207:cde3 with SMTP id s15-20020a170906778f00b009943207cde3mr11143513ejm.49.1690205767468;
        Mon, 24 Jul 2023 06:36:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p24-20020a170906a01800b00992f2befcbcsm6764671ejy.180.2023.07.24.06.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:36:06 -0700 (PDT)
Message-ID: <68c371ed-f178-9d85-da31-4b5b894813cd@linaro.org>
Date:   Mon, 24 Jul 2023 15:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: Add gpio-line-names to PCA9532
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
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/07/2023 08:35, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> pca9532 supports up to 16 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

