Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691756B7787
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 13:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjCMMce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 08:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCMMcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 08:32:33 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE0F62B7C
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 05:32:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id j11so48045184edq.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678710750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbR/fUsZhAg0lP6P9ObdAu9MnPucNzm4qqeur4JI9QY=;
        b=ll4UtNcYh/0tvXztxN635HQrvQCFi3ynFljXazOIdlYGc4hiNsy8qVm76emGtxWBfO
         zgnw7zU0vuv9E6A5wo5I47MaU0VgCQdYMKbzIjGJevAwoTjcEgS4BlYP3ukEVsNwmnj8
         Ika9PzzbXEILFt7VE+Cisu72aJhhjDZIzPwihBspEo9KAxZX7tR5w6bB+Y7fX9gStp4c
         wc/ey29l6omG8PtGqToTVCmybfqgl9P9rfQSRo83EpObmaDogkxy3FQOCD7ga4V6JUJv
         kVcMIIYJQyJWLvqkvQf7By0y5s3X9/2QJc6iilpLwja9B2pf/dj0omwzNDv8FBe0pEdL
         zzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678710750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbR/fUsZhAg0lP6P9ObdAu9MnPucNzm4qqeur4JI9QY=;
        b=N3nw7x2bYKeki3lXd/A1eGg4VCBzIEsPVPFpV9qLu+IrAD4lbZmvdNyYlCTrYTnfa1
         noL9whXyF4tlWNqYjxCWk0gc9tJp9DIjE2xvmTLJrCxVQTiRKM9iH0mKK+MBo+PMLQ+r
         82D8rs59ECXBLcloPqcpsIX7ektdF7brK4GmQrl5TuTPieEb+ek7RuSqRQYIZ7Z/JE9w
         chlenqKawL78CDVRN0Cu/64hprRHCUs/W4hjiZ/5yXPZfjhtPBGjafeSnggI64YFD3V+
         7tcaAc1ij4/P2gewgl+IR1EbIuAvcE+mt6/FlXb+1sq2U8xWWTt9ouyPqVGy1ArT74DK
         vejA==
X-Gm-Message-State: AO0yUKXFVVhZzXDBEtresZGgPFo+87F0UttBZqx76SmmK0N/ULL6S4cG
        6ye3Ia67O/WF+0c5Ti5jDbojJw==
X-Google-Smtp-Source: AK7set8XlpMn2zDxWX4wLeTSxDL3k2MNsCluAH/knmVLQkSc1I+ql9nCCKqU3TW3fDKA94QVgR3HOQ==
X-Received: by 2002:a17:906:d8b6:b0:924:943d:7181 with SMTP id qc22-20020a170906d8b600b00924943d7181mr5427752ejb.51.1678710750534;
        Mon, 13 Mar 2023 05:32:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:69db:4882:d071:27c4? ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b009245ba892d6sm2268222ejf.103.2023.03.13.05.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 05:32:30 -0700 (PDT)
Message-ID: <b55228db-7d83-2a49-2c04-0284693df788@linaro.org>
Date:   Mon, 13 Mar 2023 13:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add fcs,fxl6408
Content-Language: en-US
To:     Francesco Dolcini <francesco@dolcini.it>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20230313113308.157930-1-francesco@dolcini.it>
 <20230313113308.157930-2-francesco@dolcini.it>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313113308.157930-2-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13/03/2023 12:33, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Add Fairchild FXL6408 8-bit I2C-controlled GPIO expander.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

