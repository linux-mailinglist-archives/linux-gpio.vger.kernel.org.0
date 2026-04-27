Return-Path: <linux-gpio+bounces-35609-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iErgKYS372kbEQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35609-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:22:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6B479371
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 364C7300939B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C003FB07B;
	Mon, 27 Apr 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfwplO/y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA13FAE05;
	Mon, 27 Apr 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777317751; cv=none; b=HEaMhlw7eJAQVi5HUEOw1lOI3TqTN/I2iunnJWG4ub0OS+hvFR2IN7D8wF/pmuqgb9WuDO9g7oEk5481aaN0Bj3FBUziL+YFpk2t2uavP/kYVjMgkRevLeJ6fzBRuwwjIulQ/Jjqlq4hANcvD8tiS2oHqAdabFePVd6x7KQPN1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777317751; c=relaxed/simple;
	bh=RK/en2PFPrMnlokfxtIgWIY1YPByuKAHVLSjg/38PII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dckdHRppT0FGyyWG/2p3XYlYj7JbT/ftY27sm9YKQGEjSxdKibtM4ddUqyKiwt56KgGu3k8PUMWdXs085/NTSQUk6jGvsm7wrlu4JOl7nRd3i9yp6Kr813BjGThtVGUwnx5uZmuTF3uhfk375S2AKuIBN0oAytG3TnHPTGycxf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfwplO/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8093C19425;
	Mon, 27 Apr 2026 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777317749;
	bh=RK/en2PFPrMnlokfxtIgWIY1YPByuKAHVLSjg/38PII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfwplO/yQ6P+GWbuuriZa2ilj35CtdG/ynHTX5g5m6wsRSGByX3oqsM4U6yTzSlT1
	 IC7FYZ3r6xLjI3JXJCF7896TatamkpS3vINVV9iZhdcxiJYpt1PDFm9ls5qeBXNdo8
	 KQNd8DnfHmSv3xwRdpW9wBVgEZ0yOkfwOXB9z7q23FgTt0xXPdASdZ8zoKiQ6IXzyZ
	 JSkyErih7t6S+Sz1+qMEmVAnf244aEOSnlfb2B7q1DW2GNxs0vEIh/XaZ88hGeHjhU
	 VXhg4B60+EpEZ3VwdtSMhpM9mrwHtbgrYKiVMj3ZfoK0/syhkF8F3EVeJMyQEvde8K
	 6/BNuicQuV4ug==
Date: Mon, 27 Apr 2026 20:22:24 +0100
From: Conor Dooley <conor@kernel.org>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Message-ID: <20260427-village-snub-0ba825a90289@spud>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
 <20260424-reshoot-postage-7bfe0a5eca80@spud>
 <AS8PR04MB9080CEB000F4F1C9043E8C21FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnWy0yNUsmVBnDwK"
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080CEB000F4F1C9043E8C21FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-Rspamd-Queue-Id: EBF6B479371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35609-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email]


--qnWy0yNUsmVBnDwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 08:12:10AM +0000, G.N. Zhou (OSS) wrote:
> Hi Conor,
>=20
> Thanks for your review.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Saturday, April 25, 2026 1:09 AM
> > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>; Mauro Carvalho
> > Chehab <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Fra=
nk
> > Li <frank.li@nxp.com>; Vladimir Zapolskiy <vz@mleia.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; linux-
> > media@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; imx@lists.linux.dev; linux-gpio@vger.kernel.org=
; G.N.
> > Zhou <guoniu.zhou@nxp.com>
> > Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add suppo=
rt for
> > remote GPIO data source
> >=20
> > On Fri, Apr 24, 2026 at 09:42:24AM +0800, Guoniu Zhou wrote:
> > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > >
> > > The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as
> > > an output, it can be programed to output local data or remote data
> > > coming from the remote compatible deserializer.
> > >
> > > Add GPIO flag in second cell to select remote GPIO data source.
> > >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > > Changes in v6:
> > > - Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h
> > > - Updated dt-bindings documentation accordingly
> > > - Dropped Reviewed-by tag from Rob Herring due to significant binding
> > > change
> > >
> > > Changes in v5:
> > > - Improve the description for "#gpio-cells" as commented by Conor.
> > >
> > > Changes in v4:
> > > - Use folder block instead of literal block for #gpio-cell property d=
escription.
> > >
> > > Changes in v3:
> > > - Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
> > >   compatible deserializer suggested by Rob instead of adding third
> > >   cell for GPIO controller.
> > >
> > > Changes in v2:
> > > - Remove new property ti,gpio-data
> > > - Add third cell for GPIO controller to select GPIO output source.
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 6 ++=
++-
> > -
> > >  include/dt-bindings/gpio/gpio.h                               | 8 ++=
++++++
> > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > > b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > > index 2e129bf573b7..da63771bc236 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> > > @@ -21,8 +21,10 @@ properties:
> > >    '#gpio-cells':
> > >      const: 2
> > >      description:
> > > -      First cell is the GPIO pin number, second cell is the flags. T=
he GPIO pin
> > > -      number must be in range of [0, 3].
> > > +      First cell is the GPIO pin number (0-3) and the second cell is=
 used
> > > +      to specify flags. See <dt-bindings/gpio/gpio.h> for available =
flags
> > > +      including GPIO_DATA_SOURCE_REMOTE for remote GPIO data source.
> > > +      Flags can be OR'd together.
> > >
> > >    gpio-controller: true
> > >
> > > diff --git a/include/dt-bindings/gpio/gpio.h
> > > b/include/dt-bindings/gpio/gpio.h index b5d531237448..d04a494d96ad
> > > 100644
> > > --- a/include/dt-bindings/gpio/gpio.h
> > > +++ b/include/dt-bindings/gpio/gpio.h
> > > @@ -42,4 +42,12 @@
> > >  /* Bit 6 express pull disable */
> > >  #define GPIO_PULL_DISABLE 64
> > >
> > > +/*
> > > + * Bit 24 indicates the GPIO data source is from a remote device.
> >=20
> > Why 24, not 7?
>=20
> Good question. I chose bit 24 for the following reasons:
> - There is no clear guidance in the documentation on how to add custom
>    GPIO flags, so I wanted to ensure sufficient separation from the gener=
ic
>    GPIO flags to avoid potential conflicts.
> - The generic GPIO flags currently use the lower bits (0-6). By using
>    bit 24, I'm leaving ample room (bits 7-23) for future expansion of
>    generic flags without risking collision.
> - This also reserves space (bits 25-31) for potential future custom
>    flags that may be needed by this or other drivers.
>=20
> However, if there's a preferred convention or range for driver-specific
> GPIO flags that I'm not aware of, I'm happy to adjust this.
>=20
> >=20
> > > + * This is used in serializer/deserializer setups where the GPIO pin
> > > + * on the local device (e.g., TI DS90UB953 serializer) reflects the
> > > + * state of a GPIO on the remote device (e.g., TI DS90UB960 deserial=
izer).
> > > + */
> > > +#define GPIO_DATA_SOURCE_REMOTE		0x01000000
> >=20
> > And why the divergent formatting compared to other defines in this file?
>=20
> You're right about the formatting inconsistency.
>=20
> The existing decimal notation (8, 16, 32, 64) works well for lower bits, =
but
> 16777216 (decimal for bit 24) is much less readable than 0x01000000. It's
> also harder to verify correctness and more error-prone.
>=20
> If consistency with the existing style is preferred, I can use decimal, b=
ut
> I'd suggest considering updating all these defines to use BIT() hex for b=
etter
> Readability and maintainability. What's your preference?

FWIW, I'm not ignoring you, but I won't reply until the more important
discussion with Linus has been resolved.

--qnWy0yNUsmVBnDwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+3cAAKCRB4tDGHoIJi
0iMFAQDoj7Q8kDnn01dIDQnU291BukJMhyGb4Zg48I77EvmhsQD/fwjh7DGoN0bE
BX3WisaXgSs+YjsQGNnaHQrN1RwWEQo=
=3Ths
-----END PGP SIGNATURE-----

--qnWy0yNUsmVBnDwK--

