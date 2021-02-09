Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DC431448D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 01:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhBIAG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 19:06:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:36252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229975AbhBIAG5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Feb 2021 19:06:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12FBB64EA1;
        Tue,  9 Feb 2021 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612829176;
        bh=dfRFgugqpSV7uJeshst3nXR0J5JK6HkwJyhS4dQJhCQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rBETBVQPmVF3PSogZDAUv4gL0AkyNp99sbJJXgaCPlQ7W6LDF8W13WRouRVIddqHX
         I6VhWYzWyzbRB4ooR15M06G5GAW9wif9PlDyiU57FySjRWQV7ppfbqSXSf5hQDB6z/
         G6+Xxao/naU9eak2m5nB9s99QnwqbxY6Ofp8tFDoRL1RCOrQBZUWegPYNMsn2txvyC
         uyYyyyU+gy7g/7DqyQTiGe46HDpjm80AoNTEwezj7NAX2ds6S0ifwm6gVJhB/TTlMR
         I+UcZNgdF6DiHeMl97ZoJ22yEWl4qXUriIoxn9t7mYsha2NifDoRcRCIY834JvuZfv
         BgqoBvRpa3mhA==
Received: by mail-qv1-f53.google.com with SMTP id j4so7895076qvk.6;
        Mon, 08 Feb 2021 16:06:16 -0800 (PST)
X-Gm-Message-State: AOAM531wDAPqZqNNuYIsSV8zDUATzmfoGwASjeB734D5sIG17ykDZYCS
        7QLot/DRaT36fivfCvRt4hzbVJwMKVKM9yRyzQ==
X-Google-Smtp-Source: ABdhPJy0dJyqrVDY0vfsKsuQ5uR65jQn3DMDtaYVBbCYgqkKSJ4srT2xjgeb3ebO9J0EAInN58FCPUMATPWVWju1Axw=
X-Received: by 2002:ad4:45ca:: with SMTP id v10mr9239825qvt.11.1612829175200;
 Mon, 08 Feb 2021 16:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <20210208222203.22335-13-info@metux.net>
In-Reply-To: <20210208222203.22335-13-info@metux.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Feb 2021 18:06:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJw+EjMoc92e-XMjn=0wat3TmcToHU1V2rW9UB9UhmDEA@mail.gmail.com>
Message-ID: <CAL_JsqJw+EjMoc92e-XMjn=0wat3TmcToHU1V2rW9UB9UhmDEA@mail.gmail.com>
Subject: Re: [RFC PATCH 12/12] platform/x86/of: add support for PC Engines APU
 v2/3/4 boards
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 4:22 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Add oftree based support for PC Engines APUv2/3/4 board family.
> This is entirely separate from the existing pcengines-apuv2 driver.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/platform/of/Kconfig   | 15 ++++++++
>  drivers/platform/of/Makefile  |  2 +
>  drivers/platform/of/apu2x.dts | 86 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/platform/of/init.c    |  7 ++++
>  4 files changed, 110 insertions(+)
>  create mode 100644 drivers/platform/of/apu2x.dts
>
> diff --git a/drivers/platform/of/Kconfig b/drivers/platform/of/Kconfig
> index a0b5a641a7c6..e13b6ee8c316 100644
> --- a/drivers/platform/of/Kconfig
> +++ b/drivers/platform/of/Kconfig
> @@ -38,4 +38,19 @@ config PLATFORM_OF_DRV_SYSFS_DT
>           Say Y here to enable exposing device tree nodes at
>           /sys/firmware/devicetree.
>
> +config PLATFORM_OF_DRV_PCENGINES_APU2
> +       bool "Support PC Engines APU2/3/4 mainboards"
> +       depends on INPUT
> +       depends on GPIOLIB
> +       depends on X86
> +       select GPIO_AMD_FCH
> +       select KEYBOARD_GPIO_POLLED
> +       select LEDS_GPIO
> +       select INPUT_KEYBOARD
> +       help
> +         Say Y to enable devicetree based support for PC Engines APU2/3/4
> +         mainboards. This supersedes the older pcengines-apu2 driver.
> +
> +         Supports Gpios, front panel LEDs and front button.
> +
>  endif # PLATFORM_OF_DRV
> diff --git a/drivers/platform/of/Makefile b/drivers/platform/of/Makefile
> index 84cf3003c500..dd4a13c18f16 100644
> --- a/drivers/platform/of/Makefile
> +++ b/drivers/platform/of/Makefile
> @@ -2,4 +2,6 @@
>
>  ofboard-y := init.o drv.o
>
> +ofboard-$(CONFIG_PLATFORM_OF_DRV_PCENGINES_APU2) += apu2x.dtb.o
> +
>  obj-$(CONFIG_PLATFORM_OF_DRV) += ofboard.o
> diff --git a/drivers/platform/of/apu2x.dts b/drivers/platform/of/apu2x.dts
> new file mode 100644
> index 000000000000..c16a59eb2a0e
> --- /dev/null
> +++ b/drivers/platform/of/apu2x.dts
> @@ -0,0 +1,86 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/amd-fch-gpio.h>
> +
> +/ {
> +    apu2x {
> +        compatible = "virtual,dmi-board";
> +        dmi-sys-vendor = "PC engines";
> +        dmi-board-name =
> +          "APU2",
> +          "apu2",
> +          "PC engines apu2",
> +          "APU3",
> +          "apu3",
> +          "PC engines apu3",
> +          "APU4",
> +          "apu4",
> +          "PC engines apu4";

I think these DMI properties just need to be the compatible string(s).
We already have a way to do matching with DT and don't need a
secondary way. If you can

> +        unbind {
> +            acpi = "PNP0076:00", "PNP0B00:00";
> +            platform = "platform-framebuffer.0", "PNP0103:00";

This node really needs to go. It's clearly Linuxisms. It either has to
go in the kernel or userspace.

> +        };
> +        devices {
> +            gpio1: gpio1 {
> +                compatible = "amd,fch-gpio";

This of course will need to be documented.

> +                gpio-controller;
> +                status = "okay";

nit: That's the default.

> +                ngpios=<7>;
> +                #gpio-cells=<2>;
> +                gpio-regs = <
> +                    AMD_FCH_GPIO_REG_GPIO57 // led1
> +                    AMD_FCH_GPIO_REG_GPIO58 // led2
> +                    AMD_FCH_GPIO_REG_GPIO59_DEVSLP1 // led3
> +                    AMD_FCH_GPIO_REG_GPIO32_GE1 // modesw
> +                    AMD_FCH_GPIO_REG_GPIO33_GE2 // simawap
> +                    AMD_FCH_GPIO_REG_GPIO55_DEVSLP0 // mpcie2
> +                    AMD_FCH_GPIO_REG_GPIO51 // mpcie3
> +                >;
> +                gpio-line-names =
> +                    "front-led1",
> +                    "front-led2",
> +                    "front-led3",
> +                    "front-button",
> +                    "simswap",
> +                    "mpcie2_reset",
> +                    "mpcie3_reset";
> +            };
> +            front-leds {
> +                compatible = "gpio-leds";
> +                led@0 {
> +                    gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
> +                    color = <LED_COLOR_ID_GREEN>;
> +                    default-state = "keep";
> +                    label = "apu:green:1";
> +                };
> +                led@1 {
> +                    gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +                    color = <LED_COLOR_ID_GREEN>;
> +                    default-state = "keep";
> +                    label = "apu:green:2";
> +                };
> +                led@2 {
> +                    gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +                    color = <LED_COLOR_ID_GREEN>;
> +                    default-state = "keep";
> +                    label = "apu:green:3";
> +                };
> +            };
> +            front-keys {
> +                compatible = "gpio-keys-polled";
> +                address-cells = <1>;
> +                size-cells = <0>;
> +                poll-interval = <100>;
> +                button@1 {
> +                    linux,code = <KEY_RESTART>;
> +                    label = "front button";
> +                    debounce-interval = <10>;
> +                    gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +                };
> +            };
> +        };
> +    };
> +};
> diff --git a/drivers/platform/of/init.c b/drivers/platform/of/init.c
> index 3b8373cda77a..195120dad26d 100644
> --- a/drivers/platform/of/init.c
> +++ b/drivers/platform/of/init.c
> @@ -47,7 +47,14 @@ static ssize_t fdt_image_raw_read(struct file *filep, struct kobject *kobj,
>         return count;
>  }
>
> +#ifdef CONFIG_PLATFORM_OF_DRV_PCENGINES_APU2
> +DECLARE_FDT_EXTERN(apu2x);
> +#endif
> +
>  static struct fdt_image fdt[] = {
> +#ifdef CONFIG_PLATFORM_OF_DRV_PCENGINES_APU2
> +       FDT_IMAGE_ENT(apu2x)
> +#endif
>  };
>
>  static int __init ofdrv_init_sysfs(struct fdt_image *image)
> --
> 2.11.0
>
