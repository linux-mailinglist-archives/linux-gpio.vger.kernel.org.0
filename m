Return-Path: <linux-gpio+bounces-37888-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yj0PNinqH2pcsQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37888-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:47:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D91635D90
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:47:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37888-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37888-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F173F309C9E7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 08:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450F644BC87;
	Wed,  3 Jun 2026 08:41:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0174418EC
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2026 08:41:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476092; cv=none; b=nVPZm09YpJfbs4U2sKRvi9QLi53lxOTyPOLdXcwJpwoVY42Dr+mzhn/wxiGBNhHY/RUAibtirclluRJhLjxcPhpLz1DZsYhgCHUvZmhA6tCph22nGkzsYn3OdoJCI3/FPlLuWvsjmRFM48mruet0FOdKi8SO3bzXR2Jn3dcLuDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476092; c=relaxed/simple;
	bh=likZSeLJk+7oX+CAfmlufmM6j+VDUoCaGO7ku0Qkr/A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSmAgmUDBw0TzQb6//s4ZQofmktfwdtGraOYcO5mhN2t6Z+uWHXNQkSOa4ZhZDyYGZ+hKFI4ZEO1LB030oTiMhzxvbESLmDRe8yJSeh8wqZ/FbfkhpMd0pUZma8VUbOZEnx8NdowE6qem1AR0TkX0sk5N3rexO3MuizM05lJwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhA7-0004gW-O9; Wed, 03 Jun 2026 10:41:19 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhA3-000svg-2g;
	Wed, 03 Jun 2026 10:41:15 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhA3-000000003PW-30NA;
	Wed, 03 Jun 2026 10:41:15 +0200
Message-ID: <05c54522ba76bfc4421e6838e8ff108437f69636.camel@pengutronix.de>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Linus Walleij	
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Emil Renner
 Berthing	 <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou	
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti	 <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Lianfeng
 Ouyang	 <lianfeng.ouyang@starfivetech.com>
Date: Wed, 03 Jun 2026 10:41:15 +0200
In-Reply-To: <20260603055347.66845-5-changhuang.liang@starfivetech.com>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
	 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37888-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:changhuang.liang@starfivetech.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pengutronix.de:from_mime,pengutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69D91635D90

On Di, 2026-06-02 at 22:53 -0700, Changhuang Liang wrote:
> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>=20
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
[...]
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers=
/pinctrl/starfive/pinctrl-starfive-jhb100.c
> new file mode 100644
> index 000000000000..52b97870b991
> --- /dev/null
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> @@ -0,0 +1,1607 @@
[...]
> +int jhb100_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct gpio_irq_chip *girq;
> +	const struct jhb100_pinctrl_domain_info *info;
> +	struct jhb100_pinctrl *sfp;
> +	struct pinctrl_desc *jhb100_pinctrl_desc;
> +	struct starfive_pinctrl_regs *pinctrl_regs;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	int ret;
> +	int irq;
> +
> +	info =3D of_device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	pinctrl_regs =3D info->regs;
> +
> +	sfp =3D devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> +	if (!sfp)
> +		return -ENOMEM;
> +
> +	sfp->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sfp->base))
> +		return PTR_ERR(sfp->base);
> +
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\=
n");
> +
> +	rst =3D devm_reset_control_array_get_optional_shared(dev);

Why is this shared? Are there multiple pinctrl controllers sharing
reset lines?

> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset control\n=
");
> +
> +	/*
> +	 * we don't want to assert reset and risk undoing pin muxing for the
> +	 * early boot serial console, but let's make sure the reset line is
> +	 * deasserted in case someone runs a really minimal bootloader.
> +	 */
> +	ret =3D reset_control_deassert(rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "could not deassert reset\n");

Missing reset_control_assert() in .remove will unbalance the
deassertion counter if a pin controller with shared reset is
unbound/rebound, causing the reset to never be asserted again.

regards
Philipp

