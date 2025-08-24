Return-Path: <linux-gpio+bounces-24848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C746EB32EDC
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 11:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F355B2029E1
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 09:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376152620D2;
	Sun, 24 Aug 2025 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MHD4exnx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373319C556;
	Sun, 24 Aug 2025 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756029443; cv=none; b=ioowkeD4OooiS3sccu7a1hkW//M6gEO4y7ISvWq+4vPtn4wv0JFjI6HdXH0Bg+6djUw5MU0XYGo7yrMXGxAsiZAKEXxsww0bIg7d661O0Q31MMoZlTq/5eNbpVossGlORLP8LbNM/lbgII8ZL+YEyQ1GttneqottR6hwhJZsfDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756029443; c=relaxed/simple;
	bh=SRmxSg/4ccq/UKNKtHcU4Cy2FhBb16BlkjJIJZYAouM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EHbc5LVmZ5xE3mM7ajp/sJkQxYfA0A4a9CavF7A063oc4i39Pab5qUfIgsyHmXBIojl/8CGgIINgc6wfD2tSisMNY5l0aU7XeA4CBBzpcZUtCwJUYxKDx4TXlV61+DzBQhfpJsklP9DJNPAJOKpgcnDce8zeTmANW/IJRVtdsdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=MHD4exnx; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1756029422; x=1756634222; i=wahrenst@gmx.net;
	bh=INwljBAg7t/cLkXN1fiKf0BpPxeyVBoaZHpFkuqk5iA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MHD4exnx91UYI4e/No3GHi41WuxB0dSglsBiAYt8sI/YPy6kPjWBwB7cvDIT0+Ti
	 iUMaPSrrXAzcslgT13v6fs4JPUrvmhDE3Vp9x/B35yD2Slkx6xxS46k+bMrUxAVOb
	 yHrBT32tym7hD79/X2ppIZdqB2dB+RGfB+bku9yt72GDD705fpXQHtQFmwJ6CV6+Q
	 BEvzIbbb8vanUH/WQwXrEpEEvmRZmbgi8PAnZIaMwCrU+NKfvHCzogh2f4/jUeYI2
	 iIxvW6rRM55rVeXpqvqD1y+D1i2EbLzYTgcqGOKEK9nDa+XNRFV0bxrAKGXRq164n
	 LIWFaKfQr2AARMrPfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1uDkF91efl-00aA6y; Sun, 24
 Aug 2025 11:57:02 +0200
Message-ID: <83d0f449-be3a-44ca-9722-d747969d96c9@gmx.net>
Date: Sun, 24 Aug 2025 11:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GhegFLI0+jTHNmtuf9ZF53TscIaiHR0lhcJMkLIUOB70sNL/kKB
 +5Rn/jzbRJvZLfkO5sNlc6qgLmL/67CSv/rWtIgAdjm8JSSQwGi8dwFXp8XKNeirCa3HU0V
 Ll7KHIGs6mblOruAvO+AHk8PCCTRWgQK+yfvYdeOFXVoY/EIp9DaMblEnD0iLI9OCJfi0BR
 n5PuUdXv9SiZxozGYHzNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H73j8oqGsY0=;nvS0x3H5esZXr6iyauNuAalfcwL
 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
 imZlHLN2BdzDj7UIG/t

Hi Andrea,

Am 11.08.25 um 16:46 schrieb Andrea della Porta:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@br=
oadcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>   drivers/pinctrl/bcm/Kconfig           |   13 +
>   drivers/pinctrl/bcm/Makefile          |    1 +
>   drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1197 +++++++++++++++++++++++++
>   3 files changed, 1211 insertions(+)
>   create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
>
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 35b51ce4298e..2e1b8d444f58 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -3,6 +3,19 @@
>   # Broadcom pinctrl drivers
>   #
>  =20
> +config PINCTRL_BRCMSTB
> +	tristate "Broadcom STB product line pin controller driver"
> +	depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	help
> +	  This driver provide pin muxing and configuration functionality
> +	  for Broadcom STB product line chipsets. BCM2712 SoC is one of these
> +	  chipsets.
> +
> +	  If M is selected the module will be called pinctrl-brcmstb.
> +
>   config PINCTRL_BCM281XX
>   	bool "Broadcom BCM281xx pinctrl driver"
>   	depends on OF && (ARCH_BCM_MOBILE || COMPILE_TEST)
> diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
> index 82b868ec1471..5f790c14cc4c 100644
> --- a/drivers/pinctrl/bcm/Makefile
> +++ b/drivers/pinctrl/bcm/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_BCM6358)		+=3D pinctrl-bcm6358.o
>   obj-$(CONFIG_PINCTRL_BCM6362)		+=3D pinctrl-bcm6362.o
>   obj-$(CONFIG_PINCTRL_BCM6368)		+=3D pinctrl-bcm6368.o
>   obj-$(CONFIG_PINCTRL_BCM63268)		+=3D pinctrl-bcm63268.o
> +obj-$(CONFIG_PINCTRL_BRCMSTB)		+=3D pinctrl-brcmstb.o
>   obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+=3D pinctrl-iproc-gpio.o
>   obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+=3D pinctrl-cygnus-mux.o
>   obj-$(CONFIG_PINCTRL_NS)		+=3D pinctrl-ns.o
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm=
/pinctrl-brcmstb.c
> new file mode 100644
> index 000000000000..534bd8908630
> --- /dev/null
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -0,0 +1,1197 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Broadcom brcmstb GPIO units (pinctrl only)
> + *
> + * Copyright (C) 2024-2025 Ivan T. Ivanov, Andrea della Porta
> + * Copyright (C) 2021-3 Raspberry Pi Ltd.
> + * Copyright (C) 2012 Chris Boot, Simon Arlott, Stephen Warren
> + *
> + * Based heavily on the BCM2835 GPIO & pinctrl driver, which was inspir=
ed by:
> + * pinctrl-nomadik.c, please see original file for copyright informatio=
n
> + * pinctrl-tegra.c, please see original file for copyright information
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#define BRCMSTB_PULL_NONE	0
> +#define BRCMSTB_PULL_DOWN	1
> +#define BRCMSTB_PULL_UP		2
> +#define BRCMSTB_PULL_MASK	0x3
> +
> +#define BRCMSTB_FSEL_COUNT	9
> +#define BRCMSTB_FSEL_MASK	0xf
> +
> +#define FUNC(f) \
> +	[func_##f] =3D #f
> +
> +#define PIN(i, f1, f2, f3, f4, f5, f6, f7, f8) \
> +	[i] =3D { \
> +		.funcs =3D { \
> +			func_##f1, \
> +			func_##f2, \
> +			func_##f3, \
> +			func_##f4, \
> +			func_##f5, \
> +			func_##f6, \
> +			func_##f7, \
> +			func_##f8, \
> +		}, \
> +	}
> +
> +#define MUX_BIT_VALID		0x8000
> +#define PAD_BIT_INVALID		0xffff
> +
> +#define BIT_TO_REG(b)		(((b) >> 5) << 2)
> +#define BIT_TO_SHIFT(b)		((b) & 0x1f)
> +
> +#define MUX_BIT(muxreg, muxshift) \
> +	(MUX_BIT_VALID + ((muxreg) << 5) + ((muxshift) << 2))
> +#define PAD_BIT(padreg, padshift) \
> +	(((padreg) << 5) + ((padshift) << 1))
> +
> +#define GPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> +	[n] =3D { MUX_BIT(muxreg, muxshift), PAD_BIT(padreg, padshift) }
> +
> +#define EMMC_REGS(n, padreg, padshift) \
> +	[n] =3D { 0, PAD_BIT(padreg, padshift) }
> +
> +#define AGPIO_REGS(n, muxreg, muxshift, padreg, padshift) \
> +	GPIO_REGS(n, muxreg, muxshift, padreg, padshift)
> +
> +#define SGPIO_REGS(n, muxreg, muxshift) \
> +	[(n) + 32] =3D { MUX_BIT(muxreg, muxshift), PAD_BIT_INVALID }
> +
> +#define GPIO_PIN(n)		PINCTRL_PIN(n, "gpio" #n)
> +#define AGPIO_PIN(n)		PINCTRL_PIN(n, "aon_gpio" #n)
> +#define SGPIO_PIN(n)		PINCTRL_PIN((n) + 32, "aon_sgpio" #n)
It would be great, if there is comment explaining the difference between=
=20
a AGPIO_PIN and a SGPIO_PIN?

In case AGPIO_PIN stands for AON_GPIO_PIN, i would prefer the latter.
> +
> +struct pin_regs {
> +	u16 mux_bit;
> +	u16 pad_bit;
> +};
> +
> +struct brcmstb_pin_funcs {
> +	u8 funcs[BRCMSTB_FSEL_COUNT - 1];
> +};
> +
> +struct brcmstb_pinctrl {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct pinctrl_dev *pctl_dev;
> +	struct pinctrl_desc pctl_desc;
> +	const struct pin_regs *pin_regs;
> +	const struct brcmstb_pin_funcs *pin_funcs;
> +	const char *const *gpio_groups;
> +	struct pinctrl_gpio_range gpio_range;
> +	/* Protect FSEL registers */
> +	spinlock_t fsel_lock;
> +};
> +
> +struct brcmstb_pdata {
> +	const struct pinctrl_desc *pctl_desc;
> +	const struct pinctrl_gpio_range *gpio_range;
> +	const struct pin_regs *pin_regs;
> +	const struct brcmstb_pin_funcs *pin_funcs;
> +};
> +
> +enum brcmstb_funcs {
> +	func_gpio,
> +	func_alt1,
> +	func_alt2,
> +	func_alt3,
> +	func_alt4,
> +	func_alt5,
> +	func_alt6,
> +	func_alt7,
> +	func_alt8,
> +	func_aon_cpu_standbyb,
> +	func_aon_fp_4sec_resetb,
> +	func_aon_gpclk,
> +	func_aon_pwm,
> +	func_arm_jtag,
> +	func_aud_fs_clk0,
> +	func_avs_pmu_bsc,
> +	func_bsc_m0,
> +	func_bsc_m1,
> +	func_bsc_m2,
> +	func_bsc_m3,
> +	func_clk_observe,
> +	func_ctl_hdmi_5v,
> +	func_enet0,
> +	func_enet0_mii,
> +	func_enet0_rgmii,
> +	func_ext_sc_clk,
> +	func_fl0,
> +	func_fl1,
> +	func_gpclk0,
> +	func_gpclk1,
> +	func_gpclk2,
> +	func_hdmi_tx0_auto_i2c,
> +	func_hdmi_tx0_bsc,
> +	func_hdmi_tx1_auto_i2c,
> +	func_hdmi_tx1_bsc,
> +	func_i2s_in,
> +	func_i2s_out,
> +	func_ir_in,
> +	func_mtsif,
> +	func_mtsif_alt,
> +	func_mtsif_alt1,
> +	func_pdm,
> +	func_pkt,
> +	func_pm_led_out,
> +	func_sc0,
> +	func_sd0,
> +	func_sd2,
> +	func_sd_card_a,
> +	func_sd_card_b,
> +	func_sd_card_c,
> +	func_sd_card_d,
> +	func_sd_card_e,
> +	func_sd_card_f,
> +	func_sd_card_g,
> +	func_spdif_out,
> +	func_spi_m,
> +	func_spi_s,
> +	func_sr_edm_sense,
> +	func_te0,
> +	func_te1,
> +	func_tsio,
> +	func_uart0,
> +	func_uart1,
> +	func_uart2,
> +	func_usb_pwr,
> +	func_usb_vbus,
> +	func_uui,
> +	func_vc_i2c0,
> +	func_vc_i2c3,
> +	func_vc_i2c4,
> +	func_vc_i2c5,
> +	func_vc_i2csl,
> +	func_vc_pcm,
> +	func_vc_pwm0,
> +	func_vc_pwm1,
> +	func_vc_spi0,
> +	func_vc_spi3,
> +	func_vc_spi4,
> +	func_vc_spi5,
> +	func_vc_uart0,
> +	func_vc_uart2,
> +	func_vc_uart3,
> +	func_vc_uart4,
> +	func__,
> +	func_count =3D func__
> +};
I'm very sceptical that this enum is generic. I would tend use to=20
bcm2712_funcs here.
> +
> +static const struct pin_regs bcm2712_c0_gpio_pin_regs[] =3D {
> +	GPIO_REGS(0, 0, 0, 7, 7),
> +	GPIO_REGS(1, 0, 1, 7, 8),
> +	GPIO_REGS(2, 0, 2, 7, 9),
> +	GPIO_REGS(3, 0, 3, 7, 10),
> +	GPIO_REGS(4, 0, 4, 7, 11),
> +	GPIO_REGS(5, 0, 5, 7, 12),
> +	GPIO_REGS(6, 0, 6, 7, 13),
> +	GPIO_REGS(7, 0, 7, 7, 14),
> +	GPIO_REGS(8, 1, 0, 8, 0),
> +	GPIO_REGS(9, 1, 1, 8, 1),
> +	GPIO_REGS(10, 1, 2, 8, 2),
> +	GPIO_REGS(11, 1, 3, 8, 3),
> +	GPIO_REGS(12, 1, 4, 8, 4),
> +	GPIO_REGS(13, 1, 5, 8, 5),
> +	GPIO_REGS(14, 1, 6, 8, 6),
> +	GPIO_REGS(15, 1, 7, 8, 7),
> +	GPIO_REGS(16, 2, 0, 8, 8),
> +	GPIO_REGS(17, 2, 1, 8, 9),
> +	GPIO_REGS(18, 2, 2, 8, 10),
> +	GPIO_REGS(19, 2, 3, 8, 11),
> +	GPIO_REGS(20, 2, 4, 8, 12),
> +	GPIO_REGS(21, 2, 5, 8, 13),
> +	GPIO_REGS(22, 2, 6, 8, 14),
> +	GPIO_REGS(23, 2, 7, 9, 0),
> +	GPIO_REGS(24, 3, 0, 9, 1),
> +	GPIO_REGS(25, 3, 1, 9, 2),
> +	GPIO_REGS(26, 3, 2, 9, 3),
> +	GPIO_REGS(27, 3, 3, 9, 4),
> +	GPIO_REGS(28, 3, 4, 9, 5),
> +	GPIO_REGS(29, 3, 5, 9, 6),
> +	GPIO_REGS(30, 3, 6, 9, 7),
> +	GPIO_REGS(31, 3, 7, 9, 8),
> +	GPIO_REGS(32, 4, 0, 9, 9),
> +	GPIO_REGS(33, 4, 1, 9, 10),
> +	GPIO_REGS(34, 4, 2, 9, 11),
> +	GPIO_REGS(35, 4, 3, 9, 12),
> +	GPIO_REGS(36, 4, 4, 9, 13),
> +	GPIO_REGS(37, 4, 5, 9, 14),
> +	GPIO_REGS(38, 4, 6, 10, 0),
> +	GPIO_REGS(39, 4, 7, 10, 1),
> +	GPIO_REGS(40, 5, 0, 10, 2),
> +	GPIO_REGS(41, 5, 1, 10, 3),
> +	GPIO_REGS(42, 5, 2, 10, 4),
> +	GPIO_REGS(43, 5, 3, 10, 5),
> +	GPIO_REGS(44, 5, 4, 10, 6),
> +	GPIO_REGS(45, 5, 5, 10, 7),
> +	GPIO_REGS(46, 5, 6, 10, 8),
> +	GPIO_REGS(47, 5, 7, 10, 9),
> +	GPIO_REGS(48, 6, 0, 10, 10),
> +	GPIO_REGS(49, 6, 1, 10, 11),
> +	GPIO_REGS(50, 6, 2, 10, 12),
> +	GPIO_REGS(51, 6, 3, 10, 13),
> +	GPIO_REGS(52, 6, 4, 10, 14),
> +	GPIO_REGS(53, 6, 5, 11, 0),
> +	EMMC_REGS(54, 11, 1), /* EMMC_CMD */
> +	EMMC_REGS(55, 11, 2), /* EMMC_DS */
> +	EMMC_REGS(56, 11, 3), /* EMMC_CLK */
> +	EMMC_REGS(57, 11, 4), /* EMMC_DAT0 */
> +	EMMC_REGS(58, 11, 5), /* EMMC_DAT1 */
> +	EMMC_REGS(59, 11, 6), /* EMMC_DAT2 */
> +	EMMC_REGS(60, 11, 7), /* EMMC_DAT3 */
> +	EMMC_REGS(61, 11, 8), /* EMMC_DAT4 */
> +	EMMC_REGS(62, 11, 9), /* EMMC_DAT5 */
> +	EMMC_REGS(63, 11, 10), /* EMMC_DAT6 */
> +	EMMC_REGS(64, 11, 11), /* EMMC_DAT7 */
> +};
> +
> +static struct pin_regs bcm2712_c0_aon_gpio_pin_regs[] =3D {
> +	AGPIO_REGS(0, 3, 0, 6, 10),
> +	AGPIO_REGS(1, 3, 1, 6, 11),
> +	AGPIO_REGS(2, 3, 2, 6, 12),
> +	AGPIO_REGS(3, 3, 3, 6, 13),
> +	AGPIO_REGS(4, 3, 4, 6, 14),
> +	AGPIO_REGS(5, 3, 5, 7, 0),
> +	AGPIO_REGS(6, 3, 6, 7, 1),
> +	AGPIO_REGS(7, 3, 7, 7, 2),
> +	AGPIO_REGS(8, 4, 0, 7, 3),
> +	AGPIO_REGS(9, 4, 1, 7, 4),
> +	AGPIO_REGS(10, 4, 2, 7, 5),
> +	AGPIO_REGS(11, 4, 3, 7, 6),
> +	AGPIO_REGS(12, 4, 4, 7, 7),
> +	AGPIO_REGS(13, 4, 5, 7, 8),
> +	AGPIO_REGS(14, 4, 6, 7, 9),
> +	AGPIO_REGS(15, 4, 7, 7, 10),
> +	AGPIO_REGS(16, 5, 0, 7, 11),
> +	SGPIO_REGS(0, 0, 0),
> +	SGPIO_REGS(1, 0, 1),
> +	SGPIO_REGS(2, 0, 2),
> +	SGPIO_REGS(3, 0, 3),
> +	SGPIO_REGS(4, 1, 0),
> +	SGPIO_REGS(5, 2, 0),
> +};
> +
> +static const struct pinctrl_pin_desc bcm2712_c0_gpio_pins[] =3D {
> +	GPIO_PIN(0),
> +	GPIO_PIN(1),
> +	GPIO_PIN(2),
> +	GPIO_PIN(3),
> +	GPIO_PIN(4),
> +	GPIO_PIN(5),
> +	GPIO_PIN(6),
> +	GPIO_PIN(7),
> +	GPIO_PIN(8),
> +	GPIO_PIN(9),
> +	GPIO_PIN(10),
> +	GPIO_PIN(11),
> +	GPIO_PIN(12),
> +	GPIO_PIN(13),
> +	GPIO_PIN(14),
> +	GPIO_PIN(15),
> +	GPIO_PIN(16),
> +	GPIO_PIN(17),
> +	GPIO_PIN(18),
> +	GPIO_PIN(19),
> +	GPIO_PIN(20),
> +	GPIO_PIN(21),
> +	GPIO_PIN(22),
> +	GPIO_PIN(23),
> +	GPIO_PIN(24),
> +	GPIO_PIN(25),
> +	GPIO_PIN(26),
> +	GPIO_PIN(27),
> +	GPIO_PIN(28),
> +	GPIO_PIN(29),
> +	GPIO_PIN(30),
> +	GPIO_PIN(31),
> +	GPIO_PIN(32),
> +	GPIO_PIN(33),
> +	GPIO_PIN(34),
> +	GPIO_PIN(35),
> +	GPIO_PIN(36),
> +	GPIO_PIN(37),
> +	GPIO_PIN(38),
> +	GPIO_PIN(39),
> +	GPIO_PIN(40),
> +	GPIO_PIN(41),
> +	GPIO_PIN(42),
> +	GPIO_PIN(43),
> +	GPIO_PIN(44),
> +	GPIO_PIN(45),
> +	GPIO_PIN(46),
> +	GPIO_PIN(47),
> +	GPIO_PIN(48),
> +	GPIO_PIN(49),
> +	GPIO_PIN(50),
> +	GPIO_PIN(51),
> +	GPIO_PIN(52),
> +	GPIO_PIN(53),
> +	PINCTRL_PIN(54, "emmc_cmd"),
> +	PINCTRL_PIN(55, "emmc_ds"),
> +	PINCTRL_PIN(56, "emmc_clk"),
> +	PINCTRL_PIN(57, "emmc_dat0"),
> +	PINCTRL_PIN(58, "emmc_dat1"),
> +	PINCTRL_PIN(59, "emmc_dat2"),
> +	PINCTRL_PIN(60, "emmc_dat3"),
> +	PINCTRL_PIN(61, "emmc_dat4"),
> +	PINCTRL_PIN(62, "emmc_dat5"),
> +	PINCTRL_PIN(63, "emmc_dat6"),
> +	PINCTRL_PIN(64, "emmc_dat7"),
> +};
> +
> +static struct pinctrl_pin_desc bcm2712_c0_aon_gpio_pins[] =3D {
> +	AGPIO_PIN(0),  AGPIO_PIN(1),  AGPIO_PIN(2),  AGPIO_PIN(3),
> +	AGPIO_PIN(4),  AGPIO_PIN(5),  AGPIO_PIN(6),  AGPIO_PIN(7),
> +	AGPIO_PIN(8),  AGPIO_PIN(9),  AGPIO_PIN(10), AGPIO_PIN(11),
> +	AGPIO_PIN(12), AGPIO_PIN(13), AGPIO_PIN(14), AGPIO_PIN(15),
> +	AGPIO_PIN(16), SGPIO_PIN(0),  SGPIO_PIN(1),  SGPIO_PIN(2),
> +	SGPIO_PIN(3),  SGPIO_PIN(4),  SGPIO_PIN(5),
> +};
> +
> +static const struct pin_regs bcm2712_d0_gpio_pin_regs[] =3D {
> +	GPIO_REGS(1, 0, 0, 4, 5),
> +	GPIO_REGS(2, 0, 1, 4, 6),
> +	GPIO_REGS(3, 0, 2, 4, 7),
> +	GPIO_REGS(4, 0, 3, 4, 8),
> +	GPIO_REGS(10, 0, 4, 4, 9),
> +	GPIO_REGS(11, 0, 5, 4, 10),
> +	GPIO_REGS(12, 0, 6, 4, 11),
> +	GPIO_REGS(13, 0, 7, 4, 12),
> +	GPIO_REGS(14, 1, 0, 4, 13),
> +	GPIO_REGS(15, 1, 1, 4, 14),
> +	GPIO_REGS(18, 1, 2, 5, 0),
> +	GPIO_REGS(19, 1, 3, 5, 1),
> +	GPIO_REGS(20, 1, 4, 5, 2),
> +	GPIO_REGS(21, 1, 5, 5, 3),
> +	GPIO_REGS(22, 1, 6, 5, 4),
> +	GPIO_REGS(23, 1, 7, 5, 5),
> +	GPIO_REGS(24, 2, 0, 5, 6),
> +	GPIO_REGS(25, 2, 1, 5, 7),
> +	GPIO_REGS(26, 2, 2, 5, 8),
> +	GPIO_REGS(27, 2, 3, 5, 9),
> +	GPIO_REGS(28, 2, 4, 5, 10),
> +	GPIO_REGS(29, 2, 5, 5, 11),
> +	GPIO_REGS(30, 2, 6, 5, 12),
> +	GPIO_REGS(31, 2, 7, 5, 13),
> +	GPIO_REGS(32, 3, 0, 5, 14),
> +	GPIO_REGS(33, 3, 1, 6, 0),
> +	GPIO_REGS(34, 3, 2, 6, 1),
> +	GPIO_REGS(35, 3, 3, 6, 2),
> +	EMMC_REGS(36, 6, 3), /* EMMC_CMD */
> +	EMMC_REGS(37, 6, 4), /* EMMC_DS */
> +	EMMC_REGS(38, 6, 5), /* EMMC_CLK */
> +	EMMC_REGS(39, 6, 6), /* EMMC_DAT0 */
> +	EMMC_REGS(40, 6, 7), /* EMMC_DAT1 */
> +	EMMC_REGS(41, 6, 8), /* EMMC_DAT2 */
> +	EMMC_REGS(42, 6, 9), /* EMMC_DAT3 */
> +	EMMC_REGS(43, 6, 10), /* EMMC_DAT4 */
> +	EMMC_REGS(44, 6, 11), /* EMMC_DAT5 */
> +	EMMC_REGS(45, 6, 12), /* EMMC_DAT6 */
> +	EMMC_REGS(46, 6, 13), /* EMMC_DAT7 */
> +};
> +
> +static struct pin_regs bcm2712_d0_aon_gpio_pin_regs[] =3D {
> +	AGPIO_REGS(0, 3, 0, 5, 9),
> +	AGPIO_REGS(1, 3, 1, 5, 10),
> +	AGPIO_REGS(2, 3, 2, 5, 11),
> +	AGPIO_REGS(3, 3, 3, 5, 12),
> +	AGPIO_REGS(4, 3, 4, 5, 13),
> +	AGPIO_REGS(5, 3, 5, 5, 14),
> +	AGPIO_REGS(6, 3, 6, 6, 0),
> +	AGPIO_REGS(8, 3, 7, 6, 1),
> +	AGPIO_REGS(9, 4, 0, 6, 2),
> +	AGPIO_REGS(12, 4, 1, 6, 3),
> +	AGPIO_REGS(13, 4, 2, 6, 4),
> +	AGPIO_REGS(14, 4, 3, 6, 5),
> +	SGPIO_REGS(0, 0, 0),
> +	SGPIO_REGS(1, 0, 1),
> +	SGPIO_REGS(2, 0, 2),
> +	SGPIO_REGS(3, 0, 3),
> +	SGPIO_REGS(4, 1, 0),
> +	SGPIO_REGS(5, 2, 0),
> +};
> +
> +static const struct pinctrl_pin_desc bcm2712_d0_gpio_pins[] =3D {
> +	GPIO_PIN(1),
> +	GPIO_PIN(2),
> +	GPIO_PIN(3),
> +	GPIO_PIN(4),
> +	GPIO_PIN(10),
> +	GPIO_PIN(11),
> +	GPIO_PIN(12),
> +	GPIO_PIN(13),
> +	GPIO_PIN(14),
> +	GPIO_PIN(15),
> +	GPIO_PIN(18),
> +	GPIO_PIN(19),
> +	GPIO_PIN(20),
> +	GPIO_PIN(21),
> +	GPIO_PIN(22),
> +	GPIO_PIN(23),
> +	GPIO_PIN(24),
> +	GPIO_PIN(25),
> +	GPIO_PIN(26),
> +	GPIO_PIN(27),
> +	GPIO_PIN(28),
> +	GPIO_PIN(29),
> +	GPIO_PIN(30),
> +	GPIO_PIN(31),
> +	GPIO_PIN(32),
> +	GPIO_PIN(33),
> +	GPIO_PIN(34),
> +	GPIO_PIN(35),
> +	PINCTRL_PIN(36, "emmc_cmd"),
> +	PINCTRL_PIN(37, "emmc_ds"),
> +	PINCTRL_PIN(38, "emmc_clk"),
> +	PINCTRL_PIN(39, "emmc_dat0"),
> +	PINCTRL_PIN(40, "emmc_dat1"),
> +	PINCTRL_PIN(41, "emmc_dat2"),
> +	PINCTRL_PIN(42, "emmc_dat3"),
> +	PINCTRL_PIN(43, "emmc_dat4"),
> +	PINCTRL_PIN(44, "emmc_dat5"),
> +	PINCTRL_PIN(45, "emmc_dat6"),
> +	PINCTRL_PIN(46, "emmc_dat7"),
> +};
> +
> +static struct pinctrl_pin_desc bcm2712_d0_aon_gpio_pins[] =3D {
> +	AGPIO_PIN(0),  AGPIO_PIN(1),  AGPIO_PIN(2), AGPIO_PIN(3), AGPIO_PIN(4)=
,
> +	AGPIO_PIN(5),  AGPIO_PIN(6),  AGPIO_PIN(8), AGPIO_PIN(9), AGPIO_PIN(12=
),
> +	AGPIO_PIN(13), AGPIO_PIN(14), SGPIO_PIN(0), SGPIO_PIN(1), SGPIO_PIN(2)=
,
> +	SGPIO_PIN(3),  SGPIO_PIN(4),  SGPIO_PIN(5),
> +};
> +
> +static const char * const brcmstb_func_names[] =3D {
> +	FUNC(gpio),
> +	FUNC(alt1),
> +	FUNC(alt2),
> +	FUNC(alt3),
> +	FUNC(alt4),
> +	FUNC(alt5),
> +	FUNC(alt6),
> +	FUNC(alt7),
> +	FUNC(alt8),
> +	FUNC(aon_cpu_standbyb),
> +	FUNC(aon_fp_4sec_resetb),
> +	FUNC(aon_gpclk),
> +	FUNC(aon_pwm),
> +	FUNC(arm_jtag),
> +	FUNC(aud_fs_clk0),
> +	FUNC(avs_pmu_bsc),
> +	FUNC(bsc_m0),
> +	FUNC(bsc_m1),
> +	FUNC(bsc_m2),
> +	FUNC(bsc_m3),
> +	FUNC(clk_observe),
> +	FUNC(ctl_hdmi_5v),
> +	FUNC(enet0),
> +	FUNC(enet0_mii),
> +	FUNC(enet0_rgmii),
> +	FUNC(ext_sc_clk),
> +	FUNC(fl0),
> +	FUNC(fl1),
> +	FUNC(gpclk0),
> +	FUNC(gpclk1),
> +	FUNC(gpclk2),
> +	FUNC(hdmi_tx0_auto_i2c),
> +	FUNC(hdmi_tx0_bsc),
> +	FUNC(hdmi_tx1_auto_i2c),
> +	FUNC(hdmi_tx1_bsc),
> +	FUNC(i2s_in),
> +	FUNC(i2s_out),
> +	FUNC(ir_in),
> +	FUNC(mtsif),
> +	FUNC(mtsif_alt),
> +	FUNC(mtsif_alt1),
> +	FUNC(pdm),
> +	FUNC(pkt),
> +	FUNC(pm_led_out),
> +	FUNC(sc0),
> +	FUNC(sd0),
> +	FUNC(sd2),
> +	FUNC(sd_card_a),
> +	FUNC(sd_card_b),
> +	FUNC(sd_card_c),
> +	FUNC(sd_card_d),
> +	FUNC(sd_card_e),
> +	FUNC(sd_card_f),
> +	FUNC(sd_card_g),
> +	FUNC(spdif_out),
> +	FUNC(spi_m),
> +	FUNC(spi_s),
> +	FUNC(sr_edm_sense),
> +	FUNC(te0),
> +	FUNC(te1),
> +	FUNC(tsio),
> +	FUNC(uart0),
> +	FUNC(uart1),
> +	FUNC(uart2),
> +	FUNC(usb_pwr),
> +	FUNC(usb_vbus),
> +	FUNC(uui),
> +	FUNC(vc_i2c0),
> +	FUNC(vc_i2c3),
> +	FUNC(vc_i2c4),
> +	FUNC(vc_i2c5),
> +	FUNC(vc_i2csl),
> +	FUNC(vc_pcm),
> +	FUNC(vc_pwm0),
> +	FUNC(vc_pwm1),
> +	FUNC(vc_spi0),
> +	FUNC(vc_spi3),
> +	FUNC(vc_spi4),
> +	FUNC(vc_spi5),
> +	FUNC(vc_uart0),
> +	FUNC(vc_uart2),
> +	FUNC(vc_uart3),
> +	FUNC(vc_uart4),
> +};
> +
> +static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] =
=3D {
> +	PIN(0, ir_in, vc_spi0, vc_uart3, vc_i2c3, te0, vc_i2c0, _, _),
> +	PIN(1, vc_pwm0, vc_spi0, vc_uart3, vc_i2c3, te1, aon_pwm, vc_i2c0, vc_=
pwm1),
> +	PIN(2, vc_pwm0, vc_spi0, vc_uart3, ctl_hdmi_5v, fl0, aon_pwm, ir_in, v=
c_pwm1),
> +	PIN(3, ir_in, vc_spi0, vc_uart3, aon_fp_4sec_resetb, fl1, sd_card_g, a=
on_gpclk, _),
> +	PIN(4, gpclk0, vc_spi0, vc_i2csl, aon_gpclk, pm_led_out, aon_pwm, sd_c=
ard_g, vc_pwm0),
> +	PIN(5, gpclk1, ir_in, vc_i2csl, clk_observe, aon_pwm, sd_card_g, vc_pw=
m0, _),
> +	PIN(6, uart1, vc_uart4, gpclk2, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _),
> +	PIN(7, uart1, vc_uart4, gpclk0, aon_pwm, vc_uart0, vc_spi3, _, _),
> +	PIN(8, uart1, vc_uart4, vc_i2csl, ctl_hdmi_5v, vc_uart0, vc_spi3, _, _=
),
> +	PIN(9, uart1, vc_uart4, vc_i2csl, aon_pwm, vc_uart0, vc_spi3, _, _),
> +	PIN(10, tsio, ctl_hdmi_5v, sc0, spdif_out, vc_spi5, usb_pwr, aon_gpclk=
, sd_card_f),
> +	PIN(11, tsio, uart0, sc0, aud_fs_clk0, vc_spi5, usb_vbus, vc_uart2, sd=
_card_f),
> +	PIN(12, tsio, uart0, vc_uart0, tsio, vc_spi5, usb_pwr, vc_uart2, sd_ca=
rd_f),
> +	PIN(13, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_=
i2c3),
> +	PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_=
i2c3),
> +	PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, =
aon_pwm, aon_gpclk,
> +	    _),
> +	PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, us=
b_pwr, aud_fs_clk0,
> +	    _),
I think it's okay to violate the 80 char limit in these both cases to=20
improve readability.
> +};
> +
...
> +
> +static int brcmstb_pinconf_get(struct pinctrl_dev *pctldev, unsigned in=
t pin,
> +			       unsigned long *config)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	u32 arg;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		arg =3D (brcmstb_pull_config_get(pc, pin) =3D=3D BRCMSTB_PULL_NONE);
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		arg =3D (brcmstb_pull_config_get(pc, pin) =3D=3D BRCMSTB_PULL_DOWN);
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		arg =3D (brcmstb_pull_config_get(pc, pin) =3D=3D BRCMSTB_PULL_UP);
I'm not sure this is correct. I would expect that "arg" contains the=20
resistance in Ohm for PULL_DOWN & PULL_UP.

Best regards

