Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86EDE67B0DF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbjAYLO4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbjAYLO1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:14:27 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3F7582B8
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:14:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o17-20020a05600c511100b003db021ef437so1017407wms.4
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wejdOLs59m4/7efD+ZoqO+DCHMNBKyyQYGkCW8Bk9c=;
        b=zZV+TNnKIq14J/EJBQB8+nZwpanYv/Djpn9z23TFFmaWBR/HCRNwZaigXdq5nLeLM8
         mUHu/26N/jFqVw7q6mZ5JHtYplCHu+q+YkKzaZD4/FIlKsUjo3JV4RsyfTedNBXrhaEn
         2RvCFMm/JXTsHUb85DyhA95jt7ML/s0adraztfmRePkTPjbo7z5q/iB3KyZsKmIbH+dj
         FNCcYQp3j8LWdluRDOO5HOV/l9mG/hCMWTkf40mCvHzAJg1+g+qSdZIMAlH2orna09Si
         oFLjgu/sVFMWnc6m8QAuS8pvpJdtzR0BWRnUoa162+oSIt8GZK4GlL1Qe/QkfeQucatd
         ErZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wejdOLs59m4/7efD+ZoqO+DCHMNBKyyQYGkCW8Bk9c=;
        b=yLB8DIfbP/9C9lUHhKuxaAZfUdQvjvUVkA/lS0oH0SaRSPZ8uWMf3eRf/8vTqTcq3U
         8pacHkiahh5j6xz2hoSZQ8DEjQByflM/0D7TZ7w+iTq3fwWN2P4homIO/s9P5HFURrd4
         t867/tsNowucIQ3ZO5TFhhKyKuAKCSVaEzFT7fOtOprNixxCmfoNwPzJdbulaAA8iV84
         AeHNImrfg3ScR7L4Nj8z4w9GtIB5UvFp2m1nma3OxnNFN1p9pfgFkBS/qv/atSczPQdr
         ngICVQ6pQBvDdORbMrGuqgUSIVz7qgexnd6xz2z1kpigQVmpyI5f3DaunQVrngumCcER
         nbuQ==
X-Gm-Message-State: AFqh2kpYMoJLnQMyspiVNkIvq4rtoWdngmdHlLzPfoEFK0Ca34hZlR70
        BxwtL6u3cgwCQHQAoxK3Rp9+Gw==
X-Google-Smtp-Source: AMrXdXseqbUMqqOQ++27ChVRe93u86F2Gctz414bk0UDKGbgY3mZn3GdXOlDWRS/DFh0tjsKNtsmpA==
X-Received: by 2002:a05:600c:468f:b0:3dc:c5c:b94f with SMTP id p15-20020a05600c468f00b003dc0c5cb94fmr6842124wmo.39.1674645260611;
        Wed, 25 Jan 2023 03:14:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c130f00b003db0659c454sm1774127wmf.32.2023.01.25.03.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:14:20 -0800 (PST)
Message-ID: <4dc231f5-fad4-6093-851d-afcc0f68e045@linaro.org>
Date:   Wed, 25 Jan 2023 12:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 05/10] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5332 SoC
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230125104520.89684-1-quic_kathirav@quicinc.com>
 <20230125104520.89684-6-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125104520.89684-6-quic_kathirav@quicinc.com>
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

On 25/01/2023 11:45, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add support for the global clock controller found on IPQ5332 SoC.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig       |    7 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5332.c | 3954 ++++++++++++++++++++++++++++++++
>  3 files changed, 3962 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-ipq5332.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 70d43f0a8919..1d300c89ecfc 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -141,6 +141,13 @@ config IPQ_GCC_4019
>  	  Say Y if you want to use peripheral devices such as UART, SPI,
>  	  i2c, USB, SD/eMMC, etc.
>  
> +config IPQ_GCC_5332
> +	tristate "IPQ5332 Global Clock Controller"

depends on ARM64 || COMPILE_TEST



Best regards,
Krzysztof

