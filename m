Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A253771235
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Aug 2023 22:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjHEUxA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Aug 2023 16:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjHEUw7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Aug 2023 16:52:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEBE2D69
        for <linux-gpio@vger.kernel.org>; Sat,  5 Aug 2023 13:52:54 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so12978985e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Aug 2023 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691268773; x=1691873573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4uZjubyBmUVVEt3PUoxQJFxZWi+4QvNzWctTLRO5ao=;
        b=WL7oEn0O0nOTtFkhAhBzY0aPVBFffwA19BFKdsx7I1DewAg34m2T+Hh95HlEqMdBFv
         sa7LISpkJsgpLiHoiBhDA4p5+SbaQlWaH7sRncfp1bkXIgGRQH0iDQJMhQKqEfHMNpzC
         sLcV5yiuwadorVAxjd7rCH5LLwhO20Q8byp0ANRJns7YSQ9CSvMfTtxTAUel5xKzt3IX
         biI6NdX3tR9NTwQjHXrRV/6vx6artkga+Mbos+c4meQRKIHjxL2zH3LnG33pYa6ZpxRo
         VesO3oGb5tTqLsUhv2fFCYabj41IuOoLPW1jl5LGb90Lp8g3R4jjedO9BMX+Xf+NrAok
         xniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691268773; x=1691873573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4uZjubyBmUVVEt3PUoxQJFxZWi+4QvNzWctTLRO5ao=;
        b=dAcbLV6zoO2TGXxdZ7fKfaNDX+/mYFB1BoUK9fjd5Ox0eLdOGMZrB/74P5RtUXWHZp
         sx/h6g/4cW55o6EqnbyGWJJ7N+hO1D1RR+RCXvzFBUIZa2WojunoFjIdQIOX8452Oq6v
         4e26cmZz3yz98QMKov+1aj5BlJ+t1hTQabVDkXKUSaflI3bncLlCBt05H8KUFtmGA4We
         Bo8q32rKZA8hKmc6W8eWldtW5csSb4BH9EzhpuNpL8d4Cltgigd8HSSrIJB2gV+Pf87Q
         zxZdenR2j4vJT/75FtgC60rhX9QEDWrpr/4mXPJZXSDjGzPvTjAlxs3aiHnkpDZ0WJCJ
         AoQA==
X-Gm-Message-State: AOJu0YzxE7bqviXWGbT+XjpppMQXHaj9DVcCPhWGoRsGWOxuxhS4c3xy
        QrmNKgkJOhGOS6d/AHjMollDPA==
X-Google-Smtp-Source: AGHT+IHW4BPSBjV99OmrpHfUw1HgZrgGWtEtYc7eGhiVa2EkbPc+SDIb+/BdcX/n6S5Y4gKy9tR++A==
X-Received: by 2002:a05:600c:22cf:b0:3fe:201a:4b7b with SMTP id 15-20020a05600c22cf00b003fe201a4b7bmr3754893wmg.27.1691268773391;
        Sat, 05 Aug 2023 13:52:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id h6-20020adff4c6000000b003176eab8868sm5944676wrp.82.2023.08.05.13.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:52:52 -0700 (PDT)
Message-ID: <c5330567-4fa5-c7b6-6927-d53ef9628a8c@linaro.org>
Date:   Sat, 5 Aug 2023 22:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 5/8] dt-bindings: marvell: Document PXA1908 SoC
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de
References: <20230804-pxa1908-lkml-v3-0-8e48fca37099@skole.hr>
 <20230804-pxa1908-lkml-v3-5-8e48fca37099@skole.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230804-pxa1908-lkml-v3-5-8e48fca37099@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/08/2023 15:32, Duje Mihanović wrote:
> Add dt binding for the Marvell PXA1908 SoC.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

