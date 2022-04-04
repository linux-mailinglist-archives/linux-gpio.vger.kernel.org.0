Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB63A4F1231
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 11:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354435AbiDDJlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 05:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354445AbiDDJlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 05:41:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFCA237C4
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 02:39:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ot30so8715629ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2022 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zYzeb2fJ8p/eCP3NXepXxEemb9cW6kn/EXiOBzgXQVQ=;
        b=H8xgB+BJ5DMDOo+xvvuAoWF2Sj0v/bgo7aoZ6bmGwIzSHN60ntXjscgQF/YDIrHjKK
         RtwS7kHeOI++OBryAEuN86dZI/oRTBI2sy88JZiOG+L8hhJBtKFDBG/gP1eg21Byy5G2
         7S2K/o2eBj+Liva6Vt6d3s4LivDZc8Ly5MhmzLLcPy5vHlynNc3urTliJLvoB6xbQMGu
         sPqOPOAIWIjzH8EMdnLyEYKSwcATH6yt7uJ58UOwomCF9RgQhGnoSE1Z2MVGQ5xkTJwQ
         Oo7rVPq2clTQXJ9ZzFzf1C5kZxwa5SGGZhaPMlkdVCqgvDHAgOAb9aNbw/tGo5QL24wP
         5Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zYzeb2fJ8p/eCP3NXepXxEemb9cW6kn/EXiOBzgXQVQ=;
        b=Bo0ziBasgMJjv6zsfOpl1cKJZ/mpDWHI7C0xJSqeO3OIUJFUsNAcEUcIac1m5Ir+b1
         7D7yYQt3/LomOn+eanvEFRaBUOptEzoo7j3SohDwNQPq0qaX2C6zr+hdAG6JXEz3BIML
         6Gj3+ho3z6dPh444X4xbJv5xbt2K6HCbdZnVFRpipUf+YuAoiRYP9yJshmIoylPw6Nm6
         RS8u1zT9Ql+8rK9rtU5jsfRyi69bUa9P3ohArEeEH/NhaVN9AswFBRcL7LURFVhKysxy
         Wv6/huo47U6ks6XCKtttY26eanK4T8oLMpGKdsgDdfgsBvizxvLqhrRO4PWCU7dKgCkP
         /zhg==
X-Gm-Message-State: AOAM531hwOq157pznvui8bq64HvcCYGOKmPsrB1t6I3tgk6lRtSugNlZ
        WrGeyyTszPmzJCl/YIDoRzeEnA==
X-Google-Smtp-Source: ABdhPJz0vxNya0f/EBPQIcDsfNm21sKQMPYumYWR9o99ZXh4kdxqUrZi3/2gLt1IjWwGNgi45LSBxQ==
X-Received: by 2002:a17:907:3d93:b0:6e7:4d22:75c8 with SMTP id he19-20020a1709073d9300b006e74d2275c8mr6462088ejc.330.1649065183902;
        Mon, 04 Apr 2022 02:39:43 -0700 (PDT)
Received: from [192.168.0.173] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id sb15-20020a1709076d8f00b006dfe4cda58fsm4092580ejc.95.2022.04.04.02.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 02:39:43 -0700 (PDT)
Message-ID: <30df2887-27d9-c207-4c69-9d5fe3b04777@linaro.org>
Date:   Mon, 4 Apr 2022 11:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx65
 support
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1649048650-14059-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649048650-14059-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649048650-14059-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/04/2022 07:04, Rohit Agarwal wrote:
> Add support for the PMX65 GPIO support to the Qualcomm PMIC GPIO
> binding.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
