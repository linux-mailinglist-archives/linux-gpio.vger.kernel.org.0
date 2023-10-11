Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FD97C609B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 00:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjJKWwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 18:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233798AbjJKWwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 18:52:04 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3B3C4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 15:52:00 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5859e22c7daso260584a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 15:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697064720; x=1697669520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIIu/hUJqRVL7Ctvn6ezU0u5LF9eP5/zP5lad0KkA1E=;
        b=BV15Qk30T0n+vgwfCSvdAQ/iwqnnbzlt5KkxY1oRp6esOyzhWy36gjx+wSSNjW1I73
         w/GLc982XK3bPxvzey5cNMnLMLkiepjo51YefQr3jEaVuG93znOOLZEsk5NE33iE7zol
         hzGmWFL6Ie3IM3eptGmwDACSvOPfQbaH+AHtKdChCHr3iiQOgs9QgHod8SNgS07cGmLe
         GL2ZMkBBO7l1OYkEkw9vNO4lcDsIQDcoWLe9tPwSOG65aNedFBzxayrecr89Jzo+OYh+
         XrkLRRzHac6pRSVeri3YseYbuiMxFDWN0LPtolPn2YvVzIi/7MGSfikumMCvEI7t4ZrX
         lceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697064720; x=1697669520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIIu/hUJqRVL7Ctvn6ezU0u5LF9eP5/zP5lad0KkA1E=;
        b=DsUkOgnw7Hwy83L3nyh7KKJwk83B7EyAwhHrCB4jukZbyFDjQepXWTJNiCEVpazB72
         /Q5p3EtwxBnFsLr/cx+Z8RlXgOAOPR4qQPIHzATZ2rGIRjQjvTP44LPrgeQqeGLZIiV1
         eIhcc0jhz+VG/09/GOYf3MUTNzssq6jRKUODf6wc2HeYAfGjzzkPvESHfRhUl4BtU7A1
         oJ0U0EN5XRinx+GLkTiloapr8hjPnjuvvc9OjyUgBZ+WtZcy8dbUDiaKUyse6kChuQ78
         7jO1/yarJ+oD8BHxUbamXBSNshg5rn9eG8//V0RxIGzDuaTSnZJbW6tkJllmMMVSI5az
         ogFQ==
X-Gm-Message-State: AOJu0YweFYt2RkU3ej731+TJwaX7DDkvs8SSp2MS83y6IG1hL6Ak3ZhS
        F+A+n/ERc2WjR1uMHDESMn9EQo9+zQVNpIbUxv4WIQ==
X-Google-Smtp-Source: AGHT+IG5Tx6eu1sFezsBud4LPBnUF7kAHi8OmoLtRC19jZP76zCYO9qK65J3T0Tc0nbIi6KNpW2kOzowcmRJsCuorR4=
X-Received: by 2002:a17:90b:3b90:b0:27d:adf:c19c with SMTP id
 pc16-20020a17090b3b9000b0027d0adfc19cmr2428818pjb.22.1697064719722; Wed, 11
 Oct 2023 15:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 17:51:48 -0500
Message-ID: <CAPLW+4=Yatejyf=5ckWM1HNhD56ZsQ+h7pvmH1yZ8U2bGNbn_g@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Hi folks,
>
> Firstly, thanks to everyone who reviewed the v2/V1 series! V3 incorporate=
s
> all the review feedback received so far.
>
> As this series spans multiple subsytems the expectation is that Krzysztof
> will apply the whole series through the Samsung SoC tree. If the relevant
> subsystem maintainers can give a acked-by or reviewed-by on the relevant
> patches that would be most appreciated!
>
> This series adds initial SoC support for the GS101 SoC and also initial b=
oard
> support for Pixel 6 phone (Oriole).
>
> The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> and therefore lots of the low level Exynos drivers and bindings can be
> re-used.
>
> The support added in this series consists of:
> * cpus
> * pinctrl
> * some CCF implementation
> * watchdog
> * uart
> * gpio
>
> This is enough to boot through to a busybox initramfs and shell using an
> upstream kernel though :) More platform support will be added over the
> following weeks and months.
>
> For further information on how to build and flash the upstream kernel on =
your
> Pixel 6, with a prebuilt busybox initramfs please refer to the script and
> README.md here:
>
> https://git.codelinaro.org/linaro/googlelt/pixelscripts
>
> Note 1: I've removed the dtbo overlay from v2 and later submissions and
> will re-submit once I have appropriate documentation for it.
>
> Note 2: I've left the bootargs in dts with earlycon for now, for two reas=
ons.
> 1) The bootloader hangs if bootargs isn't present in the dtb as it tries =
to
> re-write this with additional bootargs.
> 2) there is a issue whereby the full serial console doesn't come up prope=
rly
> if earlycon isn't also specified. This issue needs further investigation.
>
> kind regards,
>
> Peter.
>
> Changes since v2:
>  - Fixup pinctrl@174d0000: interrupts: [..] is too long DTC warning (Tudo=
r)
>  - Add missing windowed watchdog code (Guenter)
>  - Fixup UART YAML bindings error (Krzysztof)
>  - gs101.dtsi add missing serial_0 alias (me)
>  - samsung_tty.c: fixup gs101_serial_drv_data so fifosize os obtained fro=
m DT
>
> Changes since v1:
>  - Remove irq/gs101.h and replace macros with irq numbers globally
>  - exynos-pmu - keep alphabetical order
>  - add cmu_apm to clock bindings documentation
>  - sysreg bindings - remove superfluous `google,gs101-sysreg`
>  - watchdog bindings - Alphanumerical order, update gs201 comment
>  - samsung,pinctrl.yaml - add new "if:then:else:" to narrow for google So=
C
>  - samsung,pinctrl-wakeup-interrupt.yaml - Alphanumerical order
>  - samsung,pinctrl- add google,gs101-wakeup-eint compatible
>  - clk-pll: fixup typos
>  - clk-gs101: fix kernel test robot warnings (add 2 new clocks,dividers,g=
ate)
>  - clk-gs101: fix alphabetical order
>  - clk-gs101: cmu_apm: fixup typo and missing empty entry
>  - clk-gs101: cmu_misc: remove clocks that were being registerred twice
>  - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON =
bitfield
>  - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 =
pins as well
>  - pinctrl: gs101: rename bank_type_6/7 structs to be more specific, spli=
t from filter
>  - watchdog: s3c2410_wdt: remove dev_info prints
>  - gs101.dtsi/oriole.dts: order by unit node, remove underscores from nod=
e name, blank lines
>    add SoC node, split dts and dtsi into separate patches, remove 'DVT' s=
uffix
>  - gs101-oriole.dtso: Remove overlay until board_id is documented properl=
y
>  - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
>  - gpio-keys: update linux,code to use input-event-code macros
>  - add dedicated gs101-uart compatible
>
> Peter Griffin (20):
>   dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
>   dt-bindings: clock: Add Google gs101 clock management unit bindings
>   dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
>     compatibles to GS101
>   dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
>   dt-bindings: arm: google: Add bindings for Google ARM platforms
>   dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
>   dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
>   dt-bindings: serial: samsung: Add google-gs101-uart compatible
>   clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
>   clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
>   clk: samsung: clk-gs101: add CMU_APM support
>   clk: samsung: clk-gs101: Add support for CMU_MISC clock unit

Maybe squash those 3 patches into one? If you're going to send v4.
Just a thought.

>   pinctrl: samsung: Add filter selection support for alive banks
>   pinctrl: samsung: Add gs101 SoC pinctrl configuration
>   watchdog: s3c2410_wdt: Add support for Google tensor SoCs
>   tty: serial: samsung: Add gs101 compatible and SoC data
>   arm64: dts: google: Add initial Google gs101 SoC support
>   arm64: dts: google: Add initial Oriole/pixel 6 board support
>   arm64: defconfig: Enable Google Tensor SoC
>   MAINTAINERS: add entry for Google Tensor SoC
>
>  .../devicetree/bindings/arm/google.yaml       |   46 +
>  .../bindings/clock/google,gs101-clock.yaml    |  125 +
>  .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
>  .../bindings/pinctrl/samsung,pinctrl.yaml     |   22 +-
>  .../bindings/serial/samsung_uart.yaml         |    1 +
>  .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml    |    6 +
>  .../bindings/watchdog/samsung-wdt.yaml        |   10 +-
>  MAINTAINERS                                   |   10 +
>  arch/arm64/Kconfig.platforms                  |    6 +
>  arch/arm64/boot/dts/Makefile                  |    1 +
>  arch/arm64/boot/dts/google/Makefile           |    4 +
>  arch/arm64/boot/dts/google/gs101-oriole.dts   |   79 +
>  arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1275 ++++++++++
>  arch/arm64/boot/dts/google/gs101-pinctrl.h    |   32 +
>  arch/arm64/boot/dts/google/gs101.dtsi         |  504 ++++
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/clk/samsung/Kconfig                   |    9 +
>  drivers/clk/samsung/Makefile                  |    2 +
>  drivers/clk/samsung/clk-gs101.c               | 2164 +++++++++++++++++
>  drivers/clk/samsung/clk-pll.c                 |    9 +-
>  drivers/clk/samsung/clk-pll.h                 |    3 +
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  163 ++
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |   84 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   41 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |   24 +
>  drivers/tty/serial/samsung_tty.c              |   13 +
>  drivers/watchdog/s3c2410_wdt.c                |  127 +-
>  include/dt-bindings/clock/google,gs101.h      |  232 ++
>  30 files changed, 4985 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-=
clock.yaml
>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
>  create mode 100644 drivers/clk/samsung/clk-gs101.c
>  create mode 100644 include/dt-bindings/clock/google,gs101.h
>
> --
> 2.42.0.655.g421f12c284-goog
>
