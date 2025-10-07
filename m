Return-Path: <linux-gpio+bounces-26858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64BBC0B21
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 10:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F083AC08C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 08:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9892DCF4D;
	Tue,  7 Oct 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGNcXrQL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B362D949E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825987; cv=none; b=COeUIVgpCaf6qqCWgbxmoZgyH1KmKQKcPCCycI7F4IUVmhb/tYLYh+S25ZWYRV9sC2JMCL6jgCTIkCB8qABXmXtZy7T7lSJyAyVpztiIA+GRjQYxQ8S0RyBsAKKHg5FwOB6zHTsjbj5qC9WYAeSi+RK3P7zaGslwUZyUAKo/fZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825987; c=relaxed/simple;
	bh=O+OzpO7nuiNp+tQ5SaJvkPQc46KvjmbBEKhSAjhrkYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRZIECPHajM2JE2zCwl6YHMkanV1isA3mPrQeroX7mqM36apFDULw/g+opKRk0Z09xheGZb3PXjYu1r+3l0ZMYmG/Zr4+CR2B3SgzLnoqCH/3wyDGmi9jigTsaqHp1yzqoHL8dJg1T4uSwnFo/65hdv6tt0jjbRrTfBzobia6kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGNcXrQL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3696f1d5102so37740751fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759825981; x=1760430781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJBgNYNLNnpXb6QYC+z4Cdfg6JdOrjXxzZiYm8s3Uh8=;
        b=DGNcXrQLXRNDxQrlAFAB1IWkeNAWXnvR8m6k/n9KEvtJY0hSpc/6zhioFlqedE04IA
         GHMMeFmQI/XezfujMwx47Q0IWyGR9QZR5c53I0fkKDrMq0iLCBY6imFreuygtXhSyand
         47hme1DfA10F2qaJLKSmNWGZ76IjR6dZahMl82y0n/ZJkjzaZ2r44xK5E5MV/FwG/g5T
         uRCXuk6lVzVIwfbkDhFHWnltfz1k54Z7OZJ6KESqGm5QBNGrBdeVkmTMOS9g6I5pci3q
         0PlU+7KsiCnj1/1jiLWZg7LCsl5BGJE8/BHpnPuE3+BqHmWxqryZucKtMDkIwNwgujFl
         1LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759825981; x=1760430781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJBgNYNLNnpXb6QYC+z4Cdfg6JdOrjXxzZiYm8s3Uh8=;
        b=Hk9HUoP571d2qcIITkefu6N1jEhhX7eUVQOjDGU7EudhU/hOxBT/cp8h7zZuxnC9dj
         1dMi9FWampkguCV2wh6jqIJpFUXHJ6Qdf48UdezheeFcVJWuq143AO0Ld06k5e9p4/Kt
         dOHAzo6fCoEGTLDV8e+D/pyOJ9pXa/hOmP7/C1QY1eSnF72fDdpDUChqe4NivGIU74ib
         HEkImPitpoqH0uGMuHf79L4wDJVUp5mNWCkv+2V01HFhrVgE6c1Pw+Zokyk7kgH/GfA0
         jpadUB7gIS0s73yJZdeOwNYD1TSupKGMLIab3Hc5NV/kbW2IBrPkP3Cn0ajZ4y9FTy2U
         eVlA==
X-Forwarded-Encrypted: i=1; AJvYcCVdvvk/hYOu02/7FpTO7DyxBvVV+jo1EWRVCbskrIjN+DR1fkzp/Ks4UGKZjid3gVN4Ec+O8GFeulf+@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4sN1YulZlgRA7F6q20nFvV2y0IGwd4KdmXuiPvEXJImX7NQJ
	T/dl/osHm/uE6GD3/mdevUGk/7oOZQaIePeHgs7QF4cFl22qbj5yM4Km
X-Gm-Gg: ASbGncvbUZrwKgVaomQDah9yyQMTKz/4m4ylru3OZkOpn9dXWi7D991izwMJGCukdYt
	cE82YfaQO+vCZmTByWhpRkaA439PkF6mft4HoGLkgACRCATaxKIOQfodJPyZioalaSZOhaSMYLR
	lFooWbu3YR4ZaUKvreSTRp9JMTmwAKhUUWNDgf7uLeeH8MFw0loiGnE+hyVnMhU0KljUUsRNPpn
	lI8VG5lOzPmhOoPXrk+88sKChTETXQ83PZvm8n82+c+xE3BjqoeT1SxIPOCc3q5vluimEWEg2L2
	ZCbY/QHXU3aEwQVFbpBrdbUqxEAMfrYqS3Uqklfo2v3DNHtDn5CpqNVFKo6qNtmXX1ivcP2RibA
	XxuZPu0t88hzyL9gNjvEiRacUoWlGubOM+LF51wTpaWvb3NTNhHcbSw==
X-Google-Smtp-Source: AGHT+IFwKKHb8VdtMnYOpULqw57rPFwDDIri68ViZGVtmZPrQ+kPcd2Uig0QzxXQ9F7ajEM3Wp83rQ==
X-Received: by 2002:a2e:b888:0:b0:372:8d61:c26f with SMTP id 38308e7fff4ca-374c36f3169mr48898581fa.11.1759825981256;
        Tue, 07 Oct 2025 01:33:01 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3bd4218sm7926681fa.61.2025.10.07.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:33:00 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:32:56 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC PATCH 01/13] dt-bindings: regulator: ROHM BD72720
Message-ID: <73d30c0c2fb56582c51b6ff9dea3f5145ed36c34.1759824376.git.mazziesaccount@gmail.com>
References: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3VPimhN5qZ43uOQi"
Content-Disposition: inline
In-Reply-To: <cover.1759824376.git.mazziesaccount@gmail.com>


--3VPimhN5qZ43uOQi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD72720 is a new PMIC with 10 BUCk and 11 LDO regulators.

The BD72720 is designed to support using the BUCK10 as a supply for
the LDOs 1 to 4. When the BUCK10 is used for this, it can be set to a
LDON_HEAD mode. In this mode, the BUCK10 voltage can't be controlled by
software, but the voltage is adjusted by PMIC to match the LDO1 .. LDO4
voltages with a given offset. Offset can be 50mV .. 300mV and is
changeable at 50mV steps.

Add 'ldon-head-millivolt' property to denote a board which is designed
to utilize the LDON_HEAD mode.

All other properties are already existing.

Add dt-binding doc for ROHM BD72720 regulators to make it usable.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 .../regulator/rohm,bd72720-regulator.yaml     | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd7272=
0-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd72720-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd72720-regula=
tor.yaml
new file mode 100644
index 000000000000..665086f56928
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.ya=
ml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd72720-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD72720 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description: |
+  This module is part of the ROHM BD72720 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  Regulator nodes should be named to BUCK_<number> and LDO_<number>.
+  The valid names for BD72720 regulator nodes are
+  buck1, buck2, buck3, buck4, buck5, buck6, buck7, buck8, buck9, buck10
+  ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10, ldo11
+
+patternProperties:
+  "^ldo[1-11]$":
+    type: object
+    description:
+      Properties for single LDO regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        pattern: "^ldo[1-11]$"
+        description:
+          should be "ldo1", ..., "ldo11"
+
+      rohm,dvs-run-voltage:
+        description:
+          PMIC default "RUN" state voltage in uV. See below table for
+          LDOs which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-idle-voltage:
+        description:
+          PMIC default "IDLE" state voltage in uV. See below table for
+          LDOs which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-suspend-voltage:
+        description:
+          PMIC default "SUSPEND" state voltage in uV. See below table for
+          LDOs which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-lpsr-voltage:
+        description:
+          PMIC default "deep-idle" state voltage in uV. See below table for
+          LDOs which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+        # Supported default DVS states:
+        #     ldo        |    run     |   idle    | suspend   | lpsr
+        # --------------------------------------------------------------
+        # 1, 2, 3, and 4 | supported  | supported | supported | supported
+        # --------------------------------------------------------------
+        # 5 - 11         |                    supported (*)
+        # --------------------------------------------------------------
+        #
+        # (*) All states use same voltage but have own enable / disable
+        #      settings. Voltage 0 can be specified for a state to make
+        #      regulator disabled on that state.
+
+    unevaluatedProperties: false
+
+  "^buck[1-10]$":
+    type: object
+    description:
+      Properties for single BUCK regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      regulator-name:
+        pattern: "^buck[1-10]$"
+        description:
+          should be "buck1", ..., "buck10"
+
+      rohm,ldon-head-millivolt:
+        description:
+          Set this on boards where BUCK10 is used to supply LDOs 1-4. The =
bucki
+          voltage will be changed by the PMIC to follow the LDO output vol=
tages
+          with the offset voltage given here. This will improve the LDO ef=
ficiency.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 50
+        maximum: 300
+
+      rohm,dvs-run-voltage:
+        description:
+          PMIC default "RUN" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-idle-voltage:
+        description:
+          PMIC default "IDLE" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-suspend-voltage:
+        description:
+          PMIC default "SUSPEND" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+      rohm,dvs-lpsr-voltage:
+        description:
+          PMIC default "deep-idle" state voltage in uV. See below table for
+          bucks which support this. 0 means disabled.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3300000
+
+        # Supported default DVS states:
+        #     buck       |    run     |   idle    | suspend   | lpsr
+        # --------------------------------------------------------------
+        # 1, 2, 3, and 4 | supported  | supported | supported | supported
+        # --------------------------------------------------------------
+        # 5 - 10    |                    supported (*)
+        # --------------------------------------------------------------
+        #
+        # (*) All states use same voltage but have own enable / disable
+        #      settings. Voltage 0 can be specified for a state to make
+        #      regulator disabled on that state.
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
--=20
2.51.0


--3VPimhN5qZ43uOQi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0DgACgkQeFA3/03a
ocUuoAf/UHyrFb8dZBCpBZPBGI26r61s/sx3VMQmnvHTtEBwVeD8i3dEnmEpFncz
WsGwz8Fv5SakW0+iRpkstEfmJrsw15CUfPv6Ht9SBf0NXbGUOf+3i1d5JKH4PY0P
iZU992j5YrwjfxazAwuXF/B91aYv+3cgRUPyJcSE8UAyZJU8y5NWCZadxt9QGAzB
XIAeZjCSydgBvrsUT+RdRPS6blrRNvQ9NzxZ4g9Mghj4xUvYzypQIsPZWGWDj/xb
/aPQtZ2KxQDv77mLmi3Hh8pIkeTL9bYcmG/oiIRhFwafUTSMi56ue/bxjJFetfCL
j0HPD+rnJ0Zw4gZddYrf6d0MedH7wg==
=mXl4
-----END PGP SIGNATURE-----

--3VPimhN5qZ43uOQi--

