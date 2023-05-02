Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84AD06F3DE0
	for <lists+linux-gpio@lfdr.de>; Tue,  2 May 2023 08:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbjEBGyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 May 2023 02:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbjEBGxu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 May 2023 02:53:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1C540ED
        for <linux-gpio@vger.kernel.org>; Mon,  1 May 2023 23:53:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94eee951c70so545879166b.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 May 2023 23:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683010408; x=1685602408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHeZV5s0aJS1RPelh1kTeaQiablAxI/Yvtd0/g+FdXU=;
        b=eOXKa6uHdbsorztWW/6pbIcFsnns9Zov6NWocNT9koQq2Zdf0lhofeSh4PTiFnYf8Y
         MFKWsnCqfzp/HzZDjJQQkvdOCQvOjsPmqHolauAV5s5KUl1q04NOdJkpSmHx7XSPAED2
         hErM6Ds/jWOwH3srDt2WNG0mYF9x/R7xhIgQfxs2MOf31Fgj4BXfwQrl3xHd7mdRdwTb
         VKzWQo7Uhe34qzQdpzWPocGh59kt8mhmEkmR1vNwp17yYK51GIY7nhr3WMgi4QN2TTCA
         SpGvKglH26K+D4wFHuBiofiSyjb+ZMbwXUpX9jsTlG9C9w2KZtv/fX5nb2Hnrek/9pa0
         VIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010408; x=1685602408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHeZV5s0aJS1RPelh1kTeaQiablAxI/Yvtd0/g+FdXU=;
        b=LWQrC+fsJj89z4/54Mb7qBY8xmLSanrtR2dCQY/fuMKJCu40/4FLptLs3W9DgsuxvW
         fVwh9JJdRVmxztdIOklFzJ3rEDqy36zeFkiR+EgdEhlguZoeYqsLdk7K1eYsOeHzDzV1
         idh+ylmmOOLy71sVu1tc7gZpt4HFLC6tv+qiouz2UNjmucCvwKTYzJnjkXLshyQphkO3
         PZ3HMxlJXYzSlpdiLndSfmv66CbtA86D4EWQNxQIcgcmslFFeT1KtFp591nzKItH3iMN
         Uyx6GniljObwjXbsc+q89b8ulJzqdvPzVTi+9AlFXn8upBrewFtPBy6PeYh7am0puvkx
         lHEg==
X-Gm-Message-State: AC+VfDznxMSC/d0g+m9XtzBzRRg0yJXe0pEzmP+NLlfUrtVtP+roYTCJ
        c0tBvgiU91dBEndnBmS5lSfIV7l6N/VGT2oHZHs=
X-Google-Smtp-Source: ACHHUZ65Hxxd8UQokTDHAfyuDzRv1c1FjmN8IynUxrq4/8mGNWy3iJil0BDnPUZTN6xp0YQIxD63xw==
X-Received: by 2002:a17:907:7ea9:b0:931:df8d:113 with SMTP id qb41-20020a1709077ea900b00931df8d0113mr14442612ejc.26.1683010408003;
        Mon, 01 May 2023 23:53:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090648c500b008c16025b318sm15741327ejt.155.2023.05.01.23.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 23:53:27 -0700 (PDT)
Message-ID: <8b9545d7-2b59-cc58-2ff9-0c4c84ff3d15@linaro.org>
Date:   Tue, 2 May 2023 08:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: ds4520: Add ADI DS4520
Content-Language: en-US
To:     Okan Sahin <okan.sahin@analog.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230501230517.4491-1-okan.sahin@analog.com>
 <20230501230517.4491-2-okan.sahin@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501230517.4491-2-okan.sahin@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/05/2023 01:05, Okan Sahin wrote:
> Add ADI DS4520 devicetree document.
> 
> Signed-off-by: Okan Sahin <okan.sahin@analog.com>
> ---
>  .../bindings/gpio/adi,ds4520-gpio.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

