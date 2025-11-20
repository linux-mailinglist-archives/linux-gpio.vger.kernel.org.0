Return-Path: <linux-gpio+bounces-28870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3577C72C8D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 09:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BEDB13536AD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 08:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6C230DD2C;
	Thu, 20 Nov 2025 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JYXDB66v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3930C62F
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626810; cv=none; b=DGvjmAoiuSeQo5PScA58bc41USmJfWJbjcrHjyAF1VyZQDX3gxiMniA/KuTsRmTVxF54X38I8FHYoONZIBvJsRp5H0RpRRvUB+gfmQkA7tz+lvUkFdh4dPSvx9ZGw/Avp4FiIlo2NzOuCpDl/rhuEwnIxegbOTnQkU7TH73+Ux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626810; c=relaxed/simple;
	bh=6GjRBxIEq16fvySibBGoXBETlm2Ts8lIXfMePHALfHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs5oKR98PQEBFJ9Uqs+rt8m+ieO/J1bCuMlehnXNw5qzrbXU38L9In8ealFIGWeVobKNPPTjwUjZm86kBm8wpmO5Vi5Mnb2bSyi7sl7IKcAMTwFELGxJCEE5BjRYjx9dRhGshFayIGEA/O8wuMgEL0kPU14cLIrZwcXD9HFBV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JYXDB66v; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 20 Nov 2025 10:19:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763626805; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=yfYUQcha5v1Ro+j4Y2wvfYErfjiZB7zoAjiaqjqPWso=;
	b=JYXDB66vuKNXEk2D3132rkddGcxfAVPUElUP5/vKLGgxXccAwZDDK/c8R3TCKK5doobnPg
	CJCy5oThvA9ODv7CI08v101zc5r9jTNyfZyIjDDYls4eR8gfn3azpgKw9V+gx537WAm4Rq
	xj8vpG1mIo+r0LG/koQNOO2smC0AT94=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v5 02/16] dt-bindings: battery: Clarify trickle-charge
Message-ID: <0b12e7761c670b228f3a4c49736c838a38fbcc81.1763625920.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1763625920.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdzOgAxX3iPmgcNW"
Content-Disposition: inline
In-Reply-To: <cover.1763625920.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--zdzOgAxX3iPmgcNW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

The term 'trickle-charging' is used to describe a very slow charging
phase, where electrons "trickle-in" the battery.

There are two different use-cases for this type of charging. At least
some Li-Ion batteries can benefit from very slow, constant current,
pre-pre phase 'trickle-charging', if a battery is very empty.

Some other batteries use top-off phase 'trickle-charging', which is
different from the above case.

The battery bindings use the term 'trickle-charge' without specifying
which of the use-cases properties are addressing. This has already
caused some confusion.

Clarify that the 'trickle-charge-current-microamp' refers to the first
one, the "pre-pre" -charging use-case.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
Revision history:
 v3 =3D> :
 - No changes

 v2 =3D> v3:
 - New patch
---
 .../devicetree/bindings/power/supply/battery.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/=
Documentation/devicetree/bindings/power/supply/battery.yaml
index 491488e7b970..bfb7b716ae13 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -64,7 +64,12 @@ properties:
     description: battery design capacity
=20
   trickle-charge-current-microamp:
-    description: current for trickle-charge phase
+    description: current for trickle-charge phase.
+      Please note that the trickle-charging here, refers "wake-up" or
+      "pre-pre" -charging, for very empty batteries. Similar term is also
+      used for "maintenance" or "top-off" -charging of batteries (like
+      NiMh bq24400) - that is different and not controlled by this
+      property.
=20
   precharge-current-microamp:
     description: current for pre-charge phase
--=20
2.51.1


--zdzOgAxX3iPmgcNW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmkezywACgkQeFA3/03a
ocXYYQf/VF3miohBdq8SjlP0EDn8Hu4OBOPvuTttflpQJzsBgS/dACSOqBUI/RxF
heA/ZSqAZuZx3Ud6uTzS5m3v76W0pz0dnNJk+R4NUwDL30IQD7XnBaTzmV1hv80D
7+XWCtV35sV53uVCW79BRkH6pb810MlVWiA1d+gJwuZRFKyzg/qP39eKaP8i3gZE
NH7D/XKIiXKOr6fNmM0ADw3aH/ozNs03D9tBuPFc7aXEiyBtuvZl+J7/+or7kE71
KzN1AMJdYjBOj7ldQ0oWUg0o2JEA8lHTh7kamg3zxpncOfnHcohcLAOVSb8UAWsS
2dkd1M3JS/mv6FInTgkqa6rVpjm5eA==
=/tgU
-----END PGP SIGNATURE-----

--zdzOgAxX3iPmgcNW--

