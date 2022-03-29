Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B524EB17E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 18:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239330AbiC2QMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Mar 2022 12:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239317AbiC2QMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2022 12:12:30 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBD3175851
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 09:10:45 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id p189so10639868wmp.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2022 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5KGmATQjbYA+t55uqFGpr9FQL9ODvt7ipMp6+gLdwR0=;
        b=cTl9Z/Z2B7Zis3KdOrxkgb6rLWuK8OXOTKEVukyoy14MzjaVUOgidYcqGlBeXN3/E6
         gRQ1zHZJ+Go7tFeKRHrn3WvCudR1HQ3QEd2kps/5pOj73DFAHqIWyO8Tztdl0H4PFp/h
         wZwgN2nuKIaLkKml6sTalVL+qv9GazbFXvZKc8dQFD0GOXaVPohy1y1s5S2dnxRqyYAv
         xlpP5zY23rwrpFRIxtHcwT6QWTtn+okFiIYcLEbRYDygJbvmWP3hNF273+ClZgqVP4Q2
         y0H5zcSSJJNLIV8WAK2NVV0FI7zc+o158PrNWzOQQo6gCD0tTb5djvNiTfADBT/nWwsh
         uBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5KGmATQjbYA+t55uqFGpr9FQL9ODvt7ipMp6+gLdwR0=;
        b=ZL4PtsOlIVnXBZSHj4jfZNBb4mB4OaOw+lBMdNpJDZ8+p4+FPUd5LDwBWxZSix9iAF
         bVykKMVFI+/bhNPO8kZjMnZMnYCnODjxoro56bxzkYK/PTPW5GaUgEW1b8eRDyfd+EOn
         7O+HdoFv2uQUj9ethSVoahbl9vCd+SeYEnXkQP6UGdvGBclG7ccNNNCW6Q/68o8GtiOI
         Zer501swt9ROH2mNw7w4TcLoBN4rIRT8W9D5GuDTNLJxAOfdMjBNoWLRYnAOgHcDL4lH
         rWRO4MRqP06xizgopFNetBS6lw4h1GbCJJ+Jrf9vsTzvxhiZ5FG1OVsp41OHGie2Ktc8
         VgKA==
X-Gm-Message-State: AOAM530jT14hM4a4tHPbctr067VHS18Z2X5BBidwk5YXxk4rf/WyO4Lt
        jQaZi27B4JJ8VtzZSNb7iDEHkA==
X-Google-Smtp-Source: ABdhPJyMMortSDOevzw0MwKMNsxauJgQiSDN5PF4JM0VcTIixYewWhKKjOdSbKNzXDYclvxOx1qwOw==
X-Received: by 2002:a05:600c:20a:b0:38c:95bf:3289 with SMTP id 10-20020a05600c020a00b0038c95bf3289mr514205wmi.134.1648570244412;
        Tue, 29 Mar 2022 09:10:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3? ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00203efad1d89sm21772577wrs.9.2022.03.29.09.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 09:10:43 -0700 (PDT)
Message-ID: <35708f5e-efe5-5948-181f-8adf7d466647@baylibre.com>
Date:   Tue, 29 Mar 2022 18:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/13] pinctrl: meson: Enable COMPILE_TEST
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/03/2022 17:29, Andy Shevchenko wrote:
> Enable COMPILE_TEST for a better test coverage.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index d1955c65b4b6..64fb9e074ac6 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   menuconfig PINCTRL_MESON
>   	tristate "Amlogic SoC pinctrl drivers"
> -	depends on ARCH_MESON
> +	depends on ARCH_MESON || COMPILE_TEST
>   	depends on OF
>   	default y
>   	select PINMUX

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
