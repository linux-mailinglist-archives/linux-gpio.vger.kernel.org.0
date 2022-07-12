Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2690571625
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 11:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbiGLJuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 05:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGLJuv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 05:50:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29CDAA75D
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 02:50:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id o7so13015973lfq.9
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FD4c+Hsdhye940ZDEYK0eytq3nanfYvmmstMbkyO/KM=;
        b=W5RHqZowOwhOPQ8/RfQ5YqvUbKKcnHpt1kN2nGQenjFAB7MhIu6m6uTfPb5Yhtb9nr
         2Ssyeg8syQRdCjW7HIPgT93IEwq0G1hrOYIcnhTCPeDoP1ca63AJAhCwoifaGxPWjfhd
         Ymxri9PDqT2yw67XsU7ZkgNGq4X7OgU/3ehn31khxdpwvyzMskIHAvFf3sMHE+bHxdo3
         MHOZs/U8BoXD0aF/3yCQH+1zll75Hk+j7zYlbjxsBM3H3LxauvjviWbrAaUbah1kuoyD
         Qm73s8514RSBUhflv1snfQ6184+nXJmHQ0CYIsbPxzBaMMd/ErBDJY5/FMjGO2SwU60y
         bOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FD4c+Hsdhye940ZDEYK0eytq3nanfYvmmstMbkyO/KM=;
        b=vt4E8oHDkVCN4LptQ2pn10qSfFzoEJdqODG/hMTgfVhO4Zxd2kprPMQTtD4fONr9pt
         wI7zUe0EIkBMcnxPYli7NIOvFqOvI721B8eD1R0HiVzwKFgdCzvW0zMaqORBl1ZS2sWJ
         C4nFEuupRJKK3pBR0LT+efrrleVxmwZVWFemD4NOXqDCbbZE23bwUY1BnJmksjcpNCMk
         6qZ13jDYij1CCqpFeBulY6uAb5mDlmrFsatzuzhtWYxvosztK9/QDo9pGCxcwDq1zTLz
         dZyy4DCO0Dc4aEGtvFA4D48o9Wl9oQ5U2EbpDz/8zf38ZW/YBK1BMuZugQFIE7oX6KQX
         nEAQ==
X-Gm-Message-State: AJIora9ktokJIzU9L2dNqP0r72vyeNPtr726PHzl3FVpxBGYXuxbr5gk
        +sWE/SgLGWo1Ol9ZRVVJXWisQQ==
X-Google-Smtp-Source: AGRyM1t3ZG+j0jDG56+HTVYdVe2y58DlRXCAYBUR6gEBaEULs+nKR0Ll1WKpTXs0nFfxRDUTyAcA1A==
X-Received: by 2002:a19:6b07:0:b0:489:c785:8dfc with SMTP id d7-20020a196b07000000b00489c7858dfcmr11265554lfa.268.1657619448133;
        Tue, 12 Jul 2022 02:50:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b004795bcfe953sm2080436lfr.214.2022.07.12.02.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:50:47 -0700 (PDT)
Message-ID: <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org>
Date:   Tue, 12 Jul 2022 11:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO
 driver
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, j.neuschaefer@gmx.net,
        zhengbin13@huawei.com
Cc:     openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220710102110.39748-1-tmaimon77@gmail.com>
 <20220710102110.39748-3-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710102110.39748-3-tmaimon77@gmail.com>
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

On 10/07/2022 12:21, Tomer Maimon wrote:
> Add pinctrl and GPIO controller driver support to Arbel BMC NPCM8XX SoC.
> 
> Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
> pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
> period time.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

(...)

> +
> +static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct npcm8xx_pinctrl *pctrl;
> +	int ret;
> +
> +	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> +	if (!pctrl)
> +		return -ENOMEM;
> +
> +	pctrl->dev = &pdev->dev;
> +	dev_set_drvdata(&pdev->dev, pctrl);
> +
> +	pctrl->gcr_regmap =
> +		syscon_regmap_lookup_by_compatible("nuvoton,npcm845-gcr");

No. Use property. By this patchset, I would expect that you learnt from
previous mistakes around this. Why repeating the same trouble second time?

> +	if (IS_ERR(pctrl->gcr_regmap)) {
> +		dev_err(pctrl->dev, "didn't find nuvoton,npcm845-gcr\n");
> +		return PTR_ERR(pctrl->gcr_regmap);
> +	}
> +
> +	ret = npcm8xx_gpio_of(pctrl);
> +	if (ret < 0) {
> +		dev_err(pctrl->dev, "Failed to gpio dt-binding %u\n", ret);
> +		return ret;
> +	}
> +
> +	pctrl->pctldev = devm_pinctrl_register(&pdev->dev,
> +					       &npcm8xx_pinctrl_desc, pctrl);
> +	if (IS_ERR(pctrl->pctldev)) {
> +		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
> +		return PTR_ERR(pctrl->pctldev);
> +	}
> +
> +	ret = npcm8xx_gpio_register(pctrl);
> +	if (ret < 0) {
> +		dev_err(pctrl->dev, "Failed to register gpio %u\n", ret);
> +		return ret;
> +	}
> +
> +	pr_info("npcm8xx Pinctrl driver probed\n");


No pr_ in devices. No success debug messages.

> +	return 0;
> +}
> +
> +static const struct of_device_id npcm8xx_pinctrl_match[] = {
> +	{ .compatible = "nuvoton,npcm845-pinctrl" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, npcm8xx_pinctrl_match);
> +
> +static struct platform_driver npcm8xx_pinctrl_driver = {
> +	.probe = npcm8xx_pinctrl_probe,
> +	.driver = {
> +		.name = "npcm8xx-pinctrl",
> +		.of_match_table = npcm8xx_pinctrl_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init npcm8xx_pinctrl_register(void)
> +{
> +	return platform_driver_register(&npcm8xx_pinctrl_driver);
> +}
> +arch_initcall(npcm8xx_pinctrl_register);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("tomer.maimon@nuvoton.com");
> +MODULE_DESCRIPTION("Nuvoton NPCM8XX Pinctrl and GPIO driver");


Best regards,
Krzysztof
