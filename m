Return-Path: <linux-gpio+bounces-36488-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP6/LGo3AGreEQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36488-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 09:44:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF74502FC6
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 09:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 210603010507
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 07:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C8C366816;
	Sun, 10 May 2026 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Srw5A2bC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D83603D3;
	Sun, 10 May 2026 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778399061; cv=none; b=qKDf0mimbHgrwYsrWbp+53xj/rfEplWE0jSmqyumyKxLTi2m/g3lvU5X6nQXZnoi9CaP+iTpllaYIOu9qVHYBgZln8Smku4Qvnn0Ba3aEcCW4A3xqrBdjsa6ZoJUBvdTLHX7f4/ZUrtE/+biit8Bzroq9tVZ4dMNsmaA9NXx1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778399061; c=relaxed/simple;
	bh=JdzQ4anNbdp6hZvOcAV+vpR6o5TNnOw3BRE3u7jPJ3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdY6rirlFDtpJv35mXfweyLD1Nhj8tyR+/aOoPS6HREt+YbTm0g4080LjphaYGyNJhIMa3wZdH8PQd0LKFUfGTMH2bxY06Xhg2jaJfrlu7OIPIhRRDsxM5OCpIZJxeoVO/Bh8RGeEgP/jUl5Izj8niVJRof/aW2UZUAg/2jMl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Srw5A2bC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418C4C2BCB8;
	Sun, 10 May 2026 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778399061;
	bh=JdzQ4anNbdp6hZvOcAV+vpR6o5TNnOw3BRE3u7jPJ3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Srw5A2bCOfwk/jitLq7nfgkj2WCDxxbD2FIBLb/TQTOLxKHcxidSYyuEZ03osjmdr
	 L2IwVt0iQHGEMwt3ajEdM28j7rl+pXTUfjkDXJpRNoTX5T7UtMAd1hA3+UElo/ftTl
	 GxbOZ6eIY30unSLP0f08qKwX6VbzVh7A3m2pJov14i86Qq4xSgZeO/A775E3tFmWIK
	 vnApd2+1/75BEmcmurPKNeJU7HFX11y76Wd/dFytTW5BGfXWPz+RUzza3mXvoVryXe
	 HqHDRV3w8lReiaKoZjwCjs0cUXLMw673Uco1IorVW50vL8YSf0DgjZl81FCpwXOgUu
	 emf7xO9RWG0rA==
Date: Sun, 10 May 2026 13:14:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 05/12] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <agA3URhGA1u6R7LD@vaman>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-6-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-6-zhengxingda@iscas.ac.cn>
X-Rspamd-Queue-Id: 3FF74502FC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36488-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Action: no action

On 07-05-26, 16:17, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> As a few PHY parameters' default value isn't ready to work, add a driver
> configuring them before letting the PHY run, in addition to
> clock/reset/regulator management.

Is there any dependency on the rest of series, if not please split up!

Some warnings flagged by sashiko, please check
https://sashiko.dev/#/patchset/20260507081710.4090814-1-zhengxingda%40iscas.ac.cn


> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  drivers/phy/Kconfig                |   1 +
>  drivers/phy/Makefile               |   1 +
>  drivers/phy/thead/Kconfig          |  12 ++
>  drivers/phy/thead/Makefile         |   2 +
>  drivers/phy/thead/phy-th1520-usb.c | 197 +++++++++++++++++++++++++++++
>  5 files changed, 213 insertions(+)
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 227b9a4c612e8..ea1a52e14b839 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -164,6 +164,7 @@ source "drivers/phy/st/Kconfig"
>  source "drivers/phy/starfive/Kconfig"
>  source "drivers/phy/sunplus/Kconfig"
>  source "drivers/phy/tegra/Kconfig"
> +source "drivers/phy/thead/Kconfig"
>  source "drivers/phy/ti/Kconfig"
>  source "drivers/phy/xilinx/Kconfig"
>  
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f49d83f00a3d8..4604522548c91 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -48,5 +48,6 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   starfive/	\
>  					   sunplus/	\
>  					   tegra/	\
> +					   thead/	\
>  					   ti/		\
>  					   xilinx/
> diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
> new file mode 100644
> index 0000000000000..14012db5973c4
> --- /dev/null
> +++ b/drivers/phy/thead/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config PHY_TH1520_USB
> +	tristate "USB PHY driver for T-Head TH1520 SoC"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on HAS_IOMEM
> +	depends on OF
> +	depends on RESET_CONTROLLER
> +	select GENERIC_PHY
> +	default ARCH_THEAD

Why should this be default?

> +	help
> +	  Enable support for the USB PHY on the T-Head TH1520 SoC.
> diff --git a/drivers/phy/thead/Makefile b/drivers/phy/thead/Makefile
> new file mode 100644
> index 0000000000000..5b459bc7004bd
> --- /dev/null
> +++ b/drivers/phy/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_TH1520_USB) += phy-th1520-usb.o
> diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-th1520-usb.c
> new file mode 100644
> index 0000000000000..c87bd779bbb74
> --- /dev/null
> +++ b/drivers/phy/thead/phy-th1520-usb.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
> + *
> + * Authors:
> + * Icenowy Zheng <zhengxingda@iscas.ac.cn>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +
> +#define USB_SYSCON_OFFSET		0xf000
> +
> +/* All the below registers are in the USB syscon region */
> +#define USB_CLK_GATE_STS		0x0
> +#define USB_LOGIC_ANALYZER_TRACE_STS0	0x4
> +#define USB_LOGIC_ANALYZER_TRACE_STS1	0x8
> +#define USB_GPIO			0xc
> +#define USB_DEBUG_STS0			0x10
> +#define USB_DEBUG_STS1			0x14
> +#define USB_DEBUG_STS2			0x18
> +#define USBCTL_CLK_CTRL0		0x1c
> +#define USBPHY_CLK_CTRL1		0x20
> +#define USBPHY_TEST_CTRL0		0x24
> +#define USBPHY_TEST_CTRL1		0x28
> +#define USBPHY_TEST_CTRL2		0x2c
> +#define USBPHY_TEST_CTRL3		0x30
> +#define USB_SSP_EN			0x34
> +#define USB_HADDR_SEL			0x38
> +#define USB_SYS				0x3c
> +#define USB_HOST_STATUS			0x40
> +#define USB_HOST_CTRL			0x44
> +#define USBPHY_HOST_CTRL		0x48
> +#define USBPHY_HOST_STATUS		0x4c
> +#define USB_TEST_REG0			0x50
> +#define USB_TEST_REG1			0x54
> +#define USB_TEST_REG2			0x58
> +#define USB_TEST_REG3			0x5c

Why do need these test registers, they seem unused?

> +
> +#define USB_SYS_COMMONONN		BIT(0)
> +
> +#define USB_SSP_EN_REF_SSP_EN		BIT(0)
> +
> +struct th1520_usb_phy {
> +	struct platform_device *pdev;
> +	struct phy *phy;
> +	struct regmap *regmap;
> +	struct clk *ref_clk;
> +	struct reset_control *phy_reset;
> +};
> +
> +static int th1520_usb_phy_init(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = clk_prepare_enable(th1520_phy->ref_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_assert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	/*
> +	 * Do some initial PHY setup:
> +	 * - Set COMMONONN to allow the PHY to automatically power down.
> +	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
> +	 *   PHY clock PLL.
> +	 */
> +	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
> +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
> +
> +	ret = reset_control_deassert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	udelay(10);
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +	return ret;
> +}
> +
> +static int th1520_usb_phy_exit(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = reset_control_assert(th1520_phy->phy_reset);
> +	if (ret)
> +		return ret;
> +
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops th1520_usb_phy_ops = {
> +	.init		= th1520_usb_phy_init,
> +	.exit		= th1520_usb_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct regmap_config phy_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = USB_TEST_REG3,
> +};
> +
> +static int th1520_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct th1520_usb_phy *th1520_phy;
> +	struct reset_control *bus_reset;
> +	void __iomem *base;
> +	int ret;
> +
> +	th1520_phy = devm_kzalloc(dev, sizeof(*th1520_phy), GFP_KERNEL);
> +	if (!th1520_phy)
> +		return -ENOMEM;
> +
> +	th1520_phy->pdev = pdev;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	th1520_phy->ref_clk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(th1520_phy->ref_clk))
> +		return PTR_ERR(th1520_phy->ref_clk);
> +
> +	/* De-assert the bus reset and leave it that way */
> +	bus_reset = devm_reset_control_get_exclusive_deasserted(dev, "bus");
> +	if (IS_ERR(bus_reset))
> +		return PTR_ERR(bus_reset);
> +
> +	th1520_phy->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
> +	if (IS_ERR(th1520_phy->phy_reset))
> +		return PTR_ERR(th1520_phy->phy_reset);
> +
> +	/*
> +	 * Schematics of several boards (Lichee Module 4A/Milk-V Meles)
> +	 * describe this power rail as always-on.
> +	 */
> +	ret = devm_regulator_get_enable(dev, "avdd33-usb3");
> +	if (ret)
> +		return ret;
> +
> +	th1520_phy->regmap = devm_regmap_init_mmio_clk(dev, "bus",
> +						       base + USB_SYSCON_OFFSET,
> +						       &phy_regmap_config);
> +	if (IS_ERR(th1520_phy->regmap))
> +		return dev_err_probe(dev, PTR_ERR(th1520_phy->regmap),
> +				     "Failed to init regmap\n");
> +
> +	th1520_phy->phy = devm_phy_create(dev, dev->of_node, &th1520_usb_phy_ops);
> +	if (IS_ERR(th1520_phy->phy)) {
> +		dev_err(dev, "failed to create PHY\n");
> +		return PTR_ERR(th1520_phy->phy);
> +	}
> +
> +	phy_set_drvdata(th1520_phy->phy, th1520_phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id th1520_usb_phy_of_table[] = {
> +	{ .compatible = "thead,th1520-usb-phy" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, th1520_usb_phy_of_table);
> +
> +static struct platform_driver th1520_usb_phy_driver = {
> +	.driver = {
> +		.name = "th1520-usb-phy",
> +		.of_match_table = th1520_usb_phy_of_table,
> +	},
> +	.probe = th1520_usb_phy_probe,
> +};
> +
> +module_platform_driver(th1520_usb_phy_driver);
> +
> +MODULE_DESCRIPTION("T-Head TH1520 USB PHY driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.52.0

-- 
~Vinod

