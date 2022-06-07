Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D81853F65A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 08:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237114AbiFGGjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 02:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237123AbiFGGjV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 02:39:21 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E08B0A7C
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 23:39:20 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n10so33165720ejk.5
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jun 2022 23:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+6eJuTNYhenhOtSy0mpWdMyC3zMMcmWC680KdPh5O/c=;
        b=HYozM8kFiTcwqKrVxYDLCrX0493cz93zCKZJ+f8P4vW52obPXnTq6NV3kh1FoHfz/G
         X7fCON7a3YXvLmCYLMb+5TKI6U8CRoyGk1XVbE+v2dqJZU4GmCu7YVFqieiSRxDesBBv
         EnCAKtz9K9i+BZiMcySVBRAt5VYZiUFrgSciSMlfiDD+pJsVjpI5akEzEcegUZ5wFBvw
         JyxMduaLcnkgClGEdFK7A82CrDWTQvLxJKe4jDuWXaS1lO4J+IpQitElubvTUunFLq4/
         X4UXNzx72E7wcm3vvgo+19Mc1hGGRqsjDGQxY7tiZXGAxaojashVw2hVrZ7AWz77Q663
         FxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+6eJuTNYhenhOtSy0mpWdMyC3zMMcmWC680KdPh5O/c=;
        b=sadS0qHD0wOe7vyn65nhmtUQLs/SLJA9ZgVXl9P2EBtiKXRhpYtmayobLBmcokh4rk
         uE3zr30zJlCHTjdydBBTGEMGvpYKPfxmPAg5Vkr7Ny4boZk83JO1N8/aAFCnIJUOz/TZ
         oBm9croPVzUe+MtrEXhrKVnQSDcxI1ZrKXL0RaFSndrKG1stAo3Mz5yzEYGuMv1YNn8f
         Vb/4nwp27etBDiUBaCBhr88/kNyiEniOHqKyvX5ohmbBDHFXvjv0Zs0EHA472GilQp/l
         5d39jwuh94nJrbiBsETcYWozh8Z7vxc9TNMHf/gCoDyqdt5FqkemaF3YX4SmccFr5rIP
         59mw==
X-Gm-Message-State: AOAM532+O/w37QzHc8t7ZBHo8ykvAi+7+xYsADOguf+xpFi3nbqLArd4
        nZo/vKnFtBU3lzMQR0k+UtEHew==
X-Google-Smtp-Source: ABdhPJxJC6R9vm7E7RbQ7imv1QtZeFxdBWu2Z8oRZQhCapGo8C6J6E4SBIOg2hjT2XFEC6lAoeIJAw==
X-Received: by 2002:a17:907:2d29:b0:70e:8b1c:c3f0 with SMTP id gs41-20020a1709072d2900b0070e8b1cc3f0mr18729905ejc.37.1654583958428;
        Mon, 06 Jun 2022 23:39:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jo13-20020a170906f6cd00b006febc86b8besm7016888ejb.117.2022.06.06.23.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:39:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v3 3/8] ARM: dts: s5pv210: use local header for pinctrl register values
Date:   Tue,  7 Jun 2022 08:39:11 +0200
Message-Id: <165458395109.7886.10195566966608207927.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605160508.134075-4-krzysztof.kozlowski@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org> <20220605160508.134075-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 5 Jun 2022 18:05:03 +0200, Krzysztof Kozlowski wrote:
> The DTS uses hardware register values directly in pin controller pin
> configuration.  These are not some IDs or other abstraction layer but
> raw numbers used in the registers.
> 
> These numbers were previously put in the bindings header to avoid code
> duplication and to provide some context meaning (name), but they do not
> fit the purpose of bindings.  It is also quite confusing to use
> constants prefixed with Exynos for other SoC, because there is actually
> nothing here in common, except the actual value.
> 
> [...]

Applied, thanks!

[3/8] ARM: dts: s5pv210: use local header for pinctrl register values
      https://git.kernel.org/krzk/linux/c/7fd554de160eed060e7819aa42ca0478c9e0f4cb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
