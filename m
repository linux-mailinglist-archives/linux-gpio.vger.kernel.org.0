Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F2D3222CC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 00:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhBVXvs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Feb 2021 18:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhBVXvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2021 18:51:44 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E20C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2021 15:51:03 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id y7so58960562lji.7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2021 15:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=5SMoYT9w3pn8KnbphW0hOZRroLOYfTtDLh1EAs49Y3o=;
        b=fd9BILVsuRJTfniYQUMiVjIFShC3hBncVhUjd3oQ6sXU9KpRBqZZfxxCgsbAczlydn
         kwoXfnJMMlkqdy07IKEsjRzTmupbSokebCxrAgxHUx4APRQpEZpXSrexOxNpJOuTaFhd
         Z5gEhqdCXyvNYK2HayP0AcenRGqAlQcWVB6Rj8FYG7buuOijuiiy/UsuFASr/HkcyuUV
         lGBh/M/9rVUjZ33VjHYQwD5FjruH1mzHeFWbXIeATDaI8PW0RqcnLgJfOmjSdgYTNW4f
         VagZaVp7xZv0+XmUdkUCPGcAF5EZtWSTPLk1PT0qT9gNGhMh1moAdXjFBDTMHA8kJPG6
         ELXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=5SMoYT9w3pn8KnbphW0hOZRroLOYfTtDLh1EAs49Y3o=;
        b=hM/gdUuHN7pzhpI1QHgwmM8DFUCsSkdJUZejQAnhDIvgMN+HEDwQ1gwBkgUyYekMEI
         oxcENfRsnIwIXDqIQqT4j+Srts7iubWSSMCrSWPIEaOjJW60bGCAnDhnwBh1g5V0vXay
         DEBNgIj4XkKDm6TA8cioe6YmPPLi3ysCMYVqgYOZ6citk3anhdZp/wYj2PHMly60gTSs
         jKpHa6QNhetr2NS+Wh0v/HGNjlI/G1KEZrD4aq90S9nS79hsu/r/QYFX8RW/a7eVLBKy
         YrvXmZvbWK8UFVC+PbyuOJVN5kEEQHf4ZO5wnolTheU5HfQfhHpp8vMsIzxrCuovkHwA
         kpkA==
X-Gm-Message-State: AOAM530LDLHL5VnVB5+fV3snhbcXRAQugPE6PlDs6IwmiJmdo3z3SPgi
        M2pE0PlUxHo/DqArsRItWHeDGeWRmCsufZhYJ5IQ2FJj749kd7l3
X-Google-Smtp-Source: ABdhPJy/jFMimeOiuaVOFQXQIEm0r/alQRD7eAxgvGvEYhZQ6MeQmV+bM37zSOOe5PMnRC3uEH0H1SwHAjadE3d2Eng=
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr7313510lji.200.1614037862249;
 Mon, 22 Feb 2021 15:51:02 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Feb 2021 00:50:51 +0100
Message-ID: <CACRpkdbrBLXV+qyc-zWW6wRWnFZGviEus7+QP129bgDFxrhbjA@mail.gmail.com>
Subject: [GIT PULL] pinctrl changes for v5.12
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are the pin control changes for v5.12. Really boring this
time, not even any core changes, just drivers and janitorial.
Well the drivers are a bit interesting. Arnd deleted a bunch of
unused ARM32 drivers.

I hear we will soon get to review the M1 Mac driver, that
will be interesting.

I merged v5.11-rc2 at one point to get a base (fixes) for
some Intel patches.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62=
:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.12-1

for you to fetch changes up to b40b760aa2a9587cdcde62759642b4e99c40dedc:

  pinctrl: mediatek: Fix trigger type setting follow for unexpected
interrupt (2021-02-15 05:52:01 +0100)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.12 kernel.

This time a calm set with no core changes.

New drivers/subdrivers:

- Renesas R8A7790A0 pin controller.

- Allwinner H616 and H616-R pin controllers.

- Qualcomm SM8350 and SC8180x pin controllers.

Improvements:

- Redo the DT bindings for Ralink RT2880.

- A common Qualcomm TLMM DT binding in YAML.

- Delete the unused drivers for U300, COH901, Sirf Atlas, and ZTE ZX.

----------------------------------------------------------------
Andre Przywara (3):
      dt-bindings: pinctrl: Add Allwinner H616 compatible strings
      pinctrl: sunxi: Add support for the Allwinner H616 pin controller
      pinctrl: sunxi: Add support for the Allwinner H616-R pin controller

Andy Shevchenko (4):
      pinctrl: intel: Split intel_pinctrl_add_padgroups() for better mainte=
nance
      pinctrl: intel: Drop unnecessary check for predefined features
      pinctrl: intel: Convert capability list to features
      pinctrl: tigerlake: Add Alder Lake-P ACPI ID

Arnd Bergmann (4):
      pinctrl: remove zte zx driver
      pinctrl: remove sirf atlas/prima drivers
      pinctrl: remove coh901 driver
      pinctrl: remove ste u300 driver

Bjorn Andersson (3):
      dt-bindings: pinctrl: qcom: Define common TLMM binding
      dt-bindings: pinctrl: qcom: Add sc8180x binding
      pinctrl: qcom: Add sc8180x TLMM driver

Chanho Park (2):
      pinctrl: samsung: use raw_spinlock for locking
      pinctrl: samsung: use raw_spinlock for s3c64xx

Claudiu Beznea (3):
      dt-bindings: pinctrl: at91-pio4: add slew-rate
      pinctrl: at91-pio4: add support for slew-rate
      pinctrl: at91-pio4: fix "Prefer 'unsigned int' to bare use of 'unsign=
ed'"

Drew Fustini (3):
      pinctrl: clarify #pinctrl-cells for pinctrl-single,pins
      pinctrl: pinmux: add function selector to pinmux-functions
      pinctrl: single: set function name when adding function

Geert Uytterhoeven (2):
      pinctrl: renesas: checker: Restrict checks to Renesas platforms
      dt-bindings: pinctrl: Group tuples in pin control properties

Hailong Fan (1):
      pinctrl: mediatek: Fix trigger type setting follow for
unexpected interrupt

Jiapeng Zhong (1):
      pinctrl: bcm: Simplify bool comparison

Jonathan Neusch=C3=A4fer (2):
      dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix indentation
      pinctrl: nuvoton: npcm7xx: Fix alignment of table header comment

Konrad Dybcio (1):
      pinctrl: qcom: spmi-mpp: Add PM8019 compatible

Linus Walleij (4):
      Merge tag 'renesas-pinctrl-for-v5.12-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'v5.11-rc2' into devel
      Merge tag 'intel-pinctrl-v5.12-1' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into devel
      pinctrl: actions: Add depends on || COMPILE_TEST

Manivannan Sadhasivam (1):
      pinctrl: actions: Add the platform dependency to drivers

Paul Cercueil (3):
      kconfig.h: Add IF_ENABLED() macro
      pinctrl: ingenic: Only support SoCs enabled in config
      pinctrl: ingenic: Improve JZ4760 support

Robert Foss (1):
      dt-bindings: mediatek: mt8192: Fix dt_binding_check warning

Samuel Holland (1):
      pinctrl: sunxi: h6-r: Add s_rsb pin functions

Sergio Paracuellos (8):
      dt-bindings: pinctrl: rt2880: properly redo bindings
      pinctrl: ralink: rt2880: avoid double pointer to simplify code
      pinctrl: ralink: rt2880: return proper error code
      pinctrl: ralink: rt2880: add missing NULL check
      pinctrl: ralink: rt2880: delete not needed error message
      pinctrl: ralink: rt2880: preserve error codes
      pinctrl: ralink: rt2880: use 'PTR_ERR_OR_ZERO'
      pinctrl: ralink: rt2880: fix '-Wmissing-prototypes' in init function

Souptick Joarder (1):
      pinctrl: ti :iodelay: Fixed inconsistent indenting

Ulrich Hecht (18):
      dt-bindings: pinctrl: renesas,pfc: Document r8a779a0 PFC support
      pinctrl: renesas: Implement unlock register masks
      pinctrl: renesas: Add I/O voltage level flag
      pinctrl: renesas: Add PORT_GP_CFG_{2,31} macros
      pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
      pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
      pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
      pinctrl: renesas: r8a779a0: Add CANFD pins, groups and functions
      pinctrl: renesas: r8a779a0: Add DU pins, groups and function
      pinctrl: renesas: r8a779a0: Add HSCIF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
      pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
      pinctrl: renesas: r8a779a0: Add MSIOF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
      pinctrl: renesas: r8a779a0: Add QSPI pins, groups, and functions
      pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
      pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions

Vinod Koul (2):
      dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
      pinctrl: qcom: Add SM8350 pinctrl driver

YANG LI (1):
      pinctrl: sprd: Simplify bool comparison

Zhaoyu Liu (1):
      pinctrl: remove empty lines in pinctrl subsystem

Zheng Yongjun (4):
      pinctrl: at91: convert comma to semicolon
      pinctrl: mediatek: paris: convert comma to semicolon
      pinctrl: mediatek: moore: convert comma to semicolon
      pinctrl: ti-iodelay: convert comma to semicolon

 .../devicetree/bindings/gpio/gpio-atlas7.txt       |   50 -
 .../bindings/gpio/gpio-stericsson-coh901.txt       |    7 -
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |   17 +-
 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |    8 +-
 .../bindings/pinctrl/brcm,ns2-pinmux.txt           |    2 +-
 .../bindings/pinctrl/brcm,nsp-pinmux.txt           |    2 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         |    2 +-
 .../bindings/pinctrl/microchip,sparx5-sgpio.yaml   |    4 +-
 .../devicetree/bindings/pinctrl/pinctrl-atlas7.txt |  109 -
 .../bindings/pinctrl/pinctrl-bindings.txt          |    4 +-
 .../bindings/pinctrl/pinctrl-mcp23s08.txt          |    2 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    2 +-
 .../devicetree/bindings/pinctrl/pinctrl-single.txt |   12 +-
 .../devicetree/bindings/pinctrl/pinctrl-zx.txt     |   84 -
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    1 +
 .../bindings/pinctrl/qcom,sc8180x-pinctrl.yaml     |  152 +
 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml      |  145 +
 .../bindings/pinctrl/qcom,tlmm-common.yaml         |   85 +
 .../bindings/pinctrl/ralink,rt2880-pinmux.yaml     |   62 +-
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |    3 +-
 .../bindings/pinctrl/samsung-pinctrl.txt           |    2 +-
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |    4 +-
 drivers/pinctrl/Kconfig                            |   25 -
 drivers/pinctrl/Makefile                           |    4 -
 drivers/pinctrl/actions/Kconfig                    |    3 +
 drivers/pinctrl/actions/pinctrl-owl.c              |    1 -
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |    2 +-
 drivers/pinctrl/core.c                             |    1 -
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |    1 -
 drivers/pinctrl/intel/pinctrl-intel.c              |  117 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    4 +
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |   13 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |    4 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c           |    4 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |    1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    2 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |  137 +-
 drivers/pinctrl/pinctrl-at91.c                     |    3 +-
 drivers/pinctrl/pinctrl-coh901.c                   |  774 ---
 drivers/pinctrl/pinctrl-coh901.h                   |    6 -
 drivers/pinctrl/pinctrl-ingenic.c                  |   98 +-
 drivers/pinctrl/pinctrl-single.c                   |    1 +
 drivers/pinctrl/pinctrl-st.c                       |    1 -
 drivers/pinctrl/pinctrl-sx150x.c                   |    1 -
 drivers/pinctrl/pinctrl-u300.c                     | 1111 ----
 drivers/pinctrl/pinmux.c                           |    2 +-
 drivers/pinctrl/qcom/Kconfig                       |   18 +
 drivers/pinctrl/qcom/Makefile                      |    2 +
 drivers/pinctrl/qcom/pinctrl-sc8180x.c             | 1624 ++++++
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |    1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c              | 1649 ++++++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    1 +
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    1 -
 drivers/pinctrl/ralink/pinctrl-rt2880.c            |   47 +-
 drivers/pinctrl/renesas/Kconfig                    |    5 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/core.c                     |   38 +-
 drivers/pinctrl/renesas/pfc-r8a77950.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c              |    1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c             |    1 -
 drivers/pinctrl/renesas/pfc-r8a779a0.c             | 4460 ++++++++++++++
 drivers/pinctrl/renesas/pinctrl.c                  |   16 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |   28 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   16 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c          |    4 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c          |    4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   22 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    2 +-
 drivers/pinctrl/sirf/Makefile                      |    7 -
 drivers/pinctrl/sirf/pinctrl-atlas6.c              | 1137 ----
 drivers/pinctrl/sirf/pinctrl-atlas7.c              | 6157 ----------------=
----
 drivers/pinctrl/sirf/pinctrl-prima2.c              | 1131 ----
 drivers/pinctrl/sirf/pinctrl-sirf.c                |  894 ---
 drivers/pinctrl/sirf/pinctrl-sirf.h                |  116 -
 drivers/pinctrl/sprd/pinctrl-sprd.c                |    2 +-
 drivers/pinctrl/sunxi/Kconfig                      |   10 +
 drivers/pinctrl/sunxi/Makefile                     |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c        |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c      |   56 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c        |  548 ++
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |    7 +-
 drivers/pinctrl/zte/Kconfig                        |   14 -
 drivers/pinctrl/zte/Makefile                       |    3 -
 drivers/pinctrl/zte/pinctrl-zx.c                   |  445 --
 drivers/pinctrl/zte/pinctrl-zx.h                   |  102 -
 drivers/pinctrl/zte/pinctrl-zx296718.c             | 1024 ----
 include/linux/kconfig.h                            |    6 +
 89 files changed, 9222 insertions(+), 13460 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-atlas7.txt
 delete mode 100644
Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-atlas=
7.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-zx.tx=
t
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
 delete mode 100644 drivers/pinctrl/pinctrl-coh901.c
 delete mode 100644 drivers/pinctrl/pinctrl-coh901.h
 delete mode 100644 drivers/pinctrl/pinctrl-u300.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sc8180x.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350.c
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c
 delete mode 100644 drivers/pinctrl/sirf/Makefile
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-atlas6.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-atlas7.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-prima2.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-sirf.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-sirf.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
 delete mode 100644 drivers/pinctrl/zte/Kconfig
 delete mode 100644 drivers/pinctrl/zte/Makefile
 delete mode 100644 drivers/pinctrl/zte/pinctrl-zx.c
 delete mode 100644 drivers/pinctrl/zte/pinctrl-zx.h
 delete mode 100644 drivers/pinctrl/zte/pinctrl-zx296718.c
