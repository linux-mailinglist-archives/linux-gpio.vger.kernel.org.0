Return-Path: <linux-gpio+bounces-36872-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOq5G/07BmqmggIAu9opvQ
	(envelope-from <linux-gpio+bounces-36872-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:17:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B2546F8B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 892E6302CD20
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 21:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF703A452A;
	Thu, 14 May 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLeChtU/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79118872A;
	Thu, 14 May 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793464; cv=none; b=YoqEne0WDD5iydid6+8k9sT9OhEgmpSKEcl4+HAWzTxjfbh4orTySKovU6WcqGBmP25tWijEBOFzJo/ISwu+5JdPVliZvqiTPwIAcZULoM+QeIqApEk+97fics8GtYOA8jCSJXOe1aYrG/AhlLZmKMwrHIJaJqEyA8hA4JzHMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793464; c=relaxed/simple;
	bh=/NdY3pv7skq3tudd8McfRh9qYdCGpiAy0ZZIVMidS9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6Xi7C+7+0MyeJPm+C5LlD54kn27W1P7FcerAiLbwqL1QlJMhSqZMLbhN2bHg892XnZzueMx50Nw78lqHf9EySOad9Pj/mJUhbFEhjnDLFRdRp1kiNh6u7CG7MjAKz6n8YdfCR8oc704Y/3dyJ4qMWMTPeNUXCi7JR2h61aiIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLeChtU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44D0C2BCB3;
	Thu, 14 May 2026 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778793463;
	bh=/NdY3pv7skq3tudd8McfRh9qYdCGpiAy0ZZIVMidS9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLeChtU/7WwS0rTOwj/qnTGWMlRYlUquA8xBxVymApt9lRxGpCLgNJcH2zYMZ//5I
	 UdDpLiiirRBsL6HQg9YfXToW3FQM+gDZs1m33ywjT+K2r8aN1WQ3DfGQn+iwfISDZ0
	 SKns6V782tC9amhFKpR0hAwKun2T1qc9Q1nulnN8tgVF0Z6sIuDfeDfkrjdNQw5g4h
	 7yDBZZT3WD5Nulwg9N7YM/mLuQD0py7sXEynnw2MVx4poJG7wJ0dCgrfTwwCxLDTb9
	 ZcPne87zfEbaxSKcaplNOhzM52C7tnXvPYqFmlEJWQhFA5L7VBomI1GvUfqfVOXVW9
	 UphG5j6hHYN4w==
Date: Thu, 14 May 2026 22:17:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linusw@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: fix signature of extract
 pinctrl_generic_to_map() in nop case
Message-ID: <20260514-refreeze-agent-39c72d5b7f08@spud>
References: <20260514-slum-sprinkler-8f858eb81faf@spud>
 <agY5wJtsBDh_dPbe@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w/GGrOEK+6+0ehSd"
Content-Disposition: inline
In-Reply-To: <agY5wJtsBDh_dPbe@lizhi-Precision-Tower-5810>
X-Rspamd-Queue-Id: DC1B2546F8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36872-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--w/GGrOEK+6+0ehSd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 05:08:16PM -0400, Frank Li wrote:
> On Thu, May 14, 2026 at 09:01:27PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The signature of extract pinctrl_generic_to_map() is incorrect when
> > CONFIG_GENERIC_PINCTRL and CONFIG_OF are not enabled. Probably a
> > hangover from an earlier revision of the patchset that was not updated
> > that went undetected given it depends on OF being disabled.
>=20
> Thanks, I already posted fix patch at
>=20
> https://lore.kernel.org/imx/20260512144806.22447-1-Frank.Li@nxp.com/T/#u
>=20

Oh, I didn't realise that was a fix for this because the subject is
has nothing to do with the problem. That looks like it should be two
patches.

Thanks,
Conor.

> Frank
>=20
> >
> > Fixes: aaaf31be04260 ("pinctrl: extract pinctrl_generic_to_map() from p=
inctrl_generic_pins_function_dt_node_to_map()")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > CC: Linus Walleij <linusw@kernel.org>
> > CC: Frank Li <Frank.Li@nxp.com>
> > CC: Conor Dooley <conor.dooley@microchip.com>
> > CC: linux-gpio@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  drivers/pinctrl/pinconf.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> > index fa8fb0d290d1d..9711d16c38b62 100644
> > --- a/drivers/pinctrl/pinconf.h
> > +++ b/drivers/pinctrl/pinconf.h
> > @@ -195,7 +195,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev,=
 struct device_node *parent,
> >  		       unsigned int *num_maps, unsigned int *num_reserved_maps,
> >  		       const char **group_name, unsigned int ngroups,
> >  		       const char **functions, unsigned int *pins,
> > -		       void *function_data)
> > +		       unsigned int npins)
> >  {
> >  	return -ENOTSUPP;
> >  }
> > --
> > 2.53.0
> >

--w/GGrOEK+6+0ehSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagY79AAKCRB4tDGHoIJi
0oUJAP9a62s9LWqHmOY5jIy423fm9POc31JgBsdLs60MoOqGAAEAhmHdWnmpVROE
tqe8KQS5Zv5mmHlXuoCy4oqYMn8uLQU=
=H0zo
-----END PGP SIGNATURE-----

--w/GGrOEK+6+0ehSd--

