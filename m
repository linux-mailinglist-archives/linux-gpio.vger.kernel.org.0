Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D137521A4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 14:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbjGMMsE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jul 2023 08:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbjGMMrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2023 08:47:52 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4BF270A
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 05:47:26 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso5795385e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 05:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689252443; x=1691844443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQ3qFqjqaXg+xhPM/OfBCqCifetSEr6v0qh2wFRe3uY=;
        b=i92G8JKNvparwYPbnBagAXWtkyNe6OrAoGY9MTlkldD3dcYsmXZ3Bt9jlIdwM2BXw8
         y7VwQuUjzVfo2hn/Z4OmMX5D4XvCfjpmVWf0+sN7AhHmbLD1K7WWAcxUskC/EWIteL8z
         pgwUmWYhX8oZBy3/z3S3eTV3rj9qdeF+eLnSaryryK2Fn2XtSu1bcxYL6zRfHFZcWQbj
         o95SzvzKnzTUxrsIQTRwhPZDtDeOX3bI0wN+8BVAJtYu5K496kx8UGOBm5TXXoXPyfxj
         ahgWHaBBmBLhBgcffwYFyZzltxlkgbx/Ofx9KG2EfQV3SNejzzzEUu1cmN1xW095yUcD
         p+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252443; x=1691844443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ3qFqjqaXg+xhPM/OfBCqCifetSEr6v0qh2wFRe3uY=;
        b=ZSsu58h0z5oSwldYRzbz/AfaDU7yRxbLOUiEmsF7OzQBy7M0h56U3PnYWo3zyiphKN
         WU8lvL4IcrFThUsmBzZRni1FViB43XLmZFsJMX8ZgZc2Ohm3vj7DPyTlcEJSdBjZfl/0
         LNmgTtWhMZb1wSSZHSrD7SMiAdjVF9I0SQlGNA2Ox7oXSKgV2feijqI36z1kHY9hBQBn
         5uDu8Lrrk2SN7lSZVmfioJHH6NNp/PHzSAaWbWybvZB09vw35YKHMAK3W9YdZmcRVw8+
         wST70rHunuqNw4W0hpHKY/1OPqu4NxvMUZcyhtad/Qn3S00eI0VCItM/xjTbZMj8EdNT
         485Q==
X-Gm-Message-State: ABy/qLYYHKLkEc9nEoomUMAkEu8gHsieSJcOwgJudn9whM0kX5KVZgm0
        5PTsMDuUW4LIC1J6B6KJEgyKxA==
X-Google-Smtp-Source: APBJJlFv2JV2cNu6AAcxonI8NW8JRqwtxih4OqWDpmqP+QB4MCgD6qwhTqxWsmWLF+OTALNCxkZ9hQ==
X-Received: by 2002:a7b:cd95:0:b0:3f7:3699:c294 with SMTP id y21-20020a7bcd95000000b003f73699c294mr1277212wmj.29.1689252442663;
        Thu, 13 Jul 2023 05:47:22 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id fa16-20020a05600c519000b003fbb1ce274fsm5488171wmb.0.2023.07.13.05.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:47:22 -0700 (PDT)
Message-ID: <2ddb2042-a654-bc60-2060-b21e3acd6f31@linaro.org>
Date:   Thu, 13 Jul 2023 14:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/15] clksource: timer-oxnas-rps: remove obsolete
 timer driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-3-fb6ab3dea87c@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-3-fb6ab3dea87c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/06/2023 18:58, Neil Armstrong wrote:
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove support
> for OX810 and OX820 timer.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

