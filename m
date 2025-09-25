Return-Path: <linux-gpio+bounces-26568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B0B9D684
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 06:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B0F4A0199
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 04:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18FA2E6CD8;
	Thu, 25 Sep 2025 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="CV6c2crv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A472BA4A;
	Thu, 25 Sep 2025 04:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758775727; cv=none; b=lLBH6C/HbSkJmtgJ1L/zlndV6njqwtOZK79PMN3q6A44xCA5zNCgqocKURgKxCmUA2PtWYXEQ7LX80E/uvRiyGFXZbuQZq0kfesoZfvQPUhBI4lhXI/AmwctUsqsxH391O1lVMoIUf52+OBVIZ4kHve8RUGfLZyxyKYV3kKlYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758775727; c=relaxed/simple;
	bh=cBX2L8Tt36X9JlVQ7rj/qaCk64VpITjTxZ/Nyg2gDKM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qulO3n9Mg/CVYxoDTIFcqyXwpxca5glPD2So+HN+kKnoy54qyfpvX8RfjMna6zr+9KMblfdC3VdtHxIL/g9B0AQssJ4x9m3HAvuvr/N9rndzq6IhWv42D2eLZJCe+2Xs3ShRMOVMrypJgUwyPfg1jWiLe+BOBYHxw4VCYnBGwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=CV6c2crv; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758775715;
	bh=pL4il6Mcz3AjJ60/DLAuos3cvtVE8VY2cOJbTK/DwQU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=CV6c2crvVUcHe2qjR9Qzl+GBuzhFgZhDC/szv3jlJ/Pa00f7kT7OIlNqsBnJjaaVz
	 BbD2qw3qLncAoOw6Ax3rHRYC9M7IOMMwHLWIl6Gpvu4OfRLfWMmWYqBNsbgBhjYTID
	 KQH9PrHekbp/0YF6kK3Jjz29RixtMsxdZK9YO/5Hx07CvzbT+Es2VoqAQ8W1S6LApg
	 oOsBk4Q5nupg0ITnrhbqsBw8NUs8WblmNsobylyNkk5GBXASYnwEZWUupxQLC4lftV
	 RPMYdEbdOKonJsWx024g6oOGk6LQRJ4cJ5/N8nU2INgPOfdLFCGCqDSpsSliqNElva
	 fe5bHpil9CRjA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1C98264743;
	Thu, 25 Sep 2025 12:48:33 +0800 (AWST)
Message-ID: <005c9928cde01c8a3bf4840692eddf13f2c08282.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 linus.walleij@linaro.org, 	brgl@bgdev.pl, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Date: Thu, 25 Sep 2025 14:18:31 +0930
In-Reply-To: <20250904103401.88287-4-billy_tsai@aspeedtech.com>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
	 <20250904103401.88287-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Billy,

On Thu, 2025-09-04 at 18:34 +0800, Billy Tsai wrote:
> This patch adds pinmux support for the AST2700, which includes two SoC
> configurations:
> - SoC0 closely resembles previous generations of ASPEED BMC SoCs, allowin=
g
> =C2=A0 the reuse of existing macros and callback functions.
> - SoC1, however, introduces a new logic for configuring pin functions.
> =C2=A0 Therefore, new g7_set_mux and gpio_request_enable functions are
> =C2=A0 implemented to properly configure the pinctrl registers using the
> =C2=A0 pin_cfg table and to resolve GPIO request errors.

Do you mind splitting support for soc0 and soc1 into separate patches?
Having taken a brief look I think we're also due for some further
separation of the code. Particularly, isolating the patch for soc0
would be nice, as the register design for soc1 is just _so_ much nicer,
and I'd like to avoid dragging the baggage of previous generations
along with it.

>=20
> The driver supports:
> - All 12 GPIO-capable pins in SoC0
> - All 212 GPIO-capable pins in SoC1
>=20
> Additionally, this patch introduces several pseudo-ball definitions for
> specific configuration purposes:
> - USB function selection
> - JTAG target selection
> - PCIe RC PERST configuration
> - SGMII PHY selection
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
8 +
> =C2=A0drivers/pinctrl/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c=C2=A0=C2=A0 |=C2=A0 503=
 ++++
> =C2=A0.../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c=C2=A0=C2=A0 | 2523 ++++=
+++++++++++++
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 47 +
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 11 +-
> =C2=A0drivers/pinctrl/aspeed/pinmux-aspeed.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 35 +-

The impression I get from the changes to the latter three files here is
that the soc0 support might even be different enough to warrant
separation from the previous generations as well. You're defining
similar-but-different structs and macros to what we already have. If
the those are genuinely necessary (not yet resolved), I'd rather they
be their own driver.

> =C2=A07 files changed, 3123 insertions(+), 5 deletions(-)
> =C2=A0create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> =C2=A0create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
>=20
> diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kcon=
fig
> index 1a4e5b9ed471..16743091a139 100644
> --- a/drivers/pinctrl/aspeed/Kconfig
> +++ b/drivers/pinctrl/aspeed/Kconfig
> @@ -31,3 +31,11 @@ config PINCTRL_ASPEED_G6
> =C2=A0	help
> =C2=A0	=C2=A0 Say Y here to enable pin controller support for Aspeed's 6t=
h
> =C2=A0	=C2=A0 generation SoCs. GPIO is provided by a separate GPIO driver=
.
> +
> +config PINCTRL_ASPEED_G7
> +	bool "Aspeed G7 SoC pin control"
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && OF
> +	select PINCTRL_ASPEED
> +	help
> +	=C2=A0 Say Y here to enable pin controller support for Aspeed's 7th
> +	=C2=A0 generation SoCs. GPIO is provided by a separate GPIO driver.
> diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Mak=
efile
> index db2a7600ae2b..1713f678a984 100644
> --- a/drivers/pinctrl/aspeed/Makefile
> +++ b/drivers/pinctrl/aspeed/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_PINCTRL_ASPEED)	+=3D pinctrl-aspeed.o pinmux=
-aspeed.o
> =C2=A0obj-$(CONFIG_PINCTRL_ASPEED_G4)	+=3D pinctrl-aspeed-g4.o
> =C2=A0obj-$(CONFIG_PINCTRL_ASPEED_G5)	+=3D pinctrl-aspeed-g5.o
> =C2=A0obj-$(CONFIG_PINCTRL_ASPEED_G6)	+=3D pinctrl-aspeed-g6.o
> +obj-$(CONFIG_PINCTRL_ASPEED_G7) +=3D pinctrl-aspeed-g7-soc0.o pinctrl-as=
peed-g7-soc1.o
> \ No newline at end of file
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c b/drivers/pi=
nctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> new file mode 100644
> index 000000000000..86da889cc010
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include "pinctrl-aspeed.h"
> +#include "../pinctrl-utils.h"
> +
> +#define SCU200 0x200 /* System Reset Control #1=C2=A0 */
> +
> +#define SCU400 0x400 /* Multi-function Pin Control #1=C2=A0 */
> +#define SCU404 0x404 /* Multi-function Pin Control #2=C2=A0 */
> +#define SCU408 0x408 /* Multi-function Pin Control #3=C2=A0 */
> +#define SCU40C 0x40C /* Multi-function Pin Control #3=C2=A0 */
> +#define SCU410 0x410 /* USB Multi-function Control Register=C2=A0 */
> +#define SCU414 0x414 /* VGA Function Control Register=C2=A0 */
> +
> +#define SCU480 0x480 /* GPIO18A0 IO Control Register */
> +#define SCU484 0x484 /* GPIO18A1 IO Control Register */
> +#define SCU488 0x488 /* GPIO18A2 IO Control Register */
> +#define SCU48C 0x48c /* GPIO18A3 IO Control Register */
> +#define SCU490 0x490 /* GPIO18A4 IO Control Register */
> +#define SCU494 0x494 /* GPIO18A5 IO Control Register */
> +#define SCU498 0x498 /* GPIO18A6 IO Control Register */
> +#define SCU49C 0x49c /* GPIO18A7 IO Control Register */
> +#define SCU4A0 0x4A0 /* GPIO18B0 IO Control Register */
> +#define SCU4A4 0x4A4 /* GPIO18B1 IO Control Register */
> +#define SCU4A8 0x4A8 /* GPIO18B2 IO Control Register */
> +#define SCU4AC 0x4AC /* GPIO18B3 IO Control Register */
> +
> +enum {
> +	AC14,
> +	AE15,

Are the ball enums necessary? Historically we haven't needed it as the
undefined macro symbols were just used for token-pasting or
stringification purposes.

> +	AD14,
> +	AE14,
> +	AF14,
> +	AB13,
> +	AB14,
> +	AF15,
> +	AF13,
> +	AC13,
> +	AD13,
> +	AE13,
> +	PORTA_U3, // SCU410[1:0]
> +	PORTA_U2, // SCU410[3:2]
> +	PORTB_U3, // SCU410[5:4]
> +	PORTB_U2, // SCU410[7:6]
> +	PORTA_U3_XHCI, // SCU410[9]
> +	PORTA_U2_XHCI, // SCU410[9]
> +	PORTB_U3_XHCI, // SCU410[10]
> +	PORTB_U2_XHCI, // SCU410[10]
> +	PORTA_MODE, // SCU410[25:24]
> +	PORTB_MODE, // SCU410[29:28]
> +	PORTA_U2_PHY,
> +	PORTA_U3_PHY,
> +	PORTB_U2_PHY,
> +	PORTB_U3_PHY,
> +	JTAG_PORT,
> +	PCIERC0_PERST,
> +	PCIERC1_PERST,
> +};
> +
> +GROUP_DECL(EMMCG1, AC14, AE15, AD14);
> +GROUP_DECL(EMMCG4, AC14, AE15, AD14, AE14, AF14, AB13);
> +GROUP_DECL(EMMCG8, AC14, AE15, AD14, AE14, AF14, AB13, AF13, AC13, AD13,=
 AE13);
> +GROUP_DECL(EMMCWPN, AF15);
> +GROUP_DECL(EMMCCDN, AB14);
> +GROUP_DECL(VGADDC, AD13, AE13);
> +GROUP_DECL(VB1, AC14, AE15, AD14, AE14);
> +GROUP_DECL(VB0, AF15, AB14, AF13, AC13);

For the previous generation drivers my philosophy was "keep things that
go together together," so signal descriptors, groups and functions were
all located around the definition for one or a set of balls.

Given I'm potentially escaping maintenance of ASPEED pinctrl drivers
for the 2700 onwards I won't complain too much, but was this a specific
choice to break from that approach? You're defining all the groups,
then all the functions, then all the configurations.=20

*snip*


> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pi=
nctrl/aspeed/pinctrl-aspeed-g7-soc1.c
> new file mode 100644
> index 000000000000..7c5a5e208f63
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
>=20

*snip*

> +
> +FUNCFG_DESCL(C16, PIN_CFG(ESPI1, SCU400, GENMASK(2, 0), 1),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(LPC1, SCU400, GENMASK(2, 0), 2),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(SD, SCU400, GENMASK(2, 0), 3),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(DI2C0, SCU400, GENMASK(2, 0), 4),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(VPI, SCU400, GENMASK(2, 0), 5));
> +FUNCFG_DESCL(C14, PIN_CFG(ESPI1, SCU400, GENMASK(6, 4), (1 << 4)),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(LPC1, SCU400, GENMASK(6, 4), (2 << 4))=
,
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(SD, SCU400, GENMASK(6, 4), (3 << 4)),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(DI2C1, SCU400, GENMASK(6, 4), (4 << 4)=
),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(VPI, SCU400, GENMASK(6, 4), (5 << 4)))=
;
> +FUNCFG_DESCL(C11, PIN_CFG(ESPI1, SCU400, GENMASK(10, 8), (1 << 8)),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(LPC1, SCU400, GENMASK(10, 8), (2 << 8)=
),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(SD, SCU400, GENMASK(10, 8), (3 << 8)),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(DI2C3, SCU400, GENMASK(10, 8), (4 << 8=
)),
> +	=C2=A0=C2=A0=C2=A0=C2=A0 PIN_CFG(VPI, SCU400, GENMASK(10, 8), (5 << 8))=
);

If we're going to continue the macro soup we need to take the
opportunity to clean this up. You shouldn't need to open-code the
shifts like this, the data model needs more thought.

*snip*

> +
> +static const struct aspeed_g7_pincfg pin_cfg[] =3D {
> +	PINCFG_PIN(C16),=C2=A0=C2=A0=C2=A0 PINCFG_PIN(C14),=C2=A0=C2=A0 PINCFG_=
PIN(C11),
> +	PINCFG_PIN(D9),	=C2=A0=C2=A0=C2=A0 PINCFG_PIN(F14),=C2=A0=C2=A0 PINCFG_=
PIN(D10),

My preference is that this array definition be one entry per line,
sorted, that way we don't get weird alignment or reflow affecting the
remainder of the struct if we change things in the middle.

Cheers,

Andrew

