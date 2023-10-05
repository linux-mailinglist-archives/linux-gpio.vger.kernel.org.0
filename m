Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBAE7BA441
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbjJEQFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbjJEQD1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:03:27 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B012EABF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:20 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso14038985e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521438; x=1697126238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqhZbDetpDSPGH9tcjVMG0XAAmJGH9VuKuWc007JldY=;
        b=C2C+Q+Z+zRdZDwHDeapXdo/tr43RPhNwc7tIFqGMZxVVjiUfKuH4F6O49xAZmJdg8i
         4TmDjveEeb6WNz65G8aS0jWgIWzYlZuZ76KlcXhuU91gdXjj925mhndozhRFewv9d1Cy
         VW/NuGSmi1Dmu6/+sKhpxbvNkWTZwtg9BgP+tgUfN92IwukyO/O10tgy4iv5OToeAgbo
         gRUFlLgaJQ6dN+7lP1YwCzwWVMfFqY28E1IJpV2qqd3mAIIjGpeve1EqDxSgK0X7eUJN
         kxSgHua2JAV88cYCLGbJJo6mbSSXy9YfKhuWSbQXgunILom0slO5enDePor61gBbAyW3
         R6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521438; x=1697126238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqhZbDetpDSPGH9tcjVMG0XAAmJGH9VuKuWc007JldY=;
        b=sz/sq1i86mFYsiYsEIipOAJAA+Mj01muyPHKqYoy23QORiN16b3PG9cLb8FW4ThuU+
         XYhTRYJC63t41U4u3eRPTJFmu/8fZpVD/5pGBiIO86hjedP9YGTWn+VAbl+py+UGjyLw
         b7wjBuFzcAYdYc7T5boQwxvEwQyWWk2e7XMHH74pRLQK2oHzCaNA5xvAYOu3+a2YBcRf
         ApmKSpnL75CBcD7fJxR9p+0Ifn6IGJzXrz+4Br1XMmlBZ92NVHsxvo045Tv5F1mt/lQQ
         q5Gj/4VqRGCtP9MmmxbNPVRhvAOoblnvTrerpFK+L6gxI9q6z/4yWNnMejnNTojVGAPl
         hu4A==
X-Gm-Message-State: AOJu0YwM72m7NH72Tf1rP2l7EKfdM72LLZWbEmqZQesdp6DTnCLNoYNy
        H+QYIucCx3rus4FGUf8eyR/xpw==
X-Google-Smtp-Source: AGHT+IG/GeJb2r19mj4jeu5ZFEFUp7ngzuC6ozd49h0DMFGWzzEf3HPXrcm2cFOkZ8TfC72H5BArow==
X-Received: by 2002:a5d:668c:0:b0:317:6579:2b9f with SMTP id l12-20020a5d668c000000b0031765792b9fmr2534206wru.30.1696521438335;
        Thu, 05 Oct 2023 08:57:18 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:17 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 00/21] Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
Date:   Thu,  5 Oct 2023 16:55:57 +0100
Message-ID: <20231005155618.700312-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,

This series adds initial SoC support for the GS101 SoC and also initial board
support for Pixel 6 phone (Oriole).

The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro (raven).
Currently DT is just added for the gs101 SoC and Oriole.

The support added in this series consists of:
* cpus
* pinctrl
* some CCF clock implementation
* watchdog
* uart
* gpio

This is enough to boot through to a busybox initramfs and shell using an upstream
kernel though :) More platform support will be added over the following weeks
and months. Currently we boot with clk_ignore_unused parameter but this will be
updated as more clocks and platform support lands.

For further information on how to build and flash the upstream kernel on your
Pixel 6, with a prebuilt busybox initramfs please refer to the script and
README.md here:

https://git.codelinaro.org/linaro/googlelt/pixelscripts

I've also included the dtbo overlay containing board_id and board_rev in this
series as otherwise the LK bootloader will bootloop if this is not present in
the dtbo partition. It seems like it would be nicer for the upstream kernel to
build all the DT required to boot upstream kernel on a production phone rather
than having to obtain this dtbo from some other place, but if it is a pain point
then I can remove it.

Many thanks,

Peter.

Peter Griffin (21):
  dt-bindings: interrupt-controller: Add gs101 interrupt controller
  dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
  dt-bindings: clock: Add Google gs101 clock management unit bindings
  dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
    compatibles to GS101
  dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
  dt-bindings: arm: google: Add bindings for Google ARM platforms
  dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
  dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
  dt-bindings: clock: gs101: Add cmu_top clock indices
  dt-bindings: clock: gs101: Add cmu_apm clock indices
  dt-bindings: clock: gs101: Add cmu_misc clock indices
  clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
  clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
  clk: samsung: clk-gs101: add CMU_APM support
  clk: google: gs101: Add support for CMU_MISC clock unit
  pinctrl: samsung: Add gs101 SoC pinctrl configuration
  watchdog: s3c2410_wdt: Add support for Google tensor SoCs
  arm64: dts: google: Add initial Google gs101 SoC support
  google/gs101: Add dt overlay for oriole board
  arm64: defconfig: Enable Google Tensor SoC
  MAINTAINERS: add entry for Google Tensor SoC

 .../devicetree/bindings/arm/google.yaml       |   46 +
 .../bindings/clock/google,gs101-clock.yaml    |  109 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    4 +-
 .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    7 +
 .../bindings/watchdog/samsung-wdt.yaml        |   10 +-
 MAINTAINERS                                   |   11 +
 arch/arm64/Kconfig.platforms                  |    6 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/google/Makefile           |    7 +
 arch/arm64/boot/dts/google/gs101-oriole.dts   |   68 +
 arch/arm64/boot/dts/google/gs101-oriole.dtso  |   21 +
 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1134 +++++++++
 arch/arm64/boot/dts/google/gs101-pinctrl.h    |   17 +
 arch/arm64/boot/dts/google/gs101.dtsi         |  501 ++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/Kconfig                   |    9 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-gs101.c               | 2171 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    9 +-
 drivers/clk/samsung/clk-pll.h                 |    3 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  163 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   68 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   44 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   24 +
 drivers/watchdog/s3c2410_wdt.c                |  116 +-
 include/dt-bindings/clock/gs101.h             |  232 ++
 .../dt-bindings/interrupt-controller/gs101.h  |  758 ++++++
 30 files changed, 5533 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso
 create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
 create mode 100644 drivers/clk/samsung/clk-gs101.c
 create mode 100644 include/dt-bindings/clock/gs101.h
 create mode 100644 include/dt-bindings/interrupt-controller/gs101.h

-- 
2.42.0.582.g8ccd20d70d-goog

