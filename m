Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38675607C5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 19:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiF2RvT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 13:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiF2RvQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 13:51:16 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC7C1CB1B
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 10:51:10 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id c65so23265650edf.4
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 10:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=7iA70F9mnrwsMHEWalEOeebxI1ekPwBYb8PaHtIIokM=;
        b=aGaRkPIGRsdBG/Y1jvJGofcIxOL0lpNzU8GUcR9uR3NugS4Vg+I2sEnbflG37mikBx
         laO0U5GOIpaoM0m7F5lAYIqJQXx+0V+EaZtQmNmcv7GA2K9Te/Blr/eLcMmo5I3Ieprw
         o5bEVG5xfUqEDXofGESHLNc4x6AgIbneTGEhf5UsOlowqhsIoS/c1dHh4JWtkIKTqebP
         PhCKq/LT7Yi2ItZbJfO2KBN0Q+jNCkJk6Xfy02UxIFNpNEWXN0aXgT04TmsIS2Kgci2n
         oayLRaEkOb/1JHwKoWSKHKGVS3Dwk8unyvUAWuwJeVpEBD9istsW0QroPleTOPhnt3LG
         0qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7iA70F9mnrwsMHEWalEOeebxI1ekPwBYb8PaHtIIokM=;
        b=CEFaaxbll4CLUM1Ds3XEw3GQwsbymDr6UjeLYX9iqQQinS6iqSQYZTeH9JEAR6xjBE
         4U9RoIoxWmmypwmkPwgZNBwb4U/Q+rWKA76ZK0UyXAUMCkMYY4Anq2u1gqC0ELpQXzEf
         CWlKwNs9xLA86NmKesySUExrXoqQ5V2jm0kOHKCAPqSMHVKbtMmo2DLQ0f52eQHBR+G7
         MRGrXQb67dNw3528bRg5lJ23gvyGWFfp4iF1n521Qtipf3a18xyYZXFIrtu93GKGrveD
         GWXCdjRUGrUT/ut4DaMxPXpLqOu0phnHTLNHveB6dBAtOGNvA96k1J/iguq+lw5xmrEt
         Pm1Q==
X-Gm-Message-State: AJIora9ElKNnsRo9vwkZZAGjssBb1IoCQTv1kMZ6iqpUrAf2EZqw6pTH
        EQj3Xo7Eg7KSz95kY6Pp3FC2Zw==
X-Google-Smtp-Source: AGRyM1vPKpJLgAGgKuDVsjqMBqxKnF2ecNlUQEVwgdEzvbyFY+qlyWTh7E2rFysgq8kwEo3cYgDc7A==
X-Received: by 2002:a05:6402:500b:b0:431:78d0:bf9d with SMTP id p11-20020a056402500b00b0043178d0bf9dmr5771815eda.184.1656525069374;
        Wed, 29 Jun 2022 10:51:09 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zj4-20020a170907338400b00726ef422b80sm1926985ejb.177.2022.06.29.10.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:51:08 -0700 (PDT)
Message-ID: <0e515289-9d3c-9c61-950d-09c14b33c8c2@linaro.org>
Date:   Wed, 29 Jun 2022 19:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 00/14] dt-bindings: arm: freescale: Switch fsl,scu from
 txt to yaml
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> Changes since v5: https://lore.kernel.org/lkml/20220616164303.790379-1-viorel.suman@nxp.com/
>   * Updated according to Krzysztof Kozlowski comments
> 

My comment a about removal of each part of TXT bindings in each patch,
was not addressed. Your approach makes it more difficult to read patches
and makes sense only if each subsystem maintainer will take the patches
(separately). If the patches are going through one tree, then better to
remove the TXT gradually.

So the question - who is going to take each of the patches?

Best regards,
Krzysztof
