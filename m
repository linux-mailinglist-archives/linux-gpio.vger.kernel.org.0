Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C728553A9F4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350900AbiFAP1y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355408AbiFAP1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:27:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590EA2ED5D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:27:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h19so2734520edj.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRkw78n+vPe/QkH93LY7p8b4pHpE7xRfMRQ/TS3KqYM=;
        b=D804LFKJe1vsnt7iMrMg924lcF0GXpaONQJ3idfrkC/EM9p8Jkxh6y1mz5YkyWBNdO
         KmhZbbGOzSiyjPEL/BvdckTCtL2YwHKl3JLXcsqe6miYQmaIU4V+J1vL+jgOv+ihE/DV
         z4vBnYK7wztbLqk8YMSj4kIRsweIMpScultaUCI+zr3Pa0awxDO5btH82uzQ4Y8IAjIp
         AjpuAhuXH+f68pEC0BT+9QQnxlBZtt+/p7LZw7tZEZvs9rtT8ZuOCXdwIIP86XqknGVA
         YhUr94DTtmZGfQmU2KwSP6L2nrsBJ8Y8xsBy4pMNIV+kzlphF1k9iYNd33+qL5kQuKCC
         yUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRkw78n+vPe/QkH93LY7p8b4pHpE7xRfMRQ/TS3KqYM=;
        b=Zmd1DoFdpVHgvL+UpwLoLwpiA3a9LCBgXizzQNpM7Gz3jMMCtbsXbkiielrIiVL3qo
         oBNFwR/NqhCshWHQu5XcEqOQr8yH/uB9akpvDeORlk8zs3lR4pc0fSELdJrQFvUJSMmq
         njMBuh1ZqswJbbSiLlxOZOYvwx/lnJ1qWKTZJG+l6jm0/4c1OJyOorij/K2B8Xg2cbC0
         JsM6Wa+HMOq/kzahvN4AS9Z1EpC4zhyUalIjrE1oTmoMW0GTf9q5gOyv2F2NdXZE+ffy
         k8QZ0zBT+c62o+STXlLvauS+b2n+SviL2NgHN+wHHuqOXapxlOzpBP132sirKgDHEY5A
         ZRKg==
X-Gm-Message-State: AOAM533v9B+XSkcSzuoJUh3TnfVXs2lfdTt0KPmbj/RPboVcCGsibFI/
        NUiu3ZomExo4qfoWQ5mT8884aA==
X-Google-Smtp-Source: ABdhPJxPVNrgNzYkz4oUG/f1BtdJT4yEwADwf+eg8dXLG19SxefnC+5Idz7ShnBvRxo12Rz23jgr3w==
X-Received: by 2002:a05:6402:17d0:b0:42d:ccc1:f4e4 with SMTP id s16-20020a05640217d000b0042dccc1f4e4mr284821edy.150.1654097270945;
        Wed, 01 Jun 2022 08:27:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906248d00b006fee7b5dff2sm845870ejb.143.2022.06.01.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:27:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] pinctrl/arm: dt-bindings: deprecate header with register constants
Date:   Wed,  1 Jun 2022 17:27:13 +0200
Message-Id: <20220601152720.232383-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Hi,

Changes since v1
================
1. Correct title (in the comment) of each header (Chanho).
2. Patch #7: Adjust warning message.
3. Add tags.

Description
===========
The Samsung pin controller drivers were always expecting DTS to use raw
register values for pin configuration (e.g. pull up/down, drive strength).  DTS
had these values hard-coded all over, so at some point we decided for
convenience to move them to dt-bindings header.  Less code duplication, some
meaning added to raw number, etc.

However these constants do not fit the purpose of bindings.  They do not
provide any abstraction, any hardware and driver independent ID.  With minor
exceptions, the Linux drivers actually do not use the bindings header at
all.  Because of this "dt-bindings ID" approach, these constants were re-used
between chips, e.g. Exynos ones in S5PV210.  These does not make much sense
because the values between Exynos and S5PV210 (or S3C24xx) are not related.  If
it was an abstraction ID, this would be fine. But it's not.

Clean this up by:
1. Moving the constants to DTS-local headers.
2. Deprecating the bindings header.

Tested by comparing DTBs (dtx_diff, fdtdump).

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  ARM: dts: s3c2410: use local header for pinctrl register values
  ARM: dts: s3c64xx: use local header for pinctrl register values
  ARM: dts: s5pv210: use local header for pinctrl register values
  ARM: dts: exynos: use local header for pinctrl register values
  arm64: dts: exynos: use local header for pinctrl register values
  arm64: dts: fsd: use local header for pinctrl register values
  dt-bindings: pinctrl: deprecate header with register constants

 arch/arm/boot/dts/exynos-pinctrl.h            |  55 ++
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       |   3 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi      |   2 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/s3c2410-pinctrl.h           |  19 +
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi        |  38 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi        | 178 +++----
 arch/arm/boot/dts/s3c64xx-pinctrl.h           |  27 +
 arch/arm/boot/dts/s5pv210-aquila.dts          |   4 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi          | 134 ++---
 arch/arm/boot/dts/s5pv210-fascinate4g.dts     |  22 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts         |  34 +-
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi        | 480 +++++++++---------
 arch/arm/boot/dts/s5pv210-pinctrl.h           |  39 ++
 arch/arm64/boot/dts/exynos/exynos-pinctrl.h   |  79 +++
 .../boot/dts/exynos/exynos5433-pinctrl.dtsi   |   2 +-
 .../boot/dts/exynos/exynos7-espresso.dts      |   6 +-
 .../boot/dts/exynos/exynos7-pinctrl.dtsi      |  72 +--
 .../boot/dts/exynos/exynos7885-pinctrl.dtsi   |   2 +-
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    |   2 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi |   2 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    |  92 ++--
 arch/arm64/boot/dts/tesla/fsd-pinctrl.h       |  33 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   3 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   8 +
 include/dt-bindings/pinctrl/samsung.h         |   7 +
 34 files changed, 817 insertions(+), 550 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s5pv210-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/exynos-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.h

-- 
2.34.1

