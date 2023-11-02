Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2AA7DFC71
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Nov 2023 23:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbjKBWc2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Nov 2023 18:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbjKBWc1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Nov 2023 18:32:27 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A7F125
        for <linux-gpio@vger.kernel.org>; Thu,  2 Nov 2023 15:32:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54366784377so2345356a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Nov 2023 15:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lpnu-ua.20230601.gappssmtp.com; s=20230601; t=1698964342; x=1699569142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e9nBSRGeG0oGTzQFHQdu8lyilaZO5899sWrirHLiN9k=;
        b=B1891VoePKS4oYv8Drekbn5Q83HvK0+q7HvssMGkCDcNeQCThFdtr96gv7J7yDZE++
         pVzZ8bxEycQgaXJbPMu20kNpNeaVdLsft4ExoUHzzc1MVQfyG/DalUCFAo2ideXwW//F
         O+fatX3TsMFRlnQTbVC8l3RlL4UKslOGtJeamGVQk6q+pDYZ6aX1WM5JjmQK8hmqI0Pw
         w2S2JAFQWb4wFb4ixmI+2B6gKfIBvZsOf7ze0gVrOW9xCedg1c4CaQ3LvCB09tJFW3Eh
         tWULKyi+SdZviXmJVj7GoisX7Nt5286GOOPXJtdU9W1rkujXXNtyrIR+KcIEX4Rn7Spw
         k3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698964342; x=1699569142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9nBSRGeG0oGTzQFHQdu8lyilaZO5899sWrirHLiN9k=;
        b=VJAvXQP4nQ34SgxSyfXsGP3PlA6HNoA+5mdttKRggj89+//XCqNS0y7rldIcDl7tyd
         Ph7gbJo6QCRtX2wVFj3djZYwd548BfSlVXxjMlMtVqSpalrZHG6C3Vary7xkNTI51PCz
         5ljFkHebe3LDY4W+9Zv2yhFvOeU8FCK+Ll8JBi6VJlZXDepY43S5s34/DRpTQHowKZwu
         pDLGdcUHwlGjWN1oyvQ8EouBhpYctBSP+JQdgE8dXDV7P/gF/t3evBSZB2j1A/mREHy7
         s9sV1GMM9FCoWIVXPqYcgWIYgNv2UoR/P1sgw1HOvdYL5kEFirFfi9K1sHOX59prEgjh
         FRaA==
X-Gm-Message-State: AOJu0YzdqLSIovusIinkfAvHgNEMhO8tyFQGSvU4ntJnmMJo34vZ1fK1
        Xpupw7BuRkXsofScVaCqBRqc8w==
X-Google-Smtp-Source: AGHT+IGGugFSjo/xuux56sQ3cRW8VoLU9P/hoAn4qsI0tDYESiYS+N/GiIJRqt7VUfRp5VZAyIgUDg==
X-Received: by 2002:a50:9fe9:0:b0:543:714b:535d with SMTP id c96-20020a509fe9000000b00543714b535dmr8093289edf.3.1698964341806;
        Thu, 02 Nov 2023 15:32:21 -0700 (PDT)
Received: from [192.168.1.3] ([37.54.67.136])
        by smtp.gmail.com with ESMTPSA id u14-20020a50c04e000000b005412c0ba2f9sm233202edd.13.2023.11.02.15.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 15:32:21 -0700 (PDT)
Message-ID: <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
Date:   Fri, 3 Nov 2023 00:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
From:   Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, all

I wanted to inquire about how do you all feel about calling this SoC by 
the Google "gs101" name.

I believe the proper name for it should be the actual Samsung name, 
written in the silicon and reported in the Chip ID hardware: Exynos9845. 
This also touches the Tensor G2 (Exynos9855), Tensor G3 (Exynos9865), 
and possibly the "Tesla" SoCs.

I do not think the Linux kernel should be a marketing material: it 
should reflect reality. The chip is almost 100% composed of Samsung 
Exynos IP blocks and should be called that way.

Yours,

- Markuss

On 10/11/23 01:49, Peter Griffin wrote:
> Hi folks,
>
> Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
> the review feedback received so far.
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
> * some CCF implementation
> * watchdog
> * uart
> * gpio
>
> This is enough to boot through to a busybox initramfs and shell using an
> upstream kernel though :) More platform support will be added over the
> following weeks and months.
>
> Note 1: I've removed the dtbo overlay from v2 submission and will re-submit once
> I have appropriate documentation for it.
>
> Note 2: I've left the bootargs in dts with earlycon for now, for two reasons.
> 1) The bootloader hangs if bootargs isn't present in the dtb as it tries to
> re-write this with additional bootargs.
> 2) there is a issue whereby the full serial console doesn't come up properly
> if earlycon isn't also specified. This issue needs further investigation.
>
> Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible`
> I tried to narrow the interrupts check to google,gs101-pinctrl but I still see
> a warning:
> gs101-oriole.dtb: pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long
>
> If anyone can educate me on what I've done wrong here it would be most
> appreciated!
>
> kind regards,
>
> Peter.
>
> Changes since v1:
>   - Remove irq/gs101.h and replace macros with irq numbers globally
>   - exynos-pmu - keep alphabetical order
>   - add cmu_apm to clock bindings documentation
>   - sysreg bindings - remove superfluous `google,gs101-sysreg`
>   - watchdog bindings - Alphanumerical order, update gs201 comment
>   - samsung,pinctrl.yaml - add new "if:then:else:" to narrow for google SoC
>   - samsung,pinctrl-wakeup-interrupt.yaml - Alphanumerical order
>   - samsung,pinctrl- add google,gs101-wakeup-eint compatible
>   - clk-pll: fixup typos
>   - clk-gs101: fix kernel test robot warnings (add 2 new clocks,dividers,gate)
>   - clk-gs101: fix alphabetical order
>   - clk-gs101: cmu_apm: fixup typo and missing empty entry
>   - clk-gs101: cmu_misc: remove clocks that were being registerred twice
>   - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON bitfield
>   - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 pins as well
>   - pinctrl: gs101: rename bank_type_6/7 structs to be more specific, split from filter
>   - watchdog: s3c2410_wdt: remove dev_info prints
>   - gs101.dtsi/oriole.dts: order by unit node, remove underscores from node name, blank lines
>     add SoC node, split dts and dtsi into separate patches, remove 'DVT' suffix
>   - gs101-oriole.dtso: Remove overlay until board_id is documented properly
>   - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
>   - gpio-keys: update linux,code to use input-event-code macros
>   - add dedicated gs101-uart compatible
>
> Peter Griffin (20):
>    dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
>    dt-bindings: clock: Add Google gs101 clock management unit bindings
>    dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
>      compatibles to GS101
>    dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
>    dt-bindings: arm: google: Add bindings for Google ARM platforms
>    dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
>    dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
>    dt-bindings: serial: samsung: Add google-gs101-uart compatible
>    clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
>    clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
>    clk: samsung: clk-gs101: add CMU_APM support
>    clk: samsung: clk-gs101: Add support for CMU_MISC clock unit
>    pinctrl: samsung: Add filter selection support for alive banks
>    pinctrl: samsung: Add gs101 SoC pinctrl configuration
>    watchdog: s3c2410_wdt: Add support for Google tensor SoCs
>    tty: serial: samsung: Add gs101 compatible and SoC data
>    arm64: dts: google: Add initial Google gs101 SoC support
>    arm64: dts: google: Add initial Oriole/pixel 6 board support
>    arm64: defconfig: Enable Google Tensor SoC
>    MAINTAINERS: add entry for Google Tensor SoC
>
>   .../devicetree/bindings/arm/google.yaml       |   46 +
>   .../bindings/clock/google,gs101-clock.yaml    |  125 +
>   .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
>   .../bindings/pinctrl/samsung,pinctrl.yaml     |   19 +
>   .../bindings/serial/samsung_uart.yaml         |    2 +
>   .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
>   .../soc/samsung/samsung,exynos-sysreg.yaml    |    6 +
>   .../bindings/watchdog/samsung-wdt.yaml        |   10 +-
>   MAINTAINERS                                   |   10 +
>   arch/arm64/Kconfig.platforms                  |    6 +
>   arch/arm64/boot/dts/Makefile                  |    1 +
>   arch/arm64/boot/dts/google/Makefile           |    4 +
>   arch/arm64/boot/dts/google/gs101-oriole.dts   |   79 +
>   arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1275 ++++++++++
>   arch/arm64/boot/dts/google/gs101-pinctrl.h    |   32 +
>   arch/arm64/boot/dts/google/gs101.dtsi         |  503 ++++
>   arch/arm64/configs/defconfig                  |    1 +
>   drivers/clk/samsung/Kconfig                   |    9 +
>   drivers/clk/samsung/Makefile                  |    2 +
>   drivers/clk/samsung/clk-gs101.c               | 2164 +++++++++++++++++
>   drivers/clk/samsung/clk-pll.c                 |    9 +-
>   drivers/clk/samsung/clk-pll.h                 |    3 +
>   .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  163 ++
>   drivers/pinctrl/samsung/pinctrl-exynos.c      |   84 +-
>   drivers/pinctrl/samsung/pinctrl-exynos.h      |   41 +
>   drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
>   drivers/pinctrl/samsung/pinctrl-samsung.h     |   24 +
>   drivers/tty/serial/samsung_tty.c              |   12 +
>   drivers/watchdog/s3c2410_wdt.c                |  104 +-
>   include/dt-bindings/clock/google,gs101.h      |  232 ++
>   30 files changed, 4961 insertions(+), 13 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>   create mode 100644 arch/arm64/boot/dts/google/Makefile
>   create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>   create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>   create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>   create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
>   create mode 100644 drivers/clk/samsung/clk-gs101.c
>   create mode 100644 include/dt-bindings/clock/google,gs101.h
>
