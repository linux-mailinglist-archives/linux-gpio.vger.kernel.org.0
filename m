Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453394D9ADE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 13:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348152AbiCOMLR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348143AbiCOMLQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:11:16 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F443BBD8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:10:04 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B4833F4C1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647346203;
        bh=JrjI8ug5jiiOo2QQNMf6XXWRu9KsYWfIvga3TWL6z2s=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=E/YsfaS9VPu5v3Nzxzfpj8GDNlZJtiYRUzuNxx5kdmp+IttIP04ITnDivnrZk6Hmh
         LMdASBmMS/vI4wruhc33NaaoODMIkor1pV0KMeVoWIRZUb3VPp0bWXh2TV7uFgG/Z3
         WWcz0tkeoV7QzyP6UKw8EqU5kH//TXE6eGUj6UPyclKCOBTe7EZA9C5xCt/fDoNCaA
         eWLM4c5ZQPTLMHLS4g/6lhfhXfIgSLieJEwb4fQWgXEWYO3ae4d+3I2G1lQC0PSaq9
         4tTMx7CNuL/8Ks97MT2HTWF7RJAk+Qm7H1MR/Rx73UwiD1NJt78WZwrNEFwCDzbBxA
         lPi76oM18LuAg==
Received: by mail-ej1-f69.google.com with SMTP id hy9-20020a1709068a6900b006df68012720so391936ejc.14
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 05:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JrjI8ug5jiiOo2QQNMf6XXWRu9KsYWfIvga3TWL6z2s=;
        b=fGlmornWbpBUJDvKR+iM3w3wX5B895JRebYVhWsEi3WMpJ4YGLVRIoh7ReAyab1CbJ
         AfmEFpfmHnBYeEuCxxPxwVa7/6eOe0g6dNdlEXiO5PFI9IYE7+qXu8zSI3jSyYrmgupJ
         zPuw75Vf0ST9iB4qm9WCVMwA4x7nKHbTkyZf1iXM8TYX11mO9tgvzSwILBnbCKL6kJ6X
         shl5m31b+AjDBBfzubfAVblTFIHqxgy79xBYF/2tzsRljUZc5hss3INYVsTvUL/vbPXG
         HWDDdlMqIKtJW73PrOUM+SJBPD6O/WSUksbTtUoILiR7ovX4DM7iYJrgGOmLeK7B/zhw
         tRSw==
X-Gm-Message-State: AOAM532xQ7xa+DVERuONFR8yZjGvxxXGxlt+axqZjUcE0RnEx4HaWYyV
        prJczQPRJJ2gFPik1ZEgHYlSHWREtLZeyPopNdBfU9wYw/KhpssNOOBQkWY3bcqH8pRPO415hP0
        8c8TEMlJrIzRp5md11IQFXW5c5H5+sDTc7qjdnSI=
X-Received: by 2002:a05:6402:510b:b0:416:9d56:20e with SMTP id m11-20020a056402510b00b004169d56020emr24577127edd.264.1647346203112;
        Tue, 15 Mar 2022 05:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL5oVu+KdSTtII+FGRbWbojzGhHAKapgId7kloA1Hmcl7rJtub2yFInIrcLAwN8qHmmj/C5g==
X-Received: by 2002:a05:6402:510b:b0:416:9d56:20e with SMTP id m11-20020a056402510b00b004169d56020emr24577111edd.264.1647346202938;
        Tue, 15 Mar 2022 05:10:02 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906505600b006da7d71f25csm8018502ejk.41.2022.03.15.05.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 05:10:02 -0700 (PDT)
Message-ID: <06c80c97-c026-885c-5e69-0466d17d5930@canonical.com>
Date:   Tue, 15 Mar 2022 13:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] pinctrl: qcom-pmic-gpio: Add support for pm8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
 <49d116ad-c853-8c15-83fb-ec4e418323ef@canonical.com>
 <f345e709-afb3-6078-3a3c-87cafd79cbee@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <f345e709-afb3-6078-3a3c-87cafd79cbee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/03/2022 12:06, Dmitry Baryshkov wrote:
> On 15/03/2022 13:33, Krzysztof Kozlowski wrote:
>> On 15/03/2022 10:11, Dmitry Baryshkov wrote:
>>> PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Changes since v1:
>>>   - Added dt-bindings entry to the pinctrl/qcom,pmic-gpio.yaml
>>
>> This should be a separate patch.
> 
> Quoting Linus Wallej:
>  > I am fine with bindings being fixed in the same patch for this type
>  > of oneliners.
> 
> So, I added it to the same patch.

ok, then:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
