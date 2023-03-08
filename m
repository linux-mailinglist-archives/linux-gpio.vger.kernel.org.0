Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF08D6B087F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 14:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjCHNUb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 08:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbjCHNUF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 08:20:05 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A766B38B50
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 05:16:22 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id da10so65637031edb.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 05:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678281377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKhRGeYiMtrIvPOSKbF8ADn+p/h16wF2cLPgk7JaFfs=;
        b=amiD6dJli4aYlZfKmeodUpS/kJhhulzhPrE5TbdTW6VWiHCIlKegOrwADf4mYJoSWF
         c7KYDD8GtZkrwdwyZAI427dxoYmTvTD1I4YVaSzuBtLImPhLyu1pzNy7Ki859i1xCQ/A
         SmwRKL1Yr2a5HJltg3uN1l7bMp0jCEJ1ZkWXLXC366B3yXgk6C/gGERp9xB/ywXfx4dL
         sahVZuJsdjtHhuTbv8pjZXWZkwuKdC3cXLTgq0k5yy3SAQOGxD842JGCvNHBHJJFqFhW
         /0l/zvgdbLLpxomHMXlNmAsckYUUOeGkiDIhZNH5OhfNlJ3ZS2ui0/Wlsg0e9j5HTDYe
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678281377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKhRGeYiMtrIvPOSKbF8ADn+p/h16wF2cLPgk7JaFfs=;
        b=WFdaObhijC0ImlC8qubRLjyquhfk1TZXnc5OJGhtNGe9yCoxABwiNHakgDxn42zOdA
         mPuPaIYxpIv/cmOS///ZTQa69aY7wkfXr545eyE6f5S1wmbk3G2rSi44T//Unf3zU6Ac
         NXyP+LfnN85p5L4kgPCbScLh7qxXrnO0NueScfJf/uZ85GifFixo70DrxWAhn69WtiSM
         NBEyLgxXjalD+FIAHfNNFjr4u0EgsP88NnfpuVJ3ZTnsWvSxPKPoh6DcAkJjh/pAo2n9
         Hca5xBVwQGndN+bsxMA00rt8HXy7l5G0FTnz56wZzU18ioWToGBS5rqbdGQHMhgajk5M
         a2EA==
X-Gm-Message-State: AO0yUKVgo8eoKu55RBsgd+54hEbrUfx0fHMKemk3cj3n9VUjf56peVgS
        VDZ4xfTl2yKkicspdOIpHtA76Q==
X-Google-Smtp-Source: AK7set/BUttjKBT8na2FT9FF3nX1prnTe9lS4QdGM6JI3QDa3XnMPbcI/tclVrs4UbqWYDdCogXtvw==
X-Received: by 2002:a17:907:c24:b0:8aa:bf48:aae1 with SMTP id ga36-20020a1709070c2400b008aabf48aae1mr24948653ejc.6.1678281377265;
        Wed, 08 Mar 2023 05:16:17 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id ca5-20020a170906a3c500b008bc2c2134c5sm7481072ejb.216.2023.03.08.05.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 05:16:16 -0800 (PST)
Message-ID: <4404869f-5e5f-e53b-f370-357d4055cb47@linaro.org>
Date:   Wed, 8 Mar 2023 14:16:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: tegra234
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     smangipudi@nvidia.com
References: <20230308114432.27133-1-pshete@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308114432.27133-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/03/2023 12:44, Prathamesh Shete wrote:
> Add DT binding doc for Tegra234 pinmux driver.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 

I don't see my concerns addressed. You replied to me today, I gave you
response and then (or shortly before) you sent v2.

That's not how it works.

Address the concerns.

Best regards,
Krzysztof

