Return-Path: <linux-gpio+bounces-8547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924A946347
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 20:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88B31C21390
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 18:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1825E47A64;
	Fri,  2 Aug 2024 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="h0EnDEuA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAAE1ABEC6;
	Fri,  2 Aug 2024 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722623840; cv=none; b=pChVRHmYEwajj6H3AIGGk+a7L4Bu4Bdsg4h7bKoC6ioGUxnIlLtGjBF65SyetSc3wRVZKCclRLEZPaLpsM6T0u2ArAbp+16usMAlPNYtlMfNGFt1J6Fw+VVT4zW1+sLurg6K46XzozIN708wvjgTxU+kl6raKoDRklWV0JJKfao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722623840; c=relaxed/simple;
	bh=cNtgW2ZvrDu42WLIiQ5xZw7B3I9PBq6HSj86z6O3HAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBLTxeUZzj+EmYf461rVuTdnfXa8VYKEjT+NvLx8bcyoGYesXJalyAjY6xUpGdaAcz2lQhYDz5Vlpz3vodYDIUbBInGnnJBdfqVQjlysnxmfrQVJz63s8+c4Znd9IbkcgGYLaJ4vzZxOi2sCCdoeSsgmTaVfs7ugHqqSuVqKyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=h0EnDEuA; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722623821; x=1723228621; i=wahrenst@gmx.net;
	bh=HMMRcovC7/aiWPH0C+sk94yWOrjD5pPBsU1Uu1hukzA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h0EnDEuAHSWV8AP3pErP1JO1AiZz09m84YAx62bI3I7UUPJprqqxBvRf6kg8sR/8
	 GXNOsUJ5ZCW9zrC55cxfFd0P40D/lxKjGJvfLJZreLzj0jCeNCeqO4a9n09WtgHKm
	 VflPkY5racx4/QF5B/Lb10Yst76/7BRRsx3k/rEpVLUBcgVRIVUPwJjDIi0JGGFJP
	 ueG2qP7crBHtNN8tBFP72s/NaDpztvZgkzI9VFoZMU5mfURQOzYHAbRGj7TV3rLHo
	 TYg/5H7CtOfSSjUAIPVlVUaLa2eamlT/v4EAwNDr2CW+MdJP1FRcK1QChHq1v4DeS
	 L2K5qPQpLdIhjkP4hA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1rsuAa0n89-00bq4Y; Fri, 02
 Aug 2024 20:37:01 +0200
Message-ID: <ea44f991-48ea-482f-a27c-db68544458f0@gmx.net>
Date: Fri, 2 Aug 2024 20:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] pinctrl: bcm: Add STB family pin controller driver
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell
 <phil@raspberrypi.com>, kernel-list@raspberrypi.com
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-3-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-3-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FCZU2P8B0KCyydHW2NBSjknmho92zZLktLrbJ3PQQUtzJy07kNP
 jybz5Zq64Jn5a3dds7oRfZX0qGah7ezthXTIBBzraoG2NQYDxKoLb1169a/IxV3LE8MKHRv
 DTM0KVn9AZBvUj1nWn2zAtEX/XQOl7+CNmoXJ2dNhI/Ii8JG3lkPYNrp0es6anwbCedzvnG
 o6tQ3TxsHMiUEfmBqHEoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iZHj5E16Oao=;dvZzNFypyp9WrGvXmkaS7B1iimD
 /OqhV5zSstMofWei/1I8KiegtEwfYCeVxxAVShlRXmpI/ow51Lmu5VM6iS7Os0nXmfvAkaxMC
 vOjeV7Y3YhkY2rZvtuma0nph92Qyq21zIBdM+fYRp709MTM/v0bypyfWdT0dIWuN7fklBB79K
 p0Oj1+mPKPT7kWDBLuHEcaBgmD6pGkasklLXiysZO8iTcv8nFjj8H9nJ8jsJyAuM+yu+kLY5B
 riv01/F3HSaI9nGb3+ZJR/BDaJ/4oO+tH8dip92CPPBrhzfOVOssBbLllAIoY8inGN1Y6a7S4
 Q2EP7+vvntAvBmZqk0FsmwQVVGe54Bc4kFAG/h7LH++84tfFcZ/5Moi8ppJB2xVmKE3vLxh4F
 9GHeUlo7MxtW+GUvxyV4DADKyPOdEES90FvXrvAD7+ZweVXhemrRylYCOiurlaGygUSu5Asmx
 Jm+Ndk5I2FtUf0/qG4wGzOVUcC/n9v7IRw8/G3YUhPtRWrMpNJLkINm8+hH91yEd6Zf3crBvc
 zIBbgq6lcNuahaP9HuJ2tzmzGuIa6vQ8gQz2Dq1BSxYWMskQtvdkGiBT/CVE2XtFCr3j8odQI
 Llxeo603wsRCHmtnDvnE1ZOIs7nG7/qSVPnhseLWoO45HO2kkzcSk/Tf/MDyYJSf6KCfFkp+Y
 p3r9UUc/3GLx8nX0kjNej6ggGx/eFcbpt1zXBsx6ZzAS6Rl0/ynwpwQTWPBKLuzBzf0RoId4g
 ys9Dsovw73tniM2iJ0uHGqX6nIbV1g+rR/kGDbAhJ7FosuK4Q5ZinhJdr3rIcGuL1YlEEZPVb
 934SLtEo8FETlI26kibzwuWQ==

Hi,

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chips is
> incarnation of chip used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@br=
oadcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>   drivers/pinctrl/bcm/Kconfig           |   13 +
>   drivers/pinctrl/bcm/Makefile          |    1 +
>   drivers/pinctrl/bcm/pinctrl-brcmstb.c | 1217 +++++++++++++++++++++++++
>   3 files changed, 1231 insertions(+)
>   create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c
>
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 35b51ce4298e..2e1b8d444f58 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -3,6 +3,19 @@
>   # Broadcom pinctrl drivers
>   #
>
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
> index 000000000000..143c8c2e1d6d
> --- /dev/null
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -0,0 +1,1217 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Broadcom brcmstb GPIO units (pinctrl only)
> + *
Maybe you want to add your copyright here
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
> +#define REG_BIT_INVALID		0xffff
> +
> +#define BIT_TO_REG(b)		(((b) >> 5) << 2)
> +#define BIT_TO_SHIFT(b)	((b) & 0x1f)
> +
> +#define MUX_BIT(mr, mb)		(MUX_BIT_VALID + ((mr) * 4) * 8 + (mb) * 4)
> +#define GPIO_REGS(n, mr, mb, pr, pb) \
> +	[n] =3D { MUX_BIT(mr, mb), ((pr) * 4) * 8 + (pb) * 2 }
Please avoid these cryptic names: mr, mb, pr, pb
> +
> +#define EMMC_REGS(n, pr, pb) \
> +	[n] =3D { 0, ((pr) * 4) * 8 + (pb) * 2 }
> +
> +#define AGPIO_REGS(n, mr, mb, pr, pb) \
> +	[n] =3D { MUX_BIT(mr, mb), ((pr) * 4) * 8 + (pb) * 2 }
> +
> +#define SGPIO_REGS(n, mr, mb) \
> +	[(n) + 32] =3D { MUX_BIT(mr, mb), REG_BIT_INVALID }
> +
> +#define GPIO_PIN(a)		PINCTRL_PIN(a, "gpio" #a)
> +#define AGPIO_PIN(a)		PINCTRL_PIN(a, "aon_gpio" #a)
> +#define SGPIO_PIN(a)		PINCTRL_PIN((a) + 32, "aon_sgpio" #a)
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
> +	spinlock_t lock;
fsel_lock ?
> +};
> +
> ...
> +
> +static const struct brcmstb_pin_funcs bcm2712_d0_aon_gpio_pin_funcs[] =
=3D {
> +	PIN(0, ir_in, vc_spi0, vc_uart0, vc_i2c3, uart0, vc_i2c0, _, _),
> +	PIN(1, vc_pwm0, vc_spi0, vc_uart0, vc_i2c3, uart0, aon_pwm, vc_i2c0, v=
c_pwm1),
> +	PIN(2, vc_pwm0, vc_spi0, vc_uart0, ctl_hdmi_5v, uart0, aon_pwm, ir_in,=
 vc_pwm1),
> +	PIN(3, ir_in, vc_spi0, vc_uart0, uart0, sd_card_g, aon_gpclk, _, _),
> +	PIN(4, gpclk0, vc_spi0, pm_led_out, aon_pwm, sd_card_g, vc_pwm0, _, _)=
,
> +	PIN(5, gpclk1, ir_in, aon_pwm, sd_card_g, vc_pwm0, _, _, _),
> +	PIN(6, uart1, vc_uart2, ctl_hdmi_5v, gpclk2, vc_spi3, _, _, _),
> +	PIN(7, _, _, _, _, _, _, _, _),
In case this pin is reserved or something a comment would be nice
> +	PIN(8, uart1, vc_uart2, ctl_hdmi_5v, vc_spi0, vc_spi3, _, _, _),
> +	PIN(9, uart1, vc_uart2, vc_uart0, aon_pwm, vc_spi0, vc_uart2, vc_spi3,=
 _),
> +	PIN(10, _, _, _, _, _, _, _, _),
> +	PIN(11, _, _, _, _, _, _, _, _),
same as above
> +	PIN(12, uart1, vc_uart2, vc_uart0, vc_spi0, usb_pwr, vc_uart2, vc_spi3=
, _),
> +	PIN(13, bsc_m1, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3, _=
),
> +	PIN(14, bsc_m1, aon_gpclk, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2,=
 vc_i2c3),
> +};
> +
> ...
> +
> +static inline u32 brcmstb_reg_rd(struct brcmstb_pinctrl *pc, unsigned i=
nt reg)
> +{
> +	return readl(pc->base + reg);
> +}
> +
> +static inline void brcmstb_reg_wr(struct brcmstb_pinctrl *pc, unsigned =
int reg,
> +				  u32 val)
> +{
> +	writel(val, pc->base + reg);
> +}
> +
> +static enum brcmstb_funcs brcmstb_pinctrl_fsel_get(struct brcmstb_pinct=
rl *pc,
> +						   unsigned int pin)
> +{
> +	u32 bit =3D pc->pin_regs[pin].mux_bit;
> +	enum brcmstb_funcs func;
> +	int fsel;
> +	u32 val;
> +
> +	if (!bit)
> +		return func_gpio;
> +
> +	bit &=3D ~MUX_BIT_VALID;
> +
> +	val =3D brcmstb_reg_rd(pc, BIT_TO_REG(bit));
> +	fsel =3D (val >> BIT_TO_SHIFT(bit)) & BRCMSTB_FSEL_MASK;
> +	func =3D pc->pin_funcs[pin].funcs[fsel];
> +
> +	if (func >=3D func_count)
> +		func =3D (enum brcmstb_funcs)fsel;
> +
> +	dev_dbg(pc->dev, "get %04x: %08x (%u =3D> %s)\n",
> +		BIT_TO_REG(bit), val, pin,
> +		brcmstb_func_names[func]);
> +
> +	return func;
> +}
> +
> +static void brcmstb_pinctrl_fsel_set(struct brcmstb_pinctrl *pc,
> +				     unsigned int pin, enum brcmstb_funcs func)
I would prefer this function returns errors as int instead of silently
ignore them
> +{
> +	u32 bit =3D pc->pin_regs[pin].mux_bit, val;
> +	const u8 *pin_funcs;
> +	unsigned long flags;
> +	int fsel;
> +	int cur;
> +	int i;
> +
> +	if (!bit || func >=3D func_count)
> +		return;
> +
> +	bit &=3D ~MUX_BIT_VALID;
> +
> +	fsel =3D BRCMSTB_FSEL_COUNT;
> +
> +	if (func >=3D BRCMSTB_FSEL_COUNT) {
> +		/* Convert to an fsel number */
> +		pin_funcs =3D pc->pin_funcs[pin].funcs;
> +		for (i =3D 1; i < BRCMSTB_FSEL_COUNT; i++) {
> +			if (pin_funcs[i - 1] =3D=3D func) {
> +				fsel =3D i;
> +				break;
> +			}
> +		}
> +	} else {
> +		fsel =3D (enum brcmstb_funcs)func;
> +	}
> +
> +	if (fsel >=3D BRCMSTB_FSEL_COUNT)
> +		return;
> +
> +	spin_lock_irqsave(&pc->lock, flags);
> +
> +	val =3D brcmstb_reg_rd(pc, BIT_TO_REG(bit));
> +	cur =3D (val >> BIT_TO_SHIFT(bit)) & BRCMSTB_FSEL_MASK;
> +
> +	dev_dbg(pc->dev, "read %04x: %08x (%u =3D> %s)\n",
> +		BIT_TO_REG(bit), val, pin,
> +		brcmstb_func_names[cur]);
> +
> +	if (cur !=3D fsel) {
> +		val &=3D ~(BRCMSTB_FSEL_MASK << BIT_TO_SHIFT(bit));
> +		val |=3D fsel << BIT_TO_SHIFT(bit);
> +
> +		dev_dbg(pc->dev, "write %04x: %08x (%u <=3D %s)\n",
> +			BIT_TO_REG(bit), val, pin,
> +			brcmstb_func_names[fsel]);
> +		brcmstb_reg_wr(pc, BIT_TO_REG(bit), val);
> +	}
> +
> +	spin_unlock_irqrestore(&pc->lock, flags);
> +}
> +
> +static int brcmstb_pctl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pc->pctl_desc.npins;
> +}
> +
> +static const char *brcmstb_pctl_get_group_name(struct pinctrl_dev *pctl=
dev,
> +					       unsigned int selector)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pc->gpio_groups[selector];
> +}
> +
> +static int brcmstb_pctl_get_group_pins(struct pinctrl_dev *pctldev,
> +				       unsigned int selector,
> +				       const unsigned int **pins,
> +				       unsigned int *num_pins)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	*pins =3D &pc->pctl_desc.pins[selector].number;
> +	*num_pins =3D 1;
> +
> +	return 0;
> +}
> +
> +static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
> +				      struct seq_file *s, unsigned int offset)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +	enum brcmstb_funcs fsel =3D brcmstb_pinctrl_fsel_get(pc, offset);
> +	const char *fname =3D brcmstb_func_names[fsel];
> +
> +	seq_printf(s, "function %s", fname);
> +}
> +
> +static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> +				     struct pinctrl_map *maps,
> +				     unsigned int num_maps)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_maps; i++)
> +		if (maps[i].type =3D=3D PIN_MAP_TYPE_CONFIGS_PIN)
> +			kfree(maps[i].data.configs.configs);
> +
> +	kfree(maps);
> +}
> +
> +static const struct pinctrl_ops brcmstb_pctl_ops =3D {
> +	.get_groups_count =3D brcmstb_pctl_get_groups_count,
> +	.get_group_name =3D brcmstb_pctl_get_group_name,
> +	.get_group_pins =3D brcmstb_pctl_get_group_pins,
> +	.pin_dbg_show =3D brcmstb_pctl_pin_dbg_show,
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
> +	.dt_free_map =3D brcmstb_pctl_dt_free_map,
> +};
> +
> +static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int o=
ffset)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	/* disable by setting to GPIO */
> +	brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
> +	return 0;
> +}
> +
> +static int brcmstb_pmx_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	return func_count;
> +}
> +
> +static const char *brcmstb_pmx_get_function_name(struct pinctrl_dev *pc=
tldev,
> +						 unsigned int selector)
> +{
> +	return (selector < func_count) ? brcmstb_func_names[selector] : NULL;
> +}
> +
> +static int brcmstb_pmx_get_function_groups(struct pinctrl_dev *pctldev,
> +					   unsigned int selector,
> +					   const char *const **groups,
> +					   unsigned *const num_groups)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	*groups =3D pc->gpio_groups;
> +	*num_groups =3D pc->pctl_desc.npins;
> +
> +	return 0;
> +}
> +
> +static int brcmstb_pmx_set(struct pinctrl_dev *pctldev,
> +			   unsigned int func_selector,
> +			   unsigned int group_selector)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +	const struct pinctrl_desc *pctldesc =3D &pc->pctl_desc;
> +	const struct pinctrl_pin_desc *pindesc;
> +
> +	if (group_selector >=3D pctldesc->npins)
> +		return -EINVAL;
> +
> +	pindesc =3D &pctldesc->pins[group_selector];
> +	brcmstb_pinctrl_fsel_set(pc, pindesc->number, func_selector);
return brcmstb_pinctrl_fsel_set
> +
> +	return 0;
> +}
> +
> +static int brcmstb_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +					   struct pinctrl_gpio_range *range,
> +					   unsigned int pin)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	brcmstb_pinctrl_fsel_set(pc, pin, func_gpio);
> +
> +	return 0;
return brcmstb_pinctrl_fsel_set
> +}
> +
> +static void brcmstb_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
> +					  struct pinctrl_gpio_range *range,
> +					  unsigned int offset)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +	/* disable by setting to GPIO */
> +	brcmstb_pinctrl_fsel_set(pc, offset, func_gpio);
> +}
> +
> +static const struct pinmux_ops brcmstb_pmx_ops =3D {
> +	.free =3D brcmstb_pmx_free,
> +	.get_functions_count =3D brcmstb_pmx_get_functions_count,
> +	.get_function_name =3D brcmstb_pmx_get_function_name,
> +	.get_function_groups =3D brcmstb_pmx_get_function_groups,
> +	.set_mux =3D brcmstb_pmx_set,
> +	.gpio_request_enable =3D brcmstb_pmx_gpio_request_enable,
> +	.gpio_disable_free =3D brcmstb_pmx_gpio_disable_free,
> +};
> +
> +static unsigned int brcmstb_pull_config_get(struct brcmstb_pinctrl *pc,
> +					    unsigned int pin)
> +{
> +	u32 bit =3D pc->pin_regs[pin].pad_bit, val;
> +
> +	if (bit =3D=3D REG_BIT_INVALID)
> +		return BRCMSTB_PULL_NONE;
> +
> +	val =3D brcmstb_reg_rd(pc, BIT_TO_REG(bit));
> +	return (val >> BIT_TO_SHIFT(bit)) & BRCMSTB_PULL_MASK;
> +}
> +
> +static void brcmstb_pull_config_set(struct brcmstb_pinctrl *pc,
> +				    unsigned int pin, unsigned int arg)
The same here, returning an error would be better
> +{
> +	u32 bit =3D pc->pin_regs[pin].pad_bit, val;
> +	unsigned long flags;
> +
> +	if (bit =3D=3D REG_BIT_INVALID) {
> +		dev_warn(pc->dev, "Can't set pulls for %s\n",
> +			 pc->gpio_groups[pin]);
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&pc->lock, flags);
> +
> +	val =3D brcmstb_reg_rd(pc, BIT_TO_REG(bit));
> +	val &=3D ~(BRCMSTB_PULL_MASK << BIT_TO_SHIFT(bit));
> +	val |=3D (arg << BIT_TO_SHIFT(bit));
> +	brcmstb_reg_wr(pc, BIT_TO_REG(bit), val);
> +
> +	spin_unlock_irqrestore(&pc->lock, flags);
> +}
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
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	*config =3D pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}
> +
> +static int brcmstb_pinconf_set(struct pinctrl_dev *pctldev,
> +			       unsigned int pin, unsigned long *configs,
> +			       unsigned int num_configs)
> +{
> +	struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +	u32 param, arg;
> +	int i;
> +
> +	for (i =3D 0; i < num_configs; i++) {
> +		param =3D pinconf_to_config_param(configs[i]);
> +		arg =3D pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			brcmstb_pull_config_set(pc, pin, BRCMSTB_PULL_NONE);
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			brcmstb_pull_config_set(pc, pin, BRCMSTB_PULL_DOWN);
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			brcmstb_pull_config_set(pc, pin, BRCMSTB_PULL_UP);
In case brcmstb_pull_config_set would return an error, we shouldn't
ignore it here

Thanks
> +			break;
> +		default:
> +			return -ENOTSUPP;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +


