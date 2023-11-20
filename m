Return-Path: <linux-gpio+bounces-272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AD7F1EB2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 22:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6260E2812A2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 21:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEDF374EF;
	Mon, 20 Nov 2023 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXMMyVxm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9AADC
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:06 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso20197315e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515265; x=1701120065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5jR4xxSx4mVJkGx+AS0hQnGE93PUvpYGL7bcFf1uaA=;
        b=NXMMyVxmp2kbd0TjpFFK+tctHbmZlTdZpfp7M9KswkLMJveBWIcpzgWBRpuWibNxH+
         ry9eRl+8ZsUAhFudSBIGDD3Y1VNfJjbkG6QYX6UQOmQfVBKux1UZzU/SZeNP71ESNdUG
         Deq2x+2Z0ZuMJuMTRGaxeJMsrJqK4QDZDB65bw2Snh1B6Vi+tefxXwCXiaJyKMn/RXLX
         jusIa1neFbZkZP1L0GbqKVsMBQki8TnN5oEJYmS0gXt8xiZZvfXmv9cyenRHLa4DqO9w
         hRvBTsxmVdn2L1cO5SNAyXi0ewIBke4dOAtV2WLxeOx7SoYQzxkAGb0Mldx5Ey/UjhL3
         ojLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515265; x=1701120065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5jR4xxSx4mVJkGx+AS0hQnGE93PUvpYGL7bcFf1uaA=;
        b=ViQSIUF0NkCfjT+NGaaXs4U0YmIclAmaaQoqcxHH7PGFFXkdjMjTrC8Q6uwM8gFAKq
         DrAqfMNi3AhfOSvPppg+lcBwlKcw0box0kkvTkN48zeryNUqGrG/XcQ4/J2drKAZ/0xR
         oq1EaCNpBAvjsH4KyzECsUYqodg67y0ucq5TUqeDPlsBC2kKbzj7YepvmqkNnpt0WrJP
         225GhAOcPYbORhafZ1hW8IjBk3HYA6kJo9b8b0dqZ+pRGe1QJwig8bvua0EriTnG9q8z
         gw6GeWpRDyBUbA13XdDnKIvdCUTCRJ/q4TQ+XH/Hj8p94CVfXjGkucT1iKH6GFWBDgYl
         xHig==
X-Gm-Message-State: AOJu0Yyk546q/SL6YGzKbrAQPJZIgYpyVQHRn0VW3tsaAtt/YfrL1wHt
	wV9saNw8YjFa+2Q83RvRQKWd8A==
X-Google-Smtp-Source: AGHT+IEtnzMGVrhML0Lms6wBUTHhzdAghmhVOWGKZHbZeeg9VJiE+yIxnBC06jDP/BbIn2apzJLoFw==
X-Received: by 2002:a05:600c:511f:b0:409:677:31e7 with SMTP id o31-20020a05600c511f00b00409067731e7mr6492294wms.11.1700515265160;
        Mon, 20 Nov 2023 13:21:05 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:04 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 00/19]  Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
Date: Mon, 20 Nov 2023 21:20:18 +0000
Message-ID: <20231120212037.911774-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Firstly, thanks to everyone who reviewed the previous series. V4 incorporates
all the review feedback received so far, and is rebased onto linux-next.

As this series spans multiple subsytems the expectation is that Krzysztof
will apply the whole series through the Samsung SoC tree. If the relevant
subsystem maintainers can give a acked-by or reviewed-by on the relevant
patches that would be most appreciated!

This series adds initial SoC support for the GS101 SoC and also initial board
support for Pixel 6 phone (Oriole).

The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
(raven) phones. Currently DT is added for the gs101 SoC and Oriole.
As you can see from the patches the SoC is based on a Samsung Exynos SoC,
and therefore lots of the low level Exynos drivers and bindings can be
re-used.

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

For further information on how to build and flash the upstream kernel on your
Pixel 6, with a prebuilt busybox initramfs please refer to the script and
README.md here:

https://git.codelinaro.org/linaro/googlelt/pixelscripts

Note 1: I've removed the dtbo overlay from v2 and later submissions and
will re-submit once I have appropriate documentation for it.

Note 2: I've left the bootargs in dts with earlycon for now, for two reasons.
1) The bootloader hangs if bootargs isn't present in the dtb as it tries to
re-write this with additional bootargs.
2) There is a issue whereby the full serial console doesn't come up properly
if `exynos4210,mmio32,0x10A00000` isn't specified in bootargs. This has been
diagnosed by Tudor as some prior bootstage adding earlycon to the bootargs but
not specifying the 'mmio32' parameter which then causes earlycon to use 8bit
accesses. On gs101 blk_perioc0 is restricted to 32b data width accesses causing
a SError interrupt before any earlycon UART output.

kind regards,

Peter.

Changes since v3:
 - Add reviewed-by and tested-by tags
 - google,gs101-clock.yaml: move Required to before Allof,
   enum for cmu*top/misc (Krzysztof)
 - samsung-wdt.yaml: stick to 80chars (Sam)
 - google.yaml - remove new line
 - samsung,pinctrl-wakeup-interrupt: sort alphabetically (RobH)
 - gs101-oriole.dts: update gpio-keys pinctrl-0 phandle for keys (Stephen)
 - samsung,exynos-sysreg.yaml - Alphabetical order (RobH)
 - pinctrl-exynos: update/move comments, slight cosmetic changes (Sam)
 - samsung_tty.c: update to generic drv_data name/macro (Arnd)
 - samsung_uart.yaml: make samsung,uart-fifosize required for gs101-uart (Arnd)
 - pinctrl-exynos: Remove eint irqs from alive pin controller node (Peter/Rob)
 - Fixup kernel test robot unused const variable warnings
 - clk-gs101: Update to mout_cmu_eh_bus to CLK_CON_MUX_MUX_CLKCMU_EH_BUS
   (Chanwoo)
 - clk-gs101: Update g3aa gout/dout/mout names to g3aa_g3aa for
   consistency (Chanwoo)
 - Remove .eint_gpio_init() cb on alive, alive_far, gsacore & gsactrl
   banks (Sam)
 - s3c2410_wdt: Drop windowed watchdog mode for now (Peter)
 - s3c2410_wdt: Separate gs101 SoC support from dbgack feature (Sam)
 - Move dts to arch/arm64/boot/dts/exynos/google directory (Krzysztof)

Changes since v2:
 - Fixup pinctrl@174d0000: interrupts: [..] is too long DTC warning (Tudor)
 - Add missing windowed watchdog code (Guenter)
 - Fixup UART YAML bindings error (Krzysztof)
 - gs101.dtsi add missing serial_0 alias (me)
 - samsung_tty.c: fixup gs101_serial_drv_data so fifosize is obtained from DT
 
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
 - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON
   bitfield
 - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 pins
   as well
 - pinctrl: gs101: rename bank_type_6/7 structs to be more specific,
   split from filter
 - watchdog: s3c2410_wdt: remove dev_info prints
 - gs101.dtsi/oriole.dts: order by unit node, remove underscores from node
   name, blank lines add SoC node, split dts and dtsi into separate patches,
   remove 'DVT' suffix
 - gs101-oriole.dtso: Remove overlay until board_id is documented properly
 - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
 - gpio-keys: update linux,code to use input-event-code macros
 - add dedicated gs101-uart compatible

Peter Griffin (19):
  dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
  dt-bindings: clock: Add Google gs101 clock management unit bindings
  dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
    compatibles to GS101
  dt-bindings: watchdog: Document Google gs101 watchdog bindings
  dt-bindings: arm: google: Add bindings for Google ARM platforms
  dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
  dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
  dt-bindings: serial: samsung: Add google-gs101-uart compatible
  dt-bindings: serial: samsung: Make samsung,uart-fifosize required
    property
  clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
  clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
  pinctrl: samsung: Add filter selection support for alive banks
  pinctrl: samsung: Add gs101 SoC pinctrl configuration
  watchdog: s3c2410_wdt: Add support for Google gs101 SoC
  watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
  tty: serial: samsung: Add gs101 compatible and common
    fifoszdt_serial_drv_data
  arm64: dts: exynos: google: Add initial Google gs101 SoC support
  arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
  MAINTAINERS: add entry for Google Tensor SoC

 .../devicetree/bindings/arm/google.yaml       |   45 +
 .../bindings/clock/google,gs101-clock.yaml    |  110 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
 .../bindings/serial/samsung_uart.yaml         |   18 +
 .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    6 +
 .../bindings/watchdog/samsung-wdt.yaml        |    8 +-
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/exynos/Makefile           |    2 +
 arch/arm64/boot/dts/exynos/google/Makefile    |    4 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |   79 +
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi | 1275 +++++++++++
 .../boot/dts/exynos/google/gs101-pinctrl.h    |   32 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  437 ++++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-gs101.c               | 2036 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    6 +
 drivers/clk/samsung/clk-pll.h                 |    3 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  159 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   91 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   41 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   23 +
 drivers/tty/serial/samsung_tty.c              |   16 +
 drivers/watchdog/s3c2410_wdt.c                |   75 +-
 include/dt-bindings/clock/google,gs101.h      |  232 ++
 27 files changed, 4707 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101.dtsi
 create mode 100644 drivers/clk/samsung/clk-gs101.c
 create mode 100644 include/dt-bindings/clock/google,gs101.h

-- 
2.43.0.rc1.413.gea7ed67945-goog


