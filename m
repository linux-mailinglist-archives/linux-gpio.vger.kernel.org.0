Return-Path: <linux-gpio+bounces-38008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mngjJB6fImpZbAEAu9opvQ
	(envelope-from <linux-gpio+bounces-38008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 12:04:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AEE647276
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 12:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CW2B9+X+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38008-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38008-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEF723072411
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 09:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913923D1713;
	Fri,  5 Jun 2026 09:49:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AC63C9899;
	Fri,  5 Jun 2026 09:49:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652949; cv=none; b=e5DdRbDUKAauvmmPch3GfnHBq96EvleMsLi9H8ZCy3ikXFDTRwpjRTuV49fne+9WDg2eTbpcGKldzlv4O8AFmdmQ/6y94YDP1Tll0DpXQAS6jm9miBxbWOlsCgpR488bgmoCHq53+oYDYd82ygjb6dHTHkEa3xaL84p84ROGELM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652949; c=relaxed/simple;
	bh=S3KZKPAnneAoOAnB/MhPOA61xMlh9d7epNjqr5MIpGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIkLsYWzEFPTPgsPUAUzT6oMN0qNtcF07DSKjqqnrF0Lt33PVTu93KM9Lsw0zb9x/IidLy2MMeq+JA8k7nfXQNrsfLJnVlOxzvNVadrp0XioSAebn8/ex1ZvyXsl4rNxgGRW2Hqz8BJ9EtdssoqFomc/t1JI+MHNZkifNT/8E8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW2B9+X+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9BB1F00893;
	Fri,  5 Jun 2026 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780652947;
	bh=gXhoT+leVZI4/Qk+p2/PqLCrckwgEEZ0sHMv/uivWco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CW2B9+X+lFeJtyK7dxmKS6/9ORWHnsrNM8oAf2l//Jd9wPtMy8fPexwyMJeWgh7oZ
	 qdbPb6OmRTZi4i/Aj+NTw65n9Ku7NSTTSvS7WBWzyJhp2nrY7u8REEeM9BmX1nbrfg
	 deC9NLM6ZgWSXLidGNkHTaqWpuVMO+PhHJFhu+GPl2ryXx5Syym3mX7t581VX5zUyV
	 iFM8xpCoXE9ROHFWXuhThEbnbQFtfeCH/qm72VnZbspIwzJqwI7j3JGKXpR2tmpbzd
	 sleeG+lEE46waKVkgtC7+0GTnFlsT8zvDQv9xTnTzZt2qoYPZEVrrOaJkZguaSlm5L
	 qZXmL4T3jnafA==
Date: Fri, 5 Jun 2026 11:49:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: Move Airoha driver to dedicated directory
Message-ID: <aiKbkVvJ9-GDqZqY@lore-desk>
References: <20260605071233.28873-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q1A43My8ot58uOeO"
Content-Disposition: inline
In-Reply-To: <20260605071233.28873-1-ansuelsmth@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38008-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ansuelsmth@gmail.com,m:linusw@kernel.org,m:sean.wang@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lorenzo@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzo@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90AEE647276


--q1A43My8ot58uOeO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In preparation for additional SoC support, move the Airoha pinctrl driver
> for AN7581 SoC to a dedicated directory.
>=20
> This is to tidy things up and keep code organized without polluting the
> Mediatek driver directory.
>=20
> The driver doesn't depend on any generic or common code from the Mediatek
> codebase so it can be safely moved without any modification.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/pinctrl/Kconfig                       |  1 +
>  drivers/pinctrl/Makefile                      |  1 +
>  drivers/pinctrl/airoha/Kconfig                | 20 +++++++++++++++++++
>  drivers/pinctrl/airoha/Makefile               |  3 +++
>  .../{mediatek =3D> airoha}/pinctrl-airoha.c     |  0
>  drivers/pinctrl/mediatek/Kconfig              | 17 +---------------
>  drivers/pinctrl/mediatek/Makefile             |  1 -
>  8 files changed, 27 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/pinctrl/airoha/Kconfig
>  create mode 100644 drivers/pinctrl/airoha/Makefile
>  rename drivers/pinctrl/{mediatek =3D> airoha}/pinctrl-airoha.c (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21c0ef0b9ce5..38bf92149a15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21024,7 +21024,7 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> -F:	drivers/pinctrl/mediatek/pinctrl-airoha.c
> +F:	drivers/pinctrl/airoha/pinctrl-airoha.c
> =20
>  PIN CONTROLLER - AMD
>  M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 03f2e3ee065f..e0babad31445 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -679,6 +679,7 @@ config PINCTRL_RP1
>  	  multi function device.
> =20
>  source "drivers/pinctrl/actions/Kconfig"
> +source "drivers/pinctrl/airoha/Kconfig"
>  source "drivers/pinctrl/aspeed/Kconfig"
>  source "drivers/pinctrl/bcm/Kconfig"
>  source "drivers/pinctrl/berlin/Kconfig"
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index f7d5d5f76d0c..36c55858801f 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+=3D pinctrl-zynqmp.o
>  obj-$(CONFIG_PINCTRL_ZYNQ)	+=3D pinctrl-zynq.o
> =20
>  obj-y				+=3D actions/
> +obj-y				+=3D airoha/
>  obj-$(CONFIG_ARCH_ASPEED)	+=3D aspeed/
>  obj-y				+=3D bcm/
>  obj-$(CONFIG_PINCTRL_BERLIN)	+=3D berlin/
> diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kcon=
fig
> new file mode 100644
> index 000000000000..03adaeae8fc3
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "Airoha pinctrl drivers"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +
> +config PINCTRL_AIROHA
> +	tristate "Airoha EN7581 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +	select GPIOLIB_IRQCHIP
> +	select REGMAP_MMIO
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on Airoha EN7581 SoC.
> +
> +endmenu
> diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Mak=
efile
> new file mode 100644
> index 000000000000..a25b744dd7a8
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_PINCTRL_AIROHA)		+=3D pinctrl-airoha.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
airoha/pinctrl-airoha.c
> similarity index 100%
> rename from drivers/pinctrl/mediatek/pinctrl-airoha.c
> rename to drivers/pinctrl/airoha/pinctrl-airoha.c
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/=
Kconfig
> index 4819617d9368..97980cc28b9c 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menu "MediaTek pinctrl drivers"
> -	depends on ARCH_MEDIATEK || ARCH_AIROHA || RALINK || COMPILE_TEST
> +	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
> =20
>  config EINT_MTK
>  	tristate "MediaTek External Interrupt Support"
> @@ -126,21 +126,6 @@ config PINCTRL_MT8127
>  	select PINCTRL_MTK
> =20
>  # For ARMv8 SoCs
> -config PINCTRL_AIROHA
> -	tristate "Airoha EN7581 pin control"
> -	depends on OF
> -	depends on ARM64 || COMPILE_TEST
> -	select PINMUX
> -	select GENERIC_PINCONF
> -	select GENERIC_PINCTRL_GROUPS
> -	select GENERIC_PINMUX_FUNCTIONS
> -	select GPIOLIB
> -	select GPIOLIB_IRQCHIP
> -	select REGMAP_MMIO
> -	help
> -	  Say yes here to support pin controller and gpio driver
> -	  on Airoha EN7581 SoC.
> -
>  config PINCTRL_MT2712
>  	bool "MediaTek MT2712 pin control"
>  	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek=
/Makefile
> index ae765bd99965..6dc17b0c23f9 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -8,7 +8,6 @@ obj-$(CONFIG_PINCTRL_MTK_MOORE)		+=3D pinctrl-moore.o
>  obj-$(CONFIG_PINCTRL_MTK_PARIS)		+=3D pinctrl-paris.o
> =20
>  # SoC Drivers
> -obj-$(CONFIG_PINCTRL_AIROHA)		+=3D pinctrl-airoha.o
>  obj-$(CONFIG_PINCTRL_MT7620)		+=3D pinctrl-mt7620.o
>  obj-$(CONFIG_PINCTRL_MT7621)		+=3D pinctrl-mt7621.o
>  obj-$(CONFIG_PINCTRL_MT76X8)		+=3D pinctrl-mt76x8.o
> --=20
> 2.53.0
>=20

--q1A43My8ot58uOeO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiKbkQAKCRA6cBh0uS2t
rD8RAQCTqvwpjOmFdqe/mEXBddI5QVje6dYvxn4UEeu5m/9ffQD+NC30clolCJqz
Y7UYWFyqWHg0ayUEETtXdvzZphkMHAQ=
=7riA
-----END PGP SIGNATURE-----

--q1A43My8ot58uOeO--

