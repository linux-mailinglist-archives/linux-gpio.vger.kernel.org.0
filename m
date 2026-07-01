Return-Path: <linux-gpio+bounces-39316-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GkykIXwURWqM6goAu9opvQ
	(envelope-from <linux-gpio+bounces-39316-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:22:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C76EE066
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:22:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=G3D4uGO3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39316-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39316-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10AFD32E9DE4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CCB481673;
	Wed,  1 Jul 2026 12:41:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129C48123F;
	Wed,  1 Jul 2026 12:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909699; cv=none; b=qWe8jEey1yeZNxVJDAy0hQmRpj68yOAn88I7ptcluJqWdLy5F/0Gxd8XzV4nXCi4zHtEyxH98XK5MUUydlXh879MdOEeDAO0Zwaya/YjCvJ6zccxoAiGTqgaG6mx+H897JYjvUFLOOmJNvzEJUuyTuzxKk/vcScBWFC33hpZ+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909699; c=relaxed/simple;
	bh=InBLkfXjp3T1Zwtd+0sckVRf5My5XuAqvJacDWEOf7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1MwV/C6zsaVq3oekABXl72WfFWf/NnVFRNneDrb4OBG3NTj3+R9J63n9Llo6APINMpTM6YpEv/2QZCKKhw9OY9L4GcdtAt9Zbsifjk+opS1vG8pFl81sX53ZWLZFTy8vfmo5FjSFf1FEpnyw4E5lZ9Vrd60Y3IQg/fHN5qVuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G3D4uGO3; arc=none smtp.client-ip=95.215.58.183
Date: Wed, 1 Jul 2026 15:41:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909685; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=W32RUxeDi1R2eooDgqltvM+rPOaIvVbXo7pvR37qo98=;
	b=G3D4uGO36bv0J+XWYw+QIjayasY9dt9ovvA7Twtf+vaWUn1vUmaQQBV5kP4zo+WUroTjZM
	/0Jw5fA/PFE0Wr5/XshYdCgZRcx6OoTrHE20dWGgcsayZa6/g3+r5CcJkabnqf9XQGZkPB
	EolngxIPXwyrdqD+0cFbO5gSiLQVPhs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: regulator: ROHM BD73800 regulators
Message-ID: <67b42b5363533f11c22a6421417c3345f9872aec.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vix9+puGfqriyr7Z"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FROM_HAS_DN(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sea.lore.kernel.org:server fail,devicetree.org:server fail,linux.dev:server fail];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-39316-lists,linux-gpio=lfdr.de];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:from_mime,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 818C76EE066


--Vix9+puGfqriyr7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add bindings for the BUCKs and LDOs on ROHM BD73800. The PMIC state
specific voltages can be set in same fashion as with a few other ROHM
PMICs (for example with BD718[15,28,37,47,50,79]). Same properties are
recycled :)

The LDOs 1 and 4 can use different voltage ranges depending on the OTP
configuration.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 .../regulator/rohm,bd73800-regulator.yaml     | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd7380=
0-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd73800-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd73800-regula=
tor.yaml
new file mode 100644
index 000000000000..c427a04098ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.ya=
ml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd73800-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD73800 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description: |
+  This module is part of the ROHM BD73800 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  Regulator nodes should be named to buck<number> and ldo<number>.
+  The valid names for BD73800 regulator nodes are
+  buck1, buck2, buck3, buck4, buck5, buck6, buck7, buck8
+  ldo1, ldo2, ldo3, ldo4
+
+patternProperties:
+  "^buck[1-8]$":
+    type: object
+    description:
+      Properties for a single BUCK regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        pattern: "^buck[1-8]$"
+        description:
+          should be "buck1", ..., "buck8"
+
+      rohm,dvs-run-voltage:
+        description:
+          PMIC default "RUN" state voltage in uV. 0 means disabled. See the
+          explanation below for regulator specific details.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3500000
+
+      rohm,dvs-idle-voltage:
+        description:
+          PMIC default "IDLE" state voltage in uV. 0 means disabled. See t=
he
+          explanation below for regulator specific details.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3500000
+
+      rohm,dvs-suspend-voltage:
+        description:
+          PMIC default "SUSPEND" state voltage in uV. 0 means disabled. Se=
e the
+          explanation below for regulator specific details.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3500000
+
+        # BUCKs 1,2,3,4 and 8 support voltages 0.5 - 1.3V
+        # BUCK 5 supports voltages 0.3 - 1.3V
+        # BUCKs 6 and 7 support voltages 1.5 - 3.5V
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  "^ldo[1-4]$":
+    type: object
+    description:
+      Properties for single LDO regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        pattern: "^ldo[1-4]$"
+        description:
+          should be "ldo1", ..., "ldo4"
+
+      rohm,dvs-run-voltage:
+        description:
+          Set the default output state at PMIC's "RUN" state.
+          0 is disabled, 1 is enabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 1
+
+      rohm,dvs-idle-voltage:
+        description:
+          Set the default output state at PMIC's "IDLE" state.
+          0 is disabled, 1 is enabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 1
+
+      rohm,dvs-suspend-voltage:
+        description:
+          Set the default output state at PMIC's "SUSPEND" state.
+          0 is disabled, 1 is enabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 1
+
+      rohm,ldo-range-high:
+        type: boolean
+        description:
+          LDO1 and LDO3 voltage ranges can be "high" or "low" depending on
+          OTP. Indicate that the "high" range is used. See comment below
+          for voltages.
+
+        # LDOs 2 and 4 support voltages 0.75 - 3.3V
+        # LDOs 1 and 3 may support different ranges depending on OTP.
+        # either 0.6 - 1.8V or 0.75 - 3.3V.
+
+    unevaluatedProperties: false
+
+additionalProperties: false
--=20
2.54.0


--Vix9+puGfqriyr7Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFCucACgkQeFA3/03a
ocWfSgf+JDZdKCG82CyT9JwSIX0usDVLf+GGrv/78ITz/Lf63AJlM/e+urj/zoAf
V9mEf1bAZhJWmjIvlw/cjvHx/C9VbLEL5iMMnPQvDahLoWUekMH+VjxE3PFWdwSc
xiOiBMHIlf2qUFnIoC6tZu8SmIQk9TexKLW+DE8uasXeoC1frryu3cAPzfKyGFuD
50gZMbNV8bCBK+f0uOngP1nn2kCmh1TGlcjhWoFczRgljZnDOQdmpYxxhM8bbulF
ia4BUq7wjZD750OETJDJnTkEbTIead0MqaSfhzZa67kBbR6vJWoWcxKjTy/6EtsS
G4l9zhWHnuwzj4kYIQcLttGz09CHBw==
=vu4f
-----END PGP SIGNATURE-----

--Vix9+puGfqriyr7Z--

