Return-Path: <linux-gpio+bounces-881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1568016B5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 23:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7484D1F20EDF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 22:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79742619DC;
	Fri,  1 Dec 2023 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MpncnBSR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68861D63
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 14:40:36 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc79f73e58so17635ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 14:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701470436; x=1702075236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3amzJ9PYXbI1KiZ14eb196KPwActNZucZcEeWBrD0w=;
        b=MpncnBSRY1+EkkEGIdE5UJNqT1rXR8gTtsoXQRiBnI60HoMwBlbSL2sK+Yl7XtgpCW
         1e6x6M4AKDgLbqC6K4QRmrEin7GupeS1+1QPZoPXiuvey3f9mV8SQk2vNV3NngDWUcem
         J20yxtf1KIwmeHdKQHfDu2JUAVEpANfzta1G2FwtaEbOjLDUSo1TQjmkvb/805XnZqcG
         LOO3eqR48J+zdY2xKGPooQEPlqRxBsU1g+Lr/SxVRD/tM2ajz6WloW4k7loy6pC5vE0H
         Gu4gfduePIOBshjYp6etgV8vYATXinfwxxz1Y2BcsXn77gwyQCCjBO3d5dIxmRJaASBI
         xe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701470436; x=1702075236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3amzJ9PYXbI1KiZ14eb196KPwActNZucZcEeWBrD0w=;
        b=B/S2fnVdMIiZMsLcqMYjzTgQziYKVxYino/BYLoUfaedCTF0SV8pdCjHxQntD+yqeS
         NP+pailUc+79RP83152S5w+p3uM8LC9HL3jpmjaLVtZVWx/GXsPPYWEI3LrdcAHzFO1J
         Wtft8yHWuSDwMntGkUTm8BeAEJ+BkvPi6uooaRdzsVV00PKsyAu243Mnbb85VIpdl0QJ
         viIbwJ95Y4SvvFVkAXvhzinTmS43YtnR3RIfGjwtlx+XXzcu5jjV+Z/alPTNFsBpYf+i
         /+yxEXbJF6IStIflIZfvog7ffOc6JQZWfGRG9IyTqxWrhuBCLLIdRK2L2oJM6a7PHF0H
         Qk5Q==
X-Gm-Message-State: AOJu0Yy2zvL5PvUOiOq67X+nx87fVpMgLn3AJJuTW8dogscivGMzO9c4
	Fxpk1v3NOniODb76T66JepfS8w==
X-Google-Smtp-Source: AGHT+IE6Qkc5x7uZhqKUzAZQbv9EZF5VZpsVIkIAt4woWS/XMdu931x08schv1HTiKbQWlRT79cvJQ==
X-Received: by 2002:a17:902:e552:b0:1d0:55ef:4f76 with SMTP id n18-20020a170902e55200b001d055ef4f76mr248210plf.9.1701470435588;
        Fri, 01 Dec 2023 14:40:35 -0800 (PST)
Received: from google.com (148.98.83.34.bc.googleusercontent.com. [34.83.98.148])
        by smtp.gmail.com with ESMTPSA id q24-20020a62e118000000b006b8ffc49ba5sm3477885pfh.38.2023.12.01.14.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 14:40:34 -0800 (PST)
Date: Fri, 1 Dec 2023 14:40:31 -0800
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 00/20]  Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <ZWpg31AEwd-C8F-R@google.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>

On 12/01/2023, Peter Griffin wrote:
> Hi folks,
> 
> Thanks to everyone who reviewed the previous rounds. V5 incorporates
> the review feedback received so far, and is rebased onto linux-next as
> per Krzysztof request to incorporate all his dt-binding changes for
> exynos.
> 
> As this series spans multiple subsytems the expectation is that Krzysztof
> will apply the whole series through the Samsung SoC tree. If the relevant
> subsystem maintainers can give a acked-by or reviewed-by on the relevant
> patches that would be most appreciated!
> 
> This series adds initial SoC support for the GS101 SoC and also initial board
> support for Pixel 6 phone (Oriole).
> 
> The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> and therefore lots of the low level Exynos drivers can be re-used.
> 
> The support added in this series consists of:
> * cpus
> * pinctrl
> * CCF implementation of cmu_top, cmu_misc & cmu_apm
> * watchdog
> * USI uart
> * gpio
> 
> This is enough to boot through to a busybox initramfs and shell using an
> upstream kernel though :) More platform support will be added over the
> following weeks and months.
> 
> For further information on how to build and flash the upstream kernel on your
> Pixel 6, with a prebuilt busybox initramfs please refer to the script and
> README.md here:
> 
> https://git.codelinaro.org/linaro/googlelt/pixelscripts
> 
> Note: Booting without a dtbo works with some versions of the bootloader
> but crashes on others. Later versions aren't necessarily better. You can
> get the bootloader version with `fastboot getvar version-bootloader`
> Known good bootloader versions are: -
> - slider-1.3-11000330
> - slider-1.2-9152140
> Known to crash without dtbo
> - slider-1.3-10780582
> 
> kind regards,
> 
> Peter.
> 
> lore v4: https://lore.kernel.org/linux-arm-kernel/20231120212037.911774-1-peter.griffin@linaro.org/T/
> pw   v3: https://patchwork.kernel.org/project/linux-samsung-soc/cover/20231011184823.443959-1-peter.griffin@linaro.org/
> lore v2: https://lore.kernel.org/all/20231010224928.2296997-1-peter.griffin@linaro.org/
> lore v1: https://lore.kernel.org/linux-arm-kernel/20231005155618.700312-1-peter.griffin@linaro.org/
> 
> Changes since v4:
>  - clk-gs101: order cmu_top by register address, fix incorrect mux widths,
>    add missing mux/div/gates (Andre)
>  - google,gs101.h: add missing space in comment (Andre)
>  - ckl-gs101:google,gs101.h add all remaining gates for cmu_misc and cmu_apm
>  - update pmu dt labels (Krzysztof)
>  - Remove uart16 rts/tx gpio definitions (Krzysztof)
>  - Fixup various dts cosmetic nits (using consts, alignments,
>    names) (Sam/Krzysztof)
>  - Add more specific compatibles for arm cpu's and pmu (Sam)
>  - Use address-cells 1 and ranges property for SoC addresses (Sam)
>  - Encapsulate uart node in USI node (Sam)
>  - Remove earlycon from bootargs
>  - s3c2410_wdt: Reword QUIRK_HAS_DBGACK_BIT docs and add comment (Guenter)
>  - s3c2410_wdt: Reorder DBGACK_MASK functionality first, gs101
>    SoC second (Sam/Krzysztof)
>  
> Changes since v3:
>  - Add reviewed-by and tested-by tags
>  - google,gs101-clock.yaml: move Required to before Allof,
>    enum for cmu*top/misc (Krzysztof)
>  - samsung-wdt.yaml: stick to 80chars (Sam)
>  - google.yaml - remove new line
>  - samsung,pinctrl-wakeup-interrupt: sort alphabetically (RobH)
>  - gs101-oriole.dts: update gpio-keys pinctrl-0 phandle for keys (Stephen)
>  - samsung,exynos-sysreg.yaml - Alphabetical order (RobH)
>  - pinctrl-exynos: update/move comments, slight cosmetic changes (Sam)
>  - samsung_tty.c: update to generic drv_data name/macro (Arnd)
>  - samsung_uart.yaml: make samsung,uart-fifosize required for gs101-uart (Arnd)
>  - pinctrl-exynos: Remove eint irqs from alive pin controller node (Peter/Rob)
>  - Fixup kernel test robot unused const variable warnings
>  - clk-gs101: Update to mout_cmu_eh_bus to CLK_CON_MUX_MUX_CLKCMU_EH_BUS
>    (Chanwoo)
>  - clk-gs101: Update g3aa gout/dout/mout names to g3aa_g3aa for
>    consistency (Chanwoo)
>  - Remove .eint_gpio_init() cb on alive, alive_far, gsacore & gsactrl
>    banks (Sam)
>  - s3c2410_wdt: Drop windowed watchdog mode for now (Peter)
>  - s3c2410_wdt: Separate gs101 SoC support from dbgack feature (Sam)
>  - Move dts to arch/arm64/boot/dts/exynos/google directory (Krzysztof)
> 
> Changes since v2:
>  - Fixup pinctrl@174d0000: interrupts: [..] is too long DTC warning (Tudor)
>  - Add missing windowed watchdog code (Guenter)
>  - Fixup UART YAML bindings error (Krzysztof)
>  - gs101.dtsi add missing serial_0 alias (me)
>  - samsung_tty.c: fixup gs101_serial_drv_data so fifosize is obtained from DT
>  
> Changes since v1:
>  - Remove irq/gs101.h and replace macros with irq numbers globally
>  - exynos-pmu - keep alphabetical order
>  - add cmu_apm to clock bindings documentation
>  - sysreg bindings - remove superfluous `google,gs101-sysreg`
>  - watchdog bindings - Alphanumerical order, update gs201 comment
>  - samsung,pinctrl.yaml - add new "if:then:else:" to narrow for google SoC
>  - samsung,pinctrl-wakeup-interrupt.yaml - Alphanumerical order
>  - samsung,pinctrl- add google,gs101-wakeup-eint compatible
>  - clk-pll: fixup typos
>  - clk-gs101: fix kernel test robot warnings (add 2 new clocks,dividers,gate)
>  - clk-gs101: fix alphabetical order
>  - clk-gs101: cmu_apm: fixup typo and missing empty entry
>  - clk-gs101: cmu_misc: remove clocks that were being registered twice
>  - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON
>    bitfield
>  - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 pins
>    as well
>  - pinctrl: gs101: rename bank_type_6/7 structs to be more specific,
>    split from filter
>  - watchdog: s3c2410_wdt: remove dev_info prints
>  - gs101.dtsi/oriole.dts: order by unit node, remove underscores from node
>    name, blank lines add SoC node, split dts and dtsi into separate patches,
>    remove 'DVT' suffix
>  - gs101-oriole.dtso: Remove overlay until board_id is documented properly
>  - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
>  - gpio-keys: update linux,code to use input-event-code macros
>  - add dedicated gs101-uart compatible
> 
> Peter Griffin (19):
>   dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
>   dt-bindings: clock: Add Google gs101 clock management unit bindings
>   dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
>     compatibles to GS101
>   dt-bindings: watchdog: Document Google gs101 watchdog bindings
>   dt-bindings: arm: google: Add bindings for Google ARM platforms
>   dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
>   dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
>   dt-bindings: serial: samsung: Add google-gs101-uart compatible
>   dt-bindings: serial: samsung: Make samsung,uart-fifosize required
>     property
>   clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
>   clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
>   pinctrl: samsung: Add filter selection support for alive banks
>   pinctrl: samsung: Add gs101 SoC pinctrl configuration
>   watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
>   watchdog: s3c2410_wdt: Add support for Google gs101 SoC
>   tty: serial: samsung: Add gs101 compatible and common
>     fifoszdt_serial_drv_data
>   arm64: dts: exynos: google: Add initial Google gs101 SoC support
>   arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
>   MAINTAINERS: add entry for Google Tensor SoC
> 
> Tudor Ambarus (1):
>   dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
> 
>  .../devicetree/bindings/arm/google.yaml       |   53 +
>  .../bindings/clock/google,gs101-clock.yaml    |  110 +
>  .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
>  .../bindings/serial/samsung_uart.yaml         |   11 +
>  .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
>  .../bindings/soc/samsung/exynos-usi.yaml      |    3 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml    |    6 +
>  .../bindings/watchdog/samsung-wdt.yaml        |    8 +-
>  MAINTAINERS                                   |   10 +
>  arch/arm64/boot/dts/exynos/Makefile           |    2 +
>  arch/arm64/boot/dts/exynos/google/Makefile    |    4 +
>  .../boot/dts/exynos/google/gs101-oriole.dts   |  105 +
>  .../boot/dts/exynos/google/gs101-pinctrl.dtsi | 1250 +++++++++
>  .../boot/dts/exynos/google/gs101-pinctrl.h    |   33 +
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  476 ++++
>  drivers/clk/samsung/Makefile                  |    1 +
>  drivers/clk/samsung/clk-gs101.c               | 2495 +++++++++++++++++
>  drivers/clk/samsung/clk-pll.c                 |    6 +
>  drivers/clk/samsung/clk-pll.h                 |    3 +
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  159 ++
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   91 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   41 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   23 +
>  drivers/tty/serial/samsung_tty.c              |   16 +
>  drivers/watchdog/s3c2410_wdt.c                |   74 +-
>  include/dt-bindings/clock/google,gs101.h      |  392 +++
>  28 files changed, 5370 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101.dtsi
>  create mode 100644 drivers/clk/samsung/clk-gs101.c
>  create mode 100644 include/dt-bindings/clock/google,gs101.h
> 
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 

Thanks Peter for the updated patch series! I've gone through and reviewed the
changes and tested them on my Oriole device. I was able to boot to the busybox
console and verify the appropriate drivers probed.

Great work!

Regards,
Will


