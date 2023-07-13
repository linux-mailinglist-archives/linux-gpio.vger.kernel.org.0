Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86A27521AA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 14:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbjGMMsZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jul 2023 08:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbjGMMsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2023 08:48:19 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49003273F
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 05:47:54 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso6206335e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689252459; x=1691844459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+Z95kHJar6LgJuF8EaQ4xrWI5fsRo898PQkWtblwYA=;
        b=ZWtafz1E6fk6SAsYpf4lGZD1+nSgipZ/1yHk8BiiBeCPmDYFNw/BHXw8sle+l2vVmS
         HiRfDaiEutO8CKyd/tWcIbzDH68IKAq0P+wq6L3O+yCRnGWEZXF20jAOZurQ/poTKzrb
         g2OnlU1tMldBasNoMoKBcVuVSBCTsyKGMaByUKioVd4KMVuWxyelDtQjMhVnKsq5Iagw
         6P15f+uhPUS8d9HS9De43ANQUipGV+9v29ZgjBforFnnWFgsbssKQyogmv4hd+73mvAv
         lE4BynPqwqichj7yZRCL2JXaPbqySmT8UZO4u9PrfLAkj4WOjTJ+83c7+Pw5b6vArAq9
         /iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252459; x=1691844459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+Z95kHJar6LgJuF8EaQ4xrWI5fsRo898PQkWtblwYA=;
        b=SZIhH48ulW0e4VFLUdoyJWD9FM5YZArLnVYsDqcoS1WnzfReGKkpMLslu8CDMvb3tV
         N0EdWpL/iIs04Sl3BJ5g+Ny6WOdnvmzN17SgAMS+a5fA4DOwgn5cXgKoxkUb/nkyBWzD
         nyu8AA7sTcJ7Dn+8SbaeBX8VR8TPQ8ZYu7m/o6slHlfNfDPzB7OeX2/wIqeMTgzNR9v/
         drb33vjWEgZRBnAFHMeMcGI5raLLmOAI9eDQb8ieLIWnaEUz8rt2+Cw35+CWM1RoTvpE
         6ZtbxKg3O4ebnlR38BOFZyOgqcPVSEXDzgZy3uRga70Xg34j3y+qUcxDtZPn8MGBd/pc
         d69A==
X-Gm-Message-State: ABy/qLZ3RfEDE47M8s62HiS+h4dRKoZ1J6ymDoMO+blYDuB4sHIoqy/t
        gp3ctLnEa+SLxA0EaQaOvgqaVQ==
X-Google-Smtp-Source: APBJJlFbNLe7S8IsK2vPmgsjbKmKD9UvXXP3v3+dBxQYsKg50wEXZp6DtXoc8BrOfzOVUcWK2M8cHA==
X-Received: by 2002:a05:6000:18f:b0:315:a1d5:a3d5 with SMTP id p15-20020a056000018f00b00315a1d5a3d5mr1544161wrx.22.1689252459616;
        Thu, 13 Jul 2023 05:47:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m15-20020adfdc4f000000b003142ea7a661sm7905018wrj.21.2023.07.13.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:47:39 -0700 (PDT)
Message-ID: <cb852190-2128-ee92-ff64-a47bd262154a@linaro.org>
Date:   Thu, 13 Jul 2023 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/15] dt-bindings: timer: oxsemi,rps-timer: remove
 obsolete bindings
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
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
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 timer bindings.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

