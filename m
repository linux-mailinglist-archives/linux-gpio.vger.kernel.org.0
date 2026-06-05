Return-Path: <linux-gpio+bounces-38014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cbb/ODHwImrrfQEAu9opvQ
	(envelope-from <linux-gpio+bounces-38014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 17:50:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564C6497A6
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 17:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=LSb3DbXw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38014-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38014-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4038030B8270
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 15:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C894B8DFD;
	Fri,  5 Jun 2026 15:36:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D3309EE7;
	Fri,  5 Jun 2026 15:36:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673779; cv=none; b=uKDwJOjZnsIForo4tV8lYv1yZ2ACrRqmLU+YYaZQws3E3kX1QtP1u6GB6KQ1PvBW9VNBB1aIIl4HlC8nD/jfXOSmIDzBV3PRIkS0BYSyqnBomOJ/tIxOi/LKEOgWzH8IXCIHfACd0U/rE1vPXlv5f0YfMdE5VWJxPw6naf5JGoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673779; c=relaxed/simple;
	bh=n83rW4eamdlQ8FGqJ0dCVHLwmywwEa//w82pSDEfiJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eh1hOHNc/RJQLzg46rBVwngm9X9/aQFY9MvQWDgkZ5t2HVoCJ/4D4XSfnx/4gp61QKhyC1BTHO9gNEhZ5zH0Ki14/o7l+L9H1R0Ad+sohcyyW/LMJf4TTauPa33UC66Iyq5fh47J5H0UcAH52kfhivRmVnPBkST9JhvGAUXmpwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LSb3DbXw; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 91F194E40859;
	Fri,  5 Jun 2026 15:36:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A1AB5FED1;
	Fri,  5 Jun 2026 15:36:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C996106A24F0;
	Fri,  5 Jun 2026 17:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780673767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FHeuOlC/gaOtesZkFgqVr9DoEMDIdfxTclEETE4eqSU=;
	b=LSb3DbXwWwWowFJQbUezIa1BBhdJR5igSpOLdXQsCT+BMkRWsdW44ijdI9dXSrrrcI8V3I
	ecL7Zv+Q2UVM43Odjp/o2hzqvGbJH9gcvwM6bdnjCKpscXz21KdbG5a15Kc6ylGOPoMikV
	/27OcnmIj1H+3ddtxGC9cfiTRCWoqBfbWXl8ciMGadarXoTP7kfh+SkJNF+NmdT7qNf3N7
	nOUpMyUSLjBesoK1WhJDphDI8xte4Zjy9kt1XGP1BSTgKvcUlm5wSd8QHvl7H5BQGa0SY4
	7tx4Gs7DtT2TfocD21W8eEKgMWx1a3Dd+/HcnhtEgGNrly28oFopJXpGDFJybQ==
Message-ID: <566af63b-05a9-43f8-94e9-19af737c848a@bootlin.com>
Date: Fri, 5 Jun 2026 17:35:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] net: pcs: pcs-xpcs-regmap: support XPCS
 memory-mapped MDIO bus via regmap
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-4-elder@riscstar.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260605010022.968612-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38014-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:netdev@vger.kernel.o
 rg,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,riscstar.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5564C6497A6

Hi Alex,

On 6/5/26 03:00, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> In some DesignWare XPCS implementatons the memory-mapped MDIO bus is
> allocated to a register window that does not align to a page boundary.
> This makes iomapping the registers problematic.
> 
> For example the Toshiba TC9564 (a PCIe Ethernet-AVB/TSN bridge) provides
> an "eMAC" subsystem with the XPCS base address cuddled up to XGMAC
> registers.
> 
> Let's introduce helpers to allow the driver that owns the eMAC to register
> an XPCS using is regmap for the memory-mapped MDIO bus.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                         |   2 +
>  drivers/net/pcs/Makefile            |   4 +-
>  drivers/net/pcs/pcs-xpcs-regmap.c   | 219 ++++++++++++++++++++++++++++
>  include/linux/pcs/pcs-xpcs-regmap.h |  20 +++
>  4 files changed, 243 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>  create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb8cdcc76324f..2aa6ea012c848 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25931,8 +25931,10 @@ F:	drivers/net/ethernet/synopsys/
>  SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
>  L:	netdev@vger.kernel.org
>  S:	Orphan
> +F:	drivers/net/pcs/pcs-xpcs-regmap.c
>  F:	drivers/net/pcs/pcs-xpcs.c
>  F:	drivers/net/pcs/pcs-xpcs.h
> +F	include/linux/pcs/pcs-xpcs-regmap.h
>  F:	include/linux/pcs/pcs-xpcs.h
>  
>  SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b900..565f1b63fce0b 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux PCS drivers
>  
> -pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> +pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-regmap.o \
> +				   pcs-xpcs-plat.o pcs-xpcs-wx.o
>  
>  obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
>  obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
> diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
> new file mode 100644
> index 0000000000000..55cd05d09c7db
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-regmap.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synopsys DesignWare XPCS regmap helpers
> + *
> + * Copyright (C) 2026 RISCstar Solutions.
> + * Copyright (C) 2024 Serge Semin
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mdio.h>
> +#include <linux/pcs/pcs-xpcs.h>
> +#include <linux/pcs/pcs-xpcs-regmap.h>
> +#include <linux/regmap.h>
> +
> +#include "pcs-xpcs.h"
> +
> +/* Page select register for the indirect MMIO CSRs access */
> +#define DW_VR_CSR_VIEWPORT		0xff
> +
> +struct dw_xpcs_regmap {
> +	struct device *dev;
> +	struct mii_bus *bus;
> +	struct regmap *regmap;
> +	bool reg_indir;
> +};
> +
> +static ptrdiff_t xpcs_regmap_addr_format(int dev, int reg)
> +{
> +	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
> +}
> +
> +static u16 xpcs_regmap_addr_page(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0x1fff00, csr);
> +}
> +
> +static ptrdiff_t xpcs_regmap_addr_offset(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0xff, csr);
> +}
> +
> +static int xpcs_regmap_read_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
> +					 int reg)
> +{
> +	ptrdiff_t csr, ofs;
> +	unsigned int val;
> +	u16 page;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	page = xpcs_regmap_addr_page(csr);
> +	ofs = xpcs_regmap_addr_offset(csr);
> +
> +	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
> +	if (res < 0)
> +		return res;
> +
> +	res = regmap_read(pxpcs->regmap, ofs, &val);
> +	if (res < 0)
> +		return res;
> +
> +	return val & 0xffff;
> +}
> +
> +static int xpcs_regmap_write_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
> +					  int reg, u16 val)
> +{
> +	ptrdiff_t csr, ofs;
> +	u16 page;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	page = xpcs_regmap_addr_page(csr);
> +	ofs = xpcs_regmap_addr_offset(csr);
> +
> +	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
> +	if (res < 0)
> +		return res;
> +
> +	return regmap_write(pxpcs->regmap, ofs, val);
> +}
> +
> +static int xpcs_regmap_read_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
> +				       int reg)
> +{
> +	unsigned int val;
> +	ptrdiff_t csr;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	res = regmap_read(pxpcs->regmap, csr, &val);
> +	if (res < 0)
> +		return res;
> +
> +	return val & 0xffff;
> +}
> +
> +static int xpcs_regmap_write_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
> +					int reg, u16 val)
> +{
> +	ptrdiff_t csr = xpcs_regmap_addr_format(dev, reg);
> +
> +	return regmap_write(pxpcs->regmap, csr, val);
> +}
> +
> +static int xpcs_regmap_read_c22(struct mii_bus *bus, int addr, int reg)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
> +	else
> +		return xpcs_regmap_read_reg_direct(pxpcs, MDIO_MMD_VEND2, reg);
> +}
> +
> +static int xpcs_regmap_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
> +	else
> +		return xpcs_regmap_write_reg_direct(pxpcs, MDIO_MMD_VEND2, reg, val);
> +}
> +
> +static int xpcs_regmap_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_read_reg_indirect(pxpcs, dev, reg);
> +	else
> +		return xpcs_regmap_read_reg_direct(pxpcs, dev, reg);
> +}
> +
> +static int xpcs_regmap_write_c45(struct mii_bus *bus, int addr, int dev,
> +				 int reg, u16 val)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_write_reg_indirect(pxpcs, dev, reg, val);
> +	else
> +		return xpcs_regmap_write_reg_direct(pxpcs, dev, reg, val);
> +}
> +
> +static void devm_xpcs_regmap_destroy(void *data)
> +{
> +	struct dw_xpcs *xpcs = data;
> +
> +	xpcs_destroy(xpcs);
> +}
> +
> +struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
> +					  const struct xpcs_regmap_config *config)
> +{
> +	static atomic_t id = ATOMIC_INIT(-1);
> +	struct dw_xpcs_regmap *pxpcs;
> +	struct dw_xpcs *xpcs;
> +	int ret;
> +
> +	pxpcs = devm_kzalloc(dev, sizeof(*pxpcs), GFP_KERNEL);
> +	if (!pxpcs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pxpcs->dev = dev;
> +	pxpcs->regmap = config->regmap;
> +	pxpcs->reg_indir = config->reg_indir;

Looking at the overall series, is there any reason for this flag ?

Looks like the reg_indir=false path isn't used at all in this series.

Maybe just drop it and let anyone add it back should the need arise ?

Maxime



