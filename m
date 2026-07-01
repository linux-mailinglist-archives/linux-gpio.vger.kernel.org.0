Return-Path: <linux-gpio+bounces-39309-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6f4wEVz7RGoc4goAu9opvQ
	(envelope-from <linux-gpio+bounces-39309-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:34:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C66ECDD2
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:34:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="aKSSC/g1";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39309-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39309-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6150A3011A61
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A13847F2E9;
	Wed,  1 Jul 2026 11:33:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F37480323;
	Wed,  1 Jul 2026 11:33:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905602; cv=none; b=PAsezG7FCVZGY+9b3CdacbcF2nCYbshYSWT4YP22/xPfKpDlpFI/GjoLCpJGk9dSI0AulvnQIigqk/h9WzOY7tFdslFbU0N9Ihk8Fwd42mRIFuzMv9pleN1eTIL/67Wn2E4GmAjlNAhwmWALXdCJlnxECGH8LN3/YTCkcECS1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905602; c=relaxed/simple;
	bh=XFJmRkkhpUXL1YteDG4etkNAQt5Gg2Rl4aeQ611Z+t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwxryXNmYB78csRmdhfwDHWyn/nQQTRlpB7ctJ6dXRy+/sbYi7v06m9P3WE00QeiaMYLZpVGelr3YreWl+GOprLjxHTKD9CALt8DS3699KwPM6zp78ba6gKeAe89H/FH3QbON1UQCxPzh2AISCW/d+k5wEUslMh/9Bt59lbKfMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKSSC/g1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0728E1F000E9;
	Wed,  1 Jul 2026 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782905601;
	bh=L34uegd0YbqQzZCgtaf1AA6OLIHKoMVrJO7Vowx0ZEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aKSSC/g1kWUC7H8gzQfMl4M7oyxr23AT8oADRPVD/s0ao8pwdUw85Z1yQFteNBS2p
	 3GqJ8e9KKiDWCsXm3pOE3/UJ5Joldj93/3IJNfVUxws7FPQpbkHhaJrVbT1LPvqxVg
	 PJlR5STO1gqQq8Ml0yNfbz/QUnnOuSGjCuTCg3jbN29E4qAQBG7ksKK2MZrUsC/tbq
	 fpWcCCrrxau03gSFTTco5EBoTCk9nKQbwLt12K3mN1xdel+lebPFCuP0T0XEyqkfPy
	 BxE94AB8lvGkxs5UGRQ/yo3ffiL4BU7Uu0tGuuBLSrUwnW14meiPdbpMVoNEl+IsY9
	 3JCmxRYn2XIbw==
Date: Wed, 1 Jul 2026 12:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Message-ID: <42a439e0-e254-4604-af35-c847bd30bdff@sirena.org.uk>
References: <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
 <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
 <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
 <88b5d0e1-4b78-4b79-b9aa-d6438eeced9c@oss.qualcomm.com>
 <eb0e7827-2893-44cf-9251-a12747fdc0e2@sirena.org.uk>
 <e807f4c1-b489-428d-a29e-186fc64eb542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CcevafQLfmJ/shtU"
Content-Disposition: inline
In-Reply-To: <e807f4c1-b489-428d-a29e-186fc64eb542@oss.qualcomm.com>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-39309-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB4C66ECDD2


--CcevafQLfmJ/shtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 10:43:01AM +0800, Fenglin Wu wrote:

> Qcom PMH0101 includes bi-directional level-shifter (BIDIR_LVL_SHIFTER)
> modules that act as open-drain voltage translators, mainly to support
> 1.2 to 1.8V voltage translation on the I2C bus between the SoC with 1.2V
> IOs and other I2C clients with 1.8V IOs. Each module shares two physical
> pins with two GPIO modules, and control of the BIDIR_LVL_SHIFTER module
> is centralized on the AOP side with 'XOB' resources so it can be shared
> between different subsystems.

> When a BIDIR_LVL_SHIFTER is enabled, it needs to send RPMh commands to
> enable it and SPMI commands to disable the related two GPIO modules, to
> make sure their circuitry does not interfere with it. For now, the
> suggestion is to write a new driver for BIDIR_LVL_SHIFTER and place it
> as a child of the rpmh_rsc device, and refer to pinstate nodes to
> disable these two GPIO modules. However, we are now facing a difficulty
> in deciding which subsystem the new driver should belong to. We expected
> that the new driver should provide following capabilities:

To the extent any of this is comprehensible (I don't know what things
like AOP, XOB and so on are) nothing about this is screaming regulator.
It sounds like you just want to turn on and off a device to make the bus
you're talking through work?

> 1. Enable and disable the level-shifter at runtime. Consumers, likely
> I2C client devices, will enable it when active and disable it when not,
> mainly to save power.
> 2. Allow sharing the level-shifter between multiple consumers, even
> across different subsystems (currently managed by AOP).

> Following are the approaches that we are considered, and it seems only a
> regulator device could satisfy the requirement the best but we want to
> check with you if you are fine to put it in the regulator framework.

Why would this be a regulator?  It's not providing power to anything
which is a fairly key element of being a regulator, it fits about as
well with clocks (which also provide reference counting which is AFAICT
what you're looking for here).  You'll have a hard time writing DTs for
this that actually refelect the hardware I think.  Possibly it's a power
domain (or a resource controlled by a power domain, I know they manage
clocks and regulators)?=20

Possibly work out a DT binding for this and then work back from there.

--CcevafQLfmJ/shtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpE+voACgkQJNaLcl1U
h9CIdwf/aaI6WmwgpOMxwIKUHQkVWvY7XQGzYvUUe9sEH+vS3IioHP+pxZ3itXIm
g50ajXuBz1NTIvNeNC0XZz7rE8pY3rEDSidfSU/bw+9GuEpVQYlZu6ED3atqZSDA
EkM/Dx1n3AJ8LmspXz/TQ4xutZ5hSE6YNA5gG+l7Du10rtlBN0Yc99Rri0Wn2YcR
7C7fBhTUhS1w3dMb6Z7irHZ7/fHtNRPumgDb56OtJzN2pMjOev0/YHtx5+jyYsLp
706PODzeEVyR8z998V4wczlB25pheTAtY8LsLoaZOWgFsUiCFeEj63RjRlJ9jRtN
tfe/beI99/FNfGyCFBvucG26WLnV+Q==
=CqPN
-----END PGP SIGNATURE-----

--CcevafQLfmJ/shtU--

