Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53FF0675BA7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 18:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjATRgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 12:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjATRgX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 12:36:23 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5273DBC2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 09:36:22 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso4255783wms.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/fkQZoxq2LVgdlP6o8ISAl67meRTQs6k6eGFoQcXV0=;
        b=uCouVft/678PMSeYh72dZ/cmQ3539Q08cQjJm8WroYp5AYxoK6xmyZqRQtw45k+W/u
         p7DriRVdL5+iW+h8R+Efz19EaHAQw3bx4FMZhk7hQX+nCYhus2AoNhdXi1ksfKRw7eiw
         9VT2bugfXsp/wXAu5h1gKUMc+F/X/oFgqYT3zSSVm2X5AeJ5SurJoSe6u4weoPtM3N4b
         7ygZ53czOGsCIEJ7DBvXPY7UdnDYutz6QLJLTpB+x2E3K0HEpN6QX17BBUN+mI1C0dvk
         QG5ywTxIG9eet9FsuMCqmb/m8LcrVOtj8eKYRS1slfReD6SB2JPK2jMWyAkSX+cq5Z7A
         eIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/fkQZoxq2LVgdlP6o8ISAl67meRTQs6k6eGFoQcXV0=;
        b=ZMvK4fvyvU63tiV4QSAtwLuKcXD7zqT/p+wpBkGOwTkbkjAemhZJeZkGzo1gNHttEv
         DfqiXKScJQxOliZfRGTbrtAJETDIpalWtRZuC5CY5H/1TeL26dO5HhcZmq76RlWcMlCf
         Gbg+zeDydYOQjDQKmchIYfZwXYy/794obzNnVrmJC6iH3m5/LXciT3eKQSFIQypGyQgA
         HE3ucOsfHCZHsOz83S+3yxkq+D3U0YUo6R4Mg94d6a/ruIH5DhWnFhGq/Qe3tWoA/em7
         VTnW57b7ldEGuol82gd3c3DNZ0JlslZM6zNxbcyd/y6D683f5bkhKszPESmP6e8v40Ba
         rPJA==
X-Gm-Message-State: AFqh2ko4rskJUk8X7P1fc+WmITsCmRT5Q9bcltPNJds06TZbXsTQxFLF
        hXLWbsxBAFqQlEQpas/Y8spLxQ==
X-Google-Smtp-Source: AMrXdXsFwzzGIEstO3SnHULQxXF4eMZtD91tPjdYdhdv27AoHRcOCQEwd+woViZIHj7JJnRNA8pmRg==
X-Received: by 2002:a05:600c:22c6:b0:3da:fc30:bfc5 with SMTP id 6-20020a05600c22c600b003dafc30bfc5mr15185468wmg.13.1674236181384;
        Fri, 20 Jan 2023 09:36:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b002425be3c9e2sm35660830wrt.60.2023.01.20.09.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 09:36:20 -0800 (PST)
Message-ID: <c643747e-accb-c7af-a4f9-5cf8feb2075a@linaro.org>
Date:   Fri, 20 Jan 2023 18:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp"
 child node names to "-pins$"
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230120165103.1278852-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120165103.1278852-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/01/2023 17:51, Rob Herring wrote:
> Just 'mpp' is a bit ambiguous for a pattern as it allows any prefix or
> suffix. Change the node name pattern to "-pins$" to align with other
> Qualcomm pinctrl bindings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Use "-pins$" for pattern instead
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

