Return-Path: <linux-gpio+bounces-37907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8/UBLtIIGqi0AAAu9opvQ
	(envelope-from <linux-gpio+bounces-37907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:31:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B55639360
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:31:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GRiwEnU0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37907-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37907-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFE1F34EFD43
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70483D16E9;
	Wed,  3 Jun 2026 15:18:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C10039A063;
	Wed,  3 Jun 2026 15:18:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499913; cv=none; b=sT3wDcMZy1cmkh1Dh7n9N1nzIaqpoJB4xkdN79UkPvp2/s1i8QICSCunBkMx4/6NgtYWU725kY4DcvCb4cFW5Gbpf7HoNXglO3T6+LuC45OFjwspzwN+MWTGgicXr0kEq3M3VrhdXsgYU2QyvHq8I2C6DIo2Ze3Gdm3y5WH+nDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499913; c=relaxed/simple;
	bh=ILeO4hImKBexRl/fKhTwLPIU3nPhZ/CXs2vCp2xpNsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/E/PSFCTsswMOGt9d476Wd+HsyvzQUuXr14oJWyqzUniOFJOxaeOgkZrlv9Qqk2l1r2Il9bSmVQfPf7yRLU4DmGEQuVU2O4BWz2yUOznWzEkhjjoUt7KtZIQ+YGOcAYKEnUE+DhqVzWRFr5GmAyOEwLUllNF2O+CEJOyHs2MIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRiwEnU0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138891F00893;
	Wed,  3 Jun 2026 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499912;
	bh=gqLubRzDZskEA9R3dJXzcbqYgA5a+l8atiBeOr7IMyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GRiwEnU0BcFdjpGIldWYYQNw1LEa2mwix99tP6yfOXlV79rEJOB706J70/mTY05WO
	 Fz1N4FnNxlXkC8iT00hRocwYuYiQ5TdCqPT2sydp/zX7/EtIjkEamLOgG9Uf6fdbpb
	 oGi23KdbA4opEgs1lk7n5Jsa/6NUpOWTCPx9yFQxztl221UC/bIjG7AsWjvK/b7p03
	 c0KELW386SW/8QhA+/m2JjqAXvzwZN1LOmyw6K7ZLMi6AZwX2CAimlJaxAS1Rs5ilf
	 z+BLZBYg6nT7r0qb+eKhvwVVyI/Tcz5OsTOaLIn0fMWIWeofmdWBCvnXIsEfctLaEW
	 VftYIXSfp4npQ==
Date: Wed, 3 Jun 2026 16:18:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 02/21] pinctrl: pinconf-generic: Add property
 'input-debounce-ns'
Message-ID: <20260603-sinless-mooing-48a37d3d05ea@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UxFbr67Tboxoi01J"
Content-Disposition: inline
In-Reply-To: <20260603055347.66845-3-changhuang.liang@starfivetech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37907-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:changhuang.liang@starfivetech.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,spud:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66B55639360


--UxFbr67Tboxoi01J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

On Tue, Jun 02, 2026 at 10:53:28PM -0700, Changhuang Liang wrote:
> Add 'input-debounce-ns' to the generic parameters used for parsing DT
> files, along with the corresponding configuration parameter
> PIN_CONFIG_INPUT_DEBOUNCE_NS. This allows debounce time to be specified
> in nanoseconds as an alternative to the existing 'input-debounce'
> property which uses microseconds
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/pinctrl/pinconf-generic.c       | 2 ++
>  include/linux/pinctrl/pinconf-generic.h | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-=
generic.c
> index 64ed28309788..9d67e2d26e28 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -43,6 +43,7 @@ static const struct pin_config_item conf_items[] =3D {
>  	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", tru=
e),
>  	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", =
true),
>  	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
> +	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE_NS, "input debounce", "nsec", true),
>  	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
>  	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, fals=
e),
>  	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_UV, "input schmitt threshold", "uV",=
 true),
> @@ -185,6 +186,7 @@ static const struct pinconf_generic_params dt_params[=
] =3D {
>  	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
>  	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
>  	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
> +	{ "input-debounce-ns", PIN_CONFIG_INPUT_DEBOUNCE_NS, 0 },
>  	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
>  	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
>  	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinc=
trl/pinconf-generic.h
> index a5d4b2d8633a..1df63c732b99 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -71,6 +71,10 @@ struct pinctrl_map;
>   *	which means it will wait for signals to settle when reading inputs. T=
he
>   *	argument gives the debounce time in usecs. Setting the
>   *	argument to zero turns debouncing off.
> + * @PIN_CONFIG_INPUT_DEBOUNCE_NS: this will configure the pin to debounc=
e mode,
> + *	which means it will wait for signals to settle when reading inputs. T=
he
> + *	argument gives the debounce time in nsecs. Setting the
> + *	argument to zero turns debouncing off.
>   * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this doe=
s not
>   *	affect the pin's ability to drive output.  1 enables input, 0 disables
>   *	input.
> @@ -143,6 +147,7 @@ enum pin_config_param {
>  	PIN_CONFIG_DRIVE_STRENGTH,
>  	PIN_CONFIG_DRIVE_STRENGTH_UA,
>  	PIN_CONFIG_INPUT_DEBOUNCE,
> +	PIN_CONFIG_INPUT_DEBOUNCE_NS,
>  	PIN_CONFIG_INPUT_ENABLE,
>  	PIN_CONFIG_INPUT_SCHMITT,
>  	PIN_CONFIG_INPUT_SCHMITT_ENABLE,

Should this grow a mutual exclusion check in parse_fw_cfg()?
Part of me says yes for consistency, but also as this is a new property
that's going to have had exclusion in the binding from the start part of
me says that it is unnecessary to add that.



--UxFbr67Tboxoi01J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBFwgAKCRB4tDGHoIJi
0shdAQDVn1y7zJ5GetjXm2OW2sQdptXIBXriOfUWzTJBsBzXhAEAqbwd03uZvPIu
EdG/j/Pj6pCWlzrc4wAopEkRvGV20gs=
=uhlk
-----END PGP SIGNATURE-----

--UxFbr67Tboxoi01J--

