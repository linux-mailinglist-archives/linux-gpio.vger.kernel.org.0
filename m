Return-Path: <linux-gpio+bounces-31438-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAAfOXVUg2mJlQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31438-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 15:15:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00EE6EB5
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 15:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 725ED30078B6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6093140FDAF;
	Wed,  4 Feb 2026 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipyO18yZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449E40FDA5;
	Wed,  4 Feb 2026 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214515; cv=none; b=caGlZZthzkduyG5lsq5oLN6OwAVFBTNuelLIuTZGMrEwaSvjMghm40ZqjpeeSzkRxChIIPYFnedwEbCHG7c1sqwXsjcNj3QuuSkUIz39VNcNfT2LWaXL8KhBo9T1eM1RwBSa3lfWqFKxCCh7B+AkHMXu+YQWeWqsrn9d5c+yOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214515; c=relaxed/simple;
	bh=21n5lossvuF5I/ddB3keVySdnSktes5dlscbzt0UnQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHk20BOiRIUriYB74S/z94zgO7ymBCJzLKCIoGiUxrFu8sXbD05jfiSCz3ulFKqiTAI7ekk1pyvaqytvjHESXanPrAUqGL3Ln9zoRsP6qD+sAjHYV+ax7Ot3mWV1loplBT0bdh75Z1rsugEIkta/pfnqtW7+CQGMQlZ8t6xJ320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipyO18yZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B285C4CEF7;
	Wed,  4 Feb 2026 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770214514;
	bh=21n5lossvuF5I/ddB3keVySdnSktes5dlscbzt0UnQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipyO18yZrcu+f3RbHb117XAIaxuUOT7ZD/+gcha3aOGnUVOa1qb9M2LhMS7vccAC/
	 fImiRVy/L3C2LQ007znheCuFmO1kg0HbDrhd7GZNP9HBcqIBKNqLF1RLQHUYFa3+LL
	 6yW5M2lUw+WztPdhC9i3TPI5Wi7K8sonjphTcQWSYMmGE4P4/7yw9BiVa3L+a0Ye2p
	 6L9tz8nORwg3Qn3GFM0QcT4sWMhHD5QJ36qIgmmjk0TNuH6uVMgmc7rdX9oaJDpQpz
	 8KVq3Om5UsE5D33/XxKjIEJmfnFeo5lAeijLYo5t8q/EJ/++38ZeCpTBx3pKI3oPpp
	 sNviG/meHYClw==
Date: Wed, 4 Feb 2026 14:15:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <20260204-crawlers-nacho-d7c9021cdb6f@spud>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XRukpB6yERUMkTmR"
Content-Disposition: inline
In-Reply-To: <aYL9zgEyCarrluvP@black.igk.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31438-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E00EE6EB5
X-Rspamd-Action: no action


--XRukpB6yERUMkTmR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > > pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> > > function, and really belongs in the amlogic-am4 driver. There are thr=
ee
> > > reasons why.
> > (...)
> > > The other dt_node_to_map implementations accept a being called for
> > > either a node containing pin configuration properties or a node
> > > containing child nodes that each contain the configuration properties.
> > > IOW, they support the following two devicetree configurations:
> > >
> > > | cfg {
> > > |       label: group {
> > > |               pinmux =3D <asjhdasjhlajskd>;
> > > |               config-item1;
> > > |       };
> > > | };
> > >
> > > | label: cfg {
> > > |       group1 {
> > > |               pinmux =3D <dsjhlfka>;
> > > |               config-item2;
> > > |       };
> > > |       group2 {
> > > |               pinmux =3D <lsdjhaf>;
> > > |               config-item1;
> > > |       };
> > > | };
> > >
> > > pinconf_generic_dt_node_to_map_pinmux() only supports the latter.
> >=20
> > This alone is a good reason to apply the patch.
> >=20
> > I have a strong urge to apply this already for v7.0 despite its RFC sta=
te.
> >=20
> > Anyone against?

I forgot to say that I had made it rfc cos of where in the cycle we are
and the fact that I didn't test it. I've got no objection though if
that's what you want to do.

> Quite the opposite! I fully support unloading pin control core from OF-ce=
ntric
> code.

> Note, please, remove extra '.' (dot) in the Subject.o

fwiw, the .. was intentional cos I was truncating the pinconf_generic
=66rom the function since the subject was really long, not referring to
a member of an ops struct.

> Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

--XRukpB6yERUMkTmR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYNUbgAKCRB4tDGHoIJi
0v50AP0XzuIH33HOfDbL9/7oTHn9zkO12IFvK8FOElTbGerhHAD+N/GDS9+DqEIr
H9MnAqVbrtTrLy+IpWqQwG1DEW/YAwA=
=goz1
-----END PGP SIGNATURE-----

--XRukpB6yERUMkTmR--

