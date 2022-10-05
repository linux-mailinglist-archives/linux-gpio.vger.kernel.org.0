Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8E75F5682
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Oct 2022 16:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiJEOfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Oct 2022 10:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiJEOfN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2022 10:35:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9A827CD6
        for <linux-gpio@vger.kernel.org>; Wed,  5 Oct 2022 07:35:10 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q17so18938052lji.11
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2022 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=y1S8cIL/t+i/w+7ajcigJYXJl22/AGlTl26fkGAzMo0=;
        b=oCQhdCAgcuRM+QLekY2rE1uRXOutGsEz/oDwQkeMtLoLObAHWo3xYvt16/RK8/IocL
         6nuHfBvqOrs1ylZQxoe0X2ZBGzGq+wiV++XK3Q7/TdvDTDz2ysCjjBPYxo9jCKXzb4zp
         u+LfMS9Iv4h35ojbTwtj4G2XAg8w3F0RhFNodHvtXAGgAsCSshxnxefMrQBLPdF7Rzsk
         6mZICFjUq/pNhGT1guTu1dQdQIkPiyz1JH3HAiLBgwK9nrmI+s+wRdp1yKJxNnt+lA4k
         z0c8M1d+np202c8k/H5NRvLdMKmGXM/nY4waCe5xgOPBQAYPe0YqRKG5SjfJQOLViSqa
         UG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=y1S8cIL/t+i/w+7ajcigJYXJl22/AGlTl26fkGAzMo0=;
        b=7F4XQo2yoIiGmn/yiJxCiHJefEf8HUbu6ZtNOJwHLtxBSS0f1q1njy9M+KcsiC5Klz
         fBTj6J4oPI5AraAulxfB1K/AR93A0rKN/5Hd894VAH9GtmLpttIRS+H4lVJ5ZvZ4anPU
         tavfpuRzKWK+qtLR77icxW5mSs0/1AsvH+nuM8nIT8kKGodBC8YjoCojBWgsOZV0lSKE
         fLr7sdSkuE3Jk8qXpSMs3UGIN5Jk7PLN524WdemOp5Ogq2tPV8L7XO4YDq+DnYYqwLaW
         Xg5/oqLiEOxYmrBCdUCYiIXL+NldHkLvDlJjUhMBrcujQiFJDYsBZfvI3guu3/QM/6g8
         hZSA==
X-Gm-Message-State: ACrzQf0lh6HiddzkuQsaDG4n1dj0pWHJiFegt8h9ftTGq2/Kea7m/VSi
        2s/8Un2PhX/x8LD0dUwymsKU5g==
X-Google-Smtp-Source: AMsMyM5gYiTiPoFAcBIpGobzjv7RJqB4+ZzrpkW4wb0m+ybo3NYut8ulT8IwY1CdLtBif4rtJ5l+VQ==
X-Received: by 2002:a2e:81c7:0:b0:26d:d0a3:138c with SMTP id s7-20020a2e81c7000000b0026dd0a3138cmr5712799ljg.259.1664980509053;
        Wed, 05 Oct 2022 07:35:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m22-20020a056512115600b0048ae518364dsm2359728lfg.148.2022.10.05.07.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 07:35:08 -0700 (PDT)
Message-ID: <1ed91afd-74d2-1ab0-0d15-1b6e0dfba13b@linaro.org>
Date:   Wed, 5 Oct 2022 16:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 3/3] pinctrl: qcom: add sdm670 pinctrl
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221004215814.11694-1-mailingradian@gmail.com>
 <20221004215814.11694-4-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004215814.11694-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/10/2022 23:58, Richard Acayan wrote:
> The Snapdragon 670 has a Top-Level Mode Multiplexer (TLMM) for various
> features. Add a driver to support it.

(...)

> +
> +const int sdm670_reserved_gpios[] = {
> +	58, 59, 60, 61, 62, 63, 64, 69, 70, 71, 72, 73, 74, 104, -1
> +};
> +
> +static const struct msm_pinctrl_soc_data sdm670_pinctrl = {
> +	.pins = sdm670_pins,
> +	.npins = ARRAY_SIZE(sdm670_pins),
> +	.functions = sdm670_functions,
> +	.nfunctions = ARRAY_SIZE(sdm670_functions),
> +	.groups = sdm670_groups,
> +	.ngroups = ARRAY_SIZE(sdm670_groups),
> +	.ngpios = 151,
> +	.reserved_gpios = sdm670_reserved_gpios,
> +	.complement_fw_gpio_ranges = true,

This still fails to build... v6 was not compilable, v7 is still.

Best regards,
Krzysztof

