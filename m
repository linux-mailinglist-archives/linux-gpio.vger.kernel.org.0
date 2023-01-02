Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C4565AF86
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jan 2023 11:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjABK0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Jan 2023 05:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjABK0J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jan 2023 05:26:09 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B646DB9
        for <linux-gpio@vger.kernel.org>; Mon,  2 Jan 2023 02:26:08 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id z16so9458602wrw.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jan 2023 02:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=klbiEBnb9PJZJ+10dcr5TSev634cP5cWYPID/HX5Ikw=;
        b=rx+XMqGJ2We7kpPFKmBPtnzOdzqEJpNhnF8TqFKn4sKX4kPm3Yb3v+14LTwzh+tZ1n
         lmJQilcyPc30NiZVXRHoWBw+qHUQeGk5cQLqLWNfINDr09hSqDAsIbA0WGLb8maXl+xV
         k0O3F4vVQck6Zbb+AuZI06FagPgUm+qPQBGKureVU2zHCveTYQMJBnPvyPioQLqbMF+A
         2xUAXGzncdHYKr/kfKV2xBoi/z0f9vsysKYnp+CBIngO7gRq5wU3+qm86/FVgGOjctAh
         o+iq88c7rctOIgP3zILMRS8EQfi2GG6GPSX2diL41S/JrAJjOhFmdZhwyoS+RryoNfTj
         Idsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klbiEBnb9PJZJ+10dcr5TSev634cP5cWYPID/HX5Ikw=;
        b=czuMiAVO0ZbivXnfsxhbXwJyAS0YWIXBtFLDKsA3/vfJIdxKLPp4ncgIiE57kPLGnv
         0bul+Xtrb7L9klUlfxfUkw5saOC6RqDI9E3PuSNt/pfscDdc5/X/wpEuPTSRG4tHpnJm
         vEGhWq5KyhAobMs1cuXv83M0J5TXwaygbIBi4+hK7YtwPe6Hby07opLCmNSU5tsH5Pcx
         a5hsoQmHn4Tga6RDs08UxkVd/c+IULZ/kWkCjr5sG/WHbIWxpHPuR2LmXR1DM3hbdcki
         edPE62ppDY0z7WEKia746POQgk+E6HOdsLux7ppfXjV2HLaWq7liNDa05mpouKZ73Tbc
         Dt7Q==
X-Gm-Message-State: AFqh2kqsse/y48oWamn/+DYR45HoLl4aLoFDX1RoRTOe0LKDuGQrDNsO
        Ndm4ltVyUUqXR9ePx3uSz3Ee/Q==
X-Google-Smtp-Source: AMrXdXtR7+gX1VjaXPb90uofXVs5xk8bBBBbjhrySBlC+cYkE+LctZl3OEJFMzJZFzK2svnx8F4SDA==
X-Received: by 2002:adf:fa84:0:b0:28b:ca44:641f with SMTP id h4-20020adffa84000000b0028bca44641fmr8261901wrr.30.1672655167013;
        Mon, 02 Jan 2023 02:26:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4f32:f70:35be:acf9? ([2a01:e0a:982:cbb0:4f32:f70:35be:acf9])
        by smtp.gmail.com with ESMTPSA id s18-20020adfdb12000000b00241fde8fe04sm28448546wri.7.2023.01.02.02.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 02:26:06 -0800 (PST)
Message-ID: <7d734710-51dc-333f-84b8-9d9c8a76975b@linaro.org>
Date:   Mon, 2 Jan 2023 11:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/3] qcom: add support for SPMI PMICs found on SM8550
 platforms
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/11/2022 09:24, Neil Armstrong wrote:
> The SM8550 based platforms sports a bunch of new PMICs:
> - pm8550
> - pm8550b
> - pm8550ve
> - pm8550vs
> - pmk8550
> - pmr735d
> - pm8010
> 
> With GPIO support on:
> - pm8550
> - pm8550b
> - pm8550ve
> - pm8550vs
> - pmk8550
> - pmr735d
> 
> This documents bindings for those SPMI PMIC and adds compatible in the
> PMIC pinctrl driver for GPIO support.
> 
> To: Andy Gross <agross@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@somainline.org>
> To: Lee Jones <lee@kernel.org>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ---
> Changes in v2:
> - Squashed patch 3 & 2 into 1, added Reviewed-by from Krzysztof
> - Squashed patch 5 into 4, added Reviewed-by from Krzysztof
> - Squashed patch 7 into 6, added Reviewed-by from Konrad
> - Link to v1: https://lore.kernel.org/r/20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org
> 
> ---
> Neil Armstrong (3):
>        dt-bindings: mfd: qcom,spmi-pmic: document pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550, pm8010 & pmr735d
>        dt-bindings: pinctrl: qcom,pmic-gpio: document pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550 & pmr735d
>        pinctrl: qcom: spmi-gpio: add support for pm8550 & pmr735d gpio control
> 
>   .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        |  7 +++++++
>   .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml    | 18 ++++++++++++++++++
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c               |  6 ++++++
>   3 files changed, 31 insertions(+)
> ---
> base-commit: 8274e19d9db1019f8fac39cf46da6680513fd5d3
> change-id: 20221114-narmstrong-sm8550-upstream-spmi-d2c999ec5dc1
> 
> Best regards,

Gentle ping,

Thanks,
Neil
