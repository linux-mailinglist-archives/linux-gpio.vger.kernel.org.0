Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067016EBEC6
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Apr 2023 12:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjDWK46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Apr 2023 06:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDWK45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Apr 2023 06:56:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E001A5
        for <linux-gpio@vger.kernel.org>; Sun, 23 Apr 2023 03:56:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94eee951c70so495342066b.3
        for <linux-gpio@vger.kernel.org>; Sun, 23 Apr 2023 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682247413; x=1684839413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oR2jR/vrQrziFbROxVUT6HuFzazoTPoyzPiYyzPDjw=;
        b=YuU5pZ4rylSTnFHqxKrtxfbLMtRr5pCPOA1Kj8sYWHb1r17/AbhUfdlGILUTToBoPZ
         5hID9s+VuUC92l0M8isB5Wo6q+u16K5iqtrT9WIEkAA9eRICAwSzkTbHjpB1AASC3RvQ
         rngvsUS3Z6r2KMarel6hjcK73KUTQnbQmpp8Rbtz/+Gq9XtEzBo70DIKbApDXlcsy3FC
         wMALGoKC+Es7XLoXSWiPSGn9/s/uvVLyO9ZzHbnWoz6vlCTJ3fHQy7ECVeI9V0CLvUB/
         yQ2epCEdNmSzQ5GXl8e20PFPUpwtwHQ0RYDwoJquMbWp+vWryI78HUBssdoN+Zi1P22A
         LcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682247413; x=1684839413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oR2jR/vrQrziFbROxVUT6HuFzazoTPoyzPiYyzPDjw=;
        b=X96yP6FZy1rkz7s26sGjIIFzciRXbFWuGCEEkFsWU7nPamFPY3uJawBP7pBzyHDvko
         2i27fk7NG3BkXLVbUMjw9lRVgQgTEtqZXivwBBSzKGTOq1K6cjdPRcWuw9E1mk8GY2ex
         7WVJtMFv9x6FwdqBLgyMC/WvjeKdh+faYWEXVjyX4A+86TctcoIUeNXxemTU8agDlh06
         dXgHIUtwOFsmCeHt2hNw6uoDY+RKAVKVB11D7dlMxhKo37/IFi+EqXAAIF9YDeEd+9qE
         pyHVwia4wN9lN0y/dwz4YQwFYMPVqSNJZBoPCZoWByeBqO3ssRNyBrrvAKGTYt0Napuc
         atMg==
X-Gm-Message-State: AAQBX9dmrEdRuMSB/s3Kf6RVKuf4iKBsqbqD7i9ze9agn4Ia86jkBUBe
        oEdf8GEci5U+Qw10L/f6E+SAUXLOVmtK1xH9l1ylmOcd
X-Google-Smtp-Source: AKy350YHSpjSlgKIvLCNAnY834ZVNfHVrLLNfGEV0BO2XWtwfYC20rtmNJ0pCR3RvoID5ybuxj2EIQ==
X-Received: by 2002:a17:907:10c2:b0:94e:aa8e:b56e with SMTP id rv2-20020a17090710c200b0094eaa8eb56emr7696516ejb.33.1682247413469;
        Sun, 23 Apr 2023 03:56:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5d52:d466:d57f:118c? ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id n20-20020aa7d054000000b004fc01b0aa55sm3677247edo.4.2023.04.23.03.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 03:56:53 -0700 (PDT)
Message-ID: <c0da0e22-eea4-a03b-672e-fd8a52d02f12@linaro.org>
Date:   Sun, 23 Apr 2023 12:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: add PM8953
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230421-pm8953-gpio-v1-0-3d33e2de47e3@z3ntu.xyz>
 <20230421-pm8953-gpio-v1-1-3d33e2de47e3@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421-pm8953-gpio-v1-1-3d33e2de47e3@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/04/2023 23:56, Luca Weiss wrote:
> Document the 8 GPIOs found on PM8953.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

