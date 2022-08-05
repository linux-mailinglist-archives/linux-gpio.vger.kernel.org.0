Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C0058A633
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 08:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239940AbiHEGz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 02:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239844AbiHEGzy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 02:55:54 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5857D5D0FC
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 23:55:52 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bx38so2082860ljb.10
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2022 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I57ng/u5C1q/ButzmRr4LeG/YxB0kyQnv+AhtQ/3vDo=;
        b=YZhPWqkrcL8ONS/J5HPcUZXcUimJiKomFmvEB82+f1+0EbHL/oZmsMh10DRA+Wrt8S
         7j27qhZLgt38tGhLFTna2UNqfLLM9ikKMdBfPTuQPmyobWAlZ/Rvg3bwjPp+v1pTKkvr
         vNqWL3z3i8/5OTU4lt5lixlOI1WMgHrNdbm7G7nyoa2lbz89sT4b77YVjW1U2gaNrjp3
         Q+m7raPgnA7OuUq01eI5N4RLJk/VeTMz+B9+F2HJDuUOoHDfZCrsG1rERjePKjgr/333
         Z4NbkQr4MjwXfGNWT5KEYKQ+Z+1klRR8FmosWSE9enouDKTCCCG+AlMmCEjmoHJZNys0
         60MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I57ng/u5C1q/ButzmRr4LeG/YxB0kyQnv+AhtQ/3vDo=;
        b=ZdrQYxls0MdwfZRupG10HgeT2qzGZuN0UyujnT00FhVPuY3XA9JrhcM8alFDZUim9s
         iU3NJzvYPV0AvNxH/GD6aKlBkUdIfxbVglw1SV28PJw5wekNT6k5RRHGJ6V9MAhWHWFn
         KaeKhxZ2QZ3vwgLOLV5xYq1TCN9oyr60lHliHrpt2h99aksuuU6Um7u8Kt31M2+SO+a2
         Eq7a9BJRiQPiJFwgNAX+Y+Ce3jfsfCRJm0rNPSg1onp7YuDqzku+UOXO5Z6aJ4OX/8Rv
         HKIbF07Jujhiye7JI2m3cI8pvNVzBKFX2EhqH030/whtvhyTL0ZvjMKJiNTIm/L4Wale
         bojw==
X-Gm-Message-State: ACgBeo2kvxob0k05jNsjM6qJzpOLVxTfdoXg9Wk3AtsmfV+XzwhjIlJd
        vs0j8kUM+lHpLdoOC2DcPQZ3Jw==
X-Google-Smtp-Source: AA6agR7sKldYfGNUSXBxkNcLVOys2HTK77ZAmS+Qkt1U+tsgEheYMcboEg7XE07Wt1gTlZAdYGKILg==
X-Received: by 2002:a2e:a26e:0:b0:25e:55af:ebd9 with SMTP id k14-20020a2ea26e000000b0025e55afebd9mr1569822ljm.28.1659682550750;
        Thu, 04 Aug 2022 23:55:50 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id g17-20020a0565123b9100b0048b033e10b4sm366330lfv.54.2022.08.04.23.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 23:55:49 -0700 (PDT)
Message-ID: <e75a09d1-d4b5-628e-e257-911f7d0f7097@linaro.org>
Date:   Fri, 5 Aug 2022 08:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/3] dt-bindings: gpio: Add imx-scu gpio driver
 bindings
Content-Language: en-US
To:     Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220804184908.470216-1-shenwei.wang@nxp.com>
 <20220804184908.470216-2-shenwei.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804184908.470216-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/08/2022 20:49, Shenwei Wang wrote:
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8-scu-gpio
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@scu {

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof
