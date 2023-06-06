Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCE87240AD
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 13:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbjFFLRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 07:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjFFLRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 07:17:43 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03ADEB1
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 04:17:42 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-97000a039b2so948222066b.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 04:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686050260; x=1688642260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=puWSxyEb8/Kw716+h9Vpnt9V9aCiUnXQS7Vne/6ny8Y=;
        b=rG6XJSNeW3aZCKyvUVceGTviLzac47fRGA/d2aezsBh3Qj9NGoPf2r4gUiZZNJYgc6
         A3zm1hUz33nzNFwFVpE+JoKF2Cn3JaJot1o+jrQiyZcuYbs+AmBWwwpVN4KCl9hHrSQs
         myr/Yl9QL5l5zNNM7gw4fccsvlW7BTo11y2YXfYq7Bvt8540RkRdnkRw00H9w4OV5UoV
         o76SZUG+NgdKKMwmAvtJO6+rBTRaYu8wozhDnsA3TL1c/hWEtA3Uo6V9bGvDe/IOJUo/
         RPvrLUoppR+UoaMt+LEsALwafN9v/USiJrhQiS309nK7LhoIu1C0p7vZzkcUy6lF9ply
         BSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686050260; x=1688642260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puWSxyEb8/Kw716+h9Vpnt9V9aCiUnXQS7Vne/6ny8Y=;
        b=jITsR/X6RwmMsZmqaBNwDo9bfa4r6O1mjm9WDjn2ZXBRBcVuXveZFfk9Ne08FmNQjl
         +RU5ciDzAbMZD9OxqyrpjcZpZcxjQEN0kTP/RXOq5Pcn2qgLY226JCA3TDlSSwT21D7t
         FcDuA5iRHGj4dyYqEx1eImnWfIWXZIi9CPWaCkXN5dU1vHE1Ikwy0LIBl2GHVJMsifA0
         ZW96Cs/NdpVELcD1GVqi7nVcf0Gddj2TBxY38A0yozgMXg41BmeggI0pefLIwV9ZhjaK
         hfKSCl5aa17DPkZPZJwiK7trzxN1by+lgAb+uT3CugpnYoy2H7DMec2ktOlBc76Hr8PZ
         GxWQ==
X-Gm-Message-State: AC+VfDwKnXjedoBiaH+lfz8gNuS+mlhonhh1BtJmd0dl62HrGJ4UyyZo
        F9RyQQgC/Psd8/dzB/Mv37zqlg==
X-Google-Smtp-Source: ACHHUZ5i7YgYO/xWZPq9YEpkGCBLgexJR2WSHXqHVhEbLQmTBSNPTCghveNnHHv5JmJLxeIAAa1g0w==
X-Received: by 2002:a17:907:6eaa:b0:94a:5819:5a2b with SMTP id sh42-20020a1709076eaa00b0094a58195a2bmr2706639ejc.33.1686050257590;
        Tue, 06 Jun 2023 04:17:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id sa25-20020a170906edb900b00965f98eefc1sm5342726ejb.116.2023.06.06.04.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:17:37 -0700 (PDT)
Message-ID: <1285e0d8-17ee-cb40-f188-31bd815b8054@linaro.org>
Date:   Tue, 6 Jun 2023 13:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Spelling
 s/curcuit/circuit/
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <linux@ew.tq-group.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ab68df6b056a3b381d1d53cf1502e814812c4f96.1686045675.git.geert+renesas@glider.be>
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

On 06/06/2023 12:01, Geert Uytterhoeven wrote:
> Fix misspellings of "circuit".
> 
> Fixes: c7239a3da1628767 ("dt-bindings: gpio: Add gpio-delay binding document")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

