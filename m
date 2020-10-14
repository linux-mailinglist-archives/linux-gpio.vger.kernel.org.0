Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C3828E0E0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 14:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgJNM6d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 08:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgJNM6d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 08:58:33 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA47C0613D2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 05:58:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a4so3043884lji.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=KT0JcSzmdfu9lD/jOyJjeKmrwjwz62KwLeoYxaGtTL8=;
        b=HHFlnuKpOHk9pnv6TuQC12h8LLOtmrJn6cAAt3hN54mY9qQObcy6U/ZcsMErZfwo1a
         WH00nEkPQlY5GOVwBkVT5YtxLSaOD5wWAy9yul2Ry4ioLhJcoNRLX0XT2Wln7Xr0BQr7
         xAaifRfvjIp77WsS8MMXUs3BUftbAQiR65+LvAo5eO9aYI5hN/H6RF3u9KrSAMnYPfW7
         mGHCYjmcCeE7hIPIy/0oscej3T3xMw1uGAeuwYuO+0I1+BsSJx9kD6FsC+Gh0oEparKE
         JjeWcUq4nphDeu2N7nFDv8TK+fI96GxVPooRlCVa5lpCD5EgdlZSJTV8S+E+MVDHXRU9
         F3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=KT0JcSzmdfu9lD/jOyJjeKmrwjwz62KwLeoYxaGtTL8=;
        b=pQXTOeWabYa8PJR5hHk7HTPwDg+6ZPfo2p6f45Qkd3e7aDLBKZkJcG83SlfFkCHI5z
         9EkVuDB51YRk8xsyhAr7tl15fgiNlVzYF7jZA7iVcveYj2n9OlCDkIJUgf96u+1eVeKG
         wFHatzE5kgQSQZQT2OKteJcUx0M20HIZc80an8ot/H7ZlHMabQrf0cwnHGxs2/YuhBCH
         kMhroEIbJ6hrFCCnll2wnDWNvTJu2ZxFSY68tvIla8R1QhH/kqV875EL8X7IWf75vkUG
         0bJZ5cEGg+qEPbvxgxc7LDfhCMntxidVhA8r4Yy1g2xpvA3/CjempaCAUznI/1myDdIV
         XSGw==
X-Gm-Message-State: AOAM5324iJhZmXcwVnekRxlaJOvtWCkQ0JMuZ9Oml/JTzDdANxabdoQM
        hVX2fN6N9K1tKKgKHnnGXnv2wU7AQorKnOTLxS/rkZ/KjRynCQzV
X-Google-Smtp-Source: ABdhPJxm/K/DrCS1JZlNqD8iMwjypACXhUjUe7xIiMQ9KM8GH85Ei6TTJp2XMK/uEO2c6Ixo4uvDhQCu67i4xyMIgWc=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr1963382ljg.286.1602680311063;
 Wed, 14 Oct 2020 05:58:31 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Oct 2020 14:58:20 +0200
Message-ID: <CACRpkdbNUUAiF4Hbb=utPr1Wstwx9U0wJsJLLhSzcsJcD8gprw@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v5.10 kernel series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is the bulk of pin control changes for the v5.10 kernel
cycle.

There is nothing special to say about it at all. It should even
just merge fine, only driver changes, some new, some
incremental development.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5=
:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.10-1

for you to fetch changes up to 55596c5445566cf43b83238198fd038d21172d99:

  pinctrl: amd: Add missing pins to the pin group list (2020-10-07
15:37:17 +0200)

----------------------------------------------------------------
Pin control bulk changes for the v5.10 kernel cycle

Core changes:

- NONE whatsoever, we don't even touch the core files this
  time around.

New drivers:

- New driver for the Toshiba Visconti SoC.

- New subdriver for the Qualcomm MSM8226 SoC.

- New subdriver for the Actions Semiconductor S500 SoC.

- New subdriver for the Mediatek MT8192 SoC.

- New subdriver for the Microchip SAMA7G5 SoC.

Driver enhancements:

- Intel Cherryview and Baytrail cleanups and refactorings.

- Enhanced support for the Renesas R8A7790, more pins and
  groups.

- Some optimizations for the MCP23S08 MCP23x17 variant.

- Some cleanups around the Actions Semiconductor subdrivers.

- A bunch of cleanups around the SH-PFC and Emma Mobile
  drivers.

- The "SH-PFC" (literally SuperH pin function controller, I
  think) subdirectory is now renamed to the more neutral
  "renesas", as these are not very much centered around
  SuperH anymore.

- Non-critical fixes for the Aspeed driver.

- Non-critical fixes for the Ingenic (MIPS!) driver.

- Fix a bunch of missing pins on the AMD pinctrl driver.

----------------------------------------------------------------
Andrew Halaney (1):
      pinctrl: nomadik: Fix pull direction debug info

Andrew Jeffery (3):
      pinctrl: aspeed: Format pinconf debug consistent with pinmux
      pinctrl: aspeed: Use the right pinconf mask
      pinctrl: aspeed-g6: Add bias controls for 1.8V GPIO banks

Andy Shevchenko (12):
      pinctrl: cherryview: Drop stale comment
      pinctrl: cherryview: Move custom community members to separate data s=
truct
      pinctrl: cherryview: Switch to use struct intel_pinctrl
      pinctrl: cherryview: Utilize temporary variable to hold device pointe=
r
      pinctrl: intel: Extract intel_pinctrl_get_soc_data() helper for wider=
 use
      pinctrl: baytrail: Switch to use intel_pinctrl_get_soc_data()
      pinctrl: cherryview: Switch to use intel_pinctrl_get_soc_data()
      pinctrl: intel: Update header block to reflect direct dependencies
      pinctrl: mcp23s08: Improve error messaging in ->probe()
      pinctrl: tigerlake: Fix register offsets for TGL-H variant
      pinctrl: cannonlake: Modify COMMUNITY macros to be consistent
      pinctrl: sunrisepoint: Modify COMMUNITY macros to be consistent

Anson Huang (3):
      pinctrl: imx: Use function callbacks for SCU related functions
      pinctrl: imx: Support building SCU pinctrl core driver as module
      pinctrl: imx: Support building i.MX pinctrl core driver as module

Bartosz Dudziak (2):
      dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
      pinctrl: qcom: Add msm8226 pinctrl driver.

Chuanhong Guo (1):
      pinctrl: mediatek: mt7622: add antsel pins/groups

Cl=C3=A9ment P=C3=A9ron (1):
      dt-bindings: pinctrl: sunxi: Allow pinctrl with more interrupt banks

Cristian Ciocaltea (3):
      dt-bindings: pinctrl: Add bindings for Actions S500 SoC
      pinctrl: actions: Add Actions S500 pinctrl driver
      MAINTAINERS: Set pinctrl binding entry for all Actions Semi Owl SoCs

Drew Fustini (3):
      pinctrl: Document pinctrl-single,pins when #pinctrl-cells =3D 2
      pinctrl: single: fix pinctrl_spec.args_count bounds check
      pinctrl: single: fix debug output when #pinctrl-cells =3D 2

Enric Balletbo i Serra (1):
      pinctrl: mediatek: Free eint data on failure

Eugen Hristev (2):
      dt-bindings: pinctrl: at91-pio4: add microchip,sama7g5
      pinctrl: at91-pio4: add support for sama7g5 SoC

Fabien Parent (2):
      pinctrl: mt65xx: add OF bindings for MT8167
      pinctrl: mediatek: Add MT8167 Pinctrl driver

Geert Uytterhoeven (9):
      dt-bindings: pinctrl: sh-pfc: Convert to json-schema
      pinctrl: rza1: Switch to using "output-enable"
      dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin controller node n=
ame
      dt-bindings: pinctrl: rza1: Convert to json-schema
      dt-bindings: pinctrl: rzn1: Convert to json-schema
      pinctrl: rzn1: Do not select GENERIC_PIN{CTRL_GROUPS,MUX_FUNCTIONS}
      pinctrl: Rename sh-pfc to renesas
      pinctrl: renesas: Reintroduce SH_PFC for common sh-pfc code
      pinctrl: visconti: PINCTRL_TMPV7700 should depend on ARCH_VISCONTI

Hans de Goede (1):
      pinctrl: cherryview: Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPI=
Os

Heiko Stuebner (1):
      pinctrl: rockchip: depend on OF

Krzysztof Kozlowski (1):
      dt-bindings: pinctrl: renesas,pfc: align example GPIO hog name
with dtschema

Kuninori Morimoto (4):
      pinctrl: sh-pfc: Tidy up Emma Mobile EV2
      pinctrl: sh-pfc: Collect Renesas related CONFIGs in one place
      pinctrl: sh-pfc: Align driver description title
      pinctrl: sh-pfc: Tidy up driver description title

Lad Prabhakar (2):
      pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group
      pinctrl: sh-pfc: r8a7790: Add CAN pins, groups and functions

Linus Walleij (2):
      Merge tag 'renesas-pinctrl-for-v5.10-tag1' of
git://git.kernel.org/.../geert/renesas-drivers into devel
      Merge tag 'intel-pinctrl-v5.10-1' of
git://git.kernel.org/.../pinctrl/intel into devel

Liu Shixin (2):
      pinctrl: sprd: use module_platform_driver to simplify the code
      pinctrl: spear: simplify the return expression of spear310_pinctrl_pr=
obe

Martin DEVERA (1):
      pinctrl: sx150x: Fix pinctrl enablement order bug

Nobuhiro Iwamatsu (2):
      pinctrl: Add DT bindings for Toshiba Visconti TMPV7700 SoC
      pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support

Pali Roh=C3=A1r (1):
      pinctrl: armada-37xx: Add comment for pcie1_reset pin group

Qinglang Miao (2):
      pinctrl: spear: simplify the return expression of tvc_connect()
      pinctrl: ocelot: simplify the return expression of
ocelot_gpiochip_register()

Rikard Falkeborn (4):
      pinctrl: actions: pinctrl-owl: Constify owl_pinctrl_ops and owl_pinmu=
x_ops
      pinctrl: actions: pinctrl-s700: Constify s700_padinfo[]
      pinctrl: actions: pinctrl-s900: Constify s900_padinfo[]
      pinctrl: nuvoton: npcm7xx: Constify static ops structs

Shyam Sundar S K (1):
      pinctrl: amd: Add missing pins to the pin group list

Thierry Reding (1):
      pinctrl: devicetree: Keep deferring even on timeout

Thomas Preston (2):
      pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser
      pinctrl: mcp23s08: Fix mcp23x17 precious range

Wang Xiaojun (1):
      pinctrl: mediatek: use devm_platform_ioremap_resource_byname()

Yangtao Li (3):
      dt-bindings: pinctrl: sunxi: Get rid of continual nesting
      dt-bindings: pinctrl: sunxi: Add A100 pinctrl bindings
      pinctrl: sunxi: add support for the Allwinner A100 pin controller

Zhiyong Tao (3):
      dt-bindings: pinctrl: mt8192: add pinctrl file
      dt-bindings: pinctrl: mt8192: add binding document
      pinctrl: mediatek: Add pinctrl driver for mt8192

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (3):
      pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.
      pinctrl: Ingenic: Correct the pullup and pulldown parameters of JZ478=
0.
      pinctrl: Ingenic: Add I2S pins support for Ingenic SoCs.

 .../bindings/pinctrl/actions,s500-pinctrl.yaml     |  240 +++
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       |  141 +-
 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |    4 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 .../bindings/pinctrl/pinctrl-mt8192.yaml           |  155 ++
 .../devicetree/bindings/pinctrl/pinctrl-single.txt |   21 +-
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml     |  132 ++
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |  188 --
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |  193 ++
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |  223 --
 .../bindings/pinctrl/renesas,rza1-ports.yaml       |  190 ++
 .../bindings/pinctrl/renesas,rza2-pinctrl.yaml     |    2 +-
 .../bindings/pinctrl/renesas,rzn1-pinctrl.txt      |  153 --
 .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml     |  129 ++
 .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml |   92 +
 MAINTAINERS                                        |    7 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |    2 +-
 drivers/pinctrl/Kconfig                            |   37 +-
 drivers/pinctrl/Makefile                           |    6 +-
 drivers/pinctrl/actions/Kconfig                    |    6 +
 drivers/pinctrl/actions/Makefile                   |    1 +
 drivers/pinctrl/actions/pinctrl-owl.c              |    4 +-
 drivers/pinctrl/actions/pinctrl-s500.c             | 1727 +++++++++++++++
 drivers/pinctrl/actions/pinctrl-s700.c             |    2 +-
 drivers/pinctrl/actions/pinctrl-s900.c             |    2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |   17 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |    8 +-
 drivers/pinctrl/devicetree.c                       |    5 +-
 drivers/pinctrl/freescale/Kconfig                  |    5 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            |   13 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |   57 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c        |    3 +
 drivers/pinctrl/freescale/pinctrl-imx8qm.c         |    3 +
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c        |    3 +
 drivers/pinctrl/freescale/pinctrl-scu.c            |    5 +
 drivers/pinctrl/intel/Kconfig                      |   12 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   24 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |   22 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  184 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |   24 +-
 drivers/pinctrl/intel/pinctrl-intel.h              |    7 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |   60 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |   42 +-
 drivers/pinctrl/mediatek/Kconfig                   |   14 +
 drivers/pinctrl/mediatek/Makefile                  |    2 +
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   11 +-
 drivers/pinctrl/mediatek/pinctrl-mt7622.c          |  103 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c          |  362 ++++
 drivers/pinctrl/mediatek/pinctrl-mt8192.c          | 1409 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   31 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h      | 1248 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h      | 2275 ++++++++++++++++=
++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   11 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |    2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |   16 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    6 +-
 drivers/pinctrl/pinctrl-amd.h                      |   69 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |    7 +
 drivers/pinctrl/pinctrl-ingenic.c                  |  349 ++-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   47 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |    8 +-
 drivers/pinctrl/pinctrl-single.c                   |    4 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   17 +-
 drivers/pinctrl/qcom/Kconfig                       |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c             |  630 ++++++
 drivers/pinctrl/{sh-pfc =3D> renesas}/Kconfig        |  238 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/Makefile       |    8 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/core.c         |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/core.h         |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/gpio.c         |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-emev2.c    |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a73a4.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7740.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77470.c |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7778.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7779.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7790.c  |  121 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7791.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7792.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7794.c  |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77950.c |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77951.c |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7796.c  |    2 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77965.c |    2 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77970.c |    2 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77980.c |    2 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77990.c |    2 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77995.c |    2 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7203.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7264.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7269.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh73a0.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7720.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7722.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7723.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7724.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7734.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7757.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7785.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7786.c   |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-shx3.c     |    0
 drivers/pinctrl/{ =3D> renesas}/pinctrl-rza1.c       |   11 +-
 drivers/pinctrl/{ =3D> renesas}/pinctrl-rza2.c       |    4 +-
 drivers/pinctrl/{ =3D> renesas}/pinctrl-rzn1.c       |    6 +-
 drivers/pinctrl/{sh-pfc =3D> renesas}/pinctrl.c      |    0
 drivers/pinctrl/{sh-pfc =3D> renesas}/sh_pfc.h       |    0
 drivers/pinctrl/spear/pinctrl-spear310.c           |    8 +-
 drivers/pinctrl/spear/pinctrl-spear320.c           |    8 +-
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c         |   13 +-
 drivers/pinctrl/sunxi/Kconfig                      |   10 +
 drivers/pinctrl/sunxi/Makefile                     |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c      |  105 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c        |  708 ++++++
 drivers/pinctrl/visconti/Kconfig                   |   14 +
 drivers/pinctrl/visconti/Makefile                  |    3 +
 drivers/pinctrl/visconti/pinctrl-common.c          |  305 +++
 drivers/pinctrl/visconti/pinctrl-common.h          |   96 +
 drivers/pinctrl/visconti/pinctrl-tmpv7700.c        |  355 +++
 include/dt-bindings/pinctrl/mt8192-pinfunc.h       | 1344 ++++++++++++
 120 files changed, 13017 insertions(+), 1137 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc.y=
aml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
 create mode 100644 drivers/pinctrl/actions/pinctrl-s500.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8192.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8226.c
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/Kconfig (51%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/Makefile (92%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/core.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/core.h (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/gpio.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-emev2.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a73a4.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7740.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77470.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7778.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7779.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7790.c (98%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7791.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7792.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7794.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77950.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77951.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a7796.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77965.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77970.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77980.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77990.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-r8a77995.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7203.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7264.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7269.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh73a0.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7720.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7722.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7723.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7724.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7734.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7757.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7785.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-sh7786.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pfc-shx3.c (100%)
 rename drivers/pinctrl/{ =3D> renesas}/pinctrl-rza1.c (99%)
 rename drivers/pinctrl/{ =3D> renesas}/pinctrl-rza2.c (99%)
 rename drivers/pinctrl/{ =3D> renesas}/pinctrl-rzn1.c (99%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/pinctrl.c (100%)
 rename drivers/pinctrl/{sh-pfc =3D> renesas}/sh_pfc.h (100%)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
 create mode 100644 drivers/pinctrl/visconti/Kconfig
 create mode 100644 drivers/pinctrl/visconti/Makefile
 create mode 100644 drivers/pinctrl/visconti/pinctrl-common.c
 create mode 100644 drivers/pinctrl/visconti/pinctrl-common.h
 create mode 100644 drivers/pinctrl/visconti/pinctrl-tmpv7700.c
 create mode 100644 include/dt-bindings/pinctrl/mt8192-pinfunc.h
