Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F006862D448
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 08:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239251AbiKQHms (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 02:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKQHmq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 02:42:46 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD399FF2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 23:42:45 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bs21so2245961wrb.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 23:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VA16fY+2+/rb78B5x6tufoywKtSkHGgIbk5ebnGo2rs=;
        b=OJzxFd7bblUa+FupRmm4JHhc0vhEMVbpYWJGbW0Jn8dfRuL6xI4lpuH1vAeuh7Wm4o
         l9ZK1cu6WUtS5eTAMdjZss2y8tpSBuhEhvJK+ZWWewykZ72ehBG0ZThLFDFOOaN77kWy
         bbxUFv6KTU14CRxaHxEQSpHvGWNPddUtqzO2rmv3orDlFmEkqW511cf4DrOcojLvlG9C
         GwLWR2nzO+ilUu9YwmOxdOGPFAvZRAjZ8mq98hYN30KJeWsmnfSyOG6Bjb+CSMAYDLef
         k2fMeTF9N6HEXBtuScxtLAch+eYd2nWh0HOQ3+Bebqx8N5UKKhs9cW7tVxcNH28Qm669
         dtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VA16fY+2+/rb78B5x6tufoywKtSkHGgIbk5ebnGo2rs=;
        b=Tz525XCUCYCkm6oh1uYXyj25cA9DQd5rVySoPDwYbrETEHysoZ6P9NdIzgGUk2c569
         8BzCyjFQiilxtIkWMiDgJHRiVVCXk42kt6tga0F7iXX8CcflBCaO0JHEgfkzfNocLiAp
         Tb2Terz5ZFSpW4bLYWbEP7Kl8glbpJxTM5tnIIpDuJLVY1ntZ/bUqsVXvZqSlXaW3YfC
         I21c5UlsuJFoqm3yPR6dtXQ48YOBenj/YG6O9HDYUGSpkUlv9ZU4ieJa9nOhcWoGquft
         joshLRe2/uqC5LBRJGKl9oPOe1+NOoNbyA1w/i4EhtBNHnKxJaA/XqG3dTsdyXXsJHVs
         YA/w==
X-Gm-Message-State: ANoB5pkcTcwwcuhnLjT5by6GTHWcdTsu43PY6Lbuah5ZEozEIuQG4H4v
        dQ6wlTgdq+QVhu3Ko9v010XIKQ==
X-Google-Smtp-Source: AA0mqf4cRm7pQ7Ht5NWwnxt61YOlL6KoE2EmHck4jwLCKmkZQ7OC8qxq79dJXLWxnA0z0KdC8AjlIA==
X-Received: by 2002:a05:6000:b:b0:236:5974:a5c7 with SMTP id h11-20020a056000000b00b002365974a5c7mr618349wrx.430.1668670964502;
        Wed, 16 Nov 2022 23:42:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b? ([2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b])
        by smtp.gmail.com with ESMTPSA id r10-20020adfce8a000000b00241b371d73esm179282wrn.77.2022.11.16.23.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 23:42:44 -0800 (PST)
Message-ID: <575758c9-6bc1-e980-4aba-b49cf9246d03@linaro.org>
Date:   Thu, 17 Nov 2022 08:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: qcom,pmic-gpio: document
 pmr735d
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-5-6338a2b4b241@linaro.org>
 <2ca3260e-f3f6-cd69-96c7-e971fa757968@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <2ca3260e-f3f6-cd69-96c7-e971fa757968@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/11/2022 12:17, Krzysztof Kozlowski wrote:
> On 16/11/2022 11:11, Neil Armstrong wrote:
>> Document compatible, pin count & pin names for pmr735d.
>>
> 
> Squash with previous.

I'll squash 5 into 4, can I keep your Reviewed-by on 4 ?

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 

