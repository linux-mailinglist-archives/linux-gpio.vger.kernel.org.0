Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B1F599D42
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Aug 2022 15:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349501AbiHSNzn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Aug 2022 09:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349457AbiHSNzm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2022 09:55:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969B5D87C3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2022 06:55:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m3so570931lfg.10
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2022 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=qz+s4Lp+1rNmUcFb2WvMXoDlDkJBMF0AImdXZ84Zq2Q=;
        b=b2qPJwI1tvDFb5SSvsztBjBlbvMLCdljfj7HbLEKPKoiMjYaHinlgcNbssiLU19TsA
         rDANCGi0KhfynTCEopOYs7YZLZZZSZjhESlknMcCel+vwnX26JCbn01/FQzwku56QoQX
         LBC7/fd+Oudwpc/qf5pLqSuSyvZelrH+llgZwrFqim1KQe4+KbTlpa1aKCS6XW1k6P3/
         xy0RyLR0T8Wy1bX11SPDbWswB3IlmhSNFfCAfmRsfpaeQpr/9/4Bf1r+lyMnRQVydhiN
         Mifei2iFuYInXiOZsfF2z75zaIeC1YfTI30ViA0Kzn7DFtAY4/5psWRaKPLAfIMgO7yC
         ULaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=qz+s4Lp+1rNmUcFb2WvMXoDlDkJBMF0AImdXZ84Zq2Q=;
        b=seEcOyh/r/V9U7gwjmMA4FTW1M5A7qJIgY+mPrVoqnYN1z+RefQc/HCtDvC3CqhRY4
         RERfZDkZliyMACi5DBxlKA9R+CDPf7K6duexPLYg65XMfq5Ap5r+WmyAsH9mESO9ba74
         QYk/TOoGWHKZ0JNmqAn4KSoS/0AtbipGI0BIrUrKpSadkjFbZeSt0BOfYuyJRiqiGZAe
         C5ag6WtFtJo15PN55JHkfW/YnzQVgT366q6Mu+szBSFZnczhNWvPRT+7Z9zKhwU9gLnX
         4vMCpumkBoAuU05WITagNLJhJF7AM7L4h+guHQvotOLVcLYoMHYe7A5vJps9KIBr7rr1
         M/eg==
X-Gm-Message-State: ACgBeo1rRQuVQ49H2kHyqmapTa91dVZrtGLnbcthe7EHaqwzGdlnjIPr
        bKP14iSW6hB/6nKdSd6oAaSo1WF2HFM5shdL
X-Google-Smtp-Source: AA6agR4hZSxYhPPfmqGv6yv5rwo91nhjhiJwwdev9U1WMc5eWfLZgok57gjZGhaFuKCx+uPr0IP3mQ==
X-Received: by 2002:a05:6512:168d:b0:491:3206:b63 with SMTP id bu13-20020a056512168d00b0049132060b63mr2376458lfb.149.1660917338688;
        Fri, 19 Aug 2022 06:55:38 -0700 (PDT)
Received: from krzk-bin.. (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e8e82000000b0025dd5b3fabesm598519ljk.102.2022.08.19.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:55:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        krzysztof.kozlowski@linaro.org, tomasz.figa@gmail.com,
        robh+dt@kernel.org, alim.akhtar@samsung.com,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/2] pinctrl/arm: dt-bindings: deprecate header with register constants
Date:   Fri, 19 Aug 2022 16:55:35 +0300
Message-Id: <166091732992.90087.5461624467254256635.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
References: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
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

On Tue, 16 Aug 2022 16:30:14 +0300, Krzysztof Kozlowski wrote:
> Changes since v3
> ================
> 1. Add patch 1 - bindings example fixes.
> 2. All dependencies were merged, so this can go via Samsung pinctrl tree.
> 
> Changes since v2
> ================
> 1. Split last bindings patch per driver changes and bindings.
> 2. Add tags.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: samsung: stop using bindings header with constants
      https://git.kernel.org/pinctrl/samsung/c/df805304a820ed10fc3d038dd64b85821c9ee606
[2/2] dt-bindings: pinctrl: samsung: deprecate header with register constants
      https://git.kernel.org/pinctrl/samsung/c/9d9292576810d0b36897718c24dfbc1a2835314b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
