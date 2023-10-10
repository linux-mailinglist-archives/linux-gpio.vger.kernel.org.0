Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3DEF7C4492
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 00:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjJJWtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 18:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344058AbjJJWtw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 18:49:52 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C26A4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:48 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40566f8a093so57351095e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978186; x=1697582986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sbuVfEELPjWRyHywl2N/5ORyt876lTLvJftRhFQgfeo=;
        b=JM4hlSBBp34g2CTUMwKf5nkVDCejiCeezGqPfOleGKNaQip2CoJWOlRAxqZLDbjbee
         etfIyuuaq1lXx1Ry1RJWt/L9QYsmW6GCZN8kS7lfsn/oWqkB0MoVv0Eq9U/ncpeeh8Vl
         MPLmvnm8RfaRcPOutd87Zj9569KQwn26ofV/w7vJ4hc+wrgd6uFgpxCn1UJaVkB1CxwA
         DK6iyYpdu/Pzo2WqdyyrbVXv6/8Kn8fnWBtY9MZozH4o/4zTQPnu2dbRFXhwaZAF/uVD
         XryhBjFjbGlEYdOy6/LyjBINXCdu4yAjZKtc8/+l6xpnKo67UpUWnUIGqTaeyj70X5pQ
         Wf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978186; x=1697582986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbuVfEELPjWRyHywl2N/5ORyt876lTLvJftRhFQgfeo=;
        b=Nb8LQf0S7szvjWB7t65I0fjnMRLOzDEG7fR910Y5HaoVh36B/270ogKw66wYhl88t0
         dcxruxLc2K9lt0NwLEPMpybWgM80y2rZudjr2JSP9MXdSEWVV2mgMhEOErTuNuKpoKPJ
         9lKaXjObRFh3WGMv8toQKRMvd7rNet+6bzfCosZWCDcGxTdZp85R1xWIGH89kG+3VNM9
         DgA5mxa87xqbTwOMIk5aGbsgPRrPSPZvxoicH+4inZnekTiVvEbb/o7Vg6YAg3hVGalq
         S99mUASYPeKn4HQce+kPEZFAGy/wgfC3RHMZCd7CVg+LcoGjYK0mqMD8uJMZBxE/k3q2
         9iWw==
X-Gm-Message-State: AOJu0YxH1cfPQFFsoPS6M0PBilBArPKO8wWAgOV82KViMRcUtdq6RivV
        JiWy4hArwJ6s2uzzP1YJGWFJPQ==
X-Google-Smtp-Source: AGHT+IHj8gB6UPf+MoFrcYoRWXiVyvEqaR26l4a3qKGlDqPVGTZQ3pdV81svnPyT+nUCQYXJMsPFNQ==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id q9-20020a7bce89000000b00402f07c4b48mr16484655wmj.28.1696978186429;
        Tue, 10 Oct 2023 15:49:46 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:45 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
Date:   Tue, 10 Oct 2023 23:49:08 +0100
Message-ID: <20231010224928.2296997-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,

Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
the review feedback received so far.

This series adds initial SoC support for the GS101 SoC and also initial board
support for Pixel 6 phone (Oriole).

The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
(raven) phones. Currently DT is added for the gs101 SoC and Oriole.
As you can see from the patches the SoC is based on a Samsung Exynos SoC,
and therefore lots of the low level Exynos drivers can be re-used.

The support added in this series consists of:
* cpus
* pinctrl
* some CCF implementation
* watchdog
* uart
* gpio

This is enough to boot through to a busybox initramfs and shell using an
upstream kernel though :) More platform support will be added over the
following weeks and months.

Note 1: I've removed the dtbo overlay from v2 submission and will re-submit once
I have appropriate documentation for it.

Note 2: I've left the bootargs in dts with earlycon for now, for two reasons.
1) The bootloader hangs if bootargs isn't present in the dtb as it tries to
re-write this with additional bootargs.
2) there is a issue whereby the full serial console doesn't come up properly
if earlycon isn't also specified. This issue needs further investigation.

Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible`
I tried to narrow the interrupts check to google,gs101-pinctrl but I still see
a warning:
gs101-oriole.dtb: pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long

If anyone can educate me on what I've done wrong here it would be most
appreciated!

kind regards,

Peter.

Changes since v1:
 - Remove irq/gs101.h and replace macros with irq numbers globally
 - exynos-pmu - keep alphabetical order
 - add cmu_apm to clock bindings documentation
 - sysreg bindings - remove superfluous `google,gs101-sysreg`
 - watchdog bindings - Alphanumerical order, update gs201 comment
 - samsung,pinctrl.yaml - add new "if:then:else:" to narrow for google SoC
 - samsung,pinctrl-wakeup-interrupt.yaml - Alphanumerical order
 - samsung,pinctrl- add google,gs101-wakeup-eint compatible
 - clk-pll: fixup typos
 - clk-gs101: fix kernel test robot warnings (add 2 new clocks,dividers,gate)
 - clk-gs101: fix alphabetical order
 - clk-gs101: cmu_apm: fixup typo and missing empty entry
 - clk-gs101: cmu_misc: remove clocks that were being registerred twice
 - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON bitfield
 - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 pins as well
 - pinctrl: gs101: rename bank_type_6/7 structs to be more specific, split from filter
 - watchdog: s3c2410_wdt: remove dev_info prints
 - gs101.dtsi/oriole.dts: order by unit node, remove underscores from node name, blank lines
   add SoC node, split dts and dtsi into separate patches, remove 'DVT' suffix
 - gs101-oriole.dtso: Remove overlay until board_id is documented properly
 - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
 - gpio-keys: update linux,code to use input-event-code macros
 - add dedicated gs101-uart compatible

Peter Griffin (20):
  dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
  dt-bindings: clock: Add Google gs101 clock management unit bindings
  dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
    compatibles to GS101
  dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
  dt-bindings: arm: google: Add bindings for Google ARM platforms
  dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
  dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
  dt-bindings: serial: samsung: Add google-gs101-uart compatible
  clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
  clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
  clk: samsung: clk-gs101: add CMU_APM support
  clk: samsung: clk-gs101: Add support for CMU_MISC clock unit
  pinctrl: samsung: Add filter selection support for alive banks
  pinctrl: samsung: Add gs101 SoC pinctrl configuration
  watchdog: s3c2410_wdt: Add support for Google tensor SoCs
  tty: serial: samsung: Add gs101 compatible and SoC data
  arm64: dts: google: Add initial Google gs101 SoC support
  arm64: dts: google: Add initial Oriole/pixel 6 board support
  arm64: defconfig: Enable Google Tensor SoC
  MAINTAINERS: add entry for Google Tensor SoC

 .../devicetree/bindings/arm/google.yaml       |   46 +
 .../bindings/clock/google,gs101-clock.yaml    |  125 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   19 +
 .../bindings/serial/samsung_uart.yaml         |    2 +
 .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    6 +
 .../bindings/watchdog/samsung-wdt.yaml        |   10 +-
 MAINTAINERS                                   |   10 +
 arch/arm64/Kconfig.platforms                  |    6 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/google/Makefile           |    4 +
 arch/arm64/boot/dts/google/gs101-oriole.dts   |   79 +
 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1275 ++++++++++
 arch/arm64/boot/dts/google/gs101-pinctrl.h    |   32 +
 arch/arm64/boot/dts/google/gs101.dtsi         |  503 ++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/Kconfig                   |    9 +
 drivers/clk/samsung/Makefile                  |    2 +
 drivers/clk/samsung/clk-gs101.c               | 2164 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    9 +-
 drivers/clk/samsung/clk-pll.h                 |    3 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  163 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   84 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   41 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   24 +
 drivers/tty/serial/samsung_tty.c              |   12 +
 drivers/watchdog/s3c2410_wdt.c                |  104 +-
 include/dt-bindings/clock/google,gs101.h      |  232 ++
 30 files changed, 4961 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
 create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
 create mode 100644 drivers/clk/samsung/clk-gs101.c
 create mode 100644 include/dt-bindings/clock/google,gs101.h

-- 
2.42.0.609.gbb76f46606-goog

