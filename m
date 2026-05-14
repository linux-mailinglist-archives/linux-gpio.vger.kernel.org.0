Return-Path: <linux-gpio+bounces-36866-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC7CBUEbBmrGegIAu9opvQ
	(envelope-from <linux-gpio+bounces-36866-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:58:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE585461C7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEDB43020AB7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244DF39769E;
	Thu, 14 May 2026 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9hhLWKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D929E279329;
	Thu, 14 May 2026 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785066; cv=none; b=JGGD9aTgJce8rxDzFkQCb5ggWS95cWZpSvw1FQuTOpkDVBiGsCgFIWBksBmFvXCIJIuHdfStfBnAMnzXv/IsvzwrUopeVGMLJyG/lKde4PDAYSedhVOMLz5HO2n0djDssgPHq+nhLhcuhfMwJdiYmxBl0C5rrn4ACeOFR+zjZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785066; c=relaxed/simple;
	bh=+FM6hA+10TTi7iU5PA1MKulFrGwvHU/KyYs1Y/Opk94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYn/lh/jiNHwh0eg+kPXS7QPlJNfP5ISRl2Em7mmOgiId28OQE4TYc4gzH1YMWCa4Dw3TQsYf+V0Scps4I2S7gSJUsGCAAwXKToaXAop4f4ZIZu/MetA1Dnddak6KxlaZ7zedwb3wkY25oNaMnYlMT2a2qq3/kFgio2kYgXxN+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9hhLWKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC839C2BCB3;
	Thu, 14 May 2026 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785066;
	bh=+FM6hA+10TTi7iU5PA1MKulFrGwvHU/KyYs1Y/Opk94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9hhLWKFWIVd/foKe6YYx5dv48kqWpysPUwK0LZaP2I6dy8uvNUrOTrO4ou/DI/Gh
	 K8EfpuI6Giwo5ewulsKBJndXG1ZHWIBC00Sozh+uYZ9BNSdX5fHP2bU7HdewyFn+ob
	 wqNma7qU8Go0tOaOI+MFH6xJcyTqd+UJmFbXkwEHoiGUVHYrGAitb8gKfmX9Livtjk
	 1NwWSFYxZIl24oyNV5mOmSZvmYUPOM4q21yKkF6+UdDEgxUJ7T9Ttk+6bbD6Fc+yBh
	 dxhEhIfSfgIWb+c1FzrU6BNkAqjK1/ljPPuEFGF2PaIZ7R+muuRyG/6v0MJX7w7WrL
	 iqmeHGRYKtvmw==
Date: Thu, 14 May 2026 19:57:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
Message-ID: <20260514-used-revival-306ddced4ab8@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
 <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G1HwXNExfpOqsnk7"
Content-Disposition: inline
In-Reply-To: <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
X-Rspamd-Queue-Id: 6DE585461C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36866-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--G1HwXNExfpOqsnk7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:23:16PM +0200, Linus Walleij wrote:
> On Wed, May 6, 2026 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > Whipped this up last week, at to a first glance it appears to work,
> > although the spacemit platform I've used to implement this has very
> > limited in-tree use of pinctrl so it is hard to be sure.
>=20
> I like it, if it wasn't RFC I would merge it.

Half the reason that it is RFC is that I knew dlan wanted to take a look
but told me they weren't available, so I said I'd send it on the list in
the interim.

> > What I don't love though is how similar the functions
> > pinctrl_generic_pins_function_dt_node_to_map() and
> > pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
> > other than which function they in turn call.
>=20
> Hm we can maybe think of something more descriptive
> to the first one?

I think the name is actually okay, it was the similarity of the code
that I don't like. There's a fair bit of duplication.

> I think the new function is very much to the point. That's what
> it does. pinctrl_generic_pins_function_dt_node_to_map() could
> perhaps be names something that make it evident what is
> special about it. Not that I have a good idea.
>=20
> > Basically, I wanna know if you think that that is acceptable,
>=20
> Looks Good To Me (TM) no-one else is helping out with pin
> control core work so I'm happy for everything I get.

Right, well I'll go clean it up I suppose. I might send a rfc v2 with an
extra patch that tries to get rid of some of the code duplication and
you can tell me which version you prefer?

--G1HwXNExfpOqsnk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYbJgAKCRB4tDGHoIJi
0pQuAQDdsm05Tu6s305sA0AF4zcLSMo5WeLpHnAmao/S4UXj2AD/VgBbmKWYI8YG
d3/lbYthJp15vGrtvCrbRjMd8nqi2Q4=
=CZj+
-----END PGP SIGNATURE-----

--G1HwXNExfpOqsnk7--

