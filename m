Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA0577B3CD
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 10:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbjHNIRl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 04:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234463AbjHNIRQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 04:17:16 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9591910EB
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 01:17:15 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so39829675e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692001034; x=1692605834;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e3CFhGYYBnmc/7BGz71n+APKSrpv4uhL75vkasqQJ4o=;
        b=iQkwPbQN3DsEDOtJk3CJaT+avcrhQmZRMrmuydv4HhzxFDJqxw9vGX/2VyMkUMA1wL
         jk+ff37u88MZw/dBof5+1vAQrQoUsZRVs3rlTi0p0x633eGOAj0RobNrihc/vuOa7pHG
         6eAH/89w+vFWZOFZKuerCFUtKJltGh7FmZ8pO7PYlqTZ0a/VC8XtnkggkA2JAFhJv0Bq
         XuPNI1tM13nTx7WnwNrHP7EJRu30NfUNL14KiE7pfsaKcQNbGHrbWnb6HNFNCHTwS0HG
         GcFhASxwqz+vqOX7V/nyAXR1aQ+K6hWKSIyZVhA20KJfGBBz8iVnsEyNGQ2cl706sOdd
         157Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692001034; x=1692605834;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3CFhGYYBnmc/7BGz71n+APKSrpv4uhL75vkasqQJ4o=;
        b=VrmNcnIcYX8uXXO292EUYk0iZv/8UiBK1hD9HADdpLCXV6i3+no9nccrH/6XQ5gQIQ
         Bjj+Zm4bN9CJVSK/K1v2FX2V9YLFomOUzvnrAILgnIOMeOZ+03aJRnu5PKJlo8JyzwaI
         s0BQcCMgb1bwGs8XN4J7ldrxR5aI/MbpnkmgfrIb+66FnINeAeAGN7bvnKk8/eqfHdqn
         pr0McLRh90G299kVGHxfqweB00ea6Q2cXWFgvu5wODNosgri21uLVq/FGSyKzhwXTlwO
         BEA8RaoF6q8GoSaFocUK1063GS7OYB22r+eNX9G8UAMEZxWwiWiip85oAOLvNlo/jspE
         AUVA==
X-Gm-Message-State: AOJu0YzymXk635tV244p3BgNecuvbWAXcyVqp3i0gwK/FNSVXhmBZi1l
        DJfF+Dy3cPv0jpaR60KL8bYIvA==
X-Google-Smtp-Source: AGHT+IEXbvgn6LW0yU+nkhHkcfkiCGwjUBAMcP+fKEDjyEF9E2V8kNEM6NVC/BjPKkIdX0hZ6fKCKg==
X-Received: by 2002:adf:f24e:0:b0:319:7b50:cf5e with SMTP id b14-20020adff24e000000b003197b50cf5emr880096wrp.19.1692001034196;
        Mon, 14 Aug 2023 01:17:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d444d000000b00317f29ad113sm13580045wrr.32.2023.08.14.01.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:17:13 -0700 (PDT)
Message-ID: <ff999018-8490-0f58-0a50-e82f1effce5c@linaro.org>
Date:   Mon, 14 Aug 2023 10:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl
 driver
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
 <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
 <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/08/2023 15:44, Linus Walleij wrote:
> On Mon, Jul 31, 2023 at 4:44 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>> On 30/06/2023 18:58, Neil Armstrong wrote:
>>> Due to lack of maintenance and stall of development for a few years now,
>>> and since no new features will ever be added upstream, remove support
>>> for OX810 and OX820 pinctrl & gpio.
>>
>> Do you plan to take patches 9, 10 & 11 or should I funnel them via a final SoC PR ?
> 
> I tried to apply them to the pinctrl tree but that fails ...
> Could you rebase patches 9,10,11 onto my "devel" branch
> and send separately? Then I will apply them right away.

Sure, sent them right now!

Thx,
Neil

> 
> Yours,
> Linus Walleij

