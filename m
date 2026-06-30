Return-Path: <linux-gpio+bounces-39238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P7EjDpjVQ2pYjwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:41:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD916E583B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:41:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fdlIZRGV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39238-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39238-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C4D530B3425
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9DC43C055;
	Tue, 30 Jun 2026 14:37:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39138305E3B;
	Tue, 30 Jun 2026 14:37:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830253; cv=none; b=QWH1NwlgUr5srLUXajE0RaXqZENbeYLKP5Z1M071CsgqWIKTBiabo/ScaCuPauhdsA3C6MTaAHv2LVVqxIICiWmbkwZQWIKIRcrieXbjhsGxBx5gUQSLGvgU6gUHfXL/vj0Ek4YdAdHCGDNUxFnMptmvyczQHeo8cPwlgCDDM/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830253; c=relaxed/simple;
	bh=ly6S2cRM37lgQG4s+e1oqbyMoRs43pLONLrRp8n1Gzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBdiF+xrEYr3I0rA9aOExTURXhxmCfZmwaNCN4hObmXBdSaBGzN74oy3MYggOdQRxFrqS9WN/7c0PW3W4JjKpSf73/L6CkN2/f5U0Z0WfubsFXrW7j5HVWwwgRm9HWvQi7viIraQTkJjVqhW1MhKPWGRSzGDI20jQ5pjZWBIJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdlIZRGV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258F91F000E9;
	Tue, 30 Jun 2026 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782830251;
	bh=1V4Y8YlAjNuMYYSEGJNqhEc7P9I+CjDUV6m6HO5EVDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fdlIZRGVW2X7eYln8+2lpX3bj48g7i7gNJMzj9Tgo/JvZav3geWTZJCM10Sl4YAG/
	 JG0FPdu4dsefsJJ7YBMJ+tPLyIvpoJuZZLUyTNNliftXEGIaU12RWUcSl1xPla22OW
	 S3FGBI8QbTcOt8ewHNLTjaO3Lr7lkyP8oyrAAt4Uv3opbFIJoRPF8FOd0Y4mp+ieyj
	 iDPw/0ZAkTud8uUD/oXLsZ4YkLtWCU2pOH0NQV0q3qqTlOyJV3iCeYzoV3Sk6Yo6jc
	 QEXW7Xa2i350xQ5QFqn7bwlbg8OuegeYooViybNEAhn8QbDX9jT6vvdpJPAWjeKJv8
	 VGqFGgKGboi9w==
Date: Tue, 30 Jun 2026 15:37:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
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
Message-ID: <eb0e7827-2893-44cf-9251-a12747fdc0e2@sirena.org.uk>
References: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
 <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
 <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
 <88b5d0e1-4b78-4b79-b9aa-d6438eeced9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c9Xu4mXMUXnRbM7e"
Content-Disposition: inline
In-Reply-To: <88b5d0e1-4b78-4b79-b9aa-d6438eeced9c@oss.qualcomm.com>
X-Cookie: Air is water with holes in it.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-39238-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sirena.org.uk:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDD916E583B


--c9Xu4mXMUXnRbM7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2026 at 04:28:54PM +0200, Konrad Dybcio wrote:

> +Mark, would you accept not-quite-a-regulator driver?

Probably not, but I'm having a hard time telling what the problem is -
the quoting level is rather deep and multiple levels of it don't use any
word wrapping within paragraphs so it's all excessively hard to read.
Frankly I very nearly just deleted the mail unread.  Could someone
summarise what's going on here please?

--c9Xu4mXMUXnRbM7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpD1KQACgkQJNaLcl1U
h9A5pwf9EylE2KkdF/sS7KElNHoSVI+97M4WAQnD/JT0uy6cvz8OhM86IdzyZLqK
PEomAf5bn0x7GV6AUEBChpw80woS5K0B+qJ1E5B5XbSbXKWQrDIQmVas5pGg33W/
0/UlM1q7dEXPjOxJg007fMnKOhrgbndO1jn+E/qNZGWRsxRQdoupDyEtuNjUSVhP
FYwHKsi9Nakxvaf1gcQpL4luFIgr1+dj28+7rEbSksCpzfulDIT9m0/Jd42n/dnD
dIuOBfIJcIxIKN2p7hwr0FbmfEalLzY58mHMwfBroLdKi0UrFDWbyj+JZ/0uNpIN
uWQdd9PJ/Fqclqb6OaArJ1qa78cgYA==
=yohu
-----END PGP SIGNATURE-----

--c9Xu4mXMUXnRbM7e--

