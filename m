Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416E953F659
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 08:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbiFGGj2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 02:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237143AbiFGGjX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 02:39:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185B8CC15D
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 23:39:22 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id v19so21612361edd.4
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jun 2022 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ulqlg3tFKXQzo70gesTAVjXKgLruTq1ckDi/Pv7dpT4=;
        b=Ht3vPgFyF0AmzIe3GS/gDvubliIhqCQZYJh+Y0OfPYn8ui2CJGevyKjOogUP8Jm1do
         mf4QR/fQO4pHIgCEkrsNm3Bn1eon1+94XFdHMF0tav/qiU4SuAGjycWqvWajq+yqvlq/
         ZHLZ9VpMy42ruK9Aby5VolQN/S2ey262+7DkZX14/stnnV/31HQxRol7TfGRqoN8aMHF
         393ruP7L94qp/n3Kda/YpK5I9yAkU5aUDyLHwGl6BPVLCQ/vrzKA5IvRFi4LSvthn7IB
         N60tZaCaKtVuHNEht97ne5A8PHv9ET47f7BTyjKSfc1kkXz70e99twpi1OW82Uph1z9T
         FLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ulqlg3tFKXQzo70gesTAVjXKgLruTq1ckDi/Pv7dpT4=;
        b=k2+uzma48RJB2vbHArVUXzQNIigERBa/5RFrTl/K9qQje7aAU6Ti0CHDugy+7MlRuC
         i854M79Mmjcg7EbAXm6nuOVdyIk5GxdbQ6SkwlkZX5T/5xWB+lf3vLO4IHEMl7mEMBYF
         oxiEWx70VT+gccHJaDUnSDJTwuiWH1g/Qknpy/3lGGYJlJKgRiWlowy+d0jz6qmZ+AhT
         73kLtrMcNRcy5HidOSeILkuGvXcxo4S6sStt9HM+4/T6s73X4wc8BFcqbPpyLcoI575W
         GiaIMWgmoGQQUGE60JwYrkO3afjum4qCCHa3+6RxSHuGWGvv/+oWn4dJJvw1vf2bVAH/
         iyaQ==
X-Gm-Message-State: AOAM533w4RpWjuy3zDt0Dd/oqpK66ppJKDgPun+4V4F2vSABA9Ksp6CQ
        M2I2lNE8HrJEM+uFyzZTHCbGsA==
X-Google-Smtp-Source: ABdhPJzQ4ZJjwBGr2W7SIz025hWycxtvQyJI0L+vtD3wMN88bRJeumtqg/7GJ9BgRLAu40dLMd3SgA==
X-Received: by 2002:a05:6402:40c6:b0:42f:9ff8:62f8 with SMTP id z6-20020a05640240c600b0042f9ff862f8mr21360359edb.95.1654583960595;
        Mon, 06 Jun 2022 23:39:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jo13-20020a170906f6cd00b006febc86b8besm7016888ejb.117.2022.06.06.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:39:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Chanho Park <chanho61.park@samsung.com>
Subject: Re: (subset) [PATCH v3 5/8] arm64: dts: exynos: use local header for pinctrl register values
Date:   Tue,  7 Jun 2022 08:39:13 +0200
Message-Id: <165458395109.7886.4832981947595366957.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605160508.134075-6-krzysztof.kozlowski@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org> <20220605160508.134075-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 5 Jun 2022 18:05:05 +0200, Krzysztof Kozlowski wrote:
> The DTS uses hardware register values directly in pin controller pin
> configuration.  These are not some IDs or other abstraction layer but
> raw numbers used in the registers.
> 
> These numbers were previously put in the bindings header to avoid code
> duplication and to provide some context meaning (name), but they do not
> fit the purpose of bindings.
> 
> [...]

Applied, thanks!

[5/8] arm64: dts: exynos: use local header for pinctrl register values
      https://git.kernel.org/krzk/linux/c/304e65b691ce115eedd43bae191f5757dca4d5ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
