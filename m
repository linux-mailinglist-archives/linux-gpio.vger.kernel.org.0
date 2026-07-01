Return-Path: <linux-gpio+bounces-39325-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HwJ6O3IZRWrp6woAu9opvQ
	(envelope-from <linux-gpio+bounces-39325-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:43:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507016EE437
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:43:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=i8SCwyQh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39325-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39325-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6F23018AC6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 13:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C0548AE3D;
	Wed,  1 Jul 2026 13:01:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CC48AE20;
	Wed,  1 Jul 2026 13:01:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910919; cv=none; b=DYl+XolukXmSYM8wc8+w+8yukdhimrfmM1SuX59wZut5lwRZ0tU12PnAGlYV6LJCki3N5O7tv0d3t0Dk707nTWp+5TFz9PB6xtw0NY0lRSZ6pX72LyDvuuxJMytpapUDVC4HBjZPzXOX95CGL0XXn3v83/p6Zx+1WPgthbslI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910919; c=relaxed/simple;
	bh=jnxZnh5V2zsErqh9R6TXWkelWIbod9lmGFF4LYtgJDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsEBDKJX8tNSynfVAVgGjP6WYgNPCvdMpr8ZpFo6/62PrHgM3sALgw3UBesgu4ojkw06SP9+ywT/wfHyPnN4Yau9vVRNgruuDas+an2nqiXH+N4RFhYiZMHMz5Zz+ld8alCYmcowi0DUgpmENmc4BR7I2Ck2E2SEO1ma/lnGDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8SCwyQh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9F11F000E9;
	Wed,  1 Jul 2026 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910918;
	bh=xSQsmx4MwF6oqeO3x1f6iZ8pIkIJYGGq6vkgVXhfEIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8SCwyQhVICEaZZJ/Lp98o2+s119rdkjdwIfsz+v3x7mfvCZzQVIGsEvAj9X0l1Dk
	 FBJejEC86nG5uBNPNuhJ3QvmBxBNGDb5NIVcuY3Yw7vx1VKXdNYUtjebwoBNUk77Ft
	 vTpL3/bY4JTA0KDlgDLDP3nCRUJ//eXv1Itxtkba0Vpl/03h8JOmPssHq0TikKln7J
	 Z4hC3HS8vVR19GIJW7+0bovNE8h7r5AmKj5DlMhiSs8xGpa7DhzzSKob0vj6wG/xKv
	 a6VK22t7YXHmSK3EB0qdMtswtECqe7XABbPBwSX+m5U2RhIC8XQQxQ+n0fFNoNzKLq
	 DytaDNZ3kcFQg==
Date: Wed, 1 Jul 2026 14:01:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 5/8] regulator: bd71828: Support ROHM BD73800
Message-ID: <bf744d4f-eabe-48e7-92e4-b147b8d79d91@sirena.org.uk>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <1d00359236272fd1fab0dfbcb9119d2f91aa0d23.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jcOo3Xx3B2XL56n0"
Content-Disposition: inline
In-Reply-To: <1d00359236272fd1fab0dfbcb9119d2f91aa0d23.1782909323.git.mazziesaccount@gmail.com>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39325-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 507016EE437


--jcOo3Xx3B2XL56n0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 03:42:35PM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>

> +	nproot = of_get_child_by_name(nproot, "regulators");
> +	if (!nproot) {
> +		dev_err(dev, "failed to find regulators node\n");
> +		return -ENODEV;
> +	}
> +	for_each_child_of_node(nproot, np) {
> +		if (of_node_name_eq(np, LDO1_NODE_NAME))
> +			ldo1_use_high_range = of_property_read_bool(np,
> +							"rohm,ldo-range-high");
> +		if (of_node_name_eq(np, LDO3_NODE_NAME))
> +			ldo3_use_high_range = of_property_read_bool(np,
> +							"rohm,ldo-range-high");
> +	}

Why do we iterate over all nodes rather than doing additional
of_get_child_by_name()s?

> +	if (ldo1_use_high_range) {
> +		d[BD73800_LDO1].desc.linear_ranges = bd73800_ldo13_high_volts;
> +		d[BD73800_LDO1].desc.n_linear_ranges =
> +					ARRAY_SIZE(bd73800_ldo13_high_volts);
> +	}
> +	if (ldo3_use_high_range) {
> +		d[BD73800_LDO3].desc.linear_ranges = bd73800_ldo13_high_volts;
> +		d[BD73800_LDO3].desc.n_linear_ranges =
> +					ARRAY_SIZE(bd73800_ldo13_high_volts);
> +	}

You could just do these updates without the intermediate variables.

--jcOo3Xx3B2XL56n0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFD78ACgkQJNaLcl1U
h9CBDAf/dk5xA9JPiqbs7lGosK1R3IusuArR8QLpFeRkO7UbIwwMHxsEiTpllWzW
gEIuuygVMXAiQ/2K7lt3KwQnEguJnlm3419HhOX7Iuvr5QbXq4Elyf044UvaveHM
OCU8sANA3BvR+7CfSHWhymoA+e71GnjArm6MiTsh9zU+qNEIgCmMlSBqg9KoI7qn
uJEjHHrLwfWgOdM2jdSLRvkF7P482F4+yIJYjBeZ4xur4DaYkV1/GI7J7iaTWl0c
9keWXd0Sb5B33DUC15jCrkXh0qVx0qZ0CENPNOg91cgsy/GE0h0TwgNQSI82NK3Q
LIr8J90ZTo3udY4NKj6vEl7v/vvGtw==
=Zag+
-----END PGP SIGNATURE-----

--jcOo3Xx3B2XL56n0--

