Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB63F7202E0
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 15:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235865AbjFBNPG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 09:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236140AbjFBNO7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 09:14:59 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E573E49
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 06:14:38 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9741caaf9d4so288812266b.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711650; x=1688303650;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NM7E2bhPISEHbBlp1H32wp1Q4VWvkt2UL0EOlnHQmhw=;
        b=EMRhYGqE0xvmt/e3UTWvucXGuihMx3qxy93kVgcdl0JaBC6zfPxxlaYtyG7CwUnPK2
         IsW2bmeGb79p0HFI+crVf0iOrCWPNAhG9UOuCkjRL6BvZMYjr/Hb6lCCCG4v61L2/ewA
         xb1is/o+4n4jOMiVzInw5czw6lMNOK3tQkbgv9IpldCx0bcp5AtRNXpC2l00j5Fu/1/e
         EGbvr+JPC2XX+1gjobhAKXk1sIQW8c9CWk7dFN5jEWVCLQrDTF5BZOw5TUmxEYP9FbFv
         7FN1w7pWbEwKqAebcSuJPJMmRFC5mN6YtIm0uKG95FNaYi5DuTPFC57WclQSrrJ2bh8H
         fgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711650; x=1688303650;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NM7E2bhPISEHbBlp1H32wp1Q4VWvkt2UL0EOlnHQmhw=;
        b=K3k5j0hqW6NZ0rzhVzdtFoYoKSQUOhitmJPqGxvGkKiRDDK/B5OVbd6weZxttvJQEu
         qbjYLRlgl66G2LYoOgMOUXDlwGaJ8APBO4mMunEasjMYaYFCuNwZ/xnpVDNyIIjKyMGk
         0qA7NxyL4n1MEeekTJnfCJUsbE25HZe+3cH6crVmhFnLqkr0E4qWYPC3GVKEbWjVkRqG
         AKSJK0lhiaX9k1AImRiJbaKyAs8UHEETduBFC9JylA2oGYLi20isQyzjo4X4NrdvzF2r
         qGY9I/dmu+KgVfFS0AD+jzISvlgBK9+18/bOv8CvFMXS/HteNfQnSlz2ICGASSlaVqxd
         jj7g==
X-Gm-Message-State: AC+VfDw16grudZhVQQs3KtILkEWm7XiYddsF0pHkVyJ6EVB8/Jy6GxhB
        UOXKi3AHvUBnvWLj60FsAP/Xjw==
X-Google-Smtp-Source: ACHHUZ4uIIsfu5hfYvBBUXo02QYm4Gt9O+H37x3tBrXc8NtwSrPZ6PnJax9nm8arEBESNAAtPajQbQ==
X-Received: by 2002:a17:906:fe43:b0:973:e69d:c720 with SMTP id wz3-20020a170906fe4300b00973e69dc720mr10021680ejb.51.1685711650410;
        Fri, 02 Jun 2023 06:14:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id bi1-20020a170906a24100b009664cdb3fc5sm737006ejb.138.2023.06.02.06.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:14:09 -0700 (PDT)
Message-ID: <de4aa846-c609-b0c3-a04a-2ad5ffaec815@linaro.org>
Date:   Fri, 2 Jun 2023 15:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 03/11] dt-bindings: stm32: add st,stm32mp25-syscfg
 compatible for syscon
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-4-alexandre.torgue@foss.st.com>
Content-Language: en-US
In-Reply-To: <20230529162034.20481-4-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Resending as my previous email probably got lost. If you got it twice,
apologies.

On 29/05/2023 18:20, Alexandre Torgue wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Add the new syscon compatible for STM32MP25 syscfg = "st,stm32mp25-syscfg".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index ad8e51aa01b0..9ed5b121cea9 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -16,6 +16,7 @@ properties:
>        - items:
>            - enum:
>                - st,stm32mp157-syscfg
> +              - st,stm32mp25-syscfg

You should rather keep some (alphabetical?) order.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

