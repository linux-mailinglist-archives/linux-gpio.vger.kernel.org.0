Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5626155FC41
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 11:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbiF2Jmw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 05:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbiF2Jmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 05:42:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E51D3CFD2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 02:42:49 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id fd6so21368121edb.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YkE3fq4zHHBIP0Wimmvx31H6GwCLnjd0b8nNId/pgAQ=;
        b=QuRfOCE+32quNyaAzH4XZ5+6NP0OeyICUyCahTtqC9SIuCwCWP+ls5rhSLzF25hQNm
         ZYevxOnvYEERu8IiOvxUlYOHzr57odhPKxK/z3sY656otVWjt+vBWYHXlHwu9jMKnLlR
         N+HaLV3qIjqG3gj6cKImr4DI4NBU1vl1NLZlYEl4YibDcIIRBLOIcQQo5lhXizZFgRAq
         V9uhHl/2s0xYHeeMpL5E7d4nr/VwWr5fYeCWDQOEk43J9iIBOqLlxR+ESH6BqDuO+eTE
         ZIAaLLPEM1/Znrk8kf36h/vKiBnfRQRk2FUkXONaI8u68LlcB42wQl8X1TuTlxgyutlO
         0N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YkE3fq4zHHBIP0Wimmvx31H6GwCLnjd0b8nNId/pgAQ=;
        b=DSodUEM1f+Bc7GJnegcqUHg+ote4MVGtH0nsBhXf2ZwW6x3OXOu6Spigak+zDoBV3M
         hDnq7oHOsFuv7O7rDQHOKjFKWTZlXrazm37BoGeiGsKCwThJYQDzKBcjNFqzSLy3CP8h
         RBP/kWHW1INtx2uCSy6OZnDQ15KNXh4Nro7LhZj8M6Qwes7fXxPdCvPboayOCXiyuxHn
         pGn5+pTbUVry9VYbK1FYRd/kC7+sK703Ct4Zsz6x+Qbt+pZPpEVkvovBmEvwBzotzVnx
         X5g8KekLjoYObRw6sv/2yEPmiw+JeslXd9RyOBtm9dSsmYTazDoxl6ti8HUMnxi977np
         C+5A==
X-Gm-Message-State: AJIora/EPqzbuRClC2g5Xu0x3yE4eWyfq9zaUhg8SUAO5xhb/FPMOL2j
        LFHn1u3AXrRRjHWVqgbY2MXbfQ==
X-Google-Smtp-Source: AGRyM1th7zSm2UAkK9P7kdVf6GKnbozGBNJb2QDcxoG7pO6lf89xibAxe9obppcdSZpMv9MiCKSWJw==
X-Received: by 2002:a05:6402:400c:b0:437:d11f:f7d3 with SMTP id d12-20020a056402400c00b00437d11ff7d3mr3110664eda.256.1656495767900;
        Wed, 29 Jun 2022 02:42:47 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hx23-20020a170906847700b00722e84c3d44sm7467081ejc.118.2022.06.29.02.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:42:47 -0700 (PDT)
Message-ID: <56976554-ddfe-d1d8-59a0-d7a7dd17f375@linaro.org>
Date:   Wed, 29 Jun 2022 11:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add pinctrl driver for MSM8909
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
 <20220628145502.4158234-3-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628145502.4158234-3-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/06/2022 16:55, Stephan Gerhold wrote:
> Make it possible to control pins using the TLMM block in the MSM8909 SoC
> by adding the necessary definitions for GPIOs, groups and functions.
> 
> The driver is originally taken from the msm-4.9 release [1] from Qualcomm,
> but cleaned up significantly with several fixes and clarifications.
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LF.UM.8.7-22500-8x09.0/drivers/pinctrl/qcom/pinctrl-msm8909.c
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  drivers/pinctrl/qcom/Kconfig           |   8 +
>  drivers/pinctrl/qcom/Makefile          |   1 +
>  drivers/pinctrl/qcom/pinctrl-msm8909.c | 956 +++++++++++++++++++++++++

I did not validate actual numbers/pins, but the driver structure looks good.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
