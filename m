Return-Path: <linux-gpio+bounces-17845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCBBA6B952
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0187E7A50D0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 10:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70F72222AC;
	Fri, 21 Mar 2025 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B33A6E+G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A7E1F17EB;
	Fri, 21 Mar 2025 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742554504; cv=none; b=KbiJP7x55uynLNdaJ11pTWGss0xegTJ7mSJlIaR97Yz3po2wtd43O1ABFYLND1FC+E+pPQ2eB2iDHy3+ZcM4cyRJ47OwIm8W0HcAO7vyVbK37YHWGuE24EbrTiSBi2M3kYLoIkP4JF+UCXkGfMApxOSVWEFqdxX4m7kP48d4RLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742554504; c=relaxed/simple;
	bh=ndMjC3dKksaL8qeJsyDaDdvKAJCC5hQ61McJPvDnheg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhW1GSGQcjFyOLQlBFs5j0fNhQttY/VkIyTlJqW4HtEX8ZHfw4QFUNB5USt919KIfUyNWVMDb2we/Nf2/bWfyujCHH+84JotvnNfIwTnM0fyobHMetZYDR1BboymDdACHKYLDVpfhf3norS/m3/V/FIRnbvXW4WtcTdti+a86wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B33A6E+G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF99C4CEE3;
	Fri, 21 Mar 2025 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742554503;
	bh=ndMjC3dKksaL8qeJsyDaDdvKAJCC5hQ61McJPvDnheg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B33A6E+GzA41g4B7RtSkQtJ+KPPnIut+SwQSY8rvq4cFhbZUVWrdlP5TLnuzK9FsG
	 11kSO9PB8r1n7gNV2sjRK/WzL0bQrzGGVn4Jwgz4jmFTFuc50YRei0/2HaQs+OusvL
	 0Hkj/gUsvbDjZKuLJPurYzh5J8aKJrAUyYYzAv9yJ8kNNqjNF96PbeXwpIQ4tSrSjl
	 Pa035/2JZ1mzL9CJny7U6oQ0vZ3Cv5Asx189OWOodSx3f7pNOtfNTHDDW3+7684X4Z
	 U7Z1hfpQnLkqmtgOs9jJQQzRJrVMylfZM2+ngRTganSFymERZ6SRi7GrSCpbEWRPxB
	 ltAw49IX3Jt9Q==
Date: Fri, 21 Mar 2025 10:54:57 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
Message-ID: <20250321105457.GG1750245@google.com>
References: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
 <20250312-max77759-mfd-v4-4-b908d606c8cb@linaro.org>
 <20250314123150.GM3890718@google.com>
 <7d94ed5bd79f0081d392747f74773e7f866252bd.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d94ed5bd79f0081d392747f74773e7f866252bd.camel@linaro.org>

On Fri, 14 Mar 2025, André Draszik wrote:

> Hi Lee,
> 
> Thanks for your review!
> 
> On Fri, 2025-03-14 at 12:31 +0000, Lee Jones wrote:
> > On Wed, 12 Mar 2025, André Draszik wrote:
> > 
> > > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > > Port Controller (TCPC), NVMEM, and a GPIO expander.
> > > 
> > > Fuel Gauge and TCPC have separate and independent I2C addresses,
> > > register maps, and interrupt lines and are therefore excluded from the
> > > MFD core device driver here.
> > > 
> > > The GPIO and NVMEM interfaces are accessed via specific commands to the
> > > built-in microprocessor. This driver implements an API that client
> > > drivers can use for accessing those.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > 
> > > ---
> > > v4:
> > > * add missing build_bug.h include
> > > * update an irq chip comment
> > > * fix a whitespace in register definitions
> > > 
> > > v2:
> > > * add kernel doc for max77759_maxq_command() and related structs
> > > * fix an msec / usec typo
> > > * add missing error handling of devm_mutex_init() (Christophe)
> > > * align sentinel in max77759_of_id[] with max77759_i2c_id[]
> > >   (Christophe)
> > > * some tidy-ups in max77759_maxq_command() (Christophe)
> > > ---
> > >  MAINTAINERS                  |   2 +
> > >  drivers/mfd/Kconfig          |  20 ++
> > >  drivers/mfd/Makefile         |   1 +
> > >  drivers/mfd/max77759.c       | 738 +++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/max77759.h |  98 ++++++
> > >  5 files changed, 859 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index a45d1bd64d116d14bc05a64fa3da852a41e1de7f..38844ea24e464d0b58f8852b79e2b94f18d48998 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14352,6 +14352,8 @@ M:	André Draszik <andre.draszik@linaro.org>
> > >  L:	linux-kernel@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
> > > +F:	drivers/mfd/max77759.c
> > > +F:	include/linux/mfd/max77759.h
> > >  
> > >  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> > >  M:	Javier Martinez Canillas <javier@dowhile0.org>
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index d44c69bb3dfd52d53fe26aa2d5e5ace346448f57..1d72bf086401064608cc41e9f9a0af044c6df68e 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -930,6 +930,26 @@ config MFD_MAX77714
> > >  	  drivers must be enabled in order to use each functionality of the
> > >  	  device.
> > >  
> > > +config MFD_MAX77759
> > > +	tristate "Maxim Integrated MAX77759 PMIC"
> > > +	depends on I2C
> > > +	depends on OF
> > > +	select IRQ_DOMAIN
> > > +	select MFD_CORE
> > > +	select REGMAP_I2C
> > > +	select REGMAP_IRQ
> > > +	help
> > > +	  Say yes here to add support for Maxim Integrated MAX77759.
> > > +	  This is a companion Power Management IC for USB Type-C applications
> > > +	  with Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > > +	  Port Controller (TCPC), NVMEM, and additional GPIO interfaces.
> > > +	  This driver provides common support for accessing the device;
> > > +	  additional drivers must be enabled in order to use the functionality
> > > +	  of the device.
> > > +
> > > +	  To compile this driver as a module, choose M here: the module will be
> > > +	  called max77759.
> > > +
> > >  config MFD_MAX77843
> > >  	bool "Maxim Semiconductor MAX77843 PMIC Support"
> > >  	depends on I2C=y
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 9220eaf7cf1255a8922430fe3e50e41771bbaa60..cc9362afd8f060d64ca0f0f028a0d7cfe9cfe512 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
> > >  obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
> > >  obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
> > >  obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
> > > +obj-$(CONFIG_MFD_MAX77759)	+= max77759.o
> > >  obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
> > >  obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
> > >  max8925-objs			:= max8925-core.o max8925-i2c.o
> > > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a4f1616d600bde250a73b69464ada1fbf6d7e67e
> > > --- /dev/null
> > > +++ b/drivers/mfd/max77759.c
> > > @@ -0,0 +1,738 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +//
> > > +// Copyright 2020 Google Inc
> > > +// Copyright 2025 Linaro Ltd.
> > > +//
> > > +// Core MFD driver for Maxim MAX77759 companion PMIC for USB Type-C
> > 
> > Only the SPDX should be in C++ style comments.
> > 
> > Please C block-comment the rest.
> 
> It's a pity that there is different guidance on how to add the
> comment, e.g. for regulators the preference is C++ style, see e.g.
> https://lore.kernel.org/all/ZulJuCu-QcMYrphP@finisterre.sirena.org.uk/

I know that Mark likes the file header to be unified.

> I'd rather have one style for max77759, the nvmem and gpio parts
> also use C++ for this, and some drivers in mfd/ also use C++ style.
> 
> It'd be nice if there was one style :-)
> 
> Do you want me to change all drivers in this series?

Sorry, styles that are not universally common and documented are
subsystem based, not by driver family.

> > Drop all references to MFD - it's not a real thing.
> 
> Sure.
> 
> > > +#include <linux/array_size.h>
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/build_bug.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/init.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/jiffies.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/mfd/max77759.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/overflow.h>
> > > +#include <linux/regmap.h>
> > 
> > This is a huge list of includes.
> > 
> > Please comb them to see if you really do need all of them.
> 
> This is the minimal list as it's usually preferred to not
> rely on implicit includes. It is good practice to directly
> include the headers used, it avoids implicit dependencies
> and spurious breakage if someone rearranges headers and
> causes the implicit include to vanish.

You're preaching to the converted with respect to implicit includes.

So long as this driver uses all of the headers here, you're golden.

> > > +/* registers - registers useful to drivers are declared in the public header */
> > 
> > This sort of goes without saying.  Suggest you remove this comment.
> > 
> > > +/* PMIC / TOP */
> > > +#define MAX77759_PMIC_REG_PMIC_ID             0x00
> > > +#define MAX77759_PMIC_REG_PMIC_ID_MAX77759    59
> > 
> > Is this a register or a value?
> 
> It's a value, which the suffix in the macro name was meant to
> convey :-) 59 is the value (in decimal) for max77759 that
> the ID register is expected to contain.

You mean the REG suffix, that is in both the register address and value?

And why do you have MAX77759 in there twice?  That's just odd.

Suggest that expected values, like IDs are placed in an enum with the
other supported platforms

enum {
	MAX77759_CHIP_ID = 59,
	MAX77760_CHIP_ID = 60,
	MAX77761_CHIP_ID = 61,
};

> 
> > 
> > > +#define MAX77759_PMIC_REG_PMIC_REVISION       0x01
> > > +#define MAX77759_PMIC_REG_OTP_REVISION        0x02
> > > +
> > > +#define MAX77759_PMIC_REG_INTSRC              0x22
> > > +#define MAX77759_PMIC_REG_INTSRCMASK          0x23
> > > +#define MAX77759_PMIC_REG_INTSRC_MAXQ         BIT(3)
> > > +#define MAX77759_PMIC_REG_INTSRC_TOPSYS       BIT(1)
> > > +#define MAX77759_PMIC_REG_INTSRC_CHGR         BIT(0)
> > 
> > These look like bit offsets rather than reg addresses?
> 
> Of course, could you please clarify what you're hinting at
> here?

Register bits/masks {c,sh}ould be indented below the register names:

#define MAX77759_PMIC_REG_INTSRCMASK		0x23
#define   MAX77759_PMIC_REG_INTSRC_MAXQ		BIT(3)

> > > +#define MAX77759_PMIC_REG_TOPSYS_INT          0x24
> > > +#define MAX77759_PMIC_REG_TOPSYS_INT_MASK     0x26
> > > +#define MAX77759_PMIC_REG_TOPSYS_INT_TSHDN    BIT(6)
> > > +#define MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO  BIT(5)
> > > +#define MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO  BIT(4)
> > > +#define MAX77759_PMIC_REG_TOPSYS_INT_FSHIP    BIT(0)
> > > +
> > > +#define MAX77759_PMIC_REG_I2C_CNFG            0x40
> > > +#define MAX77759_PMIC_REG_SWRESET             0x50
> > > +#define MAX77759_PMIC_REG_CONTROL_FG          0x51
> > > +#define MAX77759_PMIC_REG_LAST_REGISTER       MAX77759_PMIC_REG_CONTROL_FG
> > 
> > You could just use MAX77759_PMIC_REG_CONTROL_FG in-place?
> 
> I think this makes it more obvious in the regmap definition
> below - struct regmap_config::max_register vs
> struct regmap_config::num_reg_defaults_raw

The attributes are already suitably named.

Creating a new define to make this doubly obvious is not required.

[...]

> > Where are the other registers?
> 
> The intention is to add them once we start working on charger.

Add it when you do instead.

> > > +enum max77759_i2c_subdev_id {
> > > +	MAX77759_I2C_SUBDEV_ID_MAXQ,
> > > +	MAX77759_I2C_SUBDEV_ID_CHARGER,
> > 
> > Are these truly arbitrary or are you relying on the fact that the
> > compiler usually starts from 0 and incs by 1?
> 
> It's not arbitrary. A conforming compiler is required to start with
> 0, this is part of the C standard, e.g.
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf 6.7.2.2.3

I'm aware of the standard.

However from a readability perspective they look arbitrary, so either
add a comment to say that you're relying on this behaviour and that the
presence and order of each entry is fixed and should not be amended or
do future contributors a favour and hard code them from the beginning.

[...]

> > > +	struct mutex maxq_lock;
> > > +	struct regmap *regmap_maxq;
> > > +	struct completion cmd_done;
> > > +
> > > +	struct regmap *regmap_top;
> > 
> > What is top?
> 
> One of its functional blocks as per the data sheet. I think
> it makes sense to use nomenclature from it.

Maybe a comment should be added to say what top actually represents.

Not all readers of this code will have the datasheet open.

> > > +	struct regmap *regmap_charger;
> > > +};
> > > +
> > > +struct max77759_i2c_subdev {
> > > +	enum max77759_i2c_subdev_id id;
> > > +	const struct regmap_config *cfg;
> > > +	u16 i2c_address;
> > > +};
> > > +
> > > +/* TOP registers */
> > > +static const struct regmap_range max77759_top_registers[] = {
> > > +	regmap_reg_range(0x00, 0x02),
> > > +	regmap_reg_range(0x22, 0x24),
> > > +	regmap_reg_range(0x26, 0x26),
> > > +	regmap_reg_range(0x40, 0x40),
> > > +	regmap_reg_range(0x50, 0x51),
> > 
> > What are these magic numbers?  Can you define them?
> 
> This is on purpose, as I think it makes it much easier to have
> the ranges as numbers, otherwise you always have to look them up
> in the header when trying to verify correctness or simply looking
> at this. Additionally, things wouldn't be nicely aligned anymore,
> 
> Without data sheet, whether these are numbers or macro names
> makes no difference, and it's impossible to reason about them.
> 
> With data sheet, it's easier this way to compare.
> 
> But I'll change them.

Or provide come helpful comments.  Magic numbers are generally decried.

This is made worse here, since it's not obvious what this function block does.

> > > +};
> > > +
> > > +static const struct regmap_range max77759_top_ro_registers[] = {
> > > +	regmap_reg_range(0x00, 0x02),
> > > +	regmap_reg_range(0x22, 0x22),
> > > +};
> > > +
> > > +static const struct regmap_range max77759_top_volatile_registers[] = {
> > > +	regmap_reg_range(0x22, 0x22),
> > > +	regmap_reg_range(0x24, 0x24),
> > > +};
> > > +
> > > +static const struct regmap_access_table max77759_top_wr_table = {
> > > +	.yes_ranges = max77759_top_registers,
> > > +	.n_yes_ranges = ARRAY_SIZE(max77759_top_registers),
> > > +	.no_ranges = max77759_top_ro_registers,
> > > +	.n_no_ranges = ARRAY_SIZE(max77759_top_ro_registers),
> > > +};
> > > +
> > > +static const struct regmap_access_table max77759_top_rd_table = {
> > > +	.yes_ranges = max77759_top_registers,
> > > +	.n_yes_ranges = ARRAY_SIZE(max77759_top_registers),
> > > +};
> > > +
> > > +static const struct regmap_access_table max77759_top_volatile_table = {
> > > +	.yes_ranges = max77759_top_volatile_registers,
> > > +	.n_yes_ranges = ARRAY_SIZE(max77759_top_volatile_registers),
> > > +};
> > > +
> > > +static const struct regmap_config max77759_regmap_config_top = {
> > > +	.name = "top",
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.max_register = MAX77759_PMIC_REG_LAST_REGISTER,
> > > +	.wr_table = &max77759_top_wr_table,
> > > +	.rd_table = &max77759_top_rd_table,
> > > +	.volatile_table = &max77759_top_volatile_table,
> > > +	.num_reg_defaults_raw = MAX77759_PMIC_REG_LAST_REGISTER + 1,
> > > +	.cache_type = REGCACHE_MAPLE,
> > > +};
> > > +
> > > +/* MaxQ registers */
> > 
> > Again, this is obvious due to the nomenclature.
> 
> Yes, but it gives a visual separation. I'll drop it.

Or expand it to provide information that is actually useful.

[...]

> > > +int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
> > > +			  const struct max77759_maxq_command *cmd,
> > > +			  struct max77759_maxq_response *rsp)
> > > +{
> > > +	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
> > > +	int ret;
> > 
> > Nit: Please place this at the bottom of the block.
> 
> OK.
> 
> > 
> > *twitch*
> > 
> > > +	struct device *dev = regmap_get_device(max77759_mfd->regmap_maxq);
> > 
> > > +	static const unsigned int timeout_ms = 200;
> > 
> > Why 200?
> 
> This is what downstream uses, I can add a comment to say so.

We're not generally interested in downstream here.

Why do downstream use it?  Is there a value in the datasheet?

> > > +
> > > +	if (cmd->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > > +		return -EINVAL;
> > > +
> > > +	/* rsp is allowed to be NULL. In that case we do need a temporary. */
> > 
> > More details please.
> > 
> > Why is NULL valid?
> 
> The kernel doc explains it:
> 
>  * @rsp: Any response data associated with the command will be copied here;
>  *     can be %NULL if the command has no response (other than ACK).
> 
> Do you want me to duplicate this information?

You already did, just in a less useful way.

It's arguably more critical to document it here than tucked away in the header.

> > Why does it need a placeholder?  What are you using as the placeholder?
> 
> Here, we still need a location to write the response to, as we
> need to verify that the command was indeed completed correctly.

Then please tell all of the future readers who may have the same queries.

> > > +	if (!rsp)
> > > +		rsp = _rsp;
> > > +
> > > +	BUILD_BUG_ON(MAX77759_MAXQ_OPCODE_MAXLENGTH
> > > +		     != MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX);
> > 
> > Probably useful during development.  Let useful in production code.
> 
> This build bug ensures that if anybody ever changed one of the
> macros in an incorrect way, things fall apart. One of the macros is
> part of the API, the other one is derived internally in this driver.
> Better to fail loudly, than to silently ignore such errors.
> 
> I'd rather leave this check in.

I think this is a bad idea and could set a ridiculous precedent of
validating all sorts of related defines.  Author the defines and test
them thoroughly.  If anyone were to come along and incorrectly tinker
with your hard work, that's on them.

If they have to be identical, derive one from the other.

> > > +	if (!rsp->length || rsp->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > > +		return -EINVAL;
> > > +
> > > +	guard(mutex)(&max77759_mfd->maxq_lock);
> > > +
> > > +	reinit_completion(&max77759_mfd->cmd_done);
> > > +
> > > +	/* write the opcode and data */
> > 
> > Upper case throughout please.
> 
> OK
> 
> > > +	ret = regmap_bulk_write(max77759_mfd->regmap_maxq,
> > > +				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> > > +				cmd->length);
> > > +	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > > +		/* writing the last byte triggers MaxQ */
> > > +		ret = regmap_write(max77759_mfd->regmap_maxq,
> > > +				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> > > +	if (ret) {
> > 
> > Do this first.
> 
> > Then you only need to check:
> > 
> >   cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX
> > 
> > ... in the subsequent statement.
> > 
> > But what happens if:
> > 
> >   !ret && cmd->length >= MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX
> >                                          ^
> > Is that okay?  Nothing to be done?
> 
> Yes, that is OK for length==MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX
> 
> The command buffer is MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX byte long.
> 
> If the message to be sent is smaller than that, then the last byte
> still needs to be written to MaxQ (DATAOUT32 register above) to
> submit the command ("/* writing the last byte triggers MaxQ */"
> comment above).
> 
> So there are three cases to cater for:
> 
> message > MESSAGESZ_MAX   -> return -EINVAL at start of function
> message == MESSAGESZ_MAX  -> just write message using regmap_bulk_write(),
>                              DATAOUT32 will be written due to cmd->length
> message < MESSAGESZ_MAX   -> write available bytes, then do dummy write
>                              to DATAOUT32
> 
> As is, the code ensures that, it does the extra DATAOUT32 write only
> if the bulk write succeeded and if necessary. It avoids duplicated
> tests of the regmap_bulk_write() / regmap_write() return value.
> 
> With your suggestion, the code would become more complicated I believe:
> 
> 	/* write the opcode and data */
> 	ret = regmap_bulk_write(max77759_mfd->regmap_maxq,
> 				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> 				cmd->length);
> 	if (ret) {
> 		dev_err(dev, "write data failed: %d\n", ret);
> 		return ret;
> 	}
> 	if (cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX) {
> 		/* writing the last byte triggers MaxQ */
> 		ret = regmap_write(max77759_mfd->regmap_maxq,
> 				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> 		if (ret) {
> 			dev_err(dev, "write data failed: %d\n", ret);
> 			return ret;
> 		}
> 	}
> 
> vs at the moment:
> 
> 	/* write the opcode and data */
> 	ret = regmap_bulk_write(max77759_mfd->regmap_maxq,
> 				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> 				cmd->length);
> 	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> 		/* writing the last byte triggers MaxQ */
> 		ret = regmap_write(max77759_mfd->regmap_maxq,
> 				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> 	if (ret) {
> 		dev_err(dev, "write data failed: %d\n", ret);
> 		return ret;
> 	}

Ah, I missed the re-assignment of 'ret'.  It's better as it is, thanks.

[...]

> > > +static int max77759_add_chained_maxq(struct i2c_client *client,
> > > +				     struct max77759_mfd *max77759_mfd,
> > > +				     struct regmap_irq_chip_data *parent)
> > > +{
> > > +	struct regmap_irq_chip_data *irq_chip_data;
> > > +	int ret;
> > 
> > Bottom please.
> > 
> > Some people like reverse Christmas tree.
> > 
> > Structure helps me sleep at night!  =;-)
> 
> I usually declare in order of use - I'll change ordering; don't want
> to rob you of your sleep :-))

Yeah, that's common during development.

But it's usually adapted / neatened-up before submission.

Readable code == happy contributors

[...]

> > > +	ret = regmap_read(regmap_top, MAX77759_PMIC_REG_PMIC_ID, &pmic_id);
> > > +	if (ret)
> > > +		return dev_err_probe(&client->dev, ret,
> > > +				     "Unable to read Device ID\n");
> > > +
> > > +	if (pmic_id != MAX77759_PMIC_REG_PMIC_ID_MAX77759)
> > > +		return dev_err_probe(&client->dev, -ENODEV,
> > > +				     "Unsupported Device ID %#.2x (%d)\n",
> > > +				     pmic_id, pmic_id);
> > > +
> > > +	irq_data = irq_get_irq_data(client->irq);
> > > +	if (!irq_data)
> > > +		return dev_err_probe(&client->dev, -EINVAL,
> > > +				     "Invalid IRQ: %d\n", client->irq);
> > > +
> > > +	max77759_mfd = devm_kzalloc(&client->dev, sizeof(*max77759_mfd),
> > > +				    GFP_KERNEL);
> > > +	if (!max77759_mfd)
> > > +		return -ENOMEM;
> > 
> > Device data is almost universally allocated at the top of .probe().
> 
> Will do.
> 
> > 
> > > +	max77759_mfd->regmap_top = regmap_top;
> > 
> > These two blocks are unrelated - please separate them with a line break here.
> 
> Will do.
> 
> > 
> > > +	ret = devm_mutex_init(&client->dev, &max77759_mfd->maxq_lock);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	i2c_set_clientdata(client, max77759_mfd);
> > > +
> > > +	for (int i = 0; i < ARRAY_SIZE(max77759_i2c_subdevs); ++i) {
> > 
> > Any reason for the pre-increment?
> > 
> > If not, it's more standards to post-inc.
> 
> My reason is that historically compilers have created better code
> with preinc, and I generally still prefer it, to make it obvious.

Is this still true today?

Historically, we used program computers with punched cards as well.  =:-)

> There are thousands of users doing preinc in for loops in the kernel
> tree, so unless you really insist, I'd like to keep it that way for
> that reason if you're OK with reason :-)

Let's play top-trumps:

% git grep "++i" | wc -l
7062
% git grep "i++" | wc -l
75158

There is more than an order of magnitude of difference between the
styles and I bet quite a few of the aforementioned cases were authored
because they _required_ pre-inc.

Anyway, it's not a hard and fast rule, but it is the kernel's preference.

> > > +		ret = max77759_create_i2c_subdev(client,
> > > +						 max77759_mfd,
> > > +						 &max77759_i2c_subdevs[i]);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
> > > +	irq_flags |= irqd_get_trigger_type(irq_data);
> > > +
> > > +	ret = devm_regmap_add_irq_chip(&client->dev, max77759_mfd->regmap_top,
> > > +				       client->irq, irq_flags, 0,
> > > +				       &max77759_pmic_irq_chip,
> > > +				       &irq_chip_data_pmic);
> > > +	if (ret)
> > > +		return dev_err_probe(&client->dev, ret,
> > > +				     "Failed to add IRQ chip\n");
> > > +
> > > +	/* INTSRC - MaxQ & children */
> > 
> > What does these comments add beyond what is already obvious by the nomenclature?
> 
> Visual separation.

Operating on different blocks is kinda MFD's 'thing' and is pretty
obvious by the function names already.  All you're doing here is
repeating information that is already present.

> > > +	ret = max77759_add_chained_maxq(client, max77759_mfd,
> > > +					irq_chip_data_pmic);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* INTSRC - topsys & children */
> > > +	ret = max77759_add_chained_topsys(client, max77759_mfd,
> > > +					  irq_chip_data_pmic);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* INTSRC - charger & children */
> > > +	ret = max77759_add_chained_charger(client, max77759_mfd,
> > > +					   irq_chip_data_pmic);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > > +				    max77759_cells, ARRAY_SIZE(max77759_cells),
> > > +				    NULL, 0,
> > > +				    regmap_irq_get_domain(irq_chip_data_pmic));
> > > +}

[...]

> > > diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..b038b4e9b748287e23e3a7030496f09dc8bdc816
> > > --- /dev/null
> > > +++ b/include/linux/mfd/max77759.h
> > > @@ -0,0 +1,98 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright 2020 Google Inc.
> > > + * Copyright 2025 Linaro Ltd.
> > > + *
> > > + * Client interface for Maxim MAX77759 MFD driver
> > > + */
> > > +
> > > +#ifndef __LINUX_MFD_MAX77759_H
> > > +#define __LINUX_MFD_MAX77759_H
> > > +
> > > +/* MaxQ opcodes */
> > > +#define MAX77759_MAXQ_OPCODE_MAXLENGTH 33
> > > +
> > > +#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_READ   0x21
> > > +#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_WRITE  0x22
> > > +#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_READ   0x23
> > > +#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_WRITE  0x24
> > > +#define MAX77759_MAXQ_OPCODE_USER_SPACE_READ     0x81
> > > +#define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE    0x82
> > > +
> > > +/*
> > > + * register map (incomplete) - registers not useful for drivers are not
> > > + * declared here
> > > + */
> > > +/* MaxQ */
> > > +#define MAX77759_MAXQ_REG_UIC_INT1            0x64
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI  BIT(7)
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI    BIT(6)
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIO6I     BIT(1)
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIO5I     BIT(0)
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, en)  (((en) & 1) << (offs))
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(offs) \
> > > +				MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, ~0)
> > > +
> > > +#define MAX77759_MAXQ_REG_UIC_INT2            0x65
> > > +#define MAX77759_MAXQ_REG_UIC_INT3            0x66
> > > +#define MAX77759_MAXQ_REG_UIC_INT4            0x67
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS1     0x68
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS2     0x69
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS3     0x6a
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS4     0x6b
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS5     0x6c
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS6     0x6d
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS7     0x6f
> > > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS8     0x6f
> > > +#define MAX77759_MAXQ_REG_UIC_INT1_M          0x70
> > > +#define MAX77759_MAXQ_REG_UIC_INT2_M          0x71
> > > +#define MAX77759_MAXQ_REG_UIC_INT3_M          0x72
> > > +#define MAX77759_MAXQ_REG_UIC_INT4_M          0x73
> > > +
> > > +/* charger */
> > > +#define MAX77759_CHGR_REG_CHG_INT        0xb0
> > > +#define MAX77759_CHGR_REG_CHG_INT2       0xb1
> > > +#define MAX77759_CHGR_REG_CHG_INT_MASK   0xb2
> > > +#define MAX77759_CHGR_REG_CHG_INT2_MASK  0xb3
> > > +
> > > +struct max77759_mfd;
> > 
> > Place the definition in here instead.
> 
> I would like to keep it private. There is no need for it to
> become public, it's meant to be an opaque handle.

No, it's not.

It's device data that you already shared with all of the children.

If you don't want them to have it, don't give it to them.

-- 
Lee Jones [李琼斯]

