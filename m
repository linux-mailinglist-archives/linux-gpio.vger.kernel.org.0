Return-Path: <linux-gpio+bounces-33779-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDF1MU5Tu2lMigIAu9opvQ
	(envelope-from <linux-gpio+bounces-33779-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:37:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB92C48C4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8D443017DC0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 01:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5301D33ADAD;
	Thu, 19 Mar 2026 01:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5BRtnw6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CBE33263B;
	Thu, 19 Mar 2026 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773884199; cv=none; b=KsJ1OdnsW/Y4KSQIn0YbtEuiDLis9GoXvOuXZRSHgaOC8B83jSE8O2E8Ut+74QRDflTnXgm+oWpL2crvGxA77il3MLjzFiJk68/BTBb4pGvGvI0yNBLSISt3BFJ9yYpfKZheKSxnsaf/xroZIdJNOzEr30qJgc1kmxnqm1Gia8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773884199; c=relaxed/simple;
	bh=sQ9S+t4COwhuFxYoWBjkSUbfHgYR1riJrMiDGK+HRh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4qjoeUGTBSr2b+AxYRPuaSbn5LvebTYmrTnzxUnIODmSDZ3fi3KWdcoD1c/hi39wQwikLYgs5dtzG8WEsiO4hYJDay7yXY6lL7WEc01JlPhZkbOucrQAKEAofQMD2PAVbwJ6jBWGapZ1e1Y/f8WD6/U0LvsDxXkETxpulJx0J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5BRtnw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4215C19421;
	Thu, 19 Mar 2026 01:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773884198;
	bh=sQ9S+t4COwhuFxYoWBjkSUbfHgYR1riJrMiDGK+HRh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5BRtnw6drSdoWmxEklt+Rjt7mGp6DfUCqRw4LNPMcm4Ht23m1oQd1kG3az99XtTt
	 mfD8a7x8C1E0od3DjgkYqtI8Oplqy2wo0mR+hxYgOZrdHm11EIBj5VnkeTxyEF2kew
	 4vrPo0B99vs9znEg0qJD3tGBdPfYRSOneaKRC5Lcasy/GsNDZ48ySq2/ejIQMFWYdp
	 9XVftGCZS3T4mWtWx3yOXylCr7UH/1u5FYrwXdHkEeflo4X3cWCLCkPBoNauZaAVmK
	 reS5kcyJfgbXTtHp25oq3iSijm45Zzci9qk2dy4TgTXeZEQewMsknjHvuDIX/n8r0l
	 0ia6wp+wIUPlg==
Date: Thu, 19 Mar 2026 01:36:33 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
Message-ID: <20260319-cleat-doorman-922ab3729b52@spud>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud>
 <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
 <20251208-headgear-header-e17e162f0f52@spud>
 <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
 <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
 <CA+V-a8vNeJdbjJ6K9QkedHgAprC=Z0ckUztwe1ZapSiqjPKEsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="np5LBp3+k11Z84gj"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vNeJdbjJ6K9QkedHgAprC=Z0ckUztwe1ZapSiqjPKEsw@mail.gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33779-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.969];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,linaro.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73BB92C48C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--np5LBp3+k11Z84gj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 09:30:06PM +0000, Lad, Prabhakar wrote:
> Hi All,
>=20
> On Mon, Jan 19, 2026 at 12:10=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
> >
> > Hi Lad,
> >
> > I think this back-and-forth must be a bit stressful. Sorry about that.
> >
> > On Wed, Jan 14, 2026 at 9:53=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >
> > > > > > > > +      renesas,drive-strength:
> > > > > > > > +        description:
> > > > > > > > +          Drive strength configuration value. Valid values=
 are 0 to 3, representing
> > > > > > > > +          increasing drive strength from low, medium, high=
 and ultra high.
> > > > > > >
> >
> > > I got the feedback from the HW team "The RZ/T2H drive strength
> > > (driving ability) is expressed using abstract levels such as Low,
> > > Middle, and High. These values do not correspond directly to specific
> > > mA units.
> >
> > But they do correspond to *something* electrical inside the
> > silicon do they not? Then what is that?
> >
> > I think it is just 1, 2, 3 or 4 driver stages.
> >
> > > To determine how much current the pin can actually drive,
> > > the engineer must refer to the electrical characteristics table.
> > > Therefore, the drive strength in RZ/T2H is a parameter that switches
> > > the internal output transistor mode rather than directly representing
> > > a physical drive current.
> > >
> > > Consequently, expressing RZ/T2H drive strength in milli- or
> > > micro-amps, as suggested by the reviewer, is inappropriate. To
> > > accurately reflect the SoC's hardware specification, introducing a
> > > custom property is essential."
> >
> Sorry for the confusion , there was a miscommunication regarding the
> specs, but it=E2=80=99s all been sorted out. The drive-strength settings =
on
> this chip are 2.5/5/9/11.8 mA, I will represent them using the
> drive-strength-microamp DT property and send a new version.

neat :)

--np5LBp3+k11Z84gj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabtTIQAKCRB4tDGHoIJi
0ql1AP9ysMDTWQsOxxKKrwhxFbvCogLtOnFCUjA40DK4MCrEfAD/bI+m0QT7sICr
Vh5vZn/KFYCxnY42LSsUvytzeXUBYQo=
=BFsu
-----END PGP SIGNATURE-----

--np5LBp3+k11Z84gj--

