Return-Path: <linux-gpio+bounces-18556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D9A823EC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F794A0638
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACCC25E809;
	Wed,  9 Apr 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AzGQRU7l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2955C25A62C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199180; cv=none; b=p7NKb1KqKDhRp6evzML5lWI4UrHo2WZ8L0nOIy+ActCZIKxGbSZatSXj96zSEIw/aZMzXReuoaJ1vyghMYiHNKnAtiQ8HfGvVsJhgBb/RXA+DoTSXlvn65XcvhnBvgCVIGlI2S69Kt/CfWZdScJTtm8n9EIBkeRMI7Nvu47JkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199180; c=relaxed/simple;
	bh=YV5gMdkO+/+2FcO7tTPABjN5QSfMLkWV2ElqF7C7urI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFkmAsNiNak/eLOb71enMTTzd7YPJQkukvu+hQkDHKjghTofIkekLV/cY12cPCyP6Q8Nm6Lt/pVoRxTEs0J916C60iDSa23xyFuHScumRM2Kpb4VL/HoTWVeT4nomn/wpZiM6t4D8i6tiOSItfpEHpd26XdSknOZhUiRcbo0zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AzGQRU7l; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db3f3c907so60313121fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744199176; x=1744803976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm1H2iOoMU914vn168iDtpV2IXQ45QvGTjlCPNbgJX8=;
        b=AzGQRU7lY84ZNxUe+/twVT0J8XCo/8qZPWK6M1hZpxPqt55IxiDXKr11/bdgb5duqT
         8cYcRMyAYtjRKWNLxGtbim6FMt7aD3lcdo4mZh/pC3TFeEEmPRvM+yKxVIT7q3sRqnsy
         GbhEijnYg3F9vgpMT45kLIEof4V5hFos+PXAwsBHLEH9F4yLHX2KYofkHRgBLTtZmoZY
         9Ba6Nj33mcQnCqas44LGAy5GWB/oC63lezCfVha5p8PZrGPDT2U02nsUJKFqInmfQ0CG
         2h0I8oPkMX0JkjOVOd60/4EfMANEBbpXDgTWut3uDdoX3j8qVURzvrBHwEiEfxz2Zehp
         OGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744199176; x=1744803976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm1H2iOoMU914vn168iDtpV2IXQ45QvGTjlCPNbgJX8=;
        b=HQezoqJzh18WVyebHAZJdcu/suqkXAB+CWffuKFeNI9yBQddtTn8ceTQpry7n2S21W
         YKfXsACIclhrAqH+nzeQq41EDnOwL/q2DW2iRgudStmNeaVEefj07Yxw+w3+INsuawca
         qu8RQ3NPRscmXDtWgU4B+JnPtxj+Dh9hS/b/MBawvqIv1TXTLoHiWy8QCweBiCc2zg05
         jX0nAfdzygVtuhk5f5LTgpoCRu7WG4YfhwTPnG7ApAN41QuLXtvuB2McIlGFb9h+NOeF
         0EtdkeF4leHquF3VCsuCRU6Ng4gVEysaemk9dR1ZG8p0AIfaMICLx3zQU0EsbHCTaNOt
         torg==
X-Forwarded-Encrypted: i=1; AJvYcCViTQkmwwJ26PjP9iVCpbO3c9woj+hbMU1CN6aIzM55M1kk4EhcmjqbVd0KDI6UkDDf/SZOBTw5jXNA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4LTL6ZYd6Y1CCJjrrj0NtKQl6Ed9wVp+OeFFGOWIRVaKBnNe
	7Xi9VfvC2znG1sj4FPvwQ08slxvOZDGagZfd8+tqZLB9IX3OFMDxzk8mK/LwID3vCndAK07q+oc
	UujYiAAfix+PJnM4TKg0aYSd/O+Q1hAK+DAltFQ==
X-Gm-Gg: ASbGncueghuJlFF9GToXjjzqx/9dzbAZ9/jzFZkpbuPoS5d8mcSEdn+Hq8ihmw5akZF
	eYd7OKr4gp/+viqcVt2X4HDfwy8tDClqbPHp72gGB50Z4/W9563L/646/iqdWZkPbdypq0OrOas
	tr1AHvXgSVXrMCkrZhp3AQl1t7ftqpeLfrdlvoUO1OoNeCkBjNQ14XUnuA673w5JKj
X-Google-Smtp-Source: AGHT+IG2f2EIhmVND4mptsZ59DtoY6ddNGGuygIixmEqILHnYtU9D/9WVgHR1l9X34LMKjLXjbH3Ht74O1Fb5m3pEbw=
X-Received: by 2002:a2e:b541:0:b0:30d:b309:21c6 with SMTP id
 38308e7fff4ca-30f44f4b81bmr4557591fa.5.1744199176089; Wed, 09 Apr 2025
 04:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e0e9e958-2a04-43e8-b2e4-fdc97906fd9d@portwell.com.tw>
In-Reply-To: <e0e9e958-2a04-43e8-b2e4-fdc97906fd9d@portwell.com.tw>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 13:46:04 +0200
X-Gm-Features: ATxdqUEWq4vyEznbPSMl5TVpg-VzAOyz6XYx-KEbUJar_aH61-dEB3vmXt_3G7Y
Message-ID: <CAMRc=MensaCPF4PL3C0PgfgR=YY++KRqa3EcXzKkQFu4VftQMA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	jay.chen@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 1:26=E2=80=AFPM Yen-Chi Huang
<jesse.huang@portwell.com.tw> wrote:
>
> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
>
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
>
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
>
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
> V2:
>   - Add DMI system check to avoid running on unsupported platforms
>   - Add 'force' module parameter to override DMI matching
>   - Use request_region() to claim I/O port access
>   - Extend WDT timeout handling to use both minute and second registers
>   - Increase WDT max timeout from 255s to 15300s
>   - Use named defines for WDT enable/disable
>   - Remove dummy pr_info() messages
>   - Fix several coding style issues (comments, alignment, spacing)
>
> ---
>  MAINTAINERS                        |   6 +
>  drivers/platform/x86/Kconfig       |  14 ++
>  drivers/platform/x86/Makefile      |   3 +
>  drivers/platform/x86/portwell-ec.c | 268 +++++++++++++++++++++++++++++
>  4 files changed, 291 insertions(+)
>  create mode 100644 drivers/platform/x86/portwell-ec.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d5dfb9186962..c52f819786dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19132,6 +19132,12 @@ F:     kernel/time/itimer.c
>  F:     kernel/time/posix-*
>  F:     kernel/time/namespace.c
>
> +PORTWELL EC DRIVER
> +M:     Yen-Chi Huang <jesse.huang@portwell.com.tw>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     drivers/platform/x86/portwell-ec.c
> +
>  POWER MANAGEMENT CORE
>  M:     "Rafael J. Wysocki" <rafael@kernel.org>
>  L:     linux-pm@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..2f26d1bf0a75 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -779,6 +779,20 @@ config PCENGINES_APU2
>           To compile this driver as a module, choose M here: the module
>           will be called pcengines-apuv2.
>
> +config PORTWELL_EC
> +       tristate "Portwell Embedded Controller driver"
> +       depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
> +       help
> +         This driver provides support for the GPIO pins and watchdog tim=
er
> +         embedded in Portwell's EC.
> +
> +         Theoretically, this driver should work on multiple Portwell pla=
tforms,
> +         but it has only been tested on the Portwell NANO-6064 board.
> +         If you encounter any issues on other boards, please report them=
.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called portwell-ec.
> +
>  config BARCO_P50_GPIO
>         tristate "Barco P50 GPIO driver for identify LED/button"
>         depends on GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 650dfbebb6c8..83dd82e04457 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)      +=3D xo1-rfkill.o
>  # PC Engines
>  obj-$(CONFIG_PCENGINES_APU2)   +=3D pcengines-apuv2.o
>
> +# Portwell
> +obj-$(CONFIG_PORTWELL_EC)      +=3D portwell-ec.o
> +
>  # Barco
>  obj-$(CONFIG_BARCO_P50_GPIO)   +=3D barco-p50-gpio.o
>
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/po=
rtwell-ec.c
> new file mode 100644
> index 000000000000..e94377906745
> --- /dev/null
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * portwell-ec.c: Portwell embedded controller driver.
> + *
> + * Tested on:
> + *  - Portwell NANO-6064
> + *
> + * This driver provides support for GPIO and Watchdog Timer
> + * functionalities of the Portwell boards with ITE embedded controller (=
EC).
> + * The EC is accessed through I/O ports and provides:
> + *  - 8 GPIO pins for control and monitoring
> + *  - Hardware watchdog with 1-15300 second timeout range
> + *
> + * It integrates with the Linux GPIO and Watchdog subsystems, allowing
> + * userspace interaction with EC GPIO pins and watchdog control,
> + * ensuring system stability and configurability.
> + *
> + * (C) Copyright 2025 Portwell, Inc.
> + * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +#include <linux/watchdog.h>
> +
> +#define PORTWELL_EC_IOSPACE 0xe300
> +#define PORTWELL_EC_IOSPACE_LEN 0x100
> +
> +#define PORTWELL_GPIO_PINS 8
> +#define PORTWELL_GPIO_DIR_REG 0x2b
> +#define PORTWELL_GPIO_VAL_REG 0x2c
> +
> +#define PORTWELL_WDT_EC_CONFIG_ADDR 0x06
> +#define PORTWELL_WDT_CONFIG_ENABLE 0x1
> +#define PORTWELL_WDT_CONFIG_DISABLE 0x0
> +#define PORTWELL_WDT_EC_COUNT_MIN_ADDR 0x07
> +#define PORTWELL_WDT_EC_COUNT_SEC_ADDR 0x08
> +#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 15300 //255*60secs
> +
> +#define PORTWELL_EC_FW_VENDOR_ADDRESS 0x4d
> +#define PORTWELL_EC_FW_VENDOR_LENGTH 3
> +#define PORTWELL_EC_FW_VENDOR_NAME "PWG"
> +
> +static bool force;
> +module_param(force, bool, 0444);
> +MODULE_PARM_DESC(force, "Force loading ec driver without checking DMI bo=
ardname");
> +
> +static const struct dmi_system_id pwec_dmi_table[] =3D {
> +       {
> +               .ident =3D "NANO-6064 series",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
> +               },
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
> +
> +/* Functions for access EC via IOSPACE*/
> +
> +static void pwec_write(u8 index, u8 data)
> +{
> +       outb(data, PORTWELL_EC_IOSPACE + index);
> +}
> +
> +static u8 pwec_read(u8 address)
> +{
> +       return inb(PORTWELL_EC_IOSPACE + address);
> +}
> +
> +/* GPIO functions*/
> +
> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0=
;
> +}
> +
> +static void pwec_gpio_set(struct gpio_chip *chip, unsigned int offset, i=
nt val)
> +{
> +       u8 tmp =3D pwec_read(PORTWELL_GPIO_VAL_REG);
> +
> +       if (val)
> +               tmp |=3D (1 << offset);
> +       else
> +               tmp &=3D ~(1 << offset);
> +       pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
> +}
> +
> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +       u8 direction =3D pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset)=
;
> +
> +       if (direction)
> +               return GPIO_LINE_DIRECTION_IN;
> +       else
> +               return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +/*
> + * Changing direction causes issues on some boards,
> + * so direction_input and direction_output are disabled for now.
> + */
> +
> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int =
offset)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int=
 offset, int value)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static struct gpio_chip pwec_gpio_chip =3D {
> +       .label =3D "portwell-ec-gpio",
> +       .get_direction =3D pwec_gpio_get_direction,
> +       .direction_input =3D pwec_gpio_direction_input,
> +       .direction_output =3D pwec_gpio_direction_output,
> +       .get =3D pwec_gpio_get,
> +       .set =3D pwec_gpio_set,

Please use the set_rv() variant, set() is deprecated as of v6.15-rc1.

> +       .base =3D -1,
> +       .ngpio =3D PORTWELL_GPIO_PINS,
> +};
> +
> +/* Watchdog functions*/
> +
> +static int pwec_wdt_trigger(struct watchdog_device *wdd)
> +{
> +       int retry =3D 10;
> +       u8 min, sec;
> +       unsigned int timeout;
> +
> +       do {
> +               pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout /=
 60);
> +               pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout %=
 60);
> +               pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONF=
IG_ENABLE);
> +               min =3D pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
> +               sec =3D pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +               timeout =3D min * 60 + sec;
> +               retry--;
> +       } while (timeout !=3D wdd->timeout && retry >=3D 0);
> +       if (retry < 0) {
> +               pr_err("watchdog started failed\n");
> +               return -EIO;
> +       } else
> +               return 0;
> +}
> +
> +static int pwec_wdt_start(struct watchdog_device *wdd)
> +{
> +       return pwec_wdt_trigger(wdd);
> +}
> +
> +static int pwec_wdt_stop(struct watchdog_device *wdd)
> +{
> +       pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_DISAB=
LE);
> +       return 0;
> +}
> +
> +static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned in=
t timeout)
> +{
> +       if (timeout =3D=3D 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECON=
D)
> +               return -EINVAL;
> +       wdd->timeout =3D timeout;
> +       pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout / 60);
> +       pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout % 60);
> +       return 0;
> +}
> +
> +static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +       u8 min, sec;
> +
> +       min =3D pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
> +       sec =3D pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +       return min  * 60 + sec;
> +}
> +
> +static const struct watchdog_ops pwec_wdt_ops =3D {
> +       .owner =3D THIS_MODULE,
> +       .start =3D pwec_wdt_start,
> +       .stop =3D pwec_wdt_stop,
> +       .ping =3D pwec_wdt_trigger,
> +       .set_timeout =3D pwec_wdt_set_timeout,
> +       .get_timeleft =3D pwec_wdt_get_timeleft,
> +};
> +
> +static struct watchdog_device ec_wdt_dev =3D {
> +       .info =3D &(struct watchdog_info){
> +       .options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGIC=
CLOSE,
> +       .identity =3D "Portwell EC Watchdog",
> +       },
> +       .ops =3D &pwec_wdt_ops,
> +       .timeout =3D 60,
> +       .min_timeout =3D 1,
> +       .max_timeout =3D PORTWELL_WDT_EC_MAX_COUNT_SECOND,
> +};
> +
> +static int pwec_firmware_vendor_check(void)
> +{
> +       u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
> +       u8 i;
> +
> +       for (i =3D 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
> +               buf[i] =3D pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS + i);
> +       buf[PORTWELL_EC_FW_VENDOR_LENGTH] =3D '\0';
> +
> +       return (strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) =3D=3D 0) ? 0 : -=
ENODEV;
> +}
> +
> +static int __init pwec_init(void)
> +{

I'm not an expert in x86 platform drivers but shouldn't this be
implemented as an actual platform driver, not a hand-coded
quasi-driver?

Bart

> +       int result;
> +
> +       if (!force) {
> +               if (!dmi_check_system(pwec_dmi_table)) {
> +                       pr_info("unsupported platform\n");
> +                       return -ENODEV;
> +               }
> +       }
> +
> +       if (!request_region(PORTWELL_EC_IOSPACE, PORTWELL_EC_IOSPACE_LEN,=
 "portwell-ec")) {
> +               pr_err("I/O region 0xE300-0xE3FF busy\n");
> +               return -EBUSY;
> +       }
> +
> +       result =3D pwec_firmware_vendor_check();
> +       if (result < 0)
> +               return result;
> +
> +       result =3D gpiochip_add_data(&pwec_gpio_chip, NULL);
> +       if (result < 0) {
> +               pr_err("failed to register Portwell EC GPIO\n");
> +               return result;
> +       }
> +
> +       result =3D watchdog_register_device(&ec_wdt_dev);
> +       if (result < 0) {
> +               gpiochip_remove(&pwec_gpio_chip);
> +               pr_err("failed to register Portwell EC Watchdog\n");
> +               return result;
> +       }
> +
> +       return 0;
> +}
> +
> +static void __exit pwec_exit(void)
> +{
> +       watchdog_unregister_device(&ec_wdt_dev);
> +       gpiochip_remove(&pwec_gpio_chip);
> +       release_region(PORTWELL_EC_IOSPACE, PORTWELL_EC_IOSPACE_LEN);
> +}
> +
> +module_init(pwec_init);
> +module_exit(pwec_exit);
> +
> +MODULE_AUTHOR("Yen-Chi Huang <jesse.huang@portwell.com.tw");
> +MODULE_DESCRIPTION("Portwell EC Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

