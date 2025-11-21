Return-Path: <linux-gpio+bounces-28940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FAC78C33
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A1E93461D8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86EC348466;
	Fri, 21 Nov 2025 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYiHjYCX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813022BE658;
	Fri, 21 Nov 2025 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724103; cv=none; b=Ofg/mLbZrp47EothWR4Kp46KJwuqTsEFNcFCQJ5L9cE7qRH2bF7pHJ9qprLqseJABiUd1aeys49bOnK0vOxDSkg4mMmcvUcRIpRQb1CDFu9HV+O5xF12C2uMegEUyBG+XTKyBdb54NvzEIhyLtv6fGPUorY7EDqUV9mQpTXXJP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724103; c=relaxed/simple;
	bh=7KmeJvwXilI1DNvqnsGeVTWwmhzGeDmosqBJdCvMSks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phfLo+bjPAYoxAIZBVkE4P2XmNjn5vY3bNRXHiZ9HLYErIiQScD1al0cK0FsO9jT9tQWZSafXIRJi0wkpWO7mboBBBMWTk7g5afy/VADBU7PT/ntQpwdc9gS5HyRoDyFeDidhYDQDWy0qEOUBqzVpQne0FntMdKqTBz/GB64rfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYiHjYCX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EC2C4CEF1;
	Fri, 21 Nov 2025 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763724103;
	bh=7KmeJvwXilI1DNvqnsGeVTWwmhzGeDmosqBJdCvMSks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYiHjYCXW2GRmtqtHazS9GJ+IUjbkdFaGOtvKf2nBgmSH7eTonLcQv8UpkqtUVymd
	 yaVYOqAn7QtHBmFGO3CpggC4NXr2WtRjwpNCDtIM4n+xaJDYrxaVXzI0oOf9LR+fbW
	 MOMRv4k67kDngZRAItGoxyDjvmKsG0VHtwAcfal7GH1+O4HuBlslmJ5n01ukX9VABk
	 sWf2C2jZ0btsL1tgFBO1WgAMdaSbcEHQxiGEsDpKZk3AOwHVYPIq7QL1TASkXCxVNu
	 xY77Y6W/vlZrH8s0bEbAFVfjJ7SUhSTIAeiI7Yf9MgxFqaInULc6iWZiYqshzP260f
	 vuM1ux5eETwPw==
Date: Fri, 21 Nov 2025 11:21:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251121-skimpily-flagstone-8b96711443df@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud>
 <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud>
 <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
 <20251121-epidermis-overdue-1ebb1bb85e36@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6avqi2nAMlQdzEL"
Content-Disposition: inline
In-Reply-To: <20251121-epidermis-overdue-1ebb1bb85e36@spud>


--r6avqi2nAMlQdzEL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:46:54AM +0000, Conor Dooley wrote:
> On Fri, Nov 21, 2025 at 12:13:21AM +0100, Linus Walleij wrote:
> > On Thu, Nov 20, 2025 at 1:26=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > > On Wed, Nov 19, 2025 at 10:48:07PM +0100, Linus Walleij wrote:
> > > > On Wed, Nov 19, 2025 at 7:23=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> >=20
> > > > I looked at the bindings that look like this and are not 1:1 to the
> > > > in-kernel configs:
> > > >
> > > >   input-schmitt-enable:
> > > >     type: boolean
> > > >     description: enable schmitt-trigger mode
> > > >
> > > >   input-schmitt-disable:
> > > >     type: boolean
> > > >     description: disable schmitt-trigger mode
> > > >
> > > >   input-schmitt-microvolt:
> > > >     description: threshold strength for schmitt-trigger
> > > >
> > > > 1. input-schmitt is missing! But it is right there in
> > > > drivers/pinctrl/pinconf-generic.c ... All DTS files appear to be
> > > > using input-schmitt-enable/disable and -microvolt.
> > > >
> > > > 2. input-schmitt-microvolt should probably be used separately
> > > > to set the voltage threshold and can be used in conjunction
> > > > with input-schmitt-enable in the same node. In your case
> > > > you probably don't want to use it at all and disallow it.
> > > >
> > > > They are all treated individually in the parser.
> > > >
> > > > Maybe we could patch the docs in pinconf-generic.h to make it clear=
 that
> > > > they are all mutually exclusive.
> > > >
> > > > The DT parser is a bit primitive for these.
> > > > For example right now it is fine with the schema
> > > > to set input-schmitt-enable and input-schmitt-disable at the same t=
ime, and
> > > > the result will be enabled because of parse order :/
> > >
> > > > The real trick would be to also make the
> > > > schema in Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > > make them at least mutually exclusive and deprecate the
> > > > input-schmitt that noone is using, maybe that is simpler than I thi=
nk?
> > >
> > > I think that this is probably what to do. Mutual exclusion isn't
> > > difficult to set up there and if there's no property for "input-schmi=
tt"
> > > then deprecating it sounds pretty reasonable?
> >=20
> > Yeah I agree.
> >=20
> > Do you want to look into it?
> >=20
> > Otherwise it becomes my problem now that I've noticed it :D
>=20
> Yeah, it's just a binding patch here I think, so yeah I'll do it.

ngl, I forget if there's a shorthand for the bias part, so I just want
to know if is this an accurate summary of what's exclusive?

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/D=
ocumentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index cbfcf215e571..6865472ac124 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -153,4 +153,66 @@ properties:
       pin. Typically indicates how many double-inverters are
       used to delay the signal.
=20
+allOf:
+  - if:
+      required:
+        - output-disable
+    then:
+      properties:
+        output-enable: false
+        output-impedance-ohms: false
+  - if:
+      required:
+        - output-low
+    then:
+      properties:
+        output-high: false
+  - if:
+      required:
+        - low-power-enable
+    then:
+      properties:
+        low-power-disable: false
+  - if:
+      required:
+        - input-schmitt-disable
+    then:
+      properties:
+        input-schmitt-enable: false
+        input-schmitt-microvolt: false
+  - if:
+      required:
+        - drive-open-source
+    then:
+      properties:
+        drive-open-drain: false
+  - if:
+      anyOf:
+        - required:
+            - bias-disable
+        - required:
+            - bias-high-impedance
+        - required:
+            - bias-hold
+        - required:
+            - bias-up
+        - required:
+            - bias-down
+        - required:
+            - bias-pull-pin-default
+    then:
+      oneOf:
+        - required:
+            - bias-disable
+        - required:
+            - bias-high-impedance
+        - required:
+            - bias-hold
+        - required:
+            - bias-up
+        - required:
+            - bias-down
+        - required:
+            - bias-pull-pin-default
+
 additionalProperties: true



--r6avqi2nAMlQdzEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSBLQgAKCRB4tDGHoIJi
0uCUAQCsDnusC4XnS1EgnJW8hU0Zp+g9t7EcxPUbQUCLK/pBUwEAuqZ1bmtJnoFC
jTQLg1HLTTtuGST6zX4Ucpfc6JoqJwI=
=LV3W
-----END PGP SIGNATURE-----

--r6avqi2nAMlQdzEL--

