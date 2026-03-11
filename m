Return-Path: <linux-gpio+bounces-33168-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGq4Cj2tsWmzEQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33168-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 18:58:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A3268599
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 18:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 406B530488BA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 17:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B5A3E63B2;
	Wed, 11 Mar 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy0lEcAr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA033F5A2;
	Wed, 11 Mar 2026 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251896; cv=none; b=UiLN+pw74oa4tjlHUTezYLFKbw/Vxc9t+m54vFbLTTRI1S+uLUN/8A5/OMWPaib/REp6/w4peW4k1+wkPZHR2WT2wfuPxCqSbX09ynsdcSn7Yx6pu87OQjhgtsPHetcftAOHCzZhDH3/NRoyFYMgLM//tveUZLqlpcUbK2to8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251896; c=relaxed/simple;
	bh=REZVKE/XRqdzPQdeJe3+5UNr7QWGQUq5Vy/h1znmS7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ3m0d8ptn+Tbe6RboTA5GIr0m+uHHEMe/mO5O0viC6U+ILzNK9VFD/I1znd10YB9tUOzQU1Dr8BwHyx/hEASFYpXjUe11ObERrEhDIEaJUVGS+/rGne+lUw8uIrDkBmC6jzvGQMyH/3YUnnF+EVTSwOw30NACvvuK8Is+ID80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy0lEcAr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C115BC4CEF7;
	Wed, 11 Mar 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773251895;
	bh=REZVKE/XRqdzPQdeJe3+5UNr7QWGQUq5Vy/h1znmS7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cy0lEcArPly5OmTy6AXVaIBxwh5aIVqDl3XTzJlbm+09THhYCehxaFsbZL/UVXuwX
	 2rhWaOSdRz8P0k5WYtDmeHYkAO5jTMG8qUwjS60kG5H0JMic48D1EpRgHPrnEiNf/+
	 Cto8rNNXqADIDBLjMvN0qNHnrrSntyv/d9DonpmTJFhzJUkHLOSApE5LueCNvokxMC
	 HS2pLcyXQtBd7aFWE8nnKrqm0p4lHQ0l4II+xluLxlfrdMB+HZ0T19O/4+xJ6VJ7ra
	 fiYABqLAfHI7CT3IJ4Zl1AoQxm7MRskJiao0WjoO8KbxH0KO3a2wXk2EHDobCKTEqy
	 dt7DvfeZCBFUA==
Date: Wed, 11 Mar 2026 17:58:10 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/4] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
Message-ID: <20260311-unlovable-ecosphere-07df196823b3@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
 <20260311-collar-smokiness-5313aa648a6f@spud>
 <177324727784.4047403.339169143402607624.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f75TBWoebi84s6Wt"
Content-Disposition: inline
In-Reply-To: <177324727784.4047403.339169143402607624.robh@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33168-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,bootlin.com:email,0.0.0.54:email]
X-Rspamd-Queue-Id: 8C5A3268599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--f75TBWoebi84s6Wt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob,

On Wed, Mar 11, 2026 at 11:41:17AM -0500, Rob Herring (Arm) wrote:
>=20
> On Wed, 11 Mar 2026 15:17:39 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On PolarFire SoC there are more GPIO interrupts than there are interrupt
> > lines available on the PLIC, and a runtime configurable mux is used to
> > decide which interrupts are assigned direct connections to the PLIC &
> > which are relegated to sharing a line.
> >=20
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 77 +++++++++++++++++++
> >  .../microchip,mpfs-mss-top-sysreg.yaml        |  4 +
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/microchip/mic=
rochip,mpfs-irqmux.yaml
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:

AAAAAAAAA, goddammit. I forgot there was a reason why I had not just
sent off the new version of the series.

> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.exa=
mple.dts:18.33-24.11: Warning (interrupt_provider): /example-0/interrupt-co=
ntroller@54: '#interrupt-cells' found, but node is not an interrupt provider
> Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.exa=
mple.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

I wanted to ask about this Rob, I wasn't sure I fully understood it.
I figured it was because...


> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (mi=
crochip,mpfs-irqmux): 'interrupt-map' is a required property
> 	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,m=
pfs-irqmux.yaml

=2E..I had not added the interrupt-map yet...

> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (mi=
crochip,mpfs-irqmux): 'interrupt-map' is a dependency of 'interrupt-map-mas=
k'
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (mi=
crochip,mpfs-irqmux): 'anyOf' conditional failed, one must be fixed:
> 	'interrupt-controller' is a required property
> 	'interrupt-map' is a required property
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml

=2E..so this schema complained. But why is there a custom warning about
"node is not an interrupt provider", when the conditional schema
produces a warning of its own?

> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.kernel.org/project/devicetree/patch/20260311-collar=
-smokiness-5313aa648a6f@spud
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

--f75TBWoebi84s6Wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabGtMgAKCRB4tDGHoIJi
0kLAAP4/StUCvibT5hub5xjSEE2d21x03BUhs+ifxgEyZFkLvgD9EcfeAWt2eGYl
AoCeqdx4b8MruMjeVy1/SlSu8M7GWwg=
=NT5s
-----END PGP SIGNATURE-----

--f75TBWoebi84s6Wt--

