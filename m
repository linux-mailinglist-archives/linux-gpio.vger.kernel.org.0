Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924E77C6DF1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 14:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbjJLMYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 08:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbjJLMYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 08:24:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9A8B8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:24:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5031ccf004cso1188591e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697113481; x=1697718281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AJR9cDh+7ZTeuRSJ5Jio19eYIFYvTnyjLFRoPhLNrlY=;
        b=CorwcQX2DeG6zNVvutKYaNTwut87zOAqaCb9QfmdO67gH2eHi8aGL01N5tK1CFfhi2
         OWr0tEaRbW+FmZPz3en/Bq+1W+jPil8qMPHN8NTh01rUJNdG3TcTeeunI3QFLhy+7Gdh
         5nqXIa+zvYhAsnCnI9L3Ug8uhNbdXDwHm48kRyUkjkiN40wKdP4e6HQEtBuInWb1n2S/
         9iq1+hk+It73iWcH4holHIPS1Tk4qCbgq7E1PN7LUrSTCN8A4D6pD4O2n24WHuE7DMN5
         xWls9NurssNNE5Xw/0U8zvbp47RhL599IZbhnMpyCeHo8KabuY/8sdN90UrWlk3Leb68
         SgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113481; x=1697718281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJR9cDh+7ZTeuRSJ5Jio19eYIFYvTnyjLFRoPhLNrlY=;
        b=JjR7jdSs0hOggnWbC2pWvpVcxHh3KDyqpZKpgWP6lGa6n2ENo9Ngdsg2QooCc8Zpxs
         HKfgGaHR711J0N1AXF9JPUU83PmCzxwLyKm8DgaEuWLK69QLfjAd8vQ81zr1//BidhAS
         vjFjs5OcxFqjmopdbTyp7WSXZhGdTS43IjwwKuk0OT9M2bwWCsIwn34A9MFaHPNcmBN+
         h1T/hfHl9NWMvhpGXO8fFrix5BqZsyPT1976vY51KBI6/AQQDPOXhulRu1BmfvjNyJet
         A1VQWVZv2l5Nh1cN3Q7+dX1Ss5N8Bq0Ib87fwt5/8LjifkEAjxhBdidYNkfn3kIz+D5v
         nqMA==
X-Gm-Message-State: AOJu0YxMJc5qm+9o7t15t5torO1XnZQ9705Mf1D/15otQpX5eYYb5Y3R
        CO9v8ICdXrJQTAGFiIKp+/oGfg==
X-Google-Smtp-Source: AGHT+IG+GYMxhr/eYhAVnr0fodfE2g5vbmrEIq8xkkc0liLatvRkwVuegQ0Og2Gv0azIxU/P9LpD7g==
X-Received: by 2002:ac2:4ec7:0:b0:4ff:8863:be01 with SMTP id p7-20020ac24ec7000000b004ff8863be01mr17167717lfr.8.1697113481191;
        Thu, 12 Oct 2023 05:24:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d480e000000b0031c5e9c2ed7sm18366425wrq.92.2023.10.12.05.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:24:40 -0700 (PDT)
Message-ID: <28bee37b-1d6d-433e-810f-da847635fcaf@linaro.org>
Date:   Thu, 12 Oct 2023 14:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
To:     Peter Griffin <peter.griffin@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-11-peter.griffin@linaro.org>
 <CAPLW+4mO1dMjh1EDPbaL0QGe4EM0GnbQ1G7NsdtBaCcPzdmkPw@mail.gmail.com>
 <CADrjBPqo8kKUr-EPay3zDQiF7XRwN+FDFN5W2tD5Aet50L2KUA@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPqo8kKUr-EPay3zDQiF7XRwN+FDFN5W2tD5Aet50L2KUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/10/2023 14:06, Peter Griffin wrote:
> Hi Sam,
> 
> Thanks for the review.
> 
> On Thu, 12 Oct 2023 at 01:07, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>
>> On Wed, Oct 11, 2023 at 1:49 PM Peter Griffin <peter.griffin@linaro.org> wrote:
>>>
>>> CMU_TOP is the top level clock management unit which contains PLLs, muxes
>>> and gates that feed the other clock management units.
>>>
>>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>>> ---
>>>  drivers/clk/samsung/Kconfig     |    9 +
>>>  drivers/clk/samsung/Makefile    |    2 +
>>>  drivers/clk/samsung/clk-gs101.c | 1551 +++++++++++++++++++++++++++++++
>>>  3 files changed, 1562 insertions(+)
>>>  create mode 100644 drivers/clk/samsung/clk-gs101.c
>>>
>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>> index 76a494e95027..14362ec9c543 100644
>>> --- a/drivers/clk/samsung/Kconfig
>>> +++ b/drivers/clk/samsung/Kconfig
>>> @@ -12,6 +12,7 @@ config COMMON_CLK_SAMSUNG
>>>         select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
>>>         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
>>>         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
>>> +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
>>>         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
>>>
>>>  config S3C64XX_COMMON_CLK
>>> @@ -95,6 +96,14 @@ config EXYNOS_CLKOUT
>>>           status of the certains clocks from SoC, but it could also be tied to
>>>           other devices as an input clock.
>>>
>>> +config GOOGLE_GS101_COMMON_CLK
>>> +       bool "Google gs101 clock controller support" if COMPILE_TEST
>>> +       depends on COMMON_CLK_SAMSUNG
>>> +       depends on EXYNOS_ARM64_COMMON_CLK
>>> +       help
>>> +         Support for the clock controller present on the Google gs101 SoC.
>>> +         Choose Y here only if you build for this SoC.
>>> +
>>
>> Why is that new option needed? From the look of it, it could be just a
>> part of EXYNOS_ARM64_COMMON_CLK. Like clk-exynos850 or
>> clk-exynosautov9. Is there any particular feature that makes it SoC
>> special?
> 
> No, it could also be added to EXYNOS_ARM64_COMMON_CLK. I was following
> the example set by TESLA_FSD which is another custom Exynos based chipset
> that added its own config option.
> 
> Krzysztof do you have any preference on this?

Usually there is only one image for several boards so long time ago we
stopped adding per-SoC Kconfig entries. This has its own ARCH_xxx, just
like Tesla, thus having separate Kconfig for all Google Tensor clock
drivers makes sense. Maybe it should be just called a bit differently,
e.g. GOOGLE_TENSOR_COMMON_CLK



Best regards,
Krzysztof

