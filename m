Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C226867C12F
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 00:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236242AbjAYXvv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 18:51:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236109AbjAYXvu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 18:51:50 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A102F5E523
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 15:51:48 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id m2so454393ejb.8
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 15:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9XT09mLl+WL75rONS6rQhpQoBUs7qqRw2NNTRg0O6k=;
        b=pv4WXCr+6wBryHfT+d4az9VDABrkTkr/Mt8wTrLz4zzuPgYQeBtq8MC+0DKEHWxG2K
         RXkUqhmbEuKLlBVVabiHUShGoLJb43VfnA/cW7KD+5kqJi3CqFyhVgVajS/qQ793gbQr
         fUghME+AK6AUVisJ0L4YwOtfzOMKU5yGby8OYkE34zuIdDrlZBR0Tvl2sLQ1HeFd3iMQ
         7a3ypqF6hBes157/Rlv766hpRo5jaX1wA1WgfMC+RQH3uFlusktqN5X9Bvke9/2VGuHR
         YRKEYqwIHEuGN64JjP3tYMKpOzgiEaRS0KZIjQk8zy84aQgNW31DAsZJW4K9+q+7CkmF
         SKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9XT09mLl+WL75rONS6rQhpQoBUs7qqRw2NNTRg0O6k=;
        b=4vVaZlPt/dRSoVzmf7iyuTLY2buvRQ30Fxha54kJT/1/jA2sRQw6SedioyQFBxmqSn
         GaLDUd4tFhFyEN3CNn5Fg6U62f8m1kYr3GSBOhv1LVKYIAaZZEHA9Yhc3Ta0AQf4h70X
         lFmtits/ylOQJjg4jZyq5EQIXfArpZl04cugYy/JHTILL+fojU8xw3cNZAtAI713nYxx
         42BD7/YrGdmRjNHjOdmU8ZzG9FKjFEyKrnBJV6utmn5YjJfv/oFICN2Q4WwNsLbLP49+
         zG+KvbmlFb69j1lSDa3kkscMROpeQb32MFWRyWlwg2J1XWChyzkRFJJ0EkeS5CqXhjhn
         PgPQ==
X-Gm-Message-State: AFqh2krFspbUpo6XzXLRFz0tDjDVTUZQNUWvVUEjx5HAgv4j6brqXYQn
        BzcCSdiwl9tCTokXAjsxf28B9w==
X-Google-Smtp-Source: AMrXdXtG7YeI2EgukM4aRVXZxZXYOEg+kNxLpQpBhdz1+oh0SF8iTmG7EotpsVLaqqWRhbrzJ8YTpw==
X-Received: by 2002:a17:906:4755:b0:877:6845:adda with SMTP id j21-20020a170906475500b008776845addamr29737120ejs.50.1674690707160;
        Wed, 25 Jan 2023 15:51:47 -0800 (PST)
Received: from [192.168.1.101] (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id x27-20020a1709060a5b00b0084debc351b3sm3035266ejf.20.2023.01.25.15.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 15:51:46 -0800 (PST)
Message-ID: <bd788bbd-bc62-4a16-994e-f7b527f58fe5@linaro.org>
Date:   Thu, 26 Jan 2023 00:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V1 4/8] pinctrl: qcom: Add IPQ9574 pinctrl driver
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230124141541.8290-1-quic_devipriy@quicinc.com>
 <20230124141541.8290-5-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230124141541.8290-5-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 24.01.2023 15:15, devi priya wrote:
> Add pinctrl definitions for the TLMM of IPQ9574
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
[...]

> +enum ipq9574_functions {
> +	msm_mux_atest_char,
> +	msm_mux_atest_char0,
> +	msm_mux_atest_char1,
> +	msm_mux_atest_char2,
> +	msm_mux_atest_char3,
> +	msm_mux_audio_pdm0,
> +	msm_mux_audio_pdm1,
> +	msm_mux_audio_pri,
> +	msm_mux_audio_sec,
> +	msm_mux_blsp0_spi,
> +	msm_mux_blsp0_uart,
> +	msm_mux_blsp1_i2c,
> +	msm_mux_blsp1_spi,
> +	msm_mux_blsp1_uart,
> +	msm_mux_blsp2_i2c,
> +	msm_mux_blsp2_spi,
> +	msm_mux_blsp2_uart,
> +	msm_mux_blsp3_i2c,
> +	msm_mux_blsp3_spi,
> +	msm_mux_blsp3_uart,
> +	msm_mux_blsp4_i2c,
> +	msm_mux_blsp4_spi,
> +	msm_mux_blsp4_uart,
> +	msm_mux_blsp5_i2c,
> +	msm_mux_blsp5_uart,
> +	msm_mux_cri_trng0,
> +	msm_mux_cri_trng1,
> +	msm_mux_cri_trng2,
> +	msm_mux_cri_trng3,
> +	msm_mux_cxc0,
> +	msm_mux_cxc1,
> +	msm_mux_dbg_out,
> +	msm_mux_dwc_ddrphy,
> +	msm_mux_gcc_plltest,
> +	msm_mux_gcc_tlmm,
> +	msm_mux_gpio,

> +	msm_mux_mac00,
> +	msm_mux_mac01,
> +	msm_mux_mac10,
> +	msm_mux_mac11,
msm_mux_mac?

> +	msm_mux_mdc,
> +	msm_mux_mdio,
> +	msm_mux_pcie0_clk,
> +	msm_mux_pcie0_wake,
> +	msm_mux_pcie1_clk,
> +	msm_mux_pcie1_wake,
> +	msm_mux_pcie2_clk,
> +	msm_mux_pcie2_wake,
> +	msm_mux_pcie3_clk,
> +	msm_mux_pcie3_wake,
> +	msm_mux_prng_rosc0,
> +	msm_mux_prng_rosc1,
> +	msm_mux_prng_rosc2,
> +	msm_mux_prng_rosc3,

> +	msm_mux_pta1_0,
> +	msm_mux_pta1_1,
> +	msm_mux_pta1_2,
> +	msm_mux_pta20,
> +	msm_mux_pta21,
msm_mux_pta?

> +	msm_mux_pwm00,
> +	msm_mux_pwm01,
> +	msm_mux_pwm02,
> +	msm_mux_pwm03,
> +	msm_mux_pwm04,
> +	msm_mux_pwm10,
> +	msm_mux_pwm11,
> +	msm_mux_pwm12,
> +	msm_mux_pwm13,
> +	msm_mux_pwm14,
> +	msm_mux_pwm20,
> +	msm_mux_pwm21,
> +	msm_mux_pwm22,
> +	msm_mux_pwm23,
> +	msm_mux_pwm24,
> +	msm_mux_pwm30,
> +	msm_mux_pwm31,
> +	msm_mux_pwm32,
> +	msm_mux_pwm33,
msm_mux_pwm?

[...]

> +
> +static const int ipq9574_reserved_gpios[] = {
> +	59, -1
> +};
We know it's necessary and it's good that you take care
of it, but it would be even nicer if you left a comment
explaining why the rx0/pwm23/qdss_tracedata_a gpio can
not be accessed and what it's used for.

Konrad 
> +
> +static const struct msm_pinctrl_soc_data ipq9574_pinctrl = {
> +	.pins = ipq9574_pins,
> +	.npins = ARRAY_SIZE(ipq9574_pins),
> +	.functions = ipq9574_functions,
> +	.nfunctions = ARRAY_SIZE(ipq9574_functions),
> +	.groups = ipq9574_groups,
> +	.ngroups = ARRAY_SIZE(ipq9574_groups),
> +	.reserved_gpios = ipq9574_reserved_gpios,
> +	.ngpios = 65,
> +};
> +
> +static int ipq9574_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return msm_pinctrl_probe(pdev, &ipq9574_pinctrl);
> +}
> +
> +static const struct of_device_id ipq9574_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,ipq9574-tlmm", },
> +	{ },
> +};
> +
> +static struct platform_driver ipq9574_pinctrl_driver = {
> +	.driver = {
> +		.name = "ipq9574-tlmm",
> +		.of_match_table = ipq9574_pinctrl_of_match,
> +	},
> +	.probe = ipq9574_pinctrl_probe,
> +	.remove = msm_pinctrl_remove,
> +};
> +
> +static int __init ipq9574_pinctrl_init(void)
> +{
> +	return platform_driver_register(&ipq9574_pinctrl_driver);
> +}
> +arch_initcall(ipq9574_pinctrl_init);
> +
> +static void __exit ipq9574_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&ipq9574_pinctrl_driver);
> +}
> +module_exit(ipq9574_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("QTI IPQ9574 TLMM driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, ipq9574_pinctrl_of_match);
