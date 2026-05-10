Return-Path: <linux-gpio+bounces-36489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJoWO3xNAGqsGAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 11:18:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA385034D5
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 11:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AC6F3003619
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 09:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F132F36C58F;
	Sun, 10 May 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="W+CXC9SL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134AE1A9FBC;
	Sun, 10 May 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778404729; cv=pass; b=DJLQhKu1TO0jQ15a6NSFbj7oX58BlZZBMQt7NSLjcjGVoatpzijjZ4UQohYvdCJgk4y1q/AJDyWWZ8u4ohmnCpwqTrflZ16u1/901gga1+RO57Dg/ZNUvs5XHqiMd32U7FTlibMLvGDEkoGAGaDcurWaXwrvJRc7yEHHul9RPro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778404729; c=relaxed/simple;
	bh=4RvJQAtKAEQmYjKPkscFIii3Dot9Cnt6YFZgKaLkjiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s8XRCvS/2qTjo5OouxAc+hW0VORhdg9QCsRgl4zQlaQBQTnaRD7TysoG8QvUF3yQcGIWg1EQ1hS2oNNc0ZmOCygrccYILSvyazm40pVPXHn9J/UY6rUV/VkgfZCrHCj13hFAtESOKGAthMd1PSbllpn/8m7gwacdOmbd/mPOTTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=W+CXC9SL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1778404694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NpW9zYa1oHpFoduv/89cZTj3IJVyCerCeDbLG4x9oS+mbTvHFWv6zdqBHGRJ5OuOb9ZnWZp7cpMNNdxkdUVIbgFsVWakmfpjPdOFwMIN+ioghStdyD2qmupZPpSz/F62ANIb6fF3kv6spU/7jt7znzgxrx5RYkNwOQVaBCrmAtg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778404694; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pF/MAuFbMXTlizcjlRu52Hks3i0WzgCLalQH82GrqJE=; 
	b=kmao7xBi/Jn+yysjZJ5vJyg5RB7n0NfMt2IiZtYV7hGiKoLcXkt8h5nOjm/wfdZ6s/PtoBL7Lk5yEZq4EMJ/zvI7HqRKniWiIrynEn4Ahku/pwnyIocrwXUnX5poqs1BekrKaoXXWxRlKABe/p5lqIWubB7Csk43VtOdeWg12rU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778404694;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=pF/MAuFbMXTlizcjlRu52Hks3i0WzgCLalQH82GrqJE=;
	b=W+CXC9SLhWU1ajzYyABpo4ZyrX1N3ffKjJp76YPGw0adafG/X5iUuy1KIWhiGE+c
	H0ePDR+io+VumZmz43JPYbqg8UQevq+S4uKHMB5XT+N3zw9zJulsTdPw1uhm7ZkbmT/
	6HgjJDN4iwR42Nu5yYIBlB1pv2+0vbqnze0YvblrQenWFVZ5Wy6ulJFSjXkM+Fqsh5s
	PauViM9Z4Q3WJHyhpALIpBqCbAvhexklGr4eap6Lrk5JUoy+b6sOjUJaHXRVFN5blYI
	zik3jsKT1KAUZtnJmTlNKYDrEScscuRe0dztWVS7dzesJJJhP1JmJVOgf5i8KMv8lei
	Ws7p1QIj0Q==
Received: by mx.zohomail.com with SMTPS id 1778404691210603.5709819095284;
	Sun, 10 May 2026 02:18:11 -0700 (PDT)
Message-ID: <244b01b015ffd8e859ff30101d7743ff1c0fd899.camel@icenowy.me>
Subject: Re: [PATCH 05/12] phy: add a driver for T-Head TH1520 USB PHY
From: Icenowy Zheng <uwu@icenowy.me>
To: Vinod Koul <vkoul@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei	
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Jisheng Zhang	 <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-usb@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi	 <ziyao@disroot.org>
Date: Sun, 10 May 2026 17:17:59 +0800
In-Reply-To: <agA3URhGA1u6R7LD@vaman>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-6-zhengxingda@iscas.ac.cn> <agA3URhGA1u6R7LD@vaman>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 7EA385034D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36489-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,gmail.com,disroot.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Action: no action

=E5=9C=A8 2026-05-10=E6=97=A5=E7=9A=84 13:14 +0530=EF=BC=8CVinod Koul=E5=86=
=99=E9=81=93=EF=BC=9A
> On 07-05-26, 16:17, Icenowy Zheng wrote:
> > The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY,
> > with
> > some PHY parameters exported as another system controller along
> > with it.
> >=20
> > As a few PHY parameters' default value isn't ready to work, add a
> > driver
> > configuring them before letting the PHY run, in addition to
> > clock/reset/regulator management.
>=20
> Is there any dependency on the rest of series, if not please split
> up!

I want to give reviewers a whole view of the implementation, although
the phy driver doesn't depends on other patches.

I am okay to split it out in the next revision.

>=20
> Some warnings flagged by sashiko, please check
> https://sashiko.dev/#/patchset/20260507081710.4090814-1-zhengxingda%40isc=
as.ac.cn
>=20
>=20
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0drivers/phy/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/phy/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/phy/thead/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> > =C2=A0drivers/phy/thead/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/phy/thead/phy-th1520-usb.c | 197
> > +++++++++++++++++++++++++++++
> > =C2=A05 files changed, 213 insertions(+)
> > =C2=A0create mode 100644 drivers/phy/thead/Kconfig
> > =C2=A0create mode 100644 drivers/phy/thead/Makefile
> > =C2=A0create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> >=20
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 227b9a4c612e8..ea1a52e14b839 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -164,6 +164,7 @@ source "drivers/phy/st/Kconfig"
> > =C2=A0source "drivers/phy/starfive/Kconfig"
> > =C2=A0source "drivers/phy/sunplus/Kconfig"
> > =C2=A0source "drivers/phy/tegra/Kconfig"
> > +source "drivers/phy/thead/Kconfig"
> > =C2=A0source "drivers/phy/ti/Kconfig"
> > =C2=A0source "drivers/phy/xilinx/Kconfig"
> > =C2=A0
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index f49d83f00a3d8..4604522548c91 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -48,5 +48,6 @@ obj-$(CONFIG_GENERIC_PHY)		+=3D
> > allwinner/	\
> > =C2=A0					=C2=A0=C2=A0 starfive/	\
> > =C2=A0					=C2=A0=C2=A0 sunplus/	\
> > =C2=A0					=C2=A0=C2=A0 tegra/	\
> > +					=C2=A0=C2=A0 thead/	\
> > =C2=A0					=C2=A0=C2=A0 ti/		\
> > =C2=A0					=C2=A0=C2=A0 xilinx/
> > diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
> > new file mode 100644
> > index 0000000000000..14012db5973c4
> > --- /dev/null
> > +++ b/drivers/phy/thead/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config PHY_TH1520_USB
> > +	tristate "USB PHY driver for T-Head TH1520 SoC"
> > +	depends on ARCH_THEAD || COMPILE_TEST
> > +	depends on COMMON_CLK
> > +	depends on HAS_IOMEM
> > +	depends on OF
> > +	depends on RESET_CONTROLLER
> > +	select GENERIC_PHY
> > +	default ARCH_THEAD
>=20
> Why should this be default?

Okay, I will drop the default clause.

>=20
> > +	help
> > +	=C2=A0 Enable support for the USB PHY on the T-Head TH1520 SoC.
> > diff --git a/drivers/phy/thead/Makefile
> > b/drivers/phy/thead/Makefile
> > new file mode 100644
> > index 0000000000000..5b459bc7004bd
> > --- /dev/null
> > +++ b/drivers/phy/thead/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_PHY_TH1520_USB) +=3D phy-th1520-usb.o
> > diff --git a/drivers/phy/thead/phy-th1520-usb.c
> > b/drivers/phy/thead/phy-th1520-usb.c
> > new file mode 100644
> > index 0000000000000..c87bd779bbb74
> > --- /dev/null
> > +++ b/drivers/phy/thead/phy-th1520-usb.c
> > @@ -0,0 +1,197 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2026 Institute of Software, Chinese Academy of
> > Sciences (ISCAS)
> > + *
> > + * Authors:
> > + * Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/reset.h>
> > +
> > +#define USB_SYSCON_OFFSET		0xf000
> > +
> > +/* All the below registers are in the USB syscon region */
> > +#define USB_CLK_GATE_STS		0x0
> > +#define USB_LOGIC_ANALYZER_TRACE_STS0	0x4
> > +#define USB_LOGIC_ANALYZER_TRACE_STS1	0x8
> > +#define USB_GPIO			0xc
> > +#define USB_DEBUG_STS0			0x10
> > +#define USB_DEBUG_STS1			0x14
> > +#define USB_DEBUG_STS2			0x18
> > +#define USBCTL_CLK_CTRL0		0x1c
> > +#define USBPHY_CLK_CTRL1		0x20
> > +#define USBPHY_TEST_CTRL0		0x24
> > +#define USBPHY_TEST_CTRL1		0x28
> > +#define USBPHY_TEST_CTRL2		0x2c
> > +#define USBPHY_TEST_CTRL3		0x30
> > +#define USB_SSP_EN			0x34
> > +#define USB_HADDR_SEL			0x38
> > +#define USB_SYS				0x3c
> > +#define USB_HOST_STATUS			0x40
> > +#define USB_HOST_CTRL			0x44
> > +#define USBPHY_HOST_CTRL		0x48
> > +#define USBPHY_HOST_STATUS		0x4c
> > +#define USB_TEST_REG0			0x50
> > +#define USB_TEST_REG1			0x54
> > +#define USB_TEST_REG2			0x58
> > +#define USB_TEST_REG3			0x5c
>=20
> Why do need these test registers, they seem unused?

The register list is copied from the SoC manual, although most of them
are unused.

Should I remove all unused registers, as the manual is publicly
available?

Thanks,
Icenowy
>=20
> > +
> > +#define USB_SYS_COMMONONN		BIT(0)
> > +
> > +#define USB_SSP_EN_REF_SSP_EN		BIT(0)
> > +
> > +struct th1520_usb_phy {
> > +	struct platform_device *pdev;
> > +	struct phy *phy;
> > +	struct regmap *regmap;
> > +	struct clk *ref_clk;
> > +	struct reset_control *phy_reset;
> > +};
> > +
> > +static int th1520_usb_phy_init(struct phy *phy)
> > +{
> > +	struct th1520_usb_phy *th1520_phy =3D phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret =3D clk_prepare_enable(th1520_phy->ref_clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D reset_control_assert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		goto err_disable_clk;
> > +
> > +	/*
> > +	 * Do some initial PHY setup:
> > +	 * - Set COMMONONN to allow the PHY to automatically power
> > down.
> > +	 * - Set REF_SSP_EN to enable feeding reference clock to
> > SuperSpeed
> > +	 *=C2=A0=C2=A0 PHY clock PLL.
> > +	 */
> > +	regmap_set_bits(th1520_phy->regmap, USB_SYS,
> > USB_SYS_COMMONONN);
> > +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN,
> > USB_SSP_EN_REF_SSP_EN);
> > +
> > +	ret =3D reset_control_deassert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		goto err_disable_clk;
> > +
> > +	udelay(10);
> > +
> > +	return 0;
> > +
> > +err_disable_clk:
> > +	clk_disable_unprepare(th1520_phy->ref_clk);
> > +	return ret;
> > +}
> > +
> > +static int th1520_usb_phy_exit(struct phy *phy)
> > +{
> > +	struct th1520_usb_phy *th1520_phy =3D phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret =3D reset_control_assert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	clk_disable_unprepare(th1520_phy->ref_clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct phy_ops th1520_usb_phy_ops =3D {
> > +	.init		=3D th1520_usb_phy_init,
> > +	.exit		=3D th1520_usb_phy_exit,
> > +	.owner		=3D THIS_MODULE,
> > +};
> > +
> > +static const struct regmap_config phy_regmap_config =3D {
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +	.max_register =3D USB_TEST_REG3,
> > +};
> > +
> > +static int th1520_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct phy_provider *phy_provider;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct th1520_usb_phy *th1520_phy;
> > +	struct reset_control *bus_reset;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	th1520_phy =3D devm_kzalloc(dev, sizeof(*th1520_phy),
> > GFP_KERNEL);
> > +	if (!th1520_phy)
> > +		return -ENOMEM;
> > +
> > +	th1520_phy->pdev =3D pdev;
> > +
> > +	base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	th1520_phy->ref_clk =3D devm_clk_get(dev, "ref");
> > +	if (IS_ERR(th1520_phy->ref_clk))
> > +		return PTR_ERR(th1520_phy->ref_clk);
> > +
> > +	/* De-assert the bus reset and leave it that way */
> > +	bus_reset =3D
> > devm_reset_control_get_exclusive_deasserted(dev, "bus");
> > +	if (IS_ERR(bus_reset))
> > +		return PTR_ERR(bus_reset);
> > +
> > +	th1520_phy->phy_reset =3D
> > devm_reset_control_get_exclusive(dev, "phy");
> > +	if (IS_ERR(th1520_phy->phy_reset))
> > +		return PTR_ERR(th1520_phy->phy_reset);
> > +
> > +	/*
> > +	 * Schematics of several boards (Lichee Module 4A/Milk-V
> > Meles)
> > +	 * describe this power rail as always-on.
> > +	 */
> > +	ret =3D devm_regulator_get_enable(dev, "avdd33-usb3");
> > +	if (ret)
> > +		return ret;
> > +
> > +	th1520_phy->regmap =3D devm_regmap_init_mmio_clk(dev, "bus",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base +
> > USB_SYSCON_OFFSET,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > &phy_regmap_config);
> > +	if (IS_ERR(th1520_phy->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(th1520_phy-
> > >regmap),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to init regmap\n");
> > +
> > +	th1520_phy->phy =3D devm_phy_create(dev, dev->of_node,
> > &th1520_usb_phy_ops);
> > +	if (IS_ERR(th1520_phy->phy)) {
> > +		dev_err(dev, "failed to create PHY\n");
> > +		return PTR_ERR(th1520_phy->phy);
> > +	}
> > +
> > +	phy_set_drvdata(th1520_phy->phy, th1520_phy);
> > +
> > +	phy_provider =3D devm_of_phy_provider_register(dev,
> > of_phy_simple_xlate);
> > +
> > +	return PTR_ERR_OR_ZERO(phy_provider);
> > +}
> > +
> > +static const struct of_device_id th1520_usb_phy_of_table[] =3D {
> > +	{ .compatible =3D "thead,th1520-usb-phy" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, th1520_usb_phy_of_table);
> > +
> > +static struct platform_driver th1520_usb_phy_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "th1520-usb-phy",
> > +		.of_match_table =3D th1520_usb_phy_of_table,
> > +	},
> > +	.probe =3D th1520_usb_phy_probe,
> > +};
> > +
> > +module_platform_driver(th1520_usb_phy_driver);
> > +
> > +MODULE_DESCRIPTION("T-Head TH1520 USB PHY driver");
> > +MODULE_LICENSE("GPL");
> > --=20
> > 2.52.0

