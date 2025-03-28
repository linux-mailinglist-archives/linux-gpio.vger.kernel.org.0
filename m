Return-Path: <linux-gpio+bounces-18087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D847A74886
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 11:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3085517C489
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 10:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E769F21A94D;
	Fri, 28 Mar 2025 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgeM9TNN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A221931C
	for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158492; cv=none; b=Ob0bGIWMUR6bw5GWlvuV1kZahDK3SWCjx2Df/GYE+GT2QI6NjcSOigvT7KaF3UGbrBJoij+krL821vdxHHAUUKE924UzQAHk5s9ybVaeqfGxqNV9wnzX5OFx31/Rn8pBXsGDF3aU/cVjrZY+Noi9V+h+WkfXooKjP8ib6VmY6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158492; c=relaxed/simple;
	bh=55/9gDG6T5Wd1ICUcrQqrVEmOfmAoKjwBAUGIYsgi+k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Bs5MnPzj6tUg9nQTxEr7P3y4p8eV0Esdpg0zK0aH9YegLWbZiPjMVXV9EgXnhSrGoXQ6VEh/b33sFv9gXwlm8b4S44wUmb0TIElkbDbpxw30I7cwdGtZ5QHc/DjLj1lhBkaY5HcxbVm4no/zJ2Ih0UTw3bYkIzuB6oAm3OXjNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgeM9TNN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54957f0c657so2248109e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2025 03:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743158488; x=1743763288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1KtvURkM61bRCEOqn5UUUOAe4gFSRLAo3uL+Qi4BhRQ=;
        b=KgeM9TNNCtJw9/ygtTjh0boIRNanu0srY5VqJ9XKh17SBYr3QC7w+/JvvXKZPBQXYV
         W/zjFUchDTXCph+za+sPe75yt4o64eePzE5KtPABYzLsrXAxFoN5grDPhaHLDCsk/ktg
         LysJuE44cnzJLG2qwpy3qBpRaKyy+Lu2XsTeRFrRslzB1G1/FK4WMzmXWaZG106nEYzA
         c6x3Gk5OUmHvFU3HDl+gzLjkcn1jMZAbf1JGz+ItpQWv0e3TqzGBhBv+jftAolw7PCPp
         iFOCj9dhpD3jz4lCrcd5m7WnH9cx7O6KKcAVqG+UspguUlgbBY2I6IdLLkuOv529YGw2
         5qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743158488; x=1743763288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KtvURkM61bRCEOqn5UUUOAe4gFSRLAo3uL+Qi4BhRQ=;
        b=E4ZkzX2B8k4K9BBYnMJchDgA8z0pdb+oXCq3jyKS1k8FvpKGgzvXFQAyrNrFTQ+2cs
         hK0yf1cWvpuIWrgZmxOzT9hleI2JeWjLoMpMaf8SAUpK78GA0PES9/SNsfukNoAaZvnQ
         ogK7nLgAgod+PJPH4OJ9VdDX0F3flgZanwsNF0+7CDdibw0HvrQMPahaLYN55X18eVoX
         G72sWISEVHlzCdjKo0pB7eWkjKj2CXTWlJu8M7Ty4eGIvM7Hco7LrKqnZ0dXcus1h+d2
         tVriggvgQIUBUpVNwEas1jN2/msSAk2lV2mEFQDBaIvwGBPGF/7NREtA7znlhZz0+cw9
         aMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyg+0nxV6SVkLdTeAhraSTdrLTS9MXH9dkoJ+efIHSZ4PwPpBhjaHN7GNqQsHjU7ER/7B2eLQ1wy5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0PBW2iAVeOhjywqTxbZfxc7p0AuqJjbOcNUnW49Iu9GmUrAoZ
	5/K8WskdffiiGCVkO9UJx8jEzql69kPIF079GMzfvhMMgkxiCklnsHtU5MCUt18sH9EAQ6JbxB/
	BDzEWg7b0PIpCrf3yWhjgbWAb+lsaQxue0Ku8YQ==
X-Gm-Gg: ASbGnctBCUMKGpJtLr+FbyViefovPB1FPt0MRB5xeH5A3LW2qeOW0uz9n8yqqrdYTka
	WliOQ/aqPDL755H+pDARkqNE12A2CxLKyyVkJWrbPYJ7UBbdQqXhpuY5Y8ZuHu/gPynUQBEm9oE
	0FyLvdlB4bzX3Iqeiu49LrSUA=
X-Google-Smtp-Source: AGHT+IE98wP9C8pJWPJ74mgk34iZlP4zxVzh7hrGZYWI2ThOUW3L2SRm3GRnkQS0WqZ5NLvYkQmlQs2K0rYyy8Xu1jQ=
X-Received: by 2002:a05:6512:1089:b0:548:ae6e:bf43 with SMTP id
 2adb3069b0e04-54b0ae13002mr893845e87.24.1743158488118; Fri, 28 Mar 2025
 03:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 11:41:17 +0100
X-Gm-Features: AQ5f1JobtW7AV21vjxabfCvHcIa-to3ct2uH_uHYtQHVV2WXV_GdFsMVeL0Vrgc
Message-ID: <CACRpkdZ4B6D7peAta3tBsOGVaRxxX6n_qoTZdEhpSeB6JwN3tw@mail.gmail.com>
Subject: [GIT PULL] pin control changes for v6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Raag Jadav <raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

here is the big chunk of pin control changes for v6.15.

This time: no core changes, we just churn along. But there are
a lot of new drivers.

Raag Jadavs devm_kmemdup_array() helper rework is
coming in through this pull request as well, the patches to other
subsystems are ACKed, it may appear in other pull requests
as well (I'm not sure). Andy helped to facilitate this refactoring.

There will be a conflict with an earlier fix to
drivers/pinctrl/bcm/pinctrl-bcm281xx.c, just let the latest code
win and delete that conflict. The regmap config lives elsewhere
now.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319=
:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.15-1

for you to fetch changes up to 3ef9f710efcb5cc1335b5b09c16c757f703d7e5f:

  pinctrl: mediatek: Add EINT support for multiple addresses
(2025-03-24 08:51:09 +0100)

----------------------------------------------------------------
Pin control changes for the v6.15 kernel cycle:

Core changes:

- None really.

New drivers:

- AMD ISP411 "AMD ISP" driver.

- Exynos 2200 and 7870 SoC subdrivers.

- Sophgo RISC-V SG2042 and SG2044 subdrivers.

- Amlogic A4 subdriver.

- Rockchip RK3528 subdriver.

- Broadcom BCM21664 subdriver.

- Allwinner A523/T527 subdriver.

- Ingenic X1600 subdriver.

- Microchip SAMA7D65 subdriver, essentially a re-branded
  Atmel AT91 PIO4 driver, but nowadays a Microschip SoC line.

Improvements:

- Bring in the devm_kmemdup_array() helper and use it throughout,
  also bring in changes to other subsystems for this to establish
  this helper.

- Support EGPIO on the Qualcomm SA8775P SoC.

- Extend EINT support in the Mediatek driver.

----------------------------------------------------------------
Andre Przywara (8):
      pinctrl: sunxi: refactor pinctrl variants into flags
      pinctrl: sunxi: increase number of GPIO bank regulators
      pinctrl: sunxi: move bank K register offset
      pinctrl: sunxi: support moved power configuration registers
      pinctrl: sunxi: allow reading mux values from DT
      dt-bindings: pinctrl: add compatible for Allwinner A523/T527
      pinctrl: sunxi: Add support for the Allwinner A523
      pinctrl: sunxi: Add support for the secondary A523 GPIO ports

Andy Shevchenko (25):
      pinctrl: baytrail: Use dedicated helpers for chained IRQ handlers
      pinctrl: lynxpoint: Use dedicated helpers for chained IRQ handlers
      MAINTAINERS: Add pin control and GPIO to the Intel MID record
      pwm: lpss: Clarify the bypass member semantics in struct
pwm_lpss_boardinfo
      pinctrl: intel: Fix wrong bypass assignment in intel_pinctrl_probe_pw=
m()
      pinctrl: cy8c95x0: Use better bitmap APIs where appropriate
      pinctrl: cy8c95x0; Switch to use for_each_set_clump8()
      pinctrl: cy8c95x0: Transform to cy8c95x0_regmap_read_bits()
      pinctrl: cy8c95x0: Remove redundant check in
cy8c95x0_regmap_update_bits_base()
      pinctrl: cy8c95x0: Replace 'return ret' by 'return 0' in some cases
      pinctrl: cy8c95x0: Initialise boolean variable with boolean values
      pinctrl: cy8c95x0: Get rid of cy8c95x0_pinmux_direction()
forward declaration
      pinctrl: cy8c95x0: Drop unneeded casting
      pinctrl: cy8c95x0: Separate EEPROM related register definitios
      pinctrl: cy8c95x0: Fix comment style
      driver core: Split devres APIs to device/devres.h
      iio: imu: st_lsm9ds0: Replace device.h with what is needed
      Merge patch series "Split devres APIs to device/devres.h and
introduce devm_kmemdup_array()"
      Merge tag 'ib-devres-iio-input-pinctrl-v6.15' into intel/pinctrl
      pinctrl: wpcm450: Switch to use for_each_gpiochip_node() helper
      pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
      pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP=
()
      pinctrl: nuvoton: Make use of struct pinfunction and PINCTRL_PINFUNCT=
ION()
      pinctrl: nuvoton: Convert to use struct group_desc
      pinctrl: nuvoton: Reduce use of OF-specific APIs

Artur Weber (4):
      dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
      pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
      pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
      pinctrl: bcm281xx: Add support for BCM21664 pinmux

Bartosz Golaszewski (2):
      pinctrl: bcm2835: don't -EINVAL on alternate funcs from get_direction=
()
      pinctrl: spacemit: destroy mutex at driver detach

Bjorn Andersson (2):
      pinctrl: qcom: Add test case for TLMM interrupt handling
      pinctrl: qcom: tlmm-test: Validate irq_enable delivers edge irqs

Chenyuan Yang (1):
      pinctrl: renesas: rza2: Fix potential NULL pointer dereference

Claudiu Beznea (2):
      pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down
      pinctrl: renesas: rzg2l: Suppress binding attributes

Colin Ian King (1):
      pinctrl: pinconf-generic: Fix spelling mistake "paramers" -> "paramet=
ers"

Dan Carpenter (3):
      pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in probe()
      pinctrl: bcm281xx: Add missing assignment in bcm21664_pinctrl_lock_al=
l()
      pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()

Dang Huynh (1):
      pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin

Dharma Balasubiramani (1):
      dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl

Dmitry Mastykin (1):
      pinctrl: mcp23s08: Get rid of spurious level interrupts

Fabrizio Castro (3):
      pinctrl: renesas: rzg2l: Fix missing of_node_put() call
      pinctrl: renesas: rzv2m: Fix missing of_node_put() call
      pinctrl: renesas: rza2: Fix missing of_node_put() call

Geert Uytterhoeven (1):
      pinctrl: PINCTRL_AMDISP should depend on DRM_AMD_ISP

H. Nikolaus Schaller (3):
      bindings: pinctrl: ingenic: add x1600
      pinctrl: ingenic: jz4730: add pinmux for MII
      pinctrl: ingenic: jz4730: add pinmux for I2S interface

Hao Chang (1):
      pinctrl: mediatek: Add EINT support for multiple addresses

Inochi Amaoto (7):
      pinctrl: sophgo: avoid to modify untouched bit when setting cv1800 pi=
nconf
      pinctrl: sophgo: introduce generic data structure for cv18xx
pinctrl driver
      pinctrl: sophgo: generalize shareable code of cv18xx pinctrl driver
      pinctrl: sophgo: introduce generic probe function
      dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
      pinctrl: sophgo: add support for SG2042 SoC
      pinctrl: sophgo: add support for SG2044 SoC

Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
      dt-bindings: pinctrl: samsung: add exynos2200 compatible
      pinctrl: samsung: add exynos2200 SoC pinctrl configuration

Jonas Karlman (1):
      dt-bindings: pinctrl: Add pinctrl support for RK3528

Kaustabh Chakraborty (3):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      pinctrl: samsung: add support for exynos7870 pinctrl

Linus Walleij (7):
      Merge branch 'ib-sophgo' into devel
      Merge branch 'ib-amlogic-a4' into devel
      Merge tag 'renesas-pinctrl-for-v6.15-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'renesas-pinctrl-for-v6.15-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'intel-pinctrl-v6.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'samsung-pinctrl-6.15' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      pinctrl: amlogic-a4: Drop surplus semicolon

Lorenzo Bianconi (1):
      dt-bindings: pinctrl: airoha: Add missing gpio-ranges property

Paul Boddie (1):
      pinctrl: ingenic: add x1600 support

Peter Griffin (1):
      pinctrl: samsung: add support for eint_fltcon_offset

Pratap Nirujogi (1):
      pinctrl: amd: isp411: Add amdisp GPIO pinctrl

Prathamesh Shete (4):
      pinctrl-tegra: Add config property GPIO mode
      pinctrl: tegra: Add descriptions for SoC data fields
      pinctrl-tegra: Restore SFSEL bit when freeing pins
      pinctrl: tegra: Set SFIO mode to Mux Register

Raag Jadav (11):
      err.h: move IOMEM_ERR_PTR() to err.h
      devres: Introduce devm_kmemdup_array()
      pinctrl: intel: copy communities using devm_kmemdup_array()
      pinctrl: baytrail: copy communities using devm_kmemdup_array()
      pinctrl: cherryview: use devm_kmemdup_array()
      pinctrl: tangier: use devm_kmemdup_array()
      pinctrl: pxa2xx: use devm_kmemdup_array()
      iio: adc: xilinx-xadc-core: use devm_kmemdup_array()
      input: sparse-keymap: use devm_kmemdup_array()
      input: ipaq-micro-keys: use devm_kmemdup_array()
      pinctrl: intel: drop repeated config dependency

Stephan Gerhold (1):
      pinctrl: qcom: Clear latched interrupt status when changing IRQ type

Steven Liu (1):
      pinctrl: rockchip: Add support for RK3528

Uwe Kleine-K=C3=B6nig (2):
      pinctrl: intel: Import PWM_LPSS namespace for devm_pwm_lpss_probe()
      pwm: lpss: Actually use a module namespace by defining the
namespace earlier

Valentin Caron (1):
      pinctrl: devicetree: do not goto err when probing hogs in
pinctrl_dt_to_map

Wasim Nazir (2):
      dt-bindings: pinctrl: qcom: Add egpio function for sa8775p
      pinctrl: qcom: sa8775p: Enable egpio function

Xianwei Zhao (5):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoC
      pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
      pinctrl: Add driver support for Amlogic SoCs
      MAINTAINERS: Add an entry for Amlogic pinctrl driver
      pinctrl: meson: fix pin input property for a4

Yue Haibing (2):
      pinctrl: pistachio: Remove dead code in pistachio_gpio_register()
      pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()

 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    |    3 +
 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     |  175 ++++
 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  126 +++
 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |    1 +
 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    |  152 +++
 .../bindings/pinctrl/ingenic,pinctrl.yaml          |    2 +
 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml        |    2 +-
 .../bindings/pinctrl/rockchip,pinctrl.yaml         |    1 +
 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |    3 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |    2 +
 .../bindings/pinctrl/sophgo,sg2042-pinctrl.yaml    |  129 +++
 MAINTAINERS                                        |   15 +
 drivers/iio/adc/xilinx-xadc-core.c                 |    4 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c        |    2 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c        |    2 +-
 drivers/input/keyboard/ipaq-micro-keys.c           |    5 +-
 drivers/input/sparse-keymap.c                      |    3 +-
 drivers/pinctrl/Kconfig                            |   14 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |  849 ++++++++++++++--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |   14 +-
 drivers/pinctrl/devicetree.c                       |   10 +-
 drivers/pinctrl/intel/Kconfig                      |    2 -
 drivers/pinctrl/intel/pinctrl-baytrail.c           |   11 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |    5 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |    8 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |    5 +-
 drivers/pinctrl/intel/pinctrl-tangier.c            |    5 +-
 drivers/pinctrl/mediatek/mtk-eint.c                |  313 +++---
 drivers/pinctrl/mediatek/mtk-eint.h                |   23 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |    1 +
 drivers/pinctrl/mediatek/pinctrl-paris.h           |    7 +
 drivers/pinctrl/meson/Kconfig                      |   11 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1053 ++++++++++++++++=
++++
 drivers/pinctrl/nuvoton/pinctrl-ma35.c             |  120 ++-
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c           |    1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |   44 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |   39 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |   18 +-
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 drivers/pinctrl/pinctrl-amdisp.c                   |  231 +++++
 drivers/pinctrl/pinctrl-amdisp.h                   |   95 ++
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |  195 ++--
 drivers/pinctrl/pinctrl-ingenic.c                  |  262 ++++-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   23 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    6 -
 drivers/pinctrl/pinctrl-rockchip.c                 |  160 ++-
 drivers/pinctrl/pinctrl-rockchip.h                 |    1 +
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c               |    8 +-
 drivers/pinctrl/qcom/Kconfig.msm                   |   14 +-
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   12 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c             |    8 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |   58 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |  663 ++++++++++++
 drivers/pinctrl/renesas/pinctrl-rza2.c             |    5 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   22 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |    2 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |  405 +++++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   41 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    5 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    6 +
 drivers/pinctrl/sophgo/Kconfig                     |   46 +-
 drivers/pinctrl/sophgo/Makefile                    |    8 +-
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c           |   27 +-
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c           |   27 +-
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c            |  602 +++--------
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            |   66 +-
 drivers/pinctrl/sophgo/pinctrl-sg2000.c            |   27 +-
 drivers/pinctrl/sophgo/pinctrl-sg2002.c            |   27 +-
 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c        |  296 ++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.c            |  655 ++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.h            |   49 +
 drivers/pinctrl/sophgo/pinctrl-sg2044.c            |  718 +++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sophgo-common.c     |  451 +++++++++
 drivers/pinctrl/sophgo/pinctrl-sophgo.h            |  136 +++
 drivers/pinctrl/spacemit/pinctrl-k1.c              |    6 +-
 drivers/pinctrl/sunxi/Kconfig                      |   10 +
 drivers/pinctrl/sunxi/Makefile                     |    3 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c          |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |    8 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c      |   54 +
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c        |   54 +
 drivers/pinctrl/sunxi/pinctrl-sun5i.c              |    8 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c          |    8 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |    7 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c           |  374 +++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   54 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   47 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   73 +-
 drivers/pinctrl/tegra/pinctrl-tegra.h              |   34 +-
 drivers/pwm/pwm-lpss.c                             |    4 +-
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
 include/dt-bindings/pinctrl/pinctrl-sg2042.h       |  196 ++++
 include/dt-bindings/pinctrl/pinctrl-sg2044.h       |  221 ++++
 include/linux/device.h                             |  119 +--
 include/linux/device/devres.h                      |  129 +++
 include/linux/err.h                                |    3 +
 include/linux/io.h                                 |    2 -
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 include/linux/platform_data/x86/pwm-lpss.h         |   33 +-
 104 files changed, 8905 insertions(+), 1309 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yam=
l
 create mode 100644
Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-a4.c
 create mode 100644 drivers/pinctrl/pinctrl-amdisp.c
 create mode 100644 drivers/pinctrl/pinctrl-amdisp.h
 create mode 100644 drivers/pinctrl/qcom/tlmm-test.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2044.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
 create mode 100644 include/dt-bindings/pinctrl/amlogic,pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h
 create mode 100644 include/linux/device/devres.h

