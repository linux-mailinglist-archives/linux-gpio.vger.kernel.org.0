Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E95766D75
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 14:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236612AbjG1Mm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 08:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbjG1Mm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 08:42:28 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E66C35B5
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 05:42:12 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99357737980so297166966b.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548131; x=1691152931;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wCi53yHcnVelkBd6hT/VF5TdJVW3um80PjLdvIGj6bs=;
        b=eHdjlYsh5JXi5ufN+3xwN7X40sKpPqxv/QilPiTzcj0XoCrReImBLmIlZMjJaJW/2i
         La/Js5SVXFEbn+u3yvnJTkZNFgTnqzNxm8ebSi+54IchUvARoGnatC0UIozebp0H+eaX
         K1vd5o7U2BZ+FyVcz3xBtv4lffvQrfpRnyHj4Jfahvxp+MdN/oKc8QK/FF/jUVxoPkmZ
         3rOuZrRsQ3KBLQeysx78yq79SmjkomlgNCeZaj3ttDHFiJHdU9Vaarz0flhB1pCp99YU
         JfvBSjJeWb4fE2iDaFhWFQIAk5O58vxIQ2CmprjBXaP4RYUhuFIupNmWBBphvk7kErbV
         P8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548131; x=1691152931;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCi53yHcnVelkBd6hT/VF5TdJVW3um80PjLdvIGj6bs=;
        b=RcQq2RR9Nuyzd33ylac9w3Oke3TqC67bhbQTCY15bOsZ5kFDe76VmDOmvxmoy2G047
         DzTSaN6lGkxjAfubHdvH5QsoOU43G3pZNloenaHlidzNuzPEXjs+ma7mEWNlUrB/BeWj
         qhXaGZJRZGdXnAxXz4dai0vnDRc2362pb6v8fs5IotlA2Ap5ISRWtBoX7uFLzYE8ENKF
         aQFhiQdUPz/ye+kCeJzFlBKH7dVbfdtBWj4SSDEi1Wy6k10by+BnwinQ+HQchNgGBej8
         9b8iEN+Gd9GuugTO1HJWE0Rn7dQHGCfYLQn0rFo30NQn7Xc+KmQtXmCuc+M0aAw/8PnO
         fvoQ==
X-Gm-Message-State: ABy/qLaGNs36O52cZHC5Npehav9399BUra/xDRQ8rAIQrf77WT0mtVTu
        IWl4aG2VrwNRmbyFGXzNHNmUsw==
X-Google-Smtp-Source: APBJJlHbhWhKeW8b+LJZHu6aeOMO0ctTX5k8CVz7399HlMA+jFbY1PqveqrkrGEPjHbQamf+qUqBYQ==
X-Received: by 2002:a17:906:28e:b0:99b:dca9:5b8f with SMTP id 14-20020a170906028e00b0099bdca95b8fmr2132067ejf.56.1690548130943;
        Fri, 28 Jul 2023 05:42:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709067e0600b00992b66e54e9sm1998724ejr.214.2023.07.28.05.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:42:10 -0700 (PDT)
Message-ID: <0ecb57d9-de65-a38d-20f8-7f3df340498d@linaro.org>
Date:   Fri, 28 Jul 2023 14:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 21/50] dt-bindings: pinctrl: at91: add sam9x7
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230728102647.266359-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102647.266359-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/07/2023 12:26, Varshini Rajendran wrote:
> Add device tree binding for SAM9X7 pin controller.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt          | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

