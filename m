Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 365FF6D371B
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Apr 2023 12:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjDBKSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Apr 2023 06:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbjDBKSd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Apr 2023 06:18:33 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BBF83C6
        for <linux-gpio@vger.kernel.org>; Sun,  2 Apr 2023 03:18:31 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b20so106438561edd.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Apr 2023 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
        b=jt9PRfw5VQJUcClBuDD0yW3taPLHmIYTZT+hRzcnTsZeLzqTwOu592kOF52dyvMgmN
         jWia1f1dvudUnIMCqV/J9ddLPR4fuDVkJM/43X+6sdC0vLh4pkc4zEOBUy0H2h0enKHJ
         /IbIgWIWbuMI5DZwbCxvTn8TD3CPiLHME9Qjd/Pu15AtH27jrmtxex4QLF0fjsnN+1CZ
         TKvYD5ccYK1rb3AWi6KkV+vQnvdUd5CI87AS8JYq/dA76yknzmqbx5ErPLNiJgBKps2i
         0336/3xyzwLIt2xofO6kU6atVVguHVcQwncUdT2PkiUg+34YkOH58yJpOdEaK4T/dIl0
         pByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
        b=1zYmwkFqUCIzM4RmDPlPJFoRBWTuFxy8Ov4wfKw/K0mtqDU6QDRkhBofPjxgSoUvNw
         uBnupGB2WGs/Z8CRV+bD9dO/jAHOpAGCT3C3RZa53OguFh6mlulA1dhAHIISotQ4OAXz
         f5zpQp89TVt1orve3ax0wUMYDrhmI/inUOKo7SgLICmMnrZpCeUGU/Sx6mkOU7X8qs4U
         dYIvBZymBIMyP3eDL4W92TcaL0eWmUebfS4iaooi2x6L9hnSfsynbEvbBcQb26mryCXh
         l4jAICVaPz4hvnSxHSZNgahD4vOS7BHxcl9A2X7oYtGcSe6zPkXqy5Sb2uHmg/D9Xbud
         ORwA==
X-Gm-Message-State: AAQBX9e9dIxb5UcerHWxdL8puZEtnprX1fXufADK8kuKSMNxLIFnkznl
        /RagtfyRlhCkRtoAD7HtYgEqPg==
X-Google-Smtp-Source: AKy350Z6IQ1DInGgJ1tkTuG1NeZ3Izk22lBovEOzygEIjFvMr1KmPSan8ScnFcJMV6jOJPTmKXwNWw==
X-Received: by 2002:aa7:c859:0:b0:4fb:78a0:eabe with SMTP id g25-20020aa7c859000000b004fb78a0eabemr32523704edt.14.1680430709888;
        Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id 9-20020a508e09000000b00501dac14d7asm3129576edw.3.2023.04.02.03.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Message-ID: <d79d35af-792d-4f42-03f0-37ff0abce461@linaro.org>
Date:   Sun, 2 Apr 2023 12:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 04/20] dt-bindings: arm: oxnas: remove obsolete
 bindings
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
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
        Sebastian Reichel <sre@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 SoC and boards bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

