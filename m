Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06A150B4F4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 12:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbiDVK2m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 06:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbiDVK2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 06:28:41 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6F854BC0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 03:25:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y10so15448051ejw.8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SN4drg2JTpqJsP0CH9F58BTXLr90dl8MWfA2yC+Ydps=;
        b=kgLJJCQCxmhs8OK0PP2StISQ2j+AUvWuCOxalEUF2BWpNNsp3Onq1OEZ09UaNwJ4TF
         x5/cnscx9KdiDW2rndrrcuZ1AlqT/gJRpfeY00llTvFF3f9AG24QDshxR2wM8qa5Es6Y
         yf5xnKucmyQws2060UmG3ElrTy+yDc0nAKVpFMrG46waAVyzZv3NyiSIlJfPB5WohVY8
         arT8+jC/MnUK976rXrqJtu/zES5LNkf22zViak0c6E1qWqo1gVA1hE++9rUYbIz4PpfT
         YxFa1Qkd15dP9axMKlDoFpQ40SEUvjcQg29wigNea8OI6x7JfW+EGTcFV/Clu37ytb8s
         Zcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SN4drg2JTpqJsP0CH9F58BTXLr90dl8MWfA2yC+Ydps=;
        b=3BR0yNOqb953OssfvvHN4bBzqZWmU5w/93Olv22aEkGIo4vAgk8vVtiiV0i/Dfvbfr
         ZyMtfzpZh9hlPzxDQbeJhD9Inn2k4IiAAGDlYHQtu0fmzPq275NiSQOIFSz29PPZUwRZ
         W6v0/nppxxXU23GaX4t2EUScKw6s/TWQTjxZ6DHmo/qlBZKbTfFT6TSSTshWnLCb/opY
         Z347Inuq3cWBFtQVZLs2ZE+TlLsS+SwGWvC5y9tTNPsDMB91OmRwnJTFTCIMWcNSBiIL
         JM2NHilTrn6wODtkyizGaquUVFI1S9p0txk3Qp68oaRk2ipvkcn1H1lCQ+Rr89aPcdWI
         6fQg==
X-Gm-Message-State: AOAM531j3W88itRjEXN3B3+6rUH5a/xSBFz5LLAmPkDoqY8ASrKjNQp0
        eAd+S8sD9TfRonlyK4VllBSEGg==
X-Google-Smtp-Source: ABdhPJwl+qZNM8ipTsT25L3081dhFGNSIua496QmlPCsVtwo3iseCpZh1OCXY5DAVnclK7C784PSXw==
X-Received: by 2002:a17:906:9746:b0:6e0:5c9a:1a20 with SMTP id o6-20020a170906974600b006e05c9a1a20mr3582778ejy.714.1650623147318;
        Fri, 22 Apr 2022 03:25:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z8-20020a170906714800b006eff5936d60sm609754ejj.158.2022.04.22.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 03:25:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] pinctrl: samsung: Fixes for v5.18 (current cycle)
Date:   Fri, 22 Apr 2022 12:25:41 +0200
Message-Id: <20220422102541.33372-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Two fixes for the current cycle.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-fixes-5.18

for you to fetch changes up to ac875df4d854ab13d9c4af682a1837a1214fecec:

  pinctrl: samsung: fix missing GPIOLIB on ARM64 Exynos config (2022-04-21 08:58:54 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers fixes for v5.18

1. Fix sparse warning introduced in v5.18-rc1.
2. Fix possible unmet Kconfig dependency with COMPILE_TEST, present
   since v4.3 or earlier.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      pinctrl: samsung: staticize fsd_pin_ctrl
      pinctrl: samsung: fix missing GPIOLIB on ARM64 Exynos config

 arch/arm/mach-exynos/Kconfig                   |  1 -
 drivers/pinctrl/samsung/Kconfig                | 11 ++++-------
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
