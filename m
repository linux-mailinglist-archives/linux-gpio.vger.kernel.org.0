Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C7C5EF7BD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 16:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235584AbiI2Ogu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 10:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbiI2Ogo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 10:36:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAB01B053E
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 07:36:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g1so2530730lfu.12
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=s4k7ZRcK6Gp/A9rk+5L7WMB7pBPWsHR6E4YWZnsnsFY=;
        b=BzRL6P9E+x0ljQ/GjnXz24cJualfsUfAOT7lR2uqdBiMzfkKXgCVVawJACjTtHPUGR
         9WcpW/3Pm4zV8GdU7+7joDXlMbqqlYok0leythazyg2oZYltwuw3mB4sirM1XBmwiq+K
         nRsKuCHiPwP7ICkJnJS+B59VCuBWJwcn+h2ikqyCT0HhXS190BfM3lCJFPDqg7OTnevq
         vmcOXaBXK9gq/umqRWFM5oHKyshhZJnIcck0JyYSwNE96YKUyn+R7v+BD8ZY84rl25WM
         QXoPk3W0umkr1TzsJ5zSDAFKrB9ssprULlmYf/TU3juxQB9DeezLR01HbC1SG11TjO+A
         FNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=s4k7ZRcK6Gp/A9rk+5L7WMB7pBPWsHR6E4YWZnsnsFY=;
        b=AfUNFtOycEpQsZDyIf3p1+zgh++EXA95rNOCx5y4FICBQEp3svOHBvY8thStgGuufU
         LSZHnDgntRN/BbJgAFeJDhnBPq51DZ1P+7UNtTjiwoTc5ZEG/v5O+Oznloiu/4VAlrBe
         pr2/ncuHO2okm+j65IE5nkmxah4Z/GloeMEO6SLelP/BmTpe0cF5UQkOBDXFHAu0oYuI
         BhZE5kr41pdCYoNp8fGJhz5zmy5iLJaiKEb8Rubvji60YQcDJV0uOOggmz1TNVqY0oul
         Xl2V1GTqPMAC6BjjoE2ZHn7teJGARrV9WPYkX08OLn77MW9BWYHJsvp9zG8sElTy1n4f
         dTDQ==
X-Gm-Message-State: ACrzQf2fW6rSg+2D8AvJvwRVbXzKDD9U18ELrGBOwpdgImR9/2OLEjnA
        3xDlsWuJlII/fiinzfzsZ3fXNg==
X-Google-Smtp-Source: AMsMyM454F9rJIE+M/q8VrZHdlpougBUdq2HV6F93yGSzajinuWq67hQyweHcERSBN9bF3l3CE3MBw==
X-Received: by 2002:a05:6512:308e:b0:4a2:e1f:f08d with SMTP id z14-20020a056512308e00b004a20e1ff08dmr411971lfd.615.1664462199812;
        Thu, 29 Sep 2022 07:36:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e82ca000000b0026bf0d71b1esm728584ljh.93.2022.09.29.07.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:36:39 -0700 (PDT)
Message-ID: <998432d0-7e67-0112-b130-bbf9eb1b8a27@linaro.org>
Date:   Thu, 29 Sep 2022 16:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 04/30] dt-bindings: sifive-l2-cache: Support StarFive
 JH71x0 SoCs
Content-Language: en-US
To:     Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2022 16:31, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This cache controller is also used on the StarFive JH7100 and JH7110
> SoCs.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

