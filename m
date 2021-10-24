Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DDB438B5F
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 20:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhJXSWj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 14:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhJXSWj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 14:22:39 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DB6C061745;
        Sun, 24 Oct 2021 11:20:17 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id l13so12363232edi.8;
        Sun, 24 Oct 2021 11:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EnhegsVmGjdwDC7M54C1iYD2jmAneGbH/lcOsxxf1WQ=;
        b=XqqNA4IevdMeG2tYKmyyIKKT7iIEev7EUxy8PPP/D5zkVQhuHUTgtvvkVe3lGgpHtb
         8FodI4TuL+WCnRzXoNueLBJ0yH/O7kzqj+I1O0HOdCMbW/0htLjQ4RA7KiV/GJrQh15s
         OVqZXzXBAQ4XMcpcVvFM2FYf3mPlcQ9a7x0d4S8BL1/NHbzbDPYnrZ0ygcY2IhrYC7UH
         n4BB9fMcf+P8VGh4x+SMSUFBqCj68rvDrwMBj+MAt3NV7yBWnKe0vv7c2c0MeEAI4kqG
         I9Qa0S0l5AGC6UKdY2ibu+NthL2ZIQAjOZS+AsqXwD5KmAfOnhOclEk2fP41p88AZcKb
         uWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EnhegsVmGjdwDC7M54C1iYD2jmAneGbH/lcOsxxf1WQ=;
        b=XMOpsLYX/6hzV4SE+9pR/CrvG0u35HaZIIpvybQDB2QvSMRRP+5IvElcm1SubEi3Qr
         tj4TETQj5lIaJL4MMtNVA0tQN9HIxljEGLl1N1Yyngv+yE0N6QZ2drZtlzdMzw1x1eBz
         TdTR7weTfF3jtAOwzzmL/pMKQoW83RNCKui6BUrn6KFpiZX6aZi4mSHkG0GBD8pe+Q80
         1++i8SJ60JAdwIZTo5jd6IXbELa49TVvLXQKBI7UThgpeaP5WPiYj1GNC/y+Y0LWbr4+
         MlbbGzSonuSZ2URM/slY/pK9nsHHuaORjTx+M04ngavGACTdsr4oGnTo3SUNo8oem5/M
         xyrA==
X-Gm-Message-State: AOAM533mmP4EdvL6t6HGLamBEq4s+g7L/WW3xhDf9qUraN0MuEppHrOy
        DzVDBSCY6JSsZzJMQM8Yt8ktgxsX2ThENDVZ6OE=
X-Google-Smtp-Source: ABdhPJy4MFyuttVAjxcRpCHIe4XPnnbkF3P7y+mfv1vUiYtetqtv23xP77RcvpXqyaXqr1/+U5HMM5K8hnEjRFjidb8=
X-Received: by 2002:aa7:d4d3:: with SMTP id t19mr9116265edr.238.1635099616344;
 Sun, 24 Oct 2021 11:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211024060058.6719-1-rdunlap@infradead.org>
In-Reply-To: <20211024060058.6719-1-rdunlap@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 24 Oct 2021 21:19:40 +0300
Message-ID: <CAHp75Vc7AsW8eAgcL1wNCY6QhsStTS=9QCY8t+8ZG8pUhzmyGA@mail.gmail.com>
Subject: Re: [PATCH] gpio: clean up Kconfig file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sean Young <sean@mess.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 9:02 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix multiple problems in punctuation, capitalization, grammar,
> wording, and typos in the GPIO Kconfig file.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for all Intel GPIO drivers.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Sean Young <sean@mess.org>
> Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
> Cc: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpio/Kconfig |  116 ++++++++++++++++++++---------------------
>  1 file changed, 58 insertions(+), 58 deletions(-)
>
> --- linux-next-20211022.orig/drivers/gpio/Kconfig
> +++ linux-next-20211022/drivers/gpio/Kconfig
> @@ -15,7 +15,7 @@ menuconfig GPIOLIB
>         bool "GPIO Support"
>         help
>           This enables GPIO support through the generic GPIO library.
> -         You only need to enable this, if you also want to enable
> +         You only need to enable this if you also want to enable
>           one or more of the GPIO drivers below.
>
>           If unsure, say N.
> @@ -140,8 +140,8 @@ config GPIO_AMDPT
>         depends on ACPI
>         select GPIO_GENERIC
>         help
> -         driver for GPIO functionality on Promontory IOHub
> -         Require ACPI ASL code to enumerate as a platform device.
> +         Driver for GPIO functionality on Promontory IOHub.
> +         Requires ACPI ASL code to enumerate as a platform device.
>
>  config GPIO_ASPEED
>         tristate "Aspeed GPIO support"
> @@ -306,7 +306,7 @@ config GPIO_HISI
>         help
>           Say Y or M here to build support for the HiSilicon GPIO controller
>           driver GPIO block.
> -         This GPIO controller support double-edge interrupt and multi-core
> +         This GPIO controller supports double-edge interrupt and multi-core
>           concurrent access.
>
>  config GPIO_HLWD
> @@ -326,7 +326,7 @@ config GPIO_ICH
>         help
>           Say yes here to support the GPIO functionality of a number of Intel
>           ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8
> -         ICH9, ICH10, Series 5/3400 (eg Ibex Peak), Series 6/C200 (eg
> +         ICH9, ICH10, Series 5/3400 (e.g. Ibex Peak), Series 6/C200 (e.g.
>           Cougar Point), NM10 (Tiger Point), and 3100 (Whitmore Lake).
>
>           If unsure, say N.
> @@ -337,7 +337,7 @@ config GPIO_IOP
>         select GPIO_GENERIC
>         help
>           Say yes here to support the GPIO functionality of a number of Intel
> -         IOP32X or IOP33X.
> +         IOP32X or IOP33X series of chips.
>
>           If unsure, say N.
>
> @@ -364,7 +364,7 @@ config GPIO_LOONGSON
>         bool "Loongson-2/3 GPIO support"
>         depends on CPU_LOONGSON2EF || CPU_LOONGSON64
>         help
> -         driver for GPIO functionality on Loongson-2F/3A/3B processors.
> +         Driver for GPIO functionality on Loongson-2F/3A/3B processors.
>
>  config GPIO_LPC18XX
>         tristate "NXP LPC18XX/43XX GPIO support"
> @@ -392,15 +392,15 @@ config GPIO_MENZ127
>         depends on MCB
>         select GPIO_GENERIC
>         help
> -         Say yes here to support the MEN 16Z127 GPIO Controller
> +         Say yes here to support the MEN 16Z127 GPIO Controller.
>
>  config GPIO_MM_LANTIQ
>         bool "Lantiq Memory mapped GPIOs"
>         depends on LANTIQ && SOC_XWAY
>         help
>           This enables support for memory mapped GPIOs on the External Bus Unit
> -         (EBU) found on Lantiq SoCs. The gpios are output only as they are
> -         created by attaching a 16bit latch to the bus.
> +         (EBU) found on Lantiq SoCs. The GPIOs are output only as they are
> +         created by attaching a 16-bit latch to the bus.
>
>  config GPIO_MPC5200
>         def_bool y
> @@ -424,7 +424,7 @@ config GPIO_MT7621
>         select GPIO_GENERIC
>         select GPIOLIB_IRQCHIP
>         help
> -         Say yes here to support the Mediatek MT7621 SoC GPIO device
> +         Say yes here to support the Mediatek MT7621 SoC GPIO device.
>
>  config GPIO_MVEBU
>         def_bool y
> @@ -469,7 +469,7 @@ config GPIO_PL061
>         select IRQ_DOMAIN
>         select GPIOLIB_IRQCHIP
>         help
> -         Say yes here to support the PrimeCell PL061 GPIO device
> +         Say yes here to support the PrimeCell PL061 GPIO device.
>
>  config GPIO_PMIC_EIC_SPRD
>         tristate "Spreadtrum PMIC EIC support"
> @@ -483,7 +483,7 @@ config GPIO_PXA
>         bool "PXA GPIO support"
>         depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
>         help
> -         Say yes here to support the PXA GPIO device
> +         Say yes here to support the PXA GPIO device.
>
>  config GPIO_RCAR
>         tristate "Renesas R-Car and RZ/G GPIO support"
> @@ -573,7 +573,7 @@ config GPIO_SPEAR_SPICS
>         depends on PLAT_SPEAR
>         select GENERIC_IRQ_CHIP
>         help
> -         Say yes here to support ST SPEAr SPI Chip Select as GPIO device
> +         Say yes here to support ST SPEAr SPI Chip Select as GPIO device.
>
>  config GPIO_SPRD
>         tristate "Spreadtrum GPIO support"
> @@ -598,8 +598,8 @@ config GPIO_STP_XWAY
>         help
>           This enables support for the Serial To Parallel (STP) unit found on
>           XWAY SoC. The STP allows the SoC to drive a shift registers cascade,
> -         that can be up to 24 bit. This peripheral is aimed at driving leds.
> -         Some of the gpios/leds can be auto updated by the soc with dsl and
> +         that can be up to 24 bits. This peripheral is aimed at driving LEDs.
> +         Some of the GPIOs/LEDs can be auto updated by the SoC with DSL and
>           phy status.
>
>  config GPIO_SYSCON
> @@ -679,10 +679,10 @@ config GPIO_VISCONTI
>           Say yes here to support GPIO on Tohisba Visconti.
>
>  config GPIO_VR41XX
> -       tristate "NEC VR4100 series General-purpose I/O Uint support"
> +       tristate "NEC VR4100 series General-purpose I/O Unit support"
>         depends on CPU_VR41XX
>         help
> -         Say yes here to support the NEC VR4100 series General-purpose I/O Uint
> +         Say yes here to support the NEC VR4100 series General-purpose I/O Unit.
>
>  config GPIO_VX855
>         tristate "VIA VX855/VX875 GPIO"
> @@ -690,14 +690,14 @@ config GPIO_VX855
>         select MFD_CORE
>         select MFD_VX855
>         help
> -         Support access to the VX855/VX875 GPIO lines through the gpio library.
> +         Support access to the VX855/VX875 GPIO lines through the GPIO library.
>
> -         This driver provides common support for accessing the device,
> -         additional drivers must be enabled in order to use the
> +         This driver provides common support for accessing the device.
> +         Additional drivers must be enabled in order to use the
>           functionality of the device.
>
>  config GPIO_WCD934X
> -       tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
> +       tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
>         depends on MFD_WCD934X && OF_GPIO
>         help
>           This driver is to support GPIO block found on the Qualcomm Technologies
> @@ -727,7 +727,7 @@ config GPIO_XILINX
>         select GPIOLIB_IRQCHIP
>         depends on OF_GPIO
>         help
> -         Say yes here to support the Xilinx FPGA GPIO device
> +         Say yes here to support the Xilinx FPGA GPIO device.
>
>  config GPIO_XLP
>         tristate "Netlogic XLP GPIO support"
> @@ -748,7 +748,7 @@ config GPIO_XTENSA
>         depends on !SMP
>         help
>           Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
> -         and EXPSTATE (output) ports
> +         and EXPSTATE (output) ports.
>
>  config GPIO_ZEVIO
>         bool "LSI ZEVIO SoC memory mapped GPIOs"
> @@ -764,14 +764,14 @@ config GPIO_ZYNQ
>           Say yes here to support Xilinx Zynq GPIO controller.
>
>  config GPIO_ZYNQMP_MODEPIN
> -       tristate "ZynqMP ps-mode pin gpio configuration driver"
> +       tristate "ZynqMP ps-mode pin GPIO configuration driver"
>         depends on ZYNQMP_FIRMWARE
>         default ZYNQMP_FIRMWARE
>         help
> -         Say yes here to support the ZynqMP ps-mode pin gpio configuration
> +         Say yes here to support the ZynqMP ps-mode pin GPIO configuration
>           driver.
>
> -         This ps-mode pin gpio driver is based on GPIO framework, PS_MODE
> +         This ps-mode pin GPIO driver is based on GPIO framework. PS_MODE
>           is 4-bits boot mode pins. It sets and gets the status of
>           the ps-mode pin. Every pin can be configured as input/output.
>
> @@ -785,12 +785,12 @@ config GPIO_LOONGSON1
>  config GPIO_AMD_FCH
>         tristate "GPIO support for AMD Fusion Controller Hub (G-series SOCs)"
>         help
> -         This option enables driver for GPIO on AMDs Fusion Controller Hub,
> -         as found on G-series SOCs (eg. GX-412TC)
> +         This option enables driver for GPIO on AMD's Fusion Controller Hub,
> +         as found on G-series SOCs (e.g. GX-412TC).
>
> -         Note: This driver doesn't registers itself automatically, as it
> -         needs to be provided with platform specific configuration.
> -         (See eg. CONFIG_PCENGINES_APU2.)
> +         Note: This driver doesn't register itself automatically, as it
> +         needs to be provided with platform-specific configuration.
> +         (See e.g. CONFIG_PCENGINES_APU2.)
>
>  config GPIO_MSC313
>         bool "MStar MSC313 GPIO support"
> @@ -800,7 +800,7 @@ config GPIO_MSC313
>         select IRQ_DOMAIN_HIERARCHY
>         help
>           Say Y here to support the main GPIO block on MStar/SigmaStar
> -         ARMv7 based SoCs.
> +         ARMv7-based SoCs.
>
>  config GPIO_IDT3243X
>         tristate "IDT 79RC3243X GPIO support"
> @@ -809,7 +809,7 @@ config GPIO_IDT3243X
>         select GPIOLIB_IRQCHIP
>         help
>           Select this option to enable GPIO driver for
> -         IDT 79RC3243X based devices like Mikrotik RB532.
> +         IDT 79RC3243X-based devices like Mikrotik RB532.
>
>           To compile this driver as a module, choose M here: the module will
>           be called gpio-idt3243x.
> @@ -887,7 +887,7 @@ config GPIO_IT87
>           well.
>
>           To compile this driver as a module, choose M here: the module will
> -         be called gpio_it87
> +         be called gpio_it87.
>
>  config GPIO_SCH
>         tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
> @@ -903,7 +903,7 @@ config GPIO_SCH
>           powered by the core power rail and are turned off during sleep
>           modes (S3 and higher). The remaining four GPIOs are powered by
>           the Intel SCH suspend power supply. These GPIOs remain
> -         active during S3. The suspend powered GPIOs can be used to wake the
> +         active during S3. The suspend-powered GPIOs can be used to wake the
>           system from the Suspend-to-RAM state.
>
>           The Intel Tunnel Creek processor has 5 GPIOs powered by the
> @@ -1056,7 +1056,7 @@ config GPIO_PCA953X_IRQ
>         select GPIOLIB_IRQCHIP
>         help
>           Say yes here to enable the pca953x to be used as an interrupt
> -         controller. It requires the driver to be built in the kernel.
> +         controller.
>
>  config GPIO_PCA9570
>         tristate "PCA9570 4-Bit I2C GPO expander"
> @@ -1183,7 +1183,7 @@ config GPIO_CRYSTAL_COVE
>         help
>           Support for GPIO pins on Crystal Cove PMIC.
>
> -         Say Yes if you have a Intel SoC based tablet with Crystal Cove PMIC
> +         Say Yes if you have a Intel SoC-based tablet with Crystal Cove PMIC
>           inside.
>
>           This driver can also be built as a module. If so, the module will be
> @@ -1213,7 +1213,7 @@ config GPIO_DA9055
>           Say yes here to enable the GPIO driver for the DA9055 chip.
>
>           The Dialog DA9055 PMIC chip has 3 GPIO pins that can be
> -         be controller by this driver.
> +         be controlled by this driver.
>
>           If driver is built as a module it will be called gpio-da9055.
>
> @@ -1235,7 +1235,7 @@ config HTC_EGPIO
>         help
>           This driver supports the CPLD egpio chip present on
>           several HTC phones.  It provides basic support for input
> -         pins, output pins, and irqs.
> +         pins, output pins, and IRQs.
>
>  config GPIO_JANZ_TTL
>         tristate "Janz VMOD-TTL Digital IO Module"
> @@ -1296,8 +1296,8 @@ config GPIO_MAX77620
>         help
>           GPIO driver for MAX77620 and MAX20024 PMIC from Maxim Semiconductor.
>           MAX77620 PMIC has 8 pins that can be configured as GPIOs. The
> -         driver also provides interrupt support for each of the gpios.
> -         Say yes here to enable the max77620 to be used as gpio controller.
> +         driver also provides interrupt support for each of the GPIOs.
> +         Say yes here to enable the max77620 to be used as GPIO controller.
>
>  config GPIO_MAX77650
>         tristate "Maxim MAX77650/77651 GPIO support"
> @@ -1319,8 +1319,8 @@ config GPIO_RC5T583
>         help
>           Select this option to enable GPIO driver for the Ricoh RC5T583
>           chip family.
> -         This driver provides the support for driving/reading the gpio pins
> -         of RC5T583 device through standard gpio library.
> +         This driver provides the support for driving/reading the GPIO pins
> +         of RC5T583 device through standard GPIO library.
>
>  config GPIO_SL28CPLD
>         tristate "Kontron sl28cpld GPIO support"
> @@ -1389,7 +1389,7 @@ config GPIO_TPS65912
>         tristate "TI TPS65912 GPIO"
>         depends on MFD_TPS65912
>         help
> -         This driver supports TPS65912 gpio chip
> +         This driver supports TPS65912 GPIO chip.
>
>  config GPIO_TPS68470
>         bool "TPS68470 GPIO"
> @@ -1397,7 +1397,7 @@ config GPIO_TPS68470
>         help
>           Select this option to enable GPIO driver for the TPS68470
>           chip family.
> -         There are 7 GPIOs and few sensor related GPIOs supported
> +         There are 7 GPIOs and few sensor-related GPIOs supported
>           by the TPS68470. While the 7 GPIOs can be configured as
>           input or output as appropriate, the sensor related GPIOs
>           are "output only" GPIOs.
> @@ -1442,7 +1442,7 @@ config GPIO_WHISKEY_COVE
>         help
>           Support for GPIO pins on Whiskey Cove PMIC.
>
> -         Say Yes if you have a Intel SoC based tablet with Whiskey Cove PMIC
> +         Say Yes if you have an Intel SoC-based tablet with Whiskey Cove PMIC
>           inside.
>
>           This driver can also be built as a module. If so, the module will be
> @@ -1479,10 +1479,10 @@ config GPIO_AMD8111
>         depends on X86 || COMPILE_TEST
>         depends on HAS_IOPORT_MAP
>         help
> -         The AMD 8111 south bridge contains 32 GPIO pins which can be used.
> +         The AMD 8111 southbridge contains 32 GPIO pins which can be used.
>
> -         Note, that usually system firmware/ACPI handles GPIO pins on their
> -         own and users might easily break their systems with uncarefull usage
> +         Note that usually system firmware/ACPI handles GPIO pins on their
> +         own and users might easily break their systems with uncareful usage
>           of this driver!
>
>           If unsure, say N
> @@ -1530,22 +1530,22 @@ config GPIO_ML_IOH
>         select GENERIC_IRQ_CHIP
>         help
>           ML7213 is companion chip for Intel Atom E6xx series.
> -         This driver can be used for OKI SEMICONDUCTOR ML7213 IOH(Input/Output
> -         Hub) which is for IVI(In-Vehicle Infotainment) use.
> +         This driver can be used for OKI SEMICONDUCTOR ML7213 IOH (Input/Output
> +         Hub) which is for IVI (In-Vehicle Infotainment) use.
>           This driver can access the IOH's GPIO device.
>
>  config GPIO_PCH
> -       tristate "Intel EG20T PCH/LAPIS Semiconductor IOH(ML7223/ML7831) GPIO"
> +       tristate "Intel EG20T PCH/LAPIS Semiconductor IOH (ML7223/ML7831) GPIO"
>         depends on X86_32 || MIPS || COMPILE_TEST
>         select GENERIC_IRQ_CHIP
>         help
> -         This driver is for PCH(Platform controller Hub) GPIO of Intel Topcliff
> -         which is an IOH(Input/Output Hub) for x86 embedded processor.
> +         This driver is for PCH (Platform Controller Hub) GPIO of Intel Topcliff,
> +         which is an IOH (Input/Output Hub) for x86 embedded processor.
>           This driver can access PCH GPIO device.
>
> -         This driver also can be used for LAPIS Semiconductor IOH(Input/
> +         This driver also can be used for LAPIS Semiconductor IOH (Input/
>           Output Hub), ML7223 and ML7831.
> -         ML7223 IOH is for MP(Media Phone) use.
> +         ML7223 IOH is for MP (Media Phone) use.
>           ML7831 IOH is for general purpose use.
>           ML7223/ML7831 is companion chip for Intel Atom E6xx series.
>           ML7223/ML7831 is completely compatible for Intel EG20T PCH.
> @@ -1596,7 +1596,7 @@ config GPIO_74X164
>         help
>           Driver for 74x164 compatible serial-in/parallel-out 8-outputs
>           shift registers. This driver can be used to provide access
> -         to more gpio outputs.
> +         to more GPIO outputs.
>
>  config GPIO_MAX3191X
>         tristate "Maxim MAX3191x industrial serializer"



-- 
With Best Regards,
Andy Shevchenko
