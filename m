Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1897BFD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 16:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfHUOEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 10:04:22 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35071 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbfHUOEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 10:04:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so2290114wmg.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=reply-to:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=JCRJ8TNSJztXdWP7G9PaJsc2nCaLeYDn4cer9uYfaEg=;
        b=XoLJmxWJDe/fueNvOomf5NVpNaLj9UVNiKG6L+Tm80+9ktkL4QiwieSfCpr+snuWGd
         xFVP/0bhTb2eGWY4kmPFw5VRlKshXn6HM+1FstrJaETbBQ+iMXKEtJaUfAARAlkq4Ymk
         J5DiyLjzVXYN7dsrOPAwxycq33v2oUkMCc+8pi6UYKubAqH8Y774+XXgkif0iGPJ4Zix
         W4qDeX+7D+3QnNMtdFE1rv5Uxyd+q9bFKafUCuiGVneVTLedbj9qSG+3JQq1i3pXpDe5
         sQpPYRjqoeBKtcHAucuOU25VQsWPdnKBs511/lhEmt3prPeeYDXx7TM9EfS97cLTidEt
         ge5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to;
        bh=JCRJ8TNSJztXdWP7G9PaJsc2nCaLeYDn4cer9uYfaEg=;
        b=iwM/AhMlMrdVWhwgqg3dEbtB2bCiyM9w20SlrzhSB/dNnEI1IImUO9L9ewi5UMzQNh
         FX0DGVoyzGOScACiA01lYgXAS1j+OlSfDma//G+qfdo4pk6jGVRjaQMA9pSo5XQi7bh9
         Aojz6eyS7MLsuhOShWSG7pifkWPH6AHZaLkRChpGg5AkRUB1rPN3yjXpvE1xENFlw3mu
         weqZVQ7hT/VBGot7YWCgcMPGzg+rQA39cECymDgwRh5C2gykgNGfqvQmxxuelMpneoHD
         7G/tkKAhgeDeSQiUrnUbx7fOsmg1+aO7ROcWasHs+GTSjwrIvqFwrSuoluiDaN62lssb
         jy3Q==
X-Gm-Message-State: APjAAAU1ky8SJqw9uWvxt1dB0hc9XRpAqvvpUGIiM0knQMiaL7XgFlJN
        DaibWkGIVf/bwLwHw5LMNz/PoA==
X-Google-Smtp-Source: APXvYqxRAywzNzkpJa5mFpAF8dz1qM+reBtaRb7KrOdIeGFVDz+mkrugdh7+9GBzjKcO5Bo0mE/wWw==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr160626wml.175.1566396257216;
        Wed, 21 Aug 2019 07:04:17 -0700 (PDT)
Received: from [66.102.1.108] ([149.199.62.129])
        by smtp.gmail.com with ESMTPSA id h23sm85192wml.43.2019.08.21.07.04.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 07:04:14 -0700 (PDT)
Reply-To: monstr@monstr.eu
Subject: Re: [PATCH] RFT: microblaze: Switch to standard restart handler
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Simek <michals@xilinx.com>
References: <20190821083320.4788-1-linus.walleij@linaro.org>
From:   Michal Simek <monstr@monstr.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=monstr@monstr.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <628d4ee8-2ec6-ff52-2677-9dd2589dee00@monstr.eu>
Date:   Wed, 21 Aug 2019 16:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821083320.4788-1-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="lnXa6GkeQiojJpXglnTevqbudl61VXOuE"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lnXa6GkeQiojJpXglnTevqbudl61VXOuE
Content-Type: multipart/mixed; boundary="YZRWkR3XtGHQqdMST4dN7dPe2nRiKPUY4";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, Michal Simek <michals@xilinx.com>
Message-ID: <628d4ee8-2ec6-ff52-2677-9dd2589dee00@monstr.eu>
Subject: Re: [PATCH] RFT: microblaze: Switch to standard restart handler
References: <20190821083320.4788-1-linus.walleij@linaro.org>
In-Reply-To: <20190821083320.4788-1-linus.walleij@linaro.org>

--YZRWkR3XtGHQqdMST4dN7dPe2nRiKPUY4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On 21. 08. 19 10:33, Linus Walleij wrote:
> The microblaze uses the legacy APIs to dig out a GPIO pin
> defined in the root of the device tree to issue a hard
> reset of the platform.
>=20
> Asserting a hard reset should be done using the standard
> DT-enabled and fully GPIO descriptor aware driver in
> drivers/power/reset/gpio-restart.c using the bindings
> from Documentation/devicetree/bindings/power/reset/gpio-restart.txt
>=20
> To achieve this, first make sure microblaze makes use of
> the standard kernel restart path utilizing do_kernel_restart()
> from <linux/reboot.h>. Put in some grace time and an
> emergency print if the restart does not properly assert.
>=20
> As this is basic platform functionality we patch the DTS
> file and defconfig in one go for a lockstep change.
>=20
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi Michal, would be great if you could test and fix this up
> so I can get rid of one more site where legacy GPIO is used.
> I am unsure of the appropriate polarity and delays, hence the
> comments in the DTS file.
> ---
>  arch/microblaze/boot/dts/system.dts     | 16 +++++-
>  arch/microblaze/configs/mmu_defconfig   |  2 +
>  arch/microblaze/configs/nommu_defconfig |  2 +
>  arch/microblaze/include/asm/setup.h     |  1 -
>  arch/microblaze/kernel/reset.c          | 76 -------------------------=

>  arch/microblaze/mm/init.c               | 11 ++++
>  6 files changed, 30 insertions(+), 78 deletions(-)
>=20
> diff --git a/arch/microblaze/boot/dts/system.dts b/arch/microblaze/boot=
/dts/system.dts
> index 5a8a9d090c37..c4e8bed50cb0 100644
> --- a/arch/microblaze/boot/dts/system.dts
> +++ b/arch/microblaze/boot/dts/system.dts
> @@ -18,7 +18,6 @@
>  	#address-cells =3D <1>;
>  	#size-cells =3D <1>;
>  	compatible =3D "xlnx,microblaze";
> -	hard-reset-gpios =3D <&LEDs_8Bit 2 1>;
>  	model =3D "testing";
>  	DDR2_SDRAM: memory@90000000 {
>  		device_type =3D "memory";
> @@ -281,6 +280,21 @@
>  				gpios =3D <&LEDs_8Bit 7 1>;
>  			};
>  		} ;
> +
> +		gpio-restart {
> +			compatible =3D "gpio-restart";
> +			/*
> +			 * FIXME: is this active low or active high?
> +			 * the current flag (1) indicates active low.
> +			 * delay measures are templates, should be adjusted
> +			 * to datasheet or trial-and-error with real hardware.
> +			 */
> +			hard-reset-gpios =3D <&LEDs_8Bit 2 1>;
> +			active-delay =3D <100>;
> +			inactive-delay =3D <10>;
> +			wait-delay =3D <100>;
> +		};
> +
>  		RS232_Uart_1: serial@84000000 {
>  			clock-frequency =3D <125000000>;
>  			compatible =3D "xlnx,xps-uartlite-1.00.a";
> diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/co=
nfigs/mmu_defconfig
> index 92fd4e95b488..ae8d7d407ff4 100644
> --- a/arch/microblaze/configs/mmu_defconfig
> +++ b/arch/microblaze/configs/mmu_defconfig
> @@ -59,6 +59,8 @@ CONFIG_SPI_XILINX=3Dy
>  CONFIG_GPIOLIB=3Dy
>  CONFIG_GPIO_SYSFS=3Dy
>  CONFIG_GPIO_XILINX=3Dy
> +CONFIG_POWER_RESET=3Dy
> +CONFIG_POWER_RESET_GPIO_RESTART=3Dy
>  # CONFIG_HWMON is not set
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_XILINX_WATCHDOG=3Dy
> diff --git a/arch/microblaze/configs/nommu_defconfig b/arch/microblaze/=
configs/nommu_defconfig
> index 06d69a6e192d..a2a6be511551 100644
> --- a/arch/microblaze/configs/nommu_defconfig
> +++ b/arch/microblaze/configs/nommu_defconfig
> @@ -62,6 +62,8 @@ CONFIG_SPI_XILINX=3Dy
>  CONFIG_GPIOLIB=3Dy
>  CONFIG_GPIO_SYSFS=3Dy
>  CONFIG_GPIO_XILINX=3Dy
> +CONFIG_POWER_RESET=3Dy
> +CONFIG_POWER_RESET_GPIO_RESTART=3Dy
>  # CONFIG_HWMON is not set
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_XILINX_WATCHDOG=3Dy
> diff --git a/arch/microblaze/include/asm/setup.h b/arch/microblaze/incl=
ude/asm/setup.h
> index ce9b7b786156..54d634ed98e6 100644
> --- a/arch/microblaze/include/asm/setup.h
> +++ b/arch/microblaze/include/asm/setup.h
> @@ -29,7 +29,6 @@ void machine_early_init(const char *cmdline, unsigned=
 int ram,
>  		unsigned int fdt, unsigned int msr, unsigned int tlb0,
>  		unsigned int tlb1);
> =20
> -void machine_restart(char *cmd);
>  void machine_shutdown(void);
>  void machine_halt(void);
>  void machine_power_off(void);
> diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/re=
set.c
> index fcbe1daf6316..b56af4eb91bf 100644
> --- a/arch/microblaze/kernel/reset.c
> +++ b/arch/microblaze/kernel/reset.c
> @@ -10,82 +10,6 @@
>  #include <linux/init.h>
>  #include <linux/of_platform.h>
> =20
> -/* Trigger specific functions */
> -#ifdef CONFIG_GPIOLIB
> -
> -#include <linux/of_gpio.h>
> -
> -static int handle; /* reset pin handle */
> -static unsigned int reset_val;
> -
> -static int of_platform_reset_gpio_probe(void)
> -{
> -	int ret;
> -	handle =3D of_get_named_gpio(of_find_node_by_path("/"),
> -				   "hard-reset-gpios", 0);
> -
> -	if (!gpio_is_valid(handle)) {
> -		pr_info("Skipping unavailable RESET gpio %d (%s)\n",
> -				handle, "reset");
> -		return -ENODEV;
> -	}
> -
> -	ret =3D gpio_request(handle, "reset");
> -	if (ret < 0) {
> -		pr_info("GPIO pin is already allocated\n");
> -		return ret;
> -	}
> -
> -	/* get current setup value */
> -	reset_val =3D gpio_get_value(handle);
> -	/* FIXME maybe worth to perform any action */
> -	pr_debug("Reset: Gpio output state: 0x%x\n", reset_val);
> -
> -	/* Setup GPIO as output */
> -	ret =3D gpio_direction_output(handle, 0);
> -	if (ret < 0)
> -		goto err;
> -
> -	/* Setup output direction */
> -	gpio_set_value(handle, 0);
> -
> -	pr_info("RESET: Registered gpio device: %d, current val: %d\n",
> -							handle, reset_val);
> -	return 0;
> -err:
> -	gpio_free(handle);
> -	return ret;
> -}
> -device_initcall(of_platform_reset_gpio_probe);
> -
> -
> -static void gpio_system_reset(void)
> -{
> -	if (gpio_is_valid(handle))
> -		gpio_set_value(handle, 1 - reset_val);
> -	else
> -		pr_notice("Reset GPIO unavailable - halting!\n");
> -}
> -#else
> -static void gpio_system_reset(void)
> -{
> -	pr_notice("No reset GPIO present - halting!\n");
> -}
> -
> -void of_platform_reset_gpio_probe(void)
> -{
> -	return;
> -}
> -#endif
> -
> -void machine_restart(char *cmd)
> -{
> -	pr_notice("Machine restart...\n");
> -	gpio_system_reset();
> -	while (1)
> -		;
> -}
> -
>  void machine_shutdown(void)
>  {
>  	pr_notice("Machine shutdown...\n");
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index a015a951c8b7..4a45e037107f 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -17,6 +17,8 @@
>  #include <linux/slab.h>
>  #include <linux/swap.h>
>  #include <linux/export.h>
> +#include <linux/delay.h>
> +#include <linux/reboot.h>
> =20
>  #include <asm/page.h>
>  #include <asm/mmu_context.h>
> @@ -265,6 +267,15 @@ static void __init mmu_init_hw(void)
>  			: : : "r11");
>  }
> =20
> +void machine_restart(char *cmd)
> +{
> +	do_kernel_restart(cmd);
> +	/* Give the restart hook 1 s to take us down */
> +	mdelay(1000);
> +	pr_emerg("Reboot failed -- System halted\n");
> +	while (1);
> +}
> +
>  /*
>   * MMU_init sets up the basic memory mappings for the kernel,
>   * including both RAM and possibly some I/O regions,
>=20

This should got to kernel/reset.c.

Anyway I have tested it and I have issue to use restart-gpio driver and

I am using gpio-xilinx driver which drives that pin.

[    6.475449] restart-gpio amba_pl:gpio-restart: GPIO lookup for
consumer (null)
[    6.482887] restart-gpio amba_pl:gpio-restart: using device tree for
GPIO lookup
[    6.495623] restart-gpio amba_pl:gpio-restart: using lookup tables
for GPIO lookup
[    6.505016] restart-gpio amba_pl:gpio-restart: No GPIO consumer
(null) found
[    6.512275] restart-gpio amba_pl:gpio-restart: Could net get reset GPI=
O
[    6.519076] restart-gpio: probe of amba_pl:gpio-restart failed with
error -2

Is there an issue with gpio-xilinx driver that of_find_gpio() is failing?=


Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--YZRWkR3XtGHQqdMST4dN7dPe2nRiKPUY4--

--lnXa6GkeQiojJpXglnTevqbudl61VXOuE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQbPNTMvXmYlBPRwx7KSWXLKUoMIQUCXV1PVQAKCRDKSWXLKUoM
IbP0AJ9BknjyvLYIVKyszAuESP1e99UhyQCeIZqAxJOaTEIpxRz8WMAP0Mqau7c=
=S+qb
-----END PGP SIGNATURE-----

--lnXa6GkeQiojJpXglnTevqbudl61VXOuE--
