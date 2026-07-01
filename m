Return-Path: <linux-gpio+bounces-39317-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qTICCugNRWr55woAu9opvQ
	(envelope-from <linux-gpio+bounces-39317-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:54:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB26EDA0B
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:53:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=uYYRpxEM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39317-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39317-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56082311FB8D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED34481AAC;
	Wed,  1 Jul 2026 12:41:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50B48167D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 12:41:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909706; cv=none; b=mQH256GMx3WWAqZn9UXbFbmRvL0QZ/HZGtTjEhkXb+uiKmz81pCSbLH7Epb72t7cmnrCc+TUFej/7qm+3k3pNOJc1UwUdwnd5YQaS+YRZGfMYHGKWXkKxVHdI1JewN619XihGZycavSUXusny419OeHzfLbWpJOccGeKdFlGqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909706; c=relaxed/simple;
	bh=0ZdomL02xu7ntYOcZujydPsl6Y57PzcqWkoGuQL37LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4qIFQ+dr128aVil9068WdbEeMvhURD1t8JFwIIt74iUlceK8Z2OB3I8JQS3zJ5dBTl/dhfa6WHPH9T/+EvDGkeJwbeUZUvnCSsG214L50zPfdU5zpK0QfZo8N7lFRV4fWZLoV1oeIE3c1FqO9LZdW05LL1t2kjqokp/Nxl4uiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uYYRpxEM; arc=none smtp.client-ip=91.218.175.180
Date: Wed, 1 Jul 2026 15:41:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909702; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=AzosAtANTkH9HH3h+lmUsXw6NelnrxuZvtebyWK9CwQ=;
	b=uYYRpxEMrIxsTQCpDS1bwlVf2++TbRojDPsmyYHQM9E0kem3hYqoBOQeBWu75O5uTBtAOG
	4As1bFeTO+Sp7KUTadcgGKQQ2wsS0vBEB4Yjv7S3zrgUNFKzW6wF6KCK3SziJWhvDKaw04
	A2WG1oYwSgqDmxFynk2/YI5OYMaHmXA=
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
Subject: [PATCH 2/8] dt-bindings: mfd: ROHM BD73800 PMIC
Message-ID: <3e700a3fa7872a96257ff25a77670ec05cfd239c.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZyqjkF/aUdI92t5S"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url,linux.dev:dkim,linux.dev:from_mime,vger.kernel.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-39317-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFDB26EDA0B


--ZyqjkF/aUdI92t5S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

The ROHM BD73800 is a power management IC which integrates 8 BUCKs and 4
LDOs. There is also an ADC and operation amplifier intended for current
/ temperature measurement and accumulation. RTC and 32.768 kHz clock
gate are also included. The PMIC can be customized via OTP and it has
options for operating as a main PMIC in multi-PMIC installation. Some
of the pins can also be used for GPO or GPI (including interrupt support).

There are also ROHM BD71851 and BD71885 PMICs out there. These are, from
the SW-perspective, similar to the BD73800. There is only some different
default values and OTP settings. The driver should be able to handle them
just fine.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 .../bindings/mfd/rohm,bd73800-pmic.yaml       | 229 ++++++++++++++++++
 1 file changed, 229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic=
=2Eyaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml
new file mode 100644
index 000000000000..6371de08b865
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml
@@ -0,0 +1,229 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd73800-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD73800 Power Management Integrated Circuit
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description:
+  BD73800GW is a single-chip power management IC for battery-powered
+  portable devices. It integrates 8 buck converters, 4 LDOs and a current
+  sense amplifier with ADC. Also included is a Real Time Clock (RTC) and a
+  32.768 kHz clock gate. Depending on the OTP configuration the BD73800
+  may also have interrupt controller and GPIOs.
+
+  There are also different variants called BD71851 and BD71885 which are
+  almost identical from the software point of view.
+
+properties:
+  compatible:
+    oneOf:
+      - const: rohm,bd73800
+
+      - items:
+          - const: rohm,bd71851
+          - const: rohm,bd73800
+
+      - items:
+          - const: rohm,bd71885
+          - const: rohm,bd73800
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  # The GPIO1, CLKOUT (GPIO2), FAULT_B and EXTEN_OUT pins can be
+  # configured to interrupt pins by OTP.
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The IRQ number. 0 is GPIO1, 1 CLKOUT (GPIO2), 2 FAULT_B and 3 EXTEN_=
OUT.
+      NOTE, A pin can operate as IRQ source only when the OTP
+      configuration for it has been set to GPI.
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+# The GPIO1, CLKOUT, FAULT_B and EXTEN_OUT pins may be configured for a
+# specific purpose (like ADC input, 32.768 clk output, fault indicator or
+# delivering power sequence to a companion PMIC when multiple PMICs are
+# used) - but also to be either a GPO or GPI. (When used as a GPI the pin
+# can also be used as an IRQ source). The pin purpose is determined by
+# OTP (One Time Programmable memory), typically during device manufacturin=
g.
+# The OTP can't be read at runtime so device-tree should describe the pins.
+  rohm,pin-gpio1:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Indicate if the GPIO1 pin has been set to GPI or GPO at manufacturin=
g.
+    enum: [gpi, gpo]
+
+  rohm,pin-clkout:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Indicate if the CLKOUT pin has been set to GPI or GPO at manufacturi=
ng.
+    enum: [gpi, gpo]
+
+  rohm,pin-fault-b:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Indicate if the FAULT_B pin has been set to GPI or GPO at manufactur=
ing.
+    enum: [gpi, gpo]
+
+  rohm,pin-exten:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Indicate if the EXTEN_OUT pin has been set to GPI or GPO at
+      manufacturing.
+    enum: [gpi, gpo]
+
+  # The CLKOUT pin may have its purpose overridden by OTP configuration. I=
t is
+  # possible the BD73800 does not output a clock signal. Hence the optiona=
l clk
+  # properties.
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    const: bd73800-32k-out
+
+  rohm,clkout-open-drain:
+    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+
+  regulators:
+    $ref: /schemas/regulator/rohm,bd73800-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        pmic: pmic@4b {
+            compatible =3D "rohm,bd73800";
+            reg =3D <0x4b>;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
+
+            clocks =3D <&osc 0>;
+            #clock-cells =3D <0>;
+            clock-output-names =3D "bd73800-32k-out";
+
+            gpio-controller;
+            #gpio-cells =3D <2>;
+
+            rohm,pin-gpio1 =3D "gpo";
+            rohm,pin-exten =3D "gpi";
+
+            regulators {
+                buck1: buck1 {
+                    regulator-name =3D "buck1";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <2000000>;
+                    regulator-always-on;
+                    regulator-ramp-delay =3D <1250>;
+                    rohm,dvs-run-voltage =3D <1150000>;
+                    rohm,dvs-suspend-voltage =3D <950000>;
+                };
+                buck2: buck2 {
+                    regulator-name =3D "buck2";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <2000000>;
+                    regulator-always-on;
+                    regulator-ramp-delay =3D <1250>;
+                    rohm,dvs-run-voltage =3D <1150000>;
+                    rohm,dvs-suspend-voltage =3D <950000>;
+                };
+                buck3: buck3 {
+                    regulator-name =3D "buck3";
+                    regulator-min-microvolt =3D <1200000>;
+                    regulator-max-microvolt =3D <2700000>;
+                    rohm,dvs-run-voltage =3D <1150000>;
+                    rohm,dvs-idle-voltage =3D <1100000>;
+                    rohm,dvs-suspend-voltage =3D <950000>;
+                    regulator-always-on;
+                };
+                buck4: buck4 {
+                    regulator-name =3D "buck4";
+                    regulator-min-microvolt =3D <1100000>;
+                    regulator-max-microvolt =3D <1850000>;
+                    regulator-always-on;
+                };
+                buck5: buck5 {
+                    regulator-name =3D "buck5";
+                    regulator-min-microvolt =3D <1800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                    regulator-always-on;
+                };
+                buck6: buck6 {
+                    regulator-name =3D "buck6";
+                    regulator-min-microvolt =3D <1800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                    regulator-always-on;
+                };
+                buck7: buck7 {
+                    regulator-name =3D "buck7";
+                    regulator-min-microvolt =3D <1800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                    regulator-always-on;
+                };
+                buck8: buck8 {
+                    regulator-name =3D "buck8";
+                    regulator-min-microvolt =3D <500000>;
+                    regulator-max-microvolt =3D <1300000>;
+                    regulator-always-on;
+                };
+                ldo1: ldo1 {
+                    regulator-name =3D "ldo1";
+                    rohm,ldo-range-high;
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                    regulator-always-on;
+                };
+                ldo2: ldo2 {
+                    regulator-name =3D "ldo2";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                    regulator-always-on;
+                };
+                ldo3: ldo3 {
+                    regulator-name =3D "ldo3";
+                    regulator-min-microvolt =3D <800000>;
+                    regulator-max-microvolt =3D <3300000>;
+                    regulator-always-on;
+                };
+                ldo4: ldo4 {
+                    regulator-name =3D "ldo4";
+                    regulator-min-microvolt =3D <650000>;
+                    regulator-max-microvolt =3D <1750000>;
+                    regulator-always-on;
+                };
+            };
+        };
+    };
--=20
2.54.0


--ZyqjkF/aUdI92t5S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFCv4ACgkQeFA3/03a
ocU5qwgAkUr1Vv9VRV/4pMvTCV1oWcjcNAMO5ANBvvcTaEoGRA/oFONQrPm1/KWp
dY+oEo+ccLspzEIvMGls58sunBafA4LD34ji8iptxhxQTTsCKv+VujTJjINGopog
08glWMyyjCh5F42/Zzz3tJev+IH8hdLp5N7OWHZQLs6uxDGQe+hWQwZZ1EOgt39+
McLhm956dx3LkrACziiu6BxKIZVWEBfBe+qm81C6gxRHJ2Supx3rn4GNoMOX5LPp
4VxTkiVf/cZapIGz0JghkC4XnY2ezQUztu7krtwp37fU6nhQWXDO6R1Osc3bXUof
+UmxlikzeqQCyuLnzIHrrc4t8IxYeA==
=9RHj
-----END PGP SIGNATURE-----

--ZyqjkF/aUdI92t5S--

