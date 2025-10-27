Return-Path: <linux-gpio+bounces-27645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28848C0D3C8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 12:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D5A407AEC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 11:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1C52FD67E;
	Mon, 27 Oct 2025 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXGVNtcM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C72E1EE5
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565501; cv=none; b=r+tyhoSkg2A+vWkDxNR+S6d72mpGFyrclLPBhbztz8O1fby6/TSSCGV4NsGGyes60Or3pDy9i5NpPkeoE0E8wXUeC3ZR9nSjabQSACXPTo+UbWZeXGnxalIif/41v3jkGpeusehaf9PT0d30DyDO2XF0OHq2kMdMYvNhlCpysfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565501; c=relaxed/simple;
	bh=bJV1pIDRQ0fTdXTVy+9+Ty5YBDV6cJyFhCJx0AZhS/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qk1ookgxpEbRhqAPK1eWeBwNUvESoJScRSvLVmqBtdh/Dzir3rDYhBZMUWUerIAtgv1j+mOMJWn9qp/QDpgTGIzQVBNvuztoEUZe+hYEeZHq+Ma8nZHtQihYSAi253YJpd44qdf7NReM0LQFy8S6jIIsY9a133PY5Wd5xNsJPtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXGVNtcM; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592fb5d644bso4078495e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565497; x=1762170297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49XvEyGAPxvhOqitsb9crv994raefdDhe/gxFtABsFA=;
        b=QXGVNtcMT0wAIDfx3ZImI+iAyHfim36a1vtl4Akof4VdZ/dwOr0OsCDze9S7CqaQWP
         7XsWhx+3Bu0XAWinWOv0esXBjMY6AdcbkXWdFBbQNUqzAm3CfxTDO7rDRBzYzyvS21oz
         qi9J43Gxx+C3GsW/TKvHcD4wD6ENkISLPyjv3cAd4T1GxlpmBby0O1gx/mJ9ypG4HkYZ
         RAwkQh/kBt7egEHi6TT+ADMg+K/Y1Wdb/lILe8Fgre3DqIqZjgeMLAgzpQqZg6sOx1wG
         jl+vpOIKWqIiWoKeQfKKkLyr4m1o+xoI25GAzk5vNg3W9iMNjNYnOEgwcm1kU/4KnpDt
         RWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565497; x=1762170297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49XvEyGAPxvhOqitsb9crv994raefdDhe/gxFtABsFA=;
        b=KSXc/FTVRB46easdaiZIIHE59J0iPEcjcUPLUxiRsZzN5Sey4lf26lKLaI5PSs0hW+
         +sTWuUJhpWI5y7S5M8wRXsJlP3vByQc4SNETQkzbZXTlo5RTLx9Ua6E/cFTnsUzpj+1E
         VXryLzxatSxDhK0n0ZvV9cvMvER9oO/LlM1H78MMUMAYYsrX0nypuPRyUcdfa72DyKl0
         eR+XRhBOm4/Og4Ik0SwY+c0vT6/d6OyfPeHcNnDa5quR3BupFx/tPHHaQP7oXY3NC/bb
         NCChrglpuob5u+UMVqn2eNpIBCuWNit7MvwEuit21Qc5mCT+F0fQ4eczHMr+czhLHn/Q
         hLUA==
X-Forwarded-Encrypted: i=1; AJvYcCU1aqyxpNxHQ1FkUNK8viajLl3iNXoXBM3/eWaSdTJesY6t78wosV5PHrQkE6ItwPEQ+TvstPmCxiTg@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEA4fvzte4rmpd8rjcl0Xgp7sC20PfhXbdLSTOo0sfaiwO2NL
	klpfKXNyTpKJyngtGOqEzuTgWj4AtJxt2FElsJyxSmKsa0+t+S+rW4DtiHKxKcFH
X-Gm-Gg: ASbGncuAdc+oQjA9MMi/eY0YGuK5CpU2Dfgctk8rlKpExSBXXrUjkgkGTyMUibPx2ZJ
	kz1rcNFWDqzvPmyPEOz9dBtKwEweHApTNcreWh0ixkUzncHOCVjuj8I2UwiWRVzMkGgrO972zFw
	+HVoHdQJQMo4tp38ZlKJVZSzg72cacPQsMAuY2rTVnNGQT3EyRaV/Xc9QhxfcnG1Fyp2iw65hAq
	lLTF9s0QVaktQ7tXbeVUM8jp6c/OdO9rBBSF8nP13v+qLdWXplxooyghVHcZqU/SNng+hsLYT5o
	VizTIHKsLECGK3HtWiyeAIKrXZ//k2Jw5UfW0lHFyqMxzgj14g09nClXCqunMFKwEFIxYFJY/e1
	5M8iNK3aI878S0+W/C7qnCG//2vFfKS6x7+GAkyS3KQOPuwOF99b6yXkyILGwS6WEE362OXWR2H
	EfokbRVDwVjA6MnSNwwg==
X-Google-Smtp-Source: AGHT+IHppkRrpf2Zvp69RqFdfAGMn5pFll1fc6wtMRKN0kFnwN3QGg2f0fUR8rY1Whmr9/3tyMXpaw==
X-Received: by 2002:a05:6512:2390:b0:593:33f:8071 with SMTP id 2adb3069b0e04-593033f8184mr2581067e87.7.1761565496464;
        Mon, 27 Oct 2025 04:44:56 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f6bef3sm2287632e87.75.2025.10.27.04.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:44:55 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:44:49 +0200
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 01/15] dt-bindings: regulator: ROHM BD72720
Message-ID: <25746d258ac57ae3eee82a20fa14a8a168f35e58.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awBciY5eMkD6wLHN"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--awBciY5eMkD6wLHN
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
Revision history:
 RFCv1 =3D>:
 - No changes
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


--awBciY5eMkD6wLHN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/WzEACgkQeFA3/03a
ocVTUggArj/1fmI1HF43iqsDEQiiGAlrOQqr14P7kDh6+XtZXYlIHl/dHS49elmm
XFABwL8sunAbCRxPKW5dkkO7fyFwBxBcYdSxMfrfvQG+mMBW6PiXGf8DTsb8Gu9K
f9HTQSTzd9jAZG68YMll0gAiHqDuMK7X52XyPyxwff5pOvt6c1cmK4t0QqdZxo/t
EATrZrCkAqOe/geUInymcVvRB1msabXXSn/ejxl9pChYe/y8DjpKWErwp0/rUicr
FQ15ILiAsHV08pUL6lm4SIkSoPH18VOHKjvU2hcjLwMvgmcPGWc5PGWDPd1ZEgNp
0slYn8f5qf5pL4GM/tfEULb+lp8+vA==
=Zids
-----END PGP SIGNATURE-----

--awBciY5eMkD6wLHN--

