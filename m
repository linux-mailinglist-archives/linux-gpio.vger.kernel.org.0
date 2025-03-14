Return-Path: <linux-gpio+bounces-17631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F3A61508
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 16:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36AC43BE7D9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742002036F6;
	Fri, 14 Mar 2025 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kA21ujsv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7A202F83
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966241; cv=none; b=c5rD60/+IcJZy8rmmrheKFP8pyGwx/ULiHW1XRND/TchMh/+glUpoos0Y7U0KbHhhh1L+fMBZ7wseTdVmhxXWPTB5vnbmfSI6D+1rj31dFBq/5vYJOJs6/16lLxqatbVm3jN4sD5Qw5xsjF6nkQlkwMwRuV0o90X8y7WFkGJ0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966241; c=relaxed/simple;
	bh=UOP1Qyv7GBJbDWvH4eHo6xbahzbIvVYFgibQlV63WXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbptkjld7YC/j9GfekkqwAj/hifLypcmSeb98IVdsXwwHvbO+yjYbKC46AGWlYriuF90Rl1wQhe7FYg19yHBe7v1p30km7MdV6Ihj/4FB7MPSo6M+0SzVNNNm6yllRyd4b8517SRt5e7TJM/sHWNor2tKDzK7kjExFWTIwtGXVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kA21ujsv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so21426665e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741966235; x=1742571035; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d91xcSO60z93IQm+HCCTT1Uyg3FpNBgNcbzA9jds4Q4=;
        b=kA21ujsvQkPaGAirp9CIq7mGHMrEsUbdeDtDZk9w1JOG9VM7/i6K1LLWmjRBiscQq8
         TACe21iqP7QiqYI4pez75caNJL1uyCDDC5iaKfyl9HVQzDtF+wgSBc05s96iTKUgCcrV
         vgnslHIoPF13YFkzCqDkgm35ziyDlPGmqRsBG+9bST0Nqxr/HiatzQLLWkK2h6YpPjsz
         eG6nE/eroL9j7y57BHAkYQSCQjHAOAms7WJRxO5v5rcx3xVHC01iW7rQg8pRgsJx2PrD
         seXju5tf70uRqSi/+UoesKBd9xICQAjR9sEsATW7rsM7GKo3A3svwaj61lgRM/8xfVAE
         fTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966235; x=1742571035;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d91xcSO60z93IQm+HCCTT1Uyg3FpNBgNcbzA9jds4Q4=;
        b=sQAGy/y7TagNdz9YdcofxvJEdIoOXZW/+/Meu6sWtkWP41MyzCdYBqbdXh/wg4KDJt
         GazWt8Qq7eOKTrq31BjS+9o7zC9Q200rSNWPpwJmUkivFtQ7K8mGWcU0mUpBS4KqZjH8
         +QJwQAayft+aQKpm8DnS70UXD8xUnmuHnkFIQQfcJxEfmipdPd+qN7lZCLS38JzfstnN
         wNNAta09M2X7Ck2gfmT8Ggksy8A/rjrtoNmYOJsIRySa6btiKdbOl2suFBYecuqJZtsq
         qZBgSq8jII7UxhNenYWgLSslDfoFwBD+vhgtQcui355R/K/snr1p8maUeKUFad8GdJML
         0vbg==
X-Forwarded-Encrypted: i=1; AJvYcCX8LOjptXupCbvcxi99uQfUr5hEgFzNZwTSqvpv5UJnGlK+nt7kMj5yOr7c93I8wPZivMonIqOR+5/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsgyWEdncN9ZIcPEr7Ynt+u38PgHNhIAkE44fKUt75GyzTIU8
	R7MAB8fqUSYhLQdgp6Jm0GLNpdsiBIS5m/eSvpqfxMIxSjU0ySyddIUcBb/RI78=
X-Gm-Gg: ASbGncuCnQXWjhH4CeR+xCr4WEfn+9nlSDmC7tphxyvLxiq7/WAAzVHLaVHCIrsmVmS
	g2eygjYcb+SOZRaJUHnXrCYsgfIu7dd8UP82rx6JVbaUZmHVzZswgadFGpOEuJmLhAPrj6wiDDs
	nRKzX2S42p5F99FEzQFPV2wFt91NCDoPDWecXdWItIpK+geJEoKe2ulOd5wR8mQ+Ko4+V1REUGn
	+VF92dwLnwWJIiTRMrKfYofdWd0GAk7YiWonukJ4iTbDYKNWfXPeKXUGy5Ko/ywCHlpxMwtW8RO
	BXf6JmAym6fjaO1gE5IKfgl0HX2RUJiMJBNLdtKr0kHlnVZ5
X-Google-Smtp-Source: AGHT+IHWvDrpV/d6HrsfzMiG5cFN2Z8wCHs9Vpe59zhxNG1wisB2Ux5YxDN8ycuopRFipCbKof/ilw==
X-Received: by 2002:a05:600c:3146:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43d1ec8c391mr39812525e9.13.1741966234551;
        Fri, 14 Mar 2025 08:30:34 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe065a5sm20773965e9.12.2025.03.14.08.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:33 -0700 (PDT)
Message-ID: <7d94ed5bd79f0081d392747f74773e7f866252bd.camel@linaro.org>
Subject: Re: [PATCH v4 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org
Date: Fri, 14 Mar 2025 15:30:32 +0000
In-Reply-To: <20250314123150.GM3890718@google.com>
References: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
	 <20250312-max77759-mfd-v4-4-b908d606c8cb@linaro.org>
	 <20250314123150.GM3890718@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

Thanks for your review!

On Fri, 2025-03-14 at 12:31 +0000, Lee Jones wrote:
> On Wed, 12 Mar 2025, Andr=C3=A9 Draszik wrote:
>=20
> > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > Port Controller (TCPC), NVMEM, and a GPIO expander.
> >=20
> > Fuel Gauge and TCPC have separate and independent I2C addresses,
> > register maps, and interrupt lines and are therefore excluded from the
> > MFD core device driver here.
> >=20
> > The GPIO and NVMEM interfaces are accessed via specific commands to the
> > built-in microprocessor. This driver implements an API that client
> > drivers can use for accessing those.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > v4:
> > * add missing build_bug.h include
> > * update an irq chip comment
> > * fix a whitespace in register definitions
> >=20
> > v2:
> > * add kernel doc for max77759_maxq_command() and related structs
> > * fix an msec / usec typo
> > * add missing error handling of devm_mutex_init() (Christophe)
> > * align sentinel in max77759_of_id[] with max77759_i2c_id[]
> > =C2=A0 (Christophe)
> > * some tidy-ups in max77759_maxq_command() (Christophe)
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/mfd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 20 ++
> > =C2=A0drivers/mfd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 738 =
+++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/linux/mfd/max77759.h |=C2=A0 98 ++++++
> > =C2=A05 files changed, 859 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a45d1bd64d116d14bc05a64fa3da852a41e1de7f..38844ea24e464d0b58f8852=
b79e2b94f18d48998 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14352,6 +14352,8 @@ M:	Andr=C3=A9 Draszik <andre.draszik@linaro.org=
>
> > =C2=A0L:	linux-kernel@vger.kernel.org
> > =C2=A0S:	Maintained
> > =C2=A0F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
> > +F:	drivers/mfd/max77759.c
> > +F:	include/linux/mfd/max77759.h
> > =C2=A0
> > =C2=A0MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> > =C2=A0M:	Javier Martinez Canillas <javier@dowhile0.org>
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index d44c69bb3dfd52d53fe26aa2d5e5ace346448f57..1d72bf086401064608cc41e=
9f9a0af044c6df68e 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -930,6 +930,26 @@ config MFD_MAX77714
> > =C2=A0	=C2=A0 drivers must be enabled in order to use each functionalit=
y of the
> > =C2=A0	=C2=A0 device.
> > =C2=A0
> > +config MFD_MAX77759
> > +	tristate "Maxim Integrated MAX77759 PMIC"
> > +	depends on I2C
> > +	depends on OF
> > +	select IRQ_DOMAIN
> > +	select MFD_CORE
> > +	select REGMAP_I2C
> > +	select REGMAP_IRQ
> > +	help
> > +	=C2=A0 Say yes here to add support for Maxim Integrated MAX77759.
> > +	=C2=A0 This is a companion Power Management IC for USB Type-C applica=
tions
> > +	=C2=A0 with Battery Charger, Fuel Gauge, temperature sensors, USB Typ=
e-C
> > +	=C2=A0 Port Controller (TCPC), NVMEM, and additional GPIO interfaces.
> > +	=C2=A0 This driver provides common support for accessing the device;
> > +	=C2=A0 additional drivers must be enabled in order to use the functio=
nality
> > +	=C2=A0 of the device.
> > +
> > +	=C2=A0 To compile this driver as a module, choose M here: the module =
will be
> > +	=C2=A0 called max77759.
> > +
> > =C2=A0config MFD_MAX77843
> > =C2=A0	bool "Maxim Semiconductor MAX77843 PMIC Support"
> > =C2=A0	depends on I2C=3Dy
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 9220eaf7cf1255a8922430fe3e50e41771bbaa60..cc9362afd8f060d64ca0f0f=
028a0d7cfe9cfe512 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_MAX77650)	+=3D max77650.o
> > =C2=A0obj-$(CONFIG_MFD_MAX77686)	+=3D max77686.o
> > =C2=A0obj-$(CONFIG_MFD_MAX77693)	+=3D max77693.o
> > =C2=A0obj-$(CONFIG_MFD_MAX77714)	+=3D max77714.o
> > +obj-$(CONFIG_MFD_MAX77759)	+=3D max77759.o
> > =C2=A0obj-$(CONFIG_MFD_MAX77843)	+=3D max77843.o
> > =C2=A0obj-$(CONFIG_MFD_MAX8907)	+=3D max8907.o
> > =C2=A0max8925-objs			:=3D max8925-core.o max8925-i2c.o
> > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a4f1616d600bde250a73b69=
464ada1fbf6d7e67e
> > --- /dev/null
> > +++ b/drivers/mfd/max77759.c
> > @@ -0,0 +1,738 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// Copyright 2020 Google Inc
> > +// Copyright 2025 Linaro Ltd.
> > +//
> > +// Core MFD driver for Maxim MAX77759 companion PMIC for USB Type-C
>=20
> Only the SPDX should be in C++ style comments.
>=20
> Please C block-comment the rest.

It's a pity that there is different guidance on how to add the
comment, e.g. for regulators the preference is C++ style, see e.g.
https://lore.kernel.org/all/ZulJuCu-QcMYrphP@finisterre.sirena.org.uk/

I'd rather have one style for max77759, the nvmem and gpio parts
also use C++ for this, and some drivers in mfd/ also use C++ style.

It'd be nice if there was one style :-)

Do you want me to change all drivers in this series?

> Drop all references to MFD - it's not a real thing.

Sure.

> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/build_bug.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/completion.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/max77759.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/overflow.h>
> > +#include <linux/regmap.h>
>=20
> This is a huge list of includes.
>=20
> Please comb them to see if you really do need all of them.

This is the minimal list as it's usually preferred to not
rely on implicit includes.=C2=A0It is good practice to directly
include the headers used, it avoids implicit dependencies
and spurious breakage if someone rearranges headers and
causes the implicit include to vanish.

>=20
> > +/* registers - registers useful to drivers are declared in the public =
header */
>=20
> This sort of goes without saying.=C2=A0 Suggest you remove this comment.
>=20
> > +/* PMIC / TOP */
> > +#define MAX77759_PMIC_REG_PMIC_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00
> > +#define MAX77759_PMIC_REG_PMIC_ID_MAX77759=C2=A0=C2=A0=C2=A0 59
>=20
> Is this a register or a value?

It's a value, which the suffix in the macro name was meant to
convey :-) 59 is the value (in decimal) for max77759 that
the ID register is expected to contain.

>=20
> > +#define MAX77759_PMIC_REG_PMIC_REVISION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x01
> > +#define MAX77759_PMIC_REG_OTP_REVISION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x02
> > +
> > +#define MAX77759_PMIC_REG_INTSRC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x22
> > +#define MAX77759_PMIC_REG_INTSRCMASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x23
> > +#define MAX77759_PMIC_REG_INTSRC_MAXQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(3)
> > +#define MAX77759_PMIC_REG_INTSRC_TOPSYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(1)
> > +#define MAX77759_PMIC_REG_INTSRC_CHGR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(0)
>=20
> These look like bit offsets rather than reg addresses?

Of course, could you please clarify what you're hinting at
here?

> > +#define MAX77759_PMIC_REG_TOPSYS_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x24
> > +#define MAX77759_PMIC_REG_TOPSYS_INT_MASK=C2=A0=C2=A0=C2=A0=C2=A0 0x26
> > +#define MAX77759_PMIC_REG_TOPSYS_INT_TSHDN=C2=A0=C2=A0=C2=A0 BIT(6)
> > +#define MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO=C2=A0 BIT(5)
> > +#define MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO=C2=A0 BIT(4)
> > +#define MAX77759_PMIC_REG_TOPSYS_INT_FSHIP=C2=A0=C2=A0=C2=A0 BIT(0)
> > +
> > +#define MAX77759_PMIC_REG_I2C_CNFG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x40
> > +#define MAX77759_PMIC_REG_SWRESET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x50
> > +#define MAX77759_PMIC_REG_CONTROL_FG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x51
> > +#define MAX77759_PMIC_REG_LAST_REGISTER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 MAX77759_PMIC_REG_CONTROL_FG
>=20
> You could just use MAX77759_PMIC_REG_CONTROL_FG in-place?

I think this makes it more obvious in the regmap definition
below - struct regmap_config::max_register vs
struct regmap_config::num_reg_defaults_raw

>=20
> > +/* MaxQ */
>=20
> How does this improve readability?=C2=A0 The name is already in the defin=
e.

Due to Max77759 having different functional blocks, it appeared
worthwhile to visually separate the registers as well.

> If you want to provide a comment, which isn't a bad idea, extend the
> meaning and describe the purpose instead.

Will do.

> > +#define MAX77759_MAXQ_REG_AP_DATAOUT0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x81
> > +#define MAX77759_MAXQ_REG_AP_DATAOUT32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
xa1
> > +#define MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX=C2=A0 (MAX77759_MAXQ_REG_AP=
_DATAOUT32 \
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 - MAX77759_MAXQ_REG_AP_DATAOUT0 \
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 + 1)
>=20
> This is a strange way to line things up.
>=20
> > +#define MAX77759_MAXQ_REG_AP_DATAIN0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0xb1
> > +#define MAX77759_MAXQ_REG_LAST_REGISTER=C2=A0=C2=A0=C2=A0=C2=A0 0xe0
>=20
> What is the last register's purpose, besides being the last one?

As above, I think this makes it more obvious in the regmap
definition below - struct regmap_config::max_register vs
struct regmap_config::num_reg_defaults_raw

>=20
> > +/* charger */
>=20
> Not sure this provides much, but if you insist on keeping it, all
> comments should start with an upper-case char here.

Again, different functional block's register set starts here :-)

>=20
> > +#define MAX77759_CHGR_REG_LAST_REGISTER=C2=A0 0xcc
>=20
> Where are the other registers?

The intention is to add them once we start working on charger.

>=20
> > +enum max77759_i2c_subdev_id {
> > +	MAX77759_I2C_SUBDEV_ID_MAXQ,
> > +	MAX77759_I2C_SUBDEV_ID_CHARGER,
>=20
> Are these truly arbitrary or are you relying on the fact that the
> compiler usually starts from 0 and incs by 1?

It's not arbitrary. A conforming compiler is required to start with
0, this is part of the C standard, e.g.
https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf 6.7.2.2.3

>=20
> > +};
> > +
> > +struct max77759_mfd {
>=20
> Drop all "mfd"ness.

sure

>=20
> > +	/* protecting MaxQ commands - only one can be active */
>=20
> "This protects"

OK

>=20
> > +	struct mutex maxq_lock;
> > +	struct regmap *regmap_maxq;
> > +	struct completion cmd_done;
> > +
> > +	struct regmap *regmap_top;
>=20
> What is top?

One of its functional blocks as per the data sheet. I think
it makes sense to use nomenclature from it.

>=20
> > +	struct regmap *regmap_charger;
> > +};
> > +
> > +struct max77759_i2c_subdev {
> > +	enum max77759_i2c_subdev_id id;
> > +	const struct regmap_config *cfg;
> > +	u16 i2c_address;
> > +};
> > +
> > +/* TOP registers */
> > +static const struct regmap_range max77759_top_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x02),
> > +	regmap_reg_range(0x22, 0x24),
> > +	regmap_reg_range(0x26, 0x26),
> > +	regmap_reg_range(0x40, 0x40),
> > +	regmap_reg_range(0x50, 0x51),
>=20
> What are these magic numbers?=C2=A0 Can you define them?

This is on purpose, as I think it makes it much easier to have
the ranges as numbers, otherwise you always have to look them up
in the header when trying to verify correctness or simply looking
at this. Additionally, things wouldn't be nicely aligned anymore,

Without data sheet, whether these are numbers or macro names
makes no difference, and it's impossible to reason about them.

With data sheet, it's easier this way to compare.

But I'll change them.

>=20
> > +};
> > +
> > +static const struct regmap_range max77759_top_ro_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x02),
> > +	regmap_reg_range(0x22, 0x22),
> > +};
> > +
> > +static const struct regmap_range max77759_top_volatile_registers[] =3D=
 {
> > +	regmap_reg_range(0x22, 0x22),
> > +	regmap_reg_range(0x24, 0x24),
> > +};
> > +
> > +static const struct regmap_access_table max77759_top_wr_table =3D {
> > +	.yes_ranges =3D max77759_top_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_top_registers),
> > +	.no_ranges =3D max77759_top_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(max77759_top_ro_registers),
> > +};
> > +
> > +static const struct regmap_access_table max77759_top_rd_table =3D {
> > +	.yes_ranges =3D max77759_top_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_top_registers),
> > +};
> > +
> > +static const struct regmap_access_table max77759_top_volatile_table =
=3D {
> > +	.yes_ranges =3D max77759_top_volatile_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_top_volatile_registers),
> > +};
> > +
> > +static const struct regmap_config max77759_regmap_config_top =3D {
> > +	.name =3D "top",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D MAX77759_PMIC_REG_LAST_REGISTER,
> > +	.wr_table =3D &max77759_top_wr_table,
> > +	.rd_table =3D &max77759_top_rd_table,
> > +	.volatile_table =3D &max77759_top_volatile_table,
> > +	.num_reg_defaults_raw =3D MAX77759_PMIC_REG_LAST_REGISTER + 1,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +/* MaxQ registers */
>=20
> Again, this is obvious due to the nomenclature.

Yes, but it gives a visual separation. I'll drop it.

>=20
> > +static const struct regmap_range max77759_maxq_registers[] =3D {
> > +	regmap_reg_range(0x60, 0x73),
> > +	regmap_reg_range(0x81, 0xa1),
> > +	regmap_reg_range(0xb1, 0xd1),
> > +	regmap_reg_range(0xe0, 0xe0),
> > +};
> > +
> > +static const struct regmap_range max77759_maxq_ro_registers[] =3D {
> > +	regmap_reg_range(0x60, 0x63),
> > +	regmap_reg_range(0x68, 0x6f),
> > +	regmap_reg_range(0xb1, 0xd1),
> > +};
> > +
> > +static const struct regmap_range max77759_maxq_volatile_registers[] =
=3D {
> > +	regmap_reg_range(0x64, 0x6f),
> > +	regmap_reg_range(0xb1, 0xd1),
> > +	regmap_reg_range(0xe0, 0xe0),
> > +};
> > +
> > +static const struct regmap_access_table max77759_maxq_wr_table =3D {
> > +	.yes_ranges =3D max77759_maxq_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_maxq_registers),
> > +	.no_ranges =3D max77759_maxq_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(max77759_maxq_ro_registers),
> > +};
> > +
> > +static const struct regmap_access_table max77759_maxq_rd_table =3D {
> > +	.yes_ranges =3D max77759_maxq_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_maxq_registers),
> > +};
> > +
> > +static const struct regmap_access_table max77759_maxq_volatile_table =
=3D {
> > +	.yes_ranges =3D max77759_maxq_volatile_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_maxq_volatile_registers),
> > +};
> > +
> > +static const struct regmap_config max77759_regmap_config_maxq =3D {
> > +	.name =3D "maxq",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D MAX77759_MAXQ_REG_LAST_REGISTER,
> > +	.wr_table =3D &max77759_maxq_wr_table,
> > +	.rd_table =3D &max77759_maxq_rd_table,
> > +	.volatile_table =3D &max77759_maxq_volatile_table,
> > +	.num_reg_defaults_raw =3D MAX77759_MAXQ_REG_LAST_REGISTER + 1,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +/* charger registers */
> > +static const struct regmap_range max77759_charger_registers[] =3D {
> > +	regmap_reg_range(0xb0, 0xcc),
> > +};
> > +
> > +static const struct regmap_range max77759_charger_ro_registers[] =3D {
> > +	regmap_reg_range(0xb4, 0xb8),
> > +};
> > +
> > +static const struct regmap_range max77759_charger_volatile_registers[]=
 =3D {
> > +	regmap_reg_range(0xb0, 0xb1),
> > +	regmap_reg_range(0xb4, 0xb8),
> > +};
> > +
> > +static const struct regmap_access_table max77759_charger_wr_table =3D =
{
> > +	.yes_ranges =3D max77759_charger_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_charger_registers),
> > +	.no_ranges =3D max77759_charger_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(max77759_charger_ro_registers),
> > +};
> > +
> > +static const struct regmap_access_table max77759_charger_rd_table =3D =
{
> > +	.yes_ranges =3D max77759_charger_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_charger_registers),
> > +};
> > +
> > +static const struct regmap_access_table max77759_charger_volatile_tabl=
e =3D {
> > +	.yes_ranges =3D max77759_charger_volatile_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_charger_volatile_registers),
> > +};
> > +
> > +static const struct regmap_config max77759_regmap_config_charger =3D {
> > +	.name =3D "charger",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D MAX77759_CHGR_REG_LAST_REGISTER,
> > +	.wr_table =3D &max77759_charger_wr_table,
> > +	.rd_table =3D &max77759_charger_rd_table,
> > +	.volatile_table =3D &max77759_charger_volatile_table,
> > +	.num_reg_defaults_raw =3D MAX77759_CHGR_REG_LAST_REGISTER + 1,
> > +	.cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +/*
> > + * Interrupts - with the following interrupt hierarchy:
> > + *=C2=A0=C2=A0 pmic IRQs (INTSRC)
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 - MAXQ_INT: MaxQ IRQs
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - UIC_INT1
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - APCmdResI
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - SysMsgI
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GPIOxI
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 - TOPSYS_INT: topsys
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - TOPSYS_INT
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - TSHDN_INT
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - SYSOVLO_INT
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - SYSUVLO_INT
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - FSHIP_NOT_RD
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 - CHGR_INT: charger
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CHG_INT
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CHG_INT2
> > + */
> > +enum {
> > +	MAX77759_INT_MAXQ,
> > +	MAX77759_INT_TOPSYS,
> > +	MAX77759_INT_CHGR,
> > +};
> > +
> > +enum {
> > +	MAX77759_TOPSYS_INT_TSHDN,
> > +	MAX77759_TOPSYS_INT_SYSOVLO,
> > +	MAX77759_TOPSYS_INT_SYSUVLO,
> > +	MAX77759_TOPSYS_INT_FSHIP_NOT_RD,
> > +};
> > +
> > +enum {
> > +	MAX77759_MAXQ_INT_APCMDRESI,
> > +	MAX77759_MAXQ_INT_SYSMSGI,
> > +	MAX77759_MAXQ_INT_GPIO,
> > +	MAX77759_MAXQ_INT_UIC1,
> > +	MAX77759_MAXQ_INT_UIC2,
> > +	MAX77759_MAXQ_INT_UIC3,
> > +	MAX77759_MAXQ_INT_UIC4,
> > +};
> > +
> > +enum {
> > +	MAX77759_CHARGER_INT_1,
> > +	MAX77759_CHARGER_INT_2,
> > +};
> > +
> > +static const struct regmap_irq max77759_pmic_irqs[] =3D {
> > +	REGMAP_IRQ_REG(MAX77759_INT_MAXQ, 0, MAX77759_PMIC_REG_INTSRC_MAXQ),
> > +	REGMAP_IRQ_REG(MAX77759_INT_TOPSYS, 0, MAX77759_PMIC_REG_INTSRC_TOPSY=
S),
> > +	REGMAP_IRQ_REG(MAX77759_INT_CHGR, 0, MAX77759_PMIC_REG_INTSRC_CHGR),
> > +};
> > +
> > +static const struct regmap_irq max77759_maxq_irqs[] =3D {
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_APCMDRESI,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, MAX77759_MAXQ_REG_UIC_INT1_A=
PCMDRESI),
>=20
> Use up to 100-chars here to avoid the line-break.

Will do.

> This isn't 1999 anymore - we have wide-screen 4k monitors. =3D:-)
>=20
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_SYSMSGI,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, MAX77759_MAXQ_REG_UIC_INT1_S=
YSMSGI),
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_GPIO, 0, GENMASK(1, 0)),
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC1, 0, GENMASK(5, 2)),
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC2, 1, GENMASK(7, 0)),
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC3, 2, GENMASK(7, 0)),
> > +	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC4, 3, GENMASK(7, 0)),
> > +};
> > +
> > +static const struct regmap_irq max77759_topsys_irqs[] =3D {
> > +	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_TSHDN,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, MAX77759_PMIC_REG_TOPSYS_INT=
_TSHDN),
> > +	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_SYSOVLO,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, MAX77759_PMIC_REG_TOPSYS_INT=
_SYSOVLO),
> > +	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_SYSUVLO,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, MAX77759_PMIC_REG_TOPSYS_INT=
_SYSUVLO),
> > +	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_FSHIP_NOT_RD,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, MAX77759_PMIC_REG_TOPSYS_INT=
_FSHIP),
> > +};
> > +
> > +static const struct regmap_irq max77759_chgr_irqs[] =3D {
> > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
> > +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
> > +};
> > +
> > +static const struct regmap_irq_chip max77759_pmic_irq_chip =3D {
> > +	.name =3D "max77759-pmic",
> > +	/* INTSRC is read-only and doesn't require clearing */
> > +	.status_base =3D MAX77759_PMIC_REG_INTSRC,
> > +	.mask_base =3D MAX77759_PMIC_REG_INTSRCMASK,
> > +	.num_regs =3D 1,
> > +	.irqs =3D max77759_pmic_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(max77759_pmic_irqs),
> > +};
> > +
> > +/*
> > + * We can let regmap-irq auto-ack the topsys interrupt bits as require=
d, but
> > + * for all others the individual drivers need to know which interrupt =
bit
> > + * exactly is set inside their interrupt handlers, and therefore we ca=
n not set
> > + * .ack_base for those.
> > + */
>=20
> Nice - thanks for this!
>=20
> > +static const struct regmap_irq_chip max77759_maxq_irq_chip =3D {
> > +	.name =3D "max77759-maxq",
> > +	.domain_suffix =3D "MAXQ",
> > +	.status_base =3D MAX77759_MAXQ_REG_UIC_INT1,
> > +	.mask_base =3D MAX77759_MAXQ_REG_UIC_INT1_M,
> > +	.num_regs =3D 4,
> > +	.irqs =3D max77759_maxq_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(max77759_maxq_irqs),
> > +};
> > +
> > +static const struct regmap_irq_chip max77759_topsys_irq_chip =3D {
> > +	.name =3D "max77759-topsys",
> > +	.domain_suffix =3D "TOPSYS",
> > +	.status_base =3D MAX77759_PMIC_REG_TOPSYS_INT,
> > +	.mask_base =3D MAX77759_PMIC_REG_TOPSYS_INT_MASK,
> > +	.ack_base =3D MAX77759_PMIC_REG_TOPSYS_INT,
> > +	.num_regs =3D 1,
> > +	.irqs =3D max77759_topsys_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(max77759_topsys_irqs),
> > +};
> > +
> > +static const struct regmap_irq_chip max77759_chrg_irq_chip =3D {
> > +	.name =3D "max77759-chgr",
> > +	.domain_suffix =3D "CHGR",
> > +	.status_base =3D MAX77759_CHGR_REG_CHG_INT,
> > +	.mask_base =3D MAX77759_CHGR_REG_CHG_INT_MASK,
> > +	.num_regs =3D 2,
> > +	.irqs =3D max77759_chgr_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(max77759_chgr_irqs),
> > +};
> > +
> > +static const struct max77759_i2c_subdev max77759_i2c_subdevs[] =3D {
> > +	{
> > +		.id =3D MAX77759_I2C_SUBDEV_ID_MAXQ,
> > +		/* I2C address is same as top's */
>=20
> It took me a moment to figure out why this is relevant.
>=20
> Maybe shift this down, so it lines-up with the next element.

OK.

>=20
> > +		.cfg =3D &max77759_regmap_config_maxq,
> > +	},
> > +	{
> > +		.id =3D MAX77759_I2C_SUBDEV_ID_CHARGER,
> > +		.cfg =3D &max77759_regmap_config_charger,
> > +		.i2c_address =3D 0x69,
> > +	},
> > +};
> > +
> > +static const struct resource max77759_gpio_resources[] =3D {
> > +	DEFINE_RES_IRQ_NAMED(MAX77759_MAXQ_INT_GPIO, "GPI"),
> > +};
> > +
> > +static const struct resource max77759_charger_resources[] =3D {
> > +	DEFINE_RES_IRQ_NAMED(MAX77759_CHARGER_INT_1, "INT1"),
> > +	DEFINE_RES_IRQ_NAMED(MAX77759_CHARGER_INT_2, "INT2"),
> > +};
> > +
> > +static const struct mfd_cell max77759_cells[] =3D {
> > +	MFD_CELL_OF("max77759-nvmem", NULL, NULL, 0, 0,
> > +		=C2=A0=C2=A0=C2=A0 "maxim,max77759-nvmem"),
> > +};
> > +
> > +static const struct mfd_cell max77759_maxq_cells[] =3D {
> > +	MFD_CELL_OF("max77759-gpio", max77759_gpio_resources, NULL, 0, 0,
> > +		=C2=A0=C2=A0=C2=A0 "maxim,max77759-gpio"),
> > +};
> > +
> > +static const struct mfd_cell max77759_charger_cells[] =3D {
> > +	MFD_CELL_RES("max77759-charger", max77759_charger_resources),
> > +};
>=20
> Are there situations where only 1 or 2 of these will be used?
>=20
> If they will all be used all of the time, save yourself a bunch of lines
> and complexity and add them all to a single struct.

Hm, they all have different interrupt domains. This was inspired by
intel_soc_pmic_bxtwc.c I'll see what I can do.

>=20
> > +int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
> > +			=C2=A0 const struct max77759_maxq_command *cmd,
> > +			=C2=A0 struct max77759_maxq_response *rsp)
> > +{
> > +	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
> > +	int ret;
>=20
> Nit: Please place this at the bottom of the block.

OK.

>=20
> *twitch*
>=20
> > +	struct device *dev =3D regmap_get_device(max77759_mfd->regmap_maxq);
>=20
> > +	static const unsigned int timeout_ms =3D 200;
>=20
> Why 200?

This is what downstream uses, I can add a comment to say so.

>=20
> > +
> > +	if (cmd->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > +		return -EINVAL;
> > +
> > +	/* rsp is allowed to be NULL. In that case we do need a temporary. */
>=20
> More details please.
>=20
> Why is NULL valid?

The kernel doc explains it:

 * @rsp: Any response data associated with the command will be copied here;
 *     can be %NULL if the command has no response (other than ACK).

Do you want me to duplicate this information?

>=20
> Why does it need a placeholder?=C2=A0 What are you using as the placehold=
er?

Here, we still need a location to write the response to, as we
need to verify that the command was indeed completed correctly.

>=20
> > +	if (!rsp)
> > +		rsp =3D _rsp;
> > +
> > +	BUILD_BUG_ON(MAX77759_MAXQ_OPCODE_MAXLENGTH
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 !=3D MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX);
>=20
> Probably useful during development.=C2=A0 Let useful in production code.

This build bug ensures that if anybody ever changed one of the
macros in an incorrect way, things fall apart. One of the macros is
part of the API, the other one is derived internally in this driver.
Better to fail loudly, than to silently ignore such errors.

I'd rather leave this check in.

>=20
> > +	if (!rsp->length || rsp->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&max77759_mfd->maxq_lock);
> > +
> > +	reinit_completion(&max77759_mfd->cmd_done);
> > +
> > +	/* write the opcode and data */
>=20
> Upper case throughout please.

OK

> > +	ret =3D regmap_bulk_write(max77759_mfd->regmap_maxq,
> > +				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> > +				cmd->length);
> > +	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > +		/* writing the last byte triggers MaxQ */
> > +		ret =3D regmap_write(max77759_mfd->regmap_maxq,
> > +				=C2=A0=C2=A0 MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> > +	if (ret) {
>=20
> Do this first.

> Then you only need to check:
>=20
> =C2=A0 cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX
>=20
> ... in the subsequent statement.
>=20
> But what happens if:
>=20
> =C2=A0 !ret && cmd->length >=3D MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^
> Is that okay?=C2=A0 Nothing to be done?

Yes, that is OK for length=3D=3DMAX77759_MAXQ_REG_AP_MESSAGESZ_MAX

The command buffer is MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX byte long.

If the message to be sent is smaller than that, then the last byte
still needs to be written to MaxQ (DATAOUT32 register above) to
submit the command ("/* writing the last byte triggers MaxQ */"
comment above).

So there are three cases to cater for:

message > MESSAGESZ_MAX   -> return -EINVAL at start of function
message =3D=3D MESSAGESZ_MAX  -> just write message using regmap_bulk_write=
(),
                             DATAOUT32 will be written due to cmd->length
message < MESSAGESZ_MAX   -> write available bytes, then do dummy write
                             to DATAOUT32

As is, the code ensures that, it does the extra DATAOUT32 write only
if the bulk write succeeded and if necessary. It avoids duplicated
tests of the regmap_bulk_write() / regmap_write() return value.

With your suggestion, the code would become more complicated I believe:

	/* write the opcode and data */
	ret =3D regmap_bulk_write(max77759_mfd->regmap_maxq,
				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
				cmd->length);
	if (ret) {
		dev_err(dev, "write data failed: %d\n", ret);
		return ret;
	}
	if (cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX) {
		/* writing the last byte triggers MaxQ */
		ret =3D regmap_write(max77759_mfd->regmap_maxq,
				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
		if (ret) {
			dev_err(dev, "write data failed: %d\n", ret);
			return ret;
		}
	}

vs at the moment:

	/* write the opcode and data */
	ret =3D regmap_bulk_write(max77759_mfd->regmap_maxq,
				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
				cmd->length);
	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
		/* writing the last byte triggers MaxQ */
		ret =3D regmap_write(max77759_mfd->regmap_maxq,
				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
	if (ret) {
		dev_err(dev, "write data failed: %d\n", ret);
		return ret;
	}



>=20
> > +		dev_warn(dev, "write data failed: %d\n", ret);
>=20
> This should be dev_err().

OK.

>=20
> > +		return ret;
> > +	}
> > +
> > +	/* wait for response from MaxQ */
> > +	if (!wait_for_completion_timeout(&max77759_mfd->cmd_done,
> > +					 msecs_to_jiffies(timeout_ms))) {
> > +		dev_err(dev, "timed out waiting for data\n");
>=20
> What data?

I can change to 'reply'

>=20
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	ret =3D regmap_bulk_read(max77759_mfd->regmap_maxq,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_MAXQ_REG_AP_DATAIN0,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsp->rsp, rsp->length);
> > +	if (ret) {
> > +		dev_warn(dev, "read data failed: %d\n", ret);
>=20
> As above.

OK

>=20
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * As per the protocol, the first byte of the reply will match the
> > +	 * request.
> > +	 */
> > +	if (cmd->cmd[0] !=3D rsp->rsp[0]) {
> > +		dev_warn(dev, "unexpected opcode response for %#.2x: %*ph\n",
> > +			 cmd->cmd[0], (int)rsp->length, rsp->rsp);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(max77759_maxq_command);
> > +
> > +static irqreturn_t apcmdres_irq_handler(int irq, void *irq_data)
> > +{
> > +	struct max77759_mfd *max77759_mfd =3D irq_data;
> > +
> > +	regmap_write(max77759_mfd->regmap_maxq, MAX77759_MAXQ_REG_UIC_INT1,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI);
> > +
> > +	complete(&max77759_mfd->cmd_done);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int max77759_create_i2c_subdev(struct i2c_client *client,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max77759_mfd *max77759_mfd,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct max77759_i2c_subdev *s=
d)
> > +{
> > +	struct i2c_client *sub;
> > +	struct regmap *regmap;
> > +	int ret;
> > +
> > +	if (sd->i2c_address) {
> > +		sub =3D devm_i2c_new_dummy_device(&client->dev,
> > +						client->adapter,
> > +						sd->i2c_address);
> > +
> > +		if (IS_ERR(sub))
> > +			return dev_err_probe(&client->dev, PTR_ERR(sub),
> > +					"failed to claim i2c device %s\n",
>=20
> "I2C"

OK

>=20
> > +					sd->cfg->name);
> > +	} else {
> > +		sub =3D client;
>=20
> Assign during declaration, with a comment, then dispose of this leg.

OK

>=20
> > +	}
> > +
> > +	regmap =3D devm_regmap_init_i2c(sub, sd->cfg);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(&sub->dev, PTR_ERR(regmap),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
> > +
> > +	ret =3D regmap_attach_dev(&client->dev, regmap, sd->cfg);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap attach failed\n");
> > +
> > +	if (sd->id =3D=3D MAX77759_I2C_SUBDEV_ID_MAXQ)
> > +		max77759_mfd->regmap_maxq =3D regmap;
> > +	else if (sd->id =3D=3D MAX77759_I2C_SUBDEV_ID_CHARGER)
> > +		max77759_mfd->regmap_charger =3D regmap;
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77759_add_chained_irq_chip(struct device *dev,
> > +					 struct regmap *regmap,
> > +					 int pirq,
> > +					 struct regmap_irq_chip_data *parent,
> > +					 const struct regmap_irq_chip *chip,
> > +					 struct regmap_irq_chip_data **data)
> > +{
> > +	int irq, ret;
> > +
> > +	irq =3D regmap_irq_get_virq(parent, pirq);
> > +	if (irq < 0)
> > +		return dev_err_probe(dev, irq,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to get parent vIRQ(%d) for chip %=
s\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 pirq, chip->name);
> > +
> > +	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_ONESHOT | IRQF_SHARED, 0=
, chip,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to add %s IRQ chip\n",
>=20
> Some of your messages start will uppercase whilst others do not.
>=20
> *twitch*
>=20
> Please pick one and use throughout.

OK :-)


>=20
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 chip->name);
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77759_add_chained_maxq(struct i2c_client *client,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct max77759_mfd *max77759_mfd,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap_irq_chip_data *parent)
> > +{
> > +	struct regmap_irq_chip_data *irq_chip_data;
> > +	int ret;
>=20
> Bottom please.
>=20
> Some people like reverse Christmas tree.
>=20
> Structure helps me sleep at night!=C2=A0 =3D;-)

I usually declare in order of use - I'll change ordering; don't want
to rob you of your sleep :-))

>=20
> > +	int apcmdres_irq;
> > +
> > +	ret =3D max77759_add_chained_irq_chip(&client->dev,
> > +					=C2=A0=C2=A0=C2=A0 max77759_mfd->regmap_maxq,
> > +					=C2=A0=C2=A0=C2=A0 MAX77759_INT_MAXQ,
> > +					=C2=A0=C2=A0=C2=A0 parent,
> > +					=C2=A0=C2=A0=C2=A0 &max77759_maxq_irq_chip,
> > +					=C2=A0=C2=A0=C2=A0 &irq_chip_data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * We need to register our own IRQ handler before any MFD cells, to
> > +	 * ensure client drivers can use our MaxQ interface APIs without
> > +	 * any race conditions.
> > +	 */
>=20
> This is normal.

Will drop.

> > +	init_completion(&max77759_mfd->cmd_done);
> > +	apcmdres_irq =3D regmap_irq_get_virq(irq_chip_data,
> > +					=C2=A0=C2=A0 MAX77759_MAXQ_INT_APCMDRESI);
> > +
> > +	ret =3D devm_request_threaded_irq(&client->dev, apcmdres_irq,
> > +					NULL, apcmdres_irq_handler,
> > +					IRQF_ONESHOT | IRQF_SHARED,
> > +					dev_name(&client->dev), max77759_mfd);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "MAX77759_MAXQ_INT_APCMDRESI failed\n");
> > +
> > +	ret =3D devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > +				=C2=A0=C2=A0 max77759_maxq_cells,
> > +				=C2=A0=C2=A0 ARRAY_SIZE(max77759_maxq_cells),
> > +				=C2=A0=C2=A0 NULL, 0,
> > +				=C2=A0=C2=A0 regmap_irq_get_domain(irq_chip_data));
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to add MFD devices (MaxQ)\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77759_add_chained_topsys(struct i2c_client *client,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max77759_mfd *max77759=
_mfd,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap_irq_chip_data *=
parent)
> > +{
> > +	struct regmap_irq_chip_data *irq_chip_data;
> > +	int ret;
> > +
> > +	ret =3D max77759_add_chained_irq_chip(&client->dev,
> > +					=C2=A0=C2=A0=C2=A0 max77759_mfd->regmap_top,
> > +					=C2=A0=C2=A0=C2=A0 MAX77759_INT_TOPSYS,
> > +					=C2=A0=C2=A0=C2=A0 parent,
> > +					=C2=A0=C2=A0=C2=A0 &max77759_topsys_irq_chip,
> > +					=C2=A0=C2=A0=C2=A0 &irq_chip_data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77759_add_chained_charger(struct i2c_client *client,
> > +					struct max77759_mfd *max77759_mfd,
> > +					struct regmap_irq_chip_data *parent)
> > +{
> > +	struct regmap_irq_chip_data *irq_chip_data;
> > +	int ret;
> > +
> > +	ret =3D max77759_add_chained_irq_chip(&client->dev,
> > +					=C2=A0=C2=A0=C2=A0 max77759_mfd->regmap_charger,
> > +					=C2=A0=C2=A0=C2=A0 MAX77759_INT_CHGR,
> > +					=C2=A0=C2=A0=C2=A0 parent,
> > +					=C2=A0=C2=A0=C2=A0 &max77759_chrg_irq_chip,
> > +					=C2=A0=C2=A0=C2=A0 &irq_chip_data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > +				=C2=A0=C2=A0 max77759_charger_cells,
> > +				=C2=A0=C2=A0 ARRAY_SIZE(max77759_charger_cells),
> > +				=C2=A0=C2=A0 NULL, 0,
> > +				=C2=A0=C2=A0 regmap_irq_get_domain(irq_chip_data));
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to add MFD devices (charger)\n");
>=20
> "sub" or "child" devices.

OK

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int max77759_probe(struct i2c_client *client)
> > +{
> > +	struct regmap *regmap_top;
> > +	unsigned int pmic_id;
> > +	int ret;
> > +	struct irq_data *irq_data;
> > +	struct max77759_mfd *max77759_mfd;
> > +	unsigned long irq_flags;
> > +	struct regmap_irq_chip_data *irq_chip_data_pmic;
>=20
> Structure !

As above, and I'll change it.

>=20
> > +
> > +	regmap_top =3D devm_regmap_init_i2c(client, &max77759_regmap_config_t=
op);
> > +	if (IS_ERR(regmap_top))
> > +		return dev_err_probe(&client->dev, PTR_ERR(regmap_top),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
>=20
> Which regmap failed?

There's only one regmap for 'client'. The other regmaps are for the
different i2c dummy devices created, and will cause the error message
to have a different device name prefix.

I'll update the messages.

>=20
> > +	ret =3D regmap_read(regmap_top, MAX77759_PMIC_REG_PMIC_ID, &pmic_id);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Unable to read Device ID\n");
> > +
> > +	if (pmic_id !=3D MAX77759_PMIC_REG_PMIC_ID_MAX77759)
> > +		return dev_err_probe(&client->dev, -ENODEV,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Unsupported Device ID %#.2x (%d)\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 pmic_id, pmic_id);
> > +
> > +	irq_data =3D irq_get_irq_data(client->irq);
> > +	if (!irq_data)
> > +		return dev_err_probe(&client->dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid IRQ: %d\n", client->irq);
> > +
> > +	max77759_mfd =3D devm_kzalloc(&client->dev, sizeof(*max77759_mfd),
> > +				=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> > +	if (!max77759_mfd)
> > +		return -ENOMEM;
>=20
> Device data is almost universally allocated at the top of .probe().

Will do.

>=20
> > +	max77759_mfd->regmap_top =3D regmap_top;
>=20
> These two blocks are unrelated - please separate them with a line break h=
ere.

Will do.

>=20
> > +	ret =3D devm_mutex_init(&client->dev, &max77759_mfd->maxq_lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	i2c_set_clientdata(client, max77759_mfd);
> > +
> > +	for (int i =3D 0; i < ARRAY_SIZE(max77759_i2c_subdevs); ++i) {
>=20
> Any reason for the pre-increment?
>=20
> If not, it's more standards to post-inc.

My reason is that historically compilers have created better code
with preinc, and I generally still prefer it, to make it obvious.

There are thousands of users doing preinc in for loops in the kernel
tree, so unless you really insist, I'd like to keep it that way for
that reason if you're OK with reason :-)

> > +		ret =3D max77759_create_i2c_subdev(client,
> > +						 max77759_mfd,
> > +						 &max77759_i2c_subdevs[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	irq_flags =3D IRQF_ONESHOT | IRQF_SHARED;
> > +	irq_flags |=3D irqd_get_trigger_type(irq_data);
> > +
> > +	ret =3D devm_regmap_add_irq_chip(&client->dev, max77759_mfd->regmap_t=
op,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 client->irq, irq_flags, 0,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &max77759_pmic_irq_chip,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &irq_chip_data_pmic);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to add IRQ chip\n");
> > +
> > +	/* INTSRC - MaxQ & children */
>=20
> What does these comments add beyond what is already obvious by the nomenc=
lature?

Visual separation.

>=20
> > +	ret =3D max77759_add_chained_maxq(client, max77759_mfd,
> > +					irq_chip_data_pmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* INTSRC - topsys & children */
> > +	ret =3D max77759_add_chained_topsys(client, max77759_mfd,
> > +					=C2=A0 irq_chip_data_pmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* INTSRC - charger & children */
> > +	ret =3D max77759_add_chained_charger(client, max77759_mfd,
> > +					=C2=A0=C2=A0 irq_chip_data_pmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > +				=C2=A0=C2=A0=C2=A0 max77759_cells, ARRAY_SIZE(max77759_cells),
> > +				=C2=A0=C2=A0=C2=A0 NULL, 0,
> > +				=C2=A0=C2=A0=C2=A0 regmap_irq_get_domain(irq_chip_data_pmic));
> > +}
> > +
> > +static const struct i2c_device_id max77759_i2c_id[] =3D {
> > +	{ "max77759", 0 },
>=20
> The driver data attribute can be omitted if it's 0.
>=20
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
> > +
> > +static const struct of_device_id max77759_of_id[] =3D {
> > +	{ .compatible =3D "maxim,max77759", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, max77759_of_id);
> > +
> > +static struct i2c_driver max77759_i2c_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "max77759",
> > +		.of_match_table =3D max77759_of_id,
> > +	},
> > +	.probe =3D max77759_probe,
> > +	.id_table =3D max77759_i2c_id,
> > +};
> > +module_i2c_driver(max77759_i2c_driver);
> > +
> > +MODULE_AUTHOR("Andr=C3=A9 Draszik <andre.draszik@linaro.org>");
> > +MODULE_DESCRIPTION("Maxim MAX77759 multi-function core driver");
>=20
> No it isn't. :)

OK

>=20
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.=
h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b038b4e9b748287e23e3a70=
30496f09dc8bdc816
> > --- /dev/null
> > +++ b/include/linux/mfd/max77759.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright 2020 Google Inc.
> > + * Copyright 2025 Linaro Ltd.
> > + *
> > + * Client interface for Maxim MAX77759 MFD driver
> > + */
> > +
> > +#ifndef __LINUX_MFD_MAX77759_H
> > +#define __LINUX_MFD_MAX77759_H
> > +
> > +/* MaxQ opcodes */
> > +#define MAX77759_MAXQ_OPCODE_MAXLENGTH 33
> > +
> > +#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_READ=C2=A0=C2=A0 0x21
> > +#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_WRITE=C2=A0 0x22
> > +#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_READ=C2=A0=C2=A0 0x23
> > +#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_WRITE=C2=A0 0x24
> > +#define MAX77759_MAXQ_OPCODE_USER_SPACE_READ=C2=A0=C2=A0=C2=A0=C2=A0 0=
x81
> > +#define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE=C2=A0=C2=A0=C2=A0 0x82
> > +
> > +/*
> > + * register map (incomplete) - registers not useful for drivers are no=
t
> > + * declared here
> > + */
> > +/* MaxQ */
> > +#define MAX77759_MAXQ_REG_UIC_INT1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x64
> > +#define MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI=C2=A0 BIT(7)
> > +#define MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI=C2=A0=C2=A0=C2=A0 BIT(6)
> > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIO6I=C2=A0=C2=A0=C2=A0=C2=A0 BIT(=
1)
> > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIO5I=C2=A0=C2=A0=C2=A0=C2=A0 BIT(=
0)
> > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, en)=C2=A0 (((en) & 1) =
<< (offs))
> > +#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(offs) \
> > +				MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, ~0)
> > +
> > +#define MAX77759_MAXQ_REG_UIC_INT2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x65
> > +#define MAX77759_MAXQ_REG_UIC_INT3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x66
> > +#define MAX77759_MAXQ_REG_UIC_INT4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x67
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS1=C2=A0=C2=A0=C2=A0=C2=A0 0x68
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS2=C2=A0=C2=A0=C2=A0=C2=A0 0x69
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS3=C2=A0=C2=A0=C2=A0=C2=A0 0x6a
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS4=C2=A0=C2=A0=C2=A0=C2=A0 0x6b
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS5=C2=A0=C2=A0=C2=A0=C2=A0 0x6c
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS6=C2=A0=C2=A0=C2=A0=C2=A0 0x6d
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS7=C2=A0=C2=A0=C2=A0=C2=A0 0x6f
> > +#define MAX77759_MAXQ_REG_UIC_UIC_STATUS8=C2=A0=C2=A0=C2=A0=C2=A0 0x6f
> > +#define MAX77759_MAXQ_REG_UIC_INT1_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x70
> > +#define MAX77759_MAXQ_REG_UIC_INT2_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x71
> > +#define MAX77759_MAXQ_REG_UIC_INT3_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x72
> > +#define MAX77759_MAXQ_REG_UIC_INT4_M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x73
> > +
> > +/* charger */
> > +#define MAX77759_CHGR_REG_CHG_INT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xb0
> > +#define MAX77759_CHGR_REG_CHG_INT2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0xb1
> > +#define MAX77759_CHGR_REG_CHG_INT_MASK=C2=A0=C2=A0 0xb2
> > +#define MAX77759_CHGR_REG_CHG_INT2_MASK=C2=A0 0xb3
> > +
> > +struct max77759_mfd;
>=20
> Place the definition in here instead.

I would like to keep it private. There is no need for it to
become public, it's meant to be an opaque handle.


Thanks again Lee for you detailed review!

Cheers,
Andre'

>=20
> > +/**
> > + * struct max77759_maxq_command - structure containing the MaxQ comman=
d to
> > + * send
> > + *
> > + * @length: The number of bytes to send.
> > + * @cmd: The data to send.
> > + */
> > +struct max77759_maxq_command {
> > +	u8 length;
> > +	u8 cmd[] __counted_by(length);
> > +};
> > +
> > +/**
> > + * struct max77759_maxq_response - structure containing the MaxQ respo=
nse
> > + *
> > + * @length: The number of bytes to receive.
> > + * @rsp: The data received. Must have at least @length bytes space.
> > + */
> > +struct max77759_maxq_response {
> > +	u8 length;
> > +	u8 rsp[] __counted_by(length);
> > +};
> > +
> > +/**
> > + * max77759_maxq_command() - issue a MaxQ command and wait for the res=
ponse
> > + * and associated data
> > + *
> > + * @max77759_mfd: The core max77759 mfd device handle.
> > + * @cmd: The command to be sent.
> > + * @rsp: Any response data associated with the command will be copied =
here;
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 can be %NULL if the command has no response=
 (other than ACK).
> > + *
> > + * Return: 0 on success, a negative error number otherwise.
> > + */
> > +int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
> > +			=C2=A0 const struct max77759_maxq_command *cmd,
> > +			=C2=A0 struct max77759_maxq_response *rsp);
> > +
> > +#endif /* __LINUX_MFD_MAX77759_H */
> >=20
> > --=20
> > 2.49.0.rc0.332.g42c0ae87b1-goog
> >=20
>=20


