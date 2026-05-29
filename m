Return-Path: <linux-gpio+bounces-37694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAA9NAOpGWomyQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:56:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0736040EA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 316F03199BD0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 14:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883A43ED13F;
	Fri, 29 May 2026 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qm1vDW4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB143438A4
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065767; cv=none; b=agZ/gXkIigqLwtmBPbZKjmupGrX3L9trvVJZ+Uz8T3UtdEjJKS3a5ouc8syOPoKR1XNr/UvxGgfcEqB77V1PAbzklNqIIxRzOLSyQh+10Gj3Zn+i6YMoW1MSWAx4M1UUskxhowOxhK5ry/545vcTTw7sBZMEy3M5lXe9LDTCGp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065767; c=relaxed/simple;
	bh=QoX72CLcdfitZ8LMGmXOJ5sru8elvFZF8QpENmK3TiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMvCwBHcStSBJtS3cO4NikR8c/pdWufHsfcFyosHkrUXb1J72Zrpy8+9zZ9tlSX/Hiv6Q7IMZME2HDCPzcAx3EtvzAsmUg9X8nFM3AMt+YdkwPKAjHzhmaOstvwXn3XBD8KwYn2YA78G3XQbJ2lRHvq2Pe57GnwUODcOgss+bLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qm1vDW4r; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nxlN
	UXy7WC8tLMJdMYU1mZlRD4Vwcpep9ai6kLZgckg=; b=Qm1vDW4rWxgBskxuf4J+
	6T4/RKzdH80QPsD1IBX9AGyppMT/lj/AWkhdrTS1KHRuKOJ80Jx0K25RL/bQsomE
	hu89qmhqJX/J6H20d/Bmp7P2o6z0bzLSJcAKTl39Si9YrQmq8pt7Qymv8y6vVhQ1
	KyUuZJzKFuuR95fzziDKq+jqBHFZD6LVA2RE/Fa2znu30prQ+RRmRFPceOfEqaas
	Np+7yaj0eUULt5ssodSB5eS7aY7FXTwfHxkfVcWUg4YE89cBi8PV0o6SHgO/G7pa
	s6uc3yvL+EXCId4dB34j1Yb9sYWtGG6wWcxk4JvE8uH+AFGFT86P0klhgalKSVT2
	OQ==
Received: (qmail 1451035 invoked from network); 29 May 2026 16:42:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2026 16:42:43 +0200
X-UD-Smtp-Session: l3s3148p1@LpN32/VSSOQqAQ4KEBW5QLbOwWyJKVt/
Date: Fri, 29 May 2026 16:42:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	wsa@kernel.org, andriy.shevchenko@intel.com, brgl@bgdev.pl,
	basavaraj.natikar@amd.com, linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ahml4iX_FpI7Arwb@shikoro>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <4de80fd6-007e-484f-a7c9-17838ee5b1da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytKD8YuQLnoHDWdJ"
Content-Disposition: inline
In-Reply-To: <4de80fd6-007e-484f-a7c9-17838ee5b1da@kernel.org>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37694-lists,linux-gpio=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,bgdev.pl,amd.com,oss.qualcomm.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,intel.com:email,sang-engineering.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 5A0736040EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ytKD8YuQLnoHDWdJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:12:31PM +0200, Mario Limonciello wrote:
>=20
>=20
> On 5/29/26 12:08, Hardik Prakash wrote:
> > I2C controllers may have child devices with GpioInt resources that
> > depend on GPIO controllers to be fully initialized. If the I2C
> > controller probes and enumerates children before the referenced GPIO
> > controller has completed probe, GPIO interrupts may not be properly
> > configured, leading to device failures.
> >=20
> > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
> >=20
> >    i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
> >=20
> > Add a generic dependency check in i2c-designware that walks ACPI child
> > devices, identifies any GpioInt resources, resolves the referenced GPIO
> > controllers, and defers probe if those controllers are not yet bound.
> >=20
> > This ensures GPIO controllers complete initialization (including IRQ
> > setup and quirks) before I2C child enumeration begins, fixing the race
> > without device-specific quirks or DMI matching.
> >=20
> > The probe ordering race was confirmed via dynamic debug tracing:
> >=20
> >    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >    0.287121  amd_gpio_probe: requesting parent IRQ <- probe still runni=
ng
> >    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >    2.348157  lost arbitration
> >=20
> > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Assisted-by: Claude:claude-sonnet-4-6
> > Assisted-by: GPT-Codex:gpt-5.2-codex
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp=
@intel.com/
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221494
>=20
> Fixes: 3812a9e84265a ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on
> Lenovo Yoga 7 14AGP11")

No Rev-by from you, Mario?


--ytKD8YuQLnoHDWdJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoZpeIACgkQFA3kzBSg
KbY3bQ//cn38TgujrPM+wMb+0GuuimmWxH0Fltvwiu7n5W9x1lFQMr3TQP4m6w7d
Gz/DdIa/dXl3GuvBqnfGvKGNruQj0zdH8I/H9lb645i6ER4NXixdRKjurMW4Rujq
NzhAY1NQxDVTGSZ6638pBr44ghVC5+kUgzUGWmGPQlpI3o4SenmI4k7Wos2BsIOK
0pDVIyAmemj+Piv7CwPavoEL7ge64DGH19ZrNTyxeUhQYyI45rwMhPis0RKpZILZ
viEuJZiDwtnYlRGuUHvvyGHRib19iBJ9U41EE43k9z5O7trUaxAhEDdVlUUSsnZp
4fyeCsBwxB3BoTtGE6k4nx1AUkdvhziU8l7ApMDWCd/dLkyb4AVgDzJHe7glMWRE
4f5wVmVLpTEbacbAejs4FRCnb+e+bCMGK7qAaHk101oTv6DwlYcR7VR+AldF1eLd
VhonEpCbJouBUTYiVmxM2T+evTefSkYiAea8/r5ZqZqK0RVkmkRhF3KFH498cXMt
r8kGsWQU5uxz0g5BzAU42sL0hOnOAVUSbcJXaM5l10RrGEdDxYQnNGLmo7x/5Ppo
F/oDhMttZd7ua5C86br9TWigcFAB6K8sqY2QfXE/iN+SlMNJUqadCwEtdG8xwGGw
zIHiJnobM9gNkgs3uHkaU+r7HrgD4FCVzN4/bmUUdSVt6cYwUp0=
=Z27Q
-----END PGP SIGNATURE-----

--ytKD8YuQLnoHDWdJ--

