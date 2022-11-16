Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E97962B7B6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237931AbiKPKV5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238536AbiKPKVp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:21:45 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA57E2A266
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:21:43 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z24so21229248ljn.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNYkjF7cIi2WXIqX+o3PaVqyosm8x14b3vi873t3URM=;
        b=PrBBxcpaIq9QbCbXU6+b/89ayTsdmGfZc2Cne1sHAuX5SkZ3m1Oi45qjPQoQfjikBu
         Lxkl8IHt1ppGz2d00PLLpDcWrC6oUdUtNI1c+572Wl0H4EFrX7I6pXQZa/poc5eHpT6u
         /oWECqNAfOpQUglISqLM6kprfujIuOc3WGOsEByOJXycT6PC2gCGwkwR2uSXYUAOXQL0
         aus9Frv0iZluSzYzRfivgTJzvWj7AYK2lRQjKMDcGKhAaW48oxCVXP+OIEUVigwVAC0G
         RKZt6VObjoTqul8o1Rwk8CVT65hm7QaWgwn6fzyfEOkFiCxRjeJQaSYnCvbc4+q/Y6IL
         kpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNYkjF7cIi2WXIqX+o3PaVqyosm8x14b3vi873t3URM=;
        b=H32EwaYR7YOk0DioQcjLMlNCrCGAbqq7mDjtKY5ur2dfPwMZBEWFys9XrHYzMNKf7q
         eyeHrsrtQcyhegbzD/DytnGesWQ8Cl22SmLvTTLDlrLFTQnduFtI9Ayu2WqZZq8XJ63N
         hbO7McT9ClzfvhfpHZfFnNAY48otUHdo3zlfltcq1skxN22JERun0JB8WlIJoXvcpPMy
         4kfAMV8fcxNM3X1SsXH6BJ8vSxvRdOLUivpGNYJdJ7UBHxdgMAb/TxlO1ECrBdA6n00s
         RN1ooRvVLf4xc3hGLCw8BUeDxQBFfHZpYkWLKhmSOCYDmct3dEwI4F5qGCVFSGr+YhLh
         Xj3A==
X-Gm-Message-State: ANoB5plebmwYbkir+MVVfgV7La0s9LAMNzjPyQ38k3quPkbzmX8Aq2sU
        9c+tDegd2M0LzdSjb/B0ZZ8BdA==
X-Google-Smtp-Source: AA0mqf6WiHA+cf5WsEyPBRjU2n0/9hgCHghs740KVI68+tpe111lxbUwTn+VCUfUcEvEQk3hH3Y7Wg==
X-Received: by 2002:a2e:a16e:0:b0:26d:295f:dfe7 with SMTP id u14-20020a2ea16e000000b0026d295fdfe7mr7702661ljl.70.1668594101793;
        Wed, 16 Nov 2022 02:21:41 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id r30-20020ac25a5e000000b00497a32e2576sm2526550lfn.32.2022.11.16.02.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:21:41 -0800 (PST)
Message-ID: <ecd5102e-92ee-7d97-8a19-51ef45b7ed1a@linaro.org>
Date:   Wed, 16 Nov 2022 11:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 6/7] pinctrl: qcom: spmi-gpio: add support for pm8550 gpio
 control
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
 <20221114-narmstrong-sm8550-upstream-spmi-v1-6-6338a2b4b241@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-6-6338a2b4b241@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 16/11/2022 11:11, Neil Armstrong wrote:
> Add support for the pm8550, pm8550b, pm8550ve, pm8550vs & pmk8550 gpio
> controllers providing GPIO control over SPMI.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 89695b5a2ce7..f758522d035e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1221,6 +1221,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>   	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
>   	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
>   	{ .compatible = "qcom,pm8450-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8550-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm8550b-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm8550ve-gpio", .data = (void *) 8 },
> +	{ .compatible = "qcom,pm8550vs-gpio", .data = (void *) 6 },
>   	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
>   	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
>   	/* pm8950 has 8 GPIOs with holes on 3 */
> @@ -1232,6 +1236,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>   	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
>   	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
>   	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
>   	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
>   	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
>   	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
> 
