Return-Path: <linux-gpio+bounces-37695-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DuqI0GnGWoFyQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37695-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:48:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB24603ED2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 16:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CAD630BFE86
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 14:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E193EAC84;
	Fri, 29 May 2026 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ItBsgM13"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CEF33345A
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065791; cv=none; b=NYTWUW/CNwOUds0ub4dU7BITamY130VKBpiV0XQPb7e/7IPEEd5cuVA5ZWU/4Tmo4rxu4R8TkJ1yH4EzXv7Ue9fqSSOUXqasJEgwmMpZbB3nBJOEvqPHN8mqPuokyEUOlWgecRm3WzAuYv4qoTaSKncmWSijfkkxAI1Bno24sbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065791; c=relaxed/simple;
	bh=yQD4zNdD2BSQB3lNfcLeJ6QlNPagJdo7n0UyJ5bpvv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVQ/7eUWFypGW8VoQxjP3Dze+zG8P9MzNHMbCZPELSM++nVahKnXpX3M7rWKTS/IElnOHXsTFKUdLWiJg5ZbZnpBa4dR4yXsAovyFHdXXo+OaMRlcrHH9/PvMntLDWPmpwGob2y4TRI+cAzDtyyxWLOJ84MyWqGRn4SJYyQsbb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ItBsgM13; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9fuA
	9ouBqsdEcreA7yo7YyXa6zUnUxq7AwI0ZtAUbTI=; b=ItBsgM13P/zNIPQRayRF
	Pa3Ht8cJKgP/MdY2lqVLJMOTvEjvlpteEdH1E0qlVfSaqV/jwIn0V0oI37BxUMHr
	LIb4BzARp9waDW+tnV3haQKYbGf6UAIY5dCgWv5jAgTcZ1ayuDI95qY2oyYM3e/2
	4dqF+awk/OlZNomEP10PDR1DwJ11GvCwpDU3qeh6t1GFZKcFz/zqcFFc2zGIsD7U
	A8YOYxM5MgAO5b6ELnBZRqO+DD16zhW6CZkz+GY0hXFZqTr6fo/BUUEnGZiccxr2
	qARR4l7R0tv4rSTW9Ejclb/P/LVjO/YGT7K4Z4LRiTaEkOoo8h4n+ozO5fMpzdtN
	Sg==
Received: (qmail 1451240 invoked from network); 29 May 2026 16:43:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2026 16:43:06 +0200
X-UD-Smtp-Session: l3s3148p1@OcDf3PVSYtsqAQ4KEBW5QLbOwWyJKVt/
Date: Fri, 29 May 2026 16:43:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	andriy.shevchenko@intel.com, mario.limonciello@amd.com,
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <ahml-rVa2PIA5DDC@shikoro>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="by5s9rhg/cFjelNc"
Content-Disposition: inline
In-Reply-To: <20260529100838.8896-3-hardikprakash.official@gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-37695-lists,linux-gpio=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,intel.com:email,qualcomm.com:email,amd.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2CB24603ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--by5s9rhg/cFjelNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 03:38:37PM +0530, Hardik Prakash wrote:
> I2C controllers may have child devices with GpioInt resources that
> depend on GPIO controllers to be fully initialized. If the I2C
> controller probes and enumerates children before the referenced GPIO
> controller has completed probe, GPIO interrupts may not be properly
> configured, leading to device failures.
>=20
> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:
>=20
>   i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration
>=20
> Add a generic dependency check in i2c-designware that walks ACPI child
> devices, identifies any GpioInt resources, resolves the referenced GPIO
> controllers, and defers probe if those controllers are not yet bound.
>=20
> This ensures GPIO controllers complete initialization (including IRQ
> setup and quirks) before I2C child enumeration begins, fixing the race
> without device-specific quirks or DMI matching.
>=20
> The probe ordering race was confirmed via dynamic debug tracing:
>=20
>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>   2.348157  lost arbitration
>=20
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Assisted-by: Claude:claude-sonnet-4-6
> Assisted-by: GPT-Codex:gpt-5.2-codex
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@i=
ntel.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221494

In case this goes in via some other tree:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--by5s9rhg/cFjelNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoZpfoACgkQFA3kzBSg
KbYsXA//a0KHp2oMOf5p21QFIErW4mnS69Af+62AnfRC8A8VaN6cH25QldulJkuc
N81nuK1o7WvfC/7UrObBsal2l1fDc1TzQrwhJR6fWygUpxk76tEkt7ICVTs0dWMO
ZmEpq0LS8tyImJyNATycz3IlF7rRdIo/+mqFS1A38UpghjNePCgpJNPpej2A6BG3
7gl5PpL88m22gHs4tytpBStf0n58jjj3QGgNSExb33ssDptpM9mXIJCiFu38zXbp
mj4tCkCKhlA8NybALor2zoRwieo7cHk1YCiJgDVxTKiKUW8g+k0qi6qzLu52UAfj
Md1/UF+DhLFuZLiB5zm/l6p+nCdUljqyKlFWl1SgNUQKocbwa96sZd8CEDMuPJkC
z0BO8fOAVHbo3tj3GDPhR65ybg0a4xLCj0kUEnmZI1GHmkmzF5Yp/ETJqKfTsBjS
c0C+9bPzBRkUplpOJhAsF4AMiBqD4ED2sHuzbKqChvRgrD6D88rbsliB/8LJJIRS
NN23kjE7BCtjdSjwDNM0AjUPf5UV1WwKShFf9OE7/cDV36gJeRfKWmerzFsHurAe
4/xm0ck5OpaPUk9jnB5OaoYNLYgup42FFMf3SPxbOncL1ZIU+9irzH7JyQnsaJCG
fcL1XyEF7HXKaFDU0zgbASOt98L9b4svNqKxmu12cji4z9QwS3g=
=fXLA
-----END PGP SIGNATURE-----

--by5s9rhg/cFjelNc--

