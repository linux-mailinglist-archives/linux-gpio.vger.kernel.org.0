Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B31C5350BB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 May 2022 16:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346066AbiEZOhY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 May 2022 10:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiEZOhX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 10:37:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310E9CC15F
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 07:37:22 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id p26so2065603eds.5
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NW/L2mpONxggciw8AsbAzWz7p7bM7K4sMkOMScTEkGQ=;
        b=aVnw/qEXKRYEjrP4Ca8IrQYX54A5B1qs1ZR9okmbKSDwrIp8pAbgY+7dkTGkiTxggX
         8SSEgGrpq2T1mbz3XYbd3kj3u8FnEN9UAKISRxVnZP/qFqMYFznZPaZdfDefUp8qGk01
         8AgqXCU3+cMR2t1T+WuccCFyIVF/Etm+iF7AQ8Ttodb9FEDjMNhtlt7YY1E0PeN4fZ2F
         E4qKFDdQQRTV0H8Vgcw0JWQlQbQ285vfbnqISZS2UumkpPLGE0K7GiHx8TSczb68R2Xt
         Gf5QLjUcZx6m+FgNNwcPyNvlWdHC9To7SrdNvMQoZk4laQ7SPW5ziI3NA1UoIlnXmHAK
         1hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NW/L2mpONxggciw8AsbAzWz7p7bM7K4sMkOMScTEkGQ=;
        b=WSAjIh2+z4rJXwausC3XDU2Hj018oA8+PQG6YSpRwcShMjfq5Qja6k0mDIu2vWyGqp
         8PlPdG1bNINeeUv0L5oxlZ2c+SDgn7VTBRHZvznomGunS9j5E+sSWp5RcrWp3qOVF0HY
         04otrblXYJRyoftHaXj70PDFO88ZcUxKlLqaFY1GWLQo/MuTjNOsfU6d0hi/fCnVyHHY
         nN1HBvzQoc3lSbfMoboyIA/tjize9I7EgMATQCTGTVU8VGhjLl8U0CX+/o80fX1YQSEG
         X6rdF8JgOapeBezdQJFQkX/4asuCO6q4bg7wlWesgjQfuowBN/B8nKgA3uc71FgwRFvs
         CXMw==
X-Gm-Message-State: AOAM531ojv8RdGLLbNqa+IqAMJxxW7f7KKKheSXd2QRJyTxj+SFxeQkp
        u+eEFlUfp+dtSgcgRxwksg+zsQ==
X-Google-Smtp-Source: ABdhPJyi71OtHKHk9p0oVmIUZS2zJCa6U6Xxc4FHaNoYiOfV/dwoHX49Dd2dNEEMnVYc+kCu1Ycj+g==
X-Received: by 2002:a05:6402:27cc:b0:42a:64da:64c8 with SMTP id c12-20020a05640227cc00b0042a64da64c8mr27535879ede.196.1653575840758;
        Thu, 26 May 2022 07:37:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f27-20020a50a6db000000b0042be2dfa8bdsm267962edc.81.2022.05.26.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 07:37:19 -0700 (PDT)
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
Subject: [PATCH 0/7] pinctrl/arm: dt-bindings: deprecate header with register constants
Date:   Thu, 26 May 2022 16:37:00 +0200
Message-Id: <20220526143707.767490-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Hi,

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
 include/dt-bindings/pinctrl/samsung.h         |   3 +
 34 files changed, 813 insertions(+), 550 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s5pv210-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/exynos-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.h

-- 
2.34.1

