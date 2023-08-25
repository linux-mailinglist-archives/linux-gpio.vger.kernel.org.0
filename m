Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8990E787FBF
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 08:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236829AbjHYGWB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 02:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239199AbjHYGV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 02:21:28 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280521FED
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 23:21:20 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52a1132b685so892945a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 23:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692944478; x=1693549278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBxnZfv7/cH1hRB0BhsWxJRlKySChDxPip0EzQICdP8=;
        b=v8kdgE5e4XH4nsipzfMsATjh5Oy01RtVCq5xvJd2GoQII71ClGbkLd02yu5J94HcPy
         rnw71C8Itn6w/02FswZ2Ivsa0N3dQ9Ofwtx//vFtHG6ULEv2luOQvVwrGMcOBQdDsSzw
         qvSoC1uwYBfgyLfdAWwhkqf3eMe6SR6jZp874Bq6AXit3XFsYpbmEBrfiZrR3yDKQ9Hp
         vt91MnKjP/yw81XJq5rYLvySUtmQNeoTrltEr1zba0DpqGiC67BI7Ru5OmYh2NdRNPkX
         ZLy/vybV98yylUYcKNJH97/3qKdICWKeqm5MWMvAd5fGIuwY2BrecWUErSUQF9TOUTim
         47VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692944478; x=1693549278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBxnZfv7/cH1hRB0BhsWxJRlKySChDxPip0EzQICdP8=;
        b=g68paPPs67mn6gMdlCFg59UqS/iKXF5MJnEhrE8JT0Hf4R2AFqljPsFeYio9b/9bqI
         W6CepO1d1ogZ7o+T01bzJMPAXiBnvIz8s5etvFFkYiCi2Fn1lbDDrWPl0gsIj7NbPbAe
         9cwjtWkEIk/DQYkf4ozQab/579WQw8HeNGgM1kOlGRg1nneKtfEWDmzsxL5sM46JEvom
         3NyZsCH7kK7fsTDtPyNVgvpdHXw3nj9FNgiN4lWb2qocz6ghQ2bRt/D/Sr0ma3cD1aRy
         JPjaTz+d5WUCFqFjieFEvlp4D2WtmH+8gZ3KiAzILVDjNQsc+IVGpF5tnNfqTVfa7RgF
         BZ+g==
X-Gm-Message-State: AOJu0Yyzv1obOup7OFV/6yMrhiMS9zBSQRe1k/wwGfpq7Fxfi1nf422j
        kJEapjjEAeO6PNh042cUL04v0A==
X-Google-Smtp-Source: AGHT+IFljUSTpwe44zryqFCU44Zs/vd81YaW0Y2DPrJTJb8DDeiQwlMm6Xs2N4hra1eh0QlpLazdiA==
X-Received: by 2002:a17:906:3ca1:b0:9a1:891b:6eed with SMTP id b1-20020a1709063ca100b009a1891b6eedmr10694918ejh.76.1692944478566;
        Thu, 24 Aug 2023 23:21:18 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id re4-20020a170906d8c400b009930042510csm570386ejb.222.2023.08.24.23.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 23:21:18 -0700 (PDT)
Message-ID: <eb951323-d896-5ab9-e477-7dd412af58e5@linaro.org>
Date:   Fri, 25 Aug 2023 08:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] dt-bindings: gpio: pca95xx: document new tca9538 chip
Content-Language: en-US
To:     Liam Beguin <liambeguin@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20230824-tca9538-v1-0-ee3bf2065065@gmail.com>
 <20230824-tca9538-v1-2-ee3bf2065065@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824-tca9538-v1-2-ee3bf2065065@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/08/2023 01:16, Liam Beguin wrote:
> The previous patch added support for this chip. 

This is not needed. If by any chance this would go via different trees,
it would stop to make any sense.

Also, is wrong. Bindings come *always* before the users.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

