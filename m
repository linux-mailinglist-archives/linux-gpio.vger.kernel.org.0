Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F45261E15E
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Nov 2022 10:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiKFJnp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Nov 2022 04:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiKFJno (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2022 04:43:44 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F527DF69
        for <linux-gpio@vger.kernel.org>; Sun,  6 Nov 2022 01:43:43 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so12990418lfb.13
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2022 01:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3uoZ8eg/BvFs8rs7FPp0J3kaSE2I30G0Ccj5oJr1j0=;
        b=JhCFu/aUzf0W6T5ML6C7E94GeMV8WaJYKN5uI7XxEQ1qKbP9iZx2yKA3gdoRXBUY2z
         G/fWgv2s4UwsyGK+b+YcsLB+TAb3J1498wTMjElMK1w0V7u5IGc5N59aYO4LhWPBjbV/
         ymHpL33lLG9uCKa53lE6Zh9bK1bWlQsaKoVrdL9ypsbPvHgqBAqRyetcyUHSO7pxTfzU
         WIyxSazI18dj4uWtsregYMTY+05XvBnHJTNwAV39HzjU3XbY77N85RcCsLIinP5fcuPh
         B7ovO/lRaOKsrPsTB9JqRK9QDYeFygiIRitdN8uZZGDxL3F6NoxTK6nnEbwdb7Wl8t97
         bVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3uoZ8eg/BvFs8rs7FPp0J3kaSE2I30G0Ccj5oJr1j0=;
        b=J/BCIcxRwOTvwFd+jxSuUb5VqxTWz6jobpgn9HKOO/C7BsgxzDT4Kk3GXLuSUTLjMo
         cyR61vne/6CKoN6ywCwM1AwPdpp/AYtTpho7C/avlnq2sclzismzQVHkzd6o5KTBazPt
         MUBtoVpkTnTMRJm/eX0XN64h7xmwpJOQasdvXeQhT3ymPsDTcD2G3GmVXAW3enxFKXei
         bGAK8QNZEdu2enxnAv678Y4Gha8lYbfLrW4xiV0KpwUzBGcABP3Ay5l+nGMPuUOlVsqI
         /r4Fk0qyULbevrvtf30yb79g1piljW7dOEqbr73u7OHkxSmZMGaIUU5YmWeqrj9wTfT8
         Zjsw==
X-Gm-Message-State: ACrzQf03shS4emhOEHWYi1eD69fRP0tb4KOJy8vtfzjElIV6vaErIdbn
        kkfckr3LOrAAvvGdpGXFWs+y3Q==
X-Google-Smtp-Source: AMsMyM6yFiVzkAiG6SuBOtUyuRrODZlYhfqyISkrKpHDvrih18jZcYBcgFsRYtxM2rvLqfCkOewXRg==
X-Received: by 2002:ac2:4c47:0:b0:4a2:c07b:4b62 with SMTP id o7-20020ac24c47000000b004a2c07b4b62mr15311753lfk.426.1667727792787;
        Sun, 06 Nov 2022 01:43:12 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id be13-20020a056512250d00b004a8b9c68735sm628148lfb.102.2022.11.06.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:43:12 -0800 (PST)
Message-ID: <143bcd9f-b4af-2651-4f5f-752912b553e1@linaro.org>
Date:   Sun, 6 Nov 2022 10:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/6] dt-bindings: pinctrl: mt7986: add generic
 bias-pull* support
Content-Language: en-US
To:     Frank Wunderlich <linux@fw-web.de>,
        linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Sam Shih <sam.shih@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221106080114.7426-1-linux@fw-web.de>
 <20221106080114.7426-4-linux@fw-web.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221106080114.7426-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/11/2022 09:01, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Since the bias-pull-{up,down} attribute already defines in pinctrl driver
> of mediatek MT7986 SoC, this patch updates bindings to support mediatek
> common bias-pull* function.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

