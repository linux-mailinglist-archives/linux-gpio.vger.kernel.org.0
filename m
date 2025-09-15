Return-Path: <linux-gpio+bounces-26148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA99B570ED
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 09:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652BC3B8088
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 07:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFDB2D24B3;
	Mon, 15 Sep 2025 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6D8tncG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9ED202976
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920356; cv=none; b=ieKj4Yn6Wn7YIzsKc2ypBdYdFv8Efosgh8UWOTw0xhfEmdZl5S9ZKIGlhyM8yzyUlKKzwbC09mKmIXiPM9I5jMF2m9aIHA05xTEZ4M8m0YqDBdbj3gZZoEke1W7zgE1+W92drYArWBoz9wuDyAOfVronDv/4dw/lDfPKIcip9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920356; c=relaxed/simple;
	bh=A/pvIm8LIuK60+1hR9C0NY5zWTyTKfhuv51MAMU58ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orp65YCLBB9k+8zJiqsEzK4vk7ppJ8tuiPu1v56lSr4q0ZH//2kzlxOzjZ5tAo67xQEBx0oAmVaAE8QDxlH+jZBNv7vJt/bA4b9onRu99SyygNTy9JEfm1H4GTE/d+SCRirP5CWoymBKyMHrwDUXvkKSp0sf4/3N4z0LLtlLonw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6D8tncG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-336c86796c0so29407871fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 00:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757920351; x=1758525151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCTGsKnEAhIcIWggtSqgF0UGR2T7jy2XV44IdHUz0qs=;
        b=X6D8tncG+PXQxBhFu8x7cusqpaxXdAyJMKkfAH1aDDw3b5Hs0bjZrIl8l+8YQ4ocRx
         919YX9OLb8ntm7GDQblrg23gBOKJoK8fmedV14lGpPzvgO7l5wgvcRKOYfiTST4uPKkM
         gPkejqR1mbP7Q+fCsVCMh95sEhtXREXhK9LP8g4LzzxNI9x5zX8qBJ7Wv7fYZN3iJ4aK
         zemMw9rh9RHeyznmuvJskgW+lG/ABkhnx27tPg2LlM2WGSZIV5ba3cDJZMC0RWs8omoQ
         w2X9m5DxSobjmnEvs1aWEbIvsEG9EgZBEvjO8FuhA87eURX97I9JJ8rItO82wL9+ujfv
         HLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757920351; x=1758525151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCTGsKnEAhIcIWggtSqgF0UGR2T7jy2XV44IdHUz0qs=;
        b=L7/hMKTflCOTR5cmgX+bWQgdctPSkb42FvIk6RI/enzIxLmBJG1ZO+imAudk1da4dJ
         cAjS+S+MRX+fZcsEMDyxP9MGL8cQVipQzxW+H1DX95v4JnlDv973WgyISutGKO52KoyW
         0x85uz7A0c5ULYZGLdrt1k/+5xX/vGOYQ6Oug839+iYz+3nsgETxHBqMlbiGWo4yCyRu
         rsLv1ZuHunzxJw9Gy8boLM3Rqq1L4edpBPUGaUhvo8O/4FtvtmYVF2htzsbffS207YSY
         K1CfJOZlLvERio6hhfsxHeQmlxYmkk73wsPs3Yijyy3zJrnnq6Ij6BN+vhdRD1GCt53v
         99Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWCEvnjAC0qyUNDOhP0TQmxQSINrulvQXp+9Uax8VaZ0625t41686WnKF8td6Scsg12KMhuCvE5gtFg@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDXutfENP54qyxJ+IQNffDv2rOGAOIQT0BTrKoJzgQnBFa5o5
	4qQohjAvcZXEWuRyZNOy5/Aq/vO1uM4fg2TmObHshxuoLJ3fy2Kn3Ttf
X-Gm-Gg: ASbGnctBeRk7Gu7MfUoQSfB/THhGsHFKVKN2vG9We5fA9l0CgU55/v9uIBYiQssnztj
	9B1YKNOfEywW9DgK9WgndGxFYp8Gfc9Naj44DrnUg3bRZldRq9Qxpbvsvr3PUOGKfwW4MSoKICA
	pJSMGgJhZBrTBdQ5113+s22N4QFVAKCZwEevhs5bMafXgrWkutNhGZIhIryHkzhyzvJE7Xbhm2m
	6KmLj58LmXUEX9fNnXnv1bFGgjHDkMODZuWlJGJHCHjr/z7ZD3fgG5d1kr7DCTlfUvPtQnkCldN
	1TGmTDraAm03ejLNaplCL19f9KWgkqtI7QTSnIXWPu/+e5XCRLzhowwIOGZlswatwBDoLFQ5OJ8
	lwmkrbqIa813OnF9B7tgUJmBO6A==
X-Google-Smtp-Source: AGHT+IE6viEWBo0Up/kAqkcXMNpwo71/XLp84RYtnhqNjvB3tJoxPxNBcrMFpiOLJW3K15VCZMsb8Q==
X-Received: by 2002:ac2:4e12:0:b0:55f:4839:d059 with SMTP id 2adb3069b0e04-5704b52f28fmr2676811e87.13.1757920351004;
        Mon, 15 Sep 2025 00:12:31 -0700 (PDT)
Received: from mva-rohm ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e64dbbf7bsm3284576e87.118.2025.09.15.00.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 00:12:30 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:12:26 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: iio: adc: ROHM BD79112 ADC/GPIO
Message-ID: <20250915-bd79112-v5-1-a74e011a0560@gmail.com>
References: <20250915-bd79112-v5-0-a74e011a0560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C43v0lf9gbjbyPJ9"
Content-Disposition: inline
In-Reply-To: <20250915-bd79112-v5-0-a74e011a0560@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3384;
 i=mazziesaccount@gmail.com; h=from:subject:message-id;
 bh=q+PdYztni/yNFMmXAS+zMK1I2vs1JpjrImQBvaSjEjs=;
 b=owEBbQGS/pANAwAKAXhQN/9N2qHFAcsmYgBox7tkCRgoCdUzbqg7cAGhthvGC/OCorK969Rdc
 hRFUcYJLsiJATMEAAEKAB0WIQQjH5/zBlvbx8soSFN4UDf/TdqhxQUCaMe7ZAAKCRB4UDf/Tdqh
 xbpXCACnuR9mEhXMBLEsL7UwJtAtO7FmMGxLZM7CN3j8ByXUyhVeeMk8UMbmIrdiq0teEHg2NoC
 FQr6ZvxqPhuXfBJqL+WobE9Ojsc9MoPFEQJiz+ojzLvy+Vy3ielr0SNbJjbPmxb5wOYyieCWxWW
 A8MYqVxAmTJDN1sPMMiSweRpHxNlKWx94fbUs90ZKtE7jRL7KzFjqEmGeliFN1pqPR6knbZQF+J
 HBakCLU0i8OZxUCeyxbk5H5bpkqO4hJgEHyI1FOp1zOfaRG8ySQbNRM4a9p7BBIkzSVu4v2sdtf
 knZ4QBig1zHu4MMZVmlQX0AJtTV9PYm/L1tlVrp/Dd65LOcI
X-Developer-Key: i=mazziesaccount@gmail.com; a=openpgp;
 fpr=83351EE69759B11AF0A3107B40497F0C4693EF47


--C43v0lf9gbjbyPJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD79112 is an ADC/GPIO with 32 channels. The channel inputs can
be used as ADC or GPIO. Using the GPIOs as IRQ sources isn't supported.

The ADC is 12-bit, supporting input voltages up to 5.7V, and separate I/O
voltage supply. Maximum SPI clock rate is 20 MHz (10 MHz with
daisy-chain configuration) and maximum sampling rate is 1MSPS.

Add a device tree binding document for the ROHM BD79112.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
Revision history:
v4 =3D> :
 - No changes

v3 =3D> v4:
 - shorten the example by dropping some channels.

v1 =3D> v2:
 - BD79112 can act as a GPIO controller.
---
 .../devicetree/bindings/iio/adc/rohm,bd79112.yaml  | 104 +++++++++++++++++=
++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml b/=
Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..aa8b07c3fac1096c0d48ec64361=
263624f2bb9fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/rohm,bd79112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD79112 ADC/GPO
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description: |
+  The ROHM BD79112 is a 12-bit, 32-channel, SAR ADC. ADC input pins can be
+  also configured as general purpose inputs/outputs. SPI should use MODE 3.
+
+properties:
+  compatible:
+    const: rohm,bd79112
+
+  reg:
+    maxItems: 1
+
+  spi-cpha: true
+  spi-cpol: true
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  vdd-supply: true
+
+  iovdd-supply: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@([0-9]|[12][0-9]|3[01])$":
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    description: Represents ADC channel. Omitted channels' inputs are GPIO=
s.
+
+    properties:
+      reg:
+        description: AIN pin number
+        minimum: 0
+        maximum: 31
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - iovdd-supply
+  - vdd-supply
+  - spi-cpha
+  - spi-cpol
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        adc: adc@0 {
+            compatible =3D "rohm,bd79112";
+            reg =3D <0x0>;
+
+            spi-cpha;
+            spi-cpol;
+
+            vdd-supply =3D <&dummyreg>;
+            iovdd-supply =3D <&dummyreg>;
+
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            gpio-controller;
+            #gpio-cells =3D <2>;
+
+            channel@0 {
+                reg =3D <0>;
+            };
+            channel@1 {
+                reg =3D <1>;
+            };
+            channel@2 {
+                reg =3D <2>;
+            };
+            channel@16 {
+                reg =3D <16>;
+            };
+            channel@20 {
+                reg =3D <20>;
+            };
+        };
+    };

--=20
2.51.0


--C43v0lf9gbjbyPJ9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjHvFoACgkQeFA3/03a
ocWJhQf/aLfWbTiT1P8QC0ouMUYc5UR6otQWOr3Q8R8TZWxp32yNu3E2xYUIDEod
PsZspw7gASfNsoMCU44kvCJcGwqgp9xevprySzPzCz1RDMObi90o+yYGa7RZNujt
XSPA/GwgCqGLOv+BeXldOiT2NmVNcZTYybC6dMkvk0QKQsboAwnY5Tz2JSNaDUEj
z9KkjchiGMvg/JyDYZV93bz0TrDPKUCE2iOPXU42WWFJxQU5cwBjWcZI/WnQ96qb
tANBnEkiHYXrpapuANPxBejKUaYlv6ADFuEFgB1tYkcHr0Tb1GN8PtR0GD1MWr3Q
PtVfuq7kRBGJ9MuBh8OoQAh1P1GI7w==
=sn/E
-----END PGP SIGNATURE-----

--C43v0lf9gbjbyPJ9--

