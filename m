Return-Path: <linux-gpio+bounces-26864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A251CBC0B1A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 10:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80FE219A0936
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 08:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73142E11DA;
	Tue,  7 Oct 2025 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYHbtva8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D302E11CA
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826057; cv=none; b=NNf8n3srqqaZUP4DkIGTP4/v/0xL9+uwRly8xzy1HKH9iJyZr8D9YijkIJ7Teoqz1XYl5s1NMHRwnKRIfINSVzl7enHBVT9gfQPs4OkmUh96o4AxGPCPq+GRITQ7OGqPZMBZhPWidBD3iAZtUwXhtIS+qjRvIRXdMGVo2XNI+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826057; c=relaxed/simple;
	bh=EKOut8hmXYdSZ53o9Jzr0vGYAwAl38Qo7PAaLbffE0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEf7Alp7lEVf7PwbilxtzzNR0rcf2oA6ybYcLE/NzWem5cJfzvUnLQiVHTVxRf+fYwHjMtykHzdytoax6EcJSJ+wHUe1uqEA2YDkxt7QNNU5rC+pC7z9tAXwx1opiW+6hFjHgJbHh2JvyWRdmHTuaHy5Wi/swz+7PXw0e1NkTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYHbtva8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso6482166e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826052; x=1760430852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8t4BEhNzT2f7TxIbIXtITKbbYiOenAeGicCLXkBHNY=;
        b=BYHbtva8tLo9dRAPPJ6ZpfT0DvOpvAOphGnJgg9o3nF/+c+rkAwX6noYz7s8G4pZSL
         fcSi5X4bIykinYrpVT9pMyQ73IKmzUrr9f6au83QApIfevZJ30v0FetE3GBQ55PtNNhg
         BRtHnjsJjvT2djj+c3X3M/exPzpzc84JInx/olpg3r6hwwYzv89B9BMGBpzCtY5u/RoX
         mftGTxodimuVIBwQmcC5+iWDLosLZtMivvXIBGbWhcyCy1RhlRxhF7GaXx6wivS6n+aa
         W76QflMYPAdPSE/cc/1E4nUi4Tu35jCmehKYrZmTIqB8m8iS1TaeaTnoVeOyxm4Rv84m
         wHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826052; x=1760430852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8t4BEhNzT2f7TxIbIXtITKbbYiOenAeGicCLXkBHNY=;
        b=Q0OiNDNMz+YadHTovUrP2R+zBSVNUqpyg/KB2OWn+WAvkDom+NtPBpSz9FIy5U71OX
         4Xs1W4ZbgPbHah5uAL2/lZ4ffIksndbvLHFoy2P0p1CPNz3B8xlrsiAWIoxHmHbxZzKX
         doqybXnMTOfThJUxGX78xmjE3FjB3OFg7Y/KuRbaH7C1NnrzFsH0vEuG7bjSGM1jN8Oa
         VDGDsYqKClTFf5Cc3M+ZhKRePSwJzf2XG4mgxKB0ZYV4EN1Zl2vzF6IBoNL/pDGEPo3l
         6OKealypi9H+0cnDIu3sSmIcshlHdjs1yvL3VNcLQET098ZBRYQjvlXyP1irrYE8FSWX
         xiUw==
X-Forwarded-Encrypted: i=1; AJvYcCXvaOAJEFtbqA0STupS7t66+LrG6iv8lWkEKbGDkoISHnkk+cjefqekO0/Me0gHPqjt+XBoYm6ZrP1R@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZFRt5jw2rkupLZfpy+ZXGoxhpF3kLck5H/TVpxW35XvZ/9jk
	TuWde+YIO9vN4JkHEcD5/1fWwwkhX5ysSQcghvb/gVh7deg4BLZZU6Lh
X-Gm-Gg: ASbGncs0hebV+rDWAyqOKWL5xH7q1Q+x9QPL5KqPYo6mXzaOllZmVebsbo+Xx+rcmmP
	4mH5Eb3EebIkjnie+QwYRnuZwrzl/cfWTnKDHa+ZC8R2uArIRN8NhNBWYq+i3+mPY3EE49cFoRe
	dutr9s2qZcep0Hs/GXRrgPgnpjlItcbghKYFV9XF+xRYW79Q/AUOq42uJqtsxrzakWEXl/GUUjc
	TlXsMavga1p8d9hieKxuQbo9NP5DXee83fU2YOMZQj8d7d4IveYebzIy5GeoQMF1xYJPc0Zi2Bb
	iSOwWsqy98fbQtQMHuFD6MiAxVtD7MyeCVPQ3yy5YAl6UAMjM8RlN7eP3E2cgGVxtSUkmGCqMqf
	uVC0lWa3qXWUMggtq6v96BNiEh6yYUMfYOChLaVJuhkkyY0SztvHX9A==
X-Google-Smtp-Source: AGHT+IGrjcaPa+o4BHPNmNuxaoWMfFhafV/2QkeXOazUlCWvsu3VSc9Zta2eqE8CWytfvtp5cQX0+Q==
X-Received: by 2002:a05:6512:3c9b:b0:57c:79b7:8c59 with SMTP id 2adb3069b0e04-58cbaaa2210mr4353624e87.23.1759826051248;
        Tue, 07 Oct 2025 01:34:11 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112428csm5868620e87.1.2025.10.07.01.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:34:10 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:34:06 +0300
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
Subject: [RFC PATCH 07/13] regulator: bd71828: rename IC specific entities
Message-ID: <101397e80b6ba8ffe3fee63090c4947e0c001c70.1759824376.git.mazziesaccount@gmail.com>
References: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MNOA3IQ8dAj0bpCB"
Content-Disposition: inline
In-Reply-To: <cover.1759824376.git.mazziesaccount@gmail.com>


--MNOA3IQ8dAj0bpCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new ROHM BD72720 PMIC has similarities with the BD71828. It makes
sense to support the regulator control for both PMICs using the same
driver. It is often more clear to have the IC specific functions and
globals named starting with the chip-name. So, as a preparatory step,
prefix the BD71828 specific functions and globals with the bd71828.

It would be tempting to try also removing the chip ID from those
functions which will be common for both PMICs. I have bad experiences on
this as it tends to lead to problems when yet another IC is being
supported with the same driver, and we will have some functions used for
all, some for two of the three, and some for just one. At this point
I used to start inventing wildcards like BD718XX or BD7272X. This
approach is pretty much always failing as we tend to eventually have
something like BD73900 - where all the wildcard stuff will break down.

So, my approach these days is to:
 - keep the original chip-id prefix for anything that had it already
   (and avoid the churn).
 - use same prefix for all things that are used by multiple ICs -
   typically the chip-ID of the first chip. This typically matches also
   the driver and file names.
 - use specific chip-ID as a prefix for anything which is specific to
   just one chip.

As a preparatory step to adding the BD72720, add bd71828 prefix to all
commonly usable functions and globals.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
No functional changes intended.
---
 drivers/regulator/bd71828-regulator.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71=
828-regulator.c
index dd871ffe979c..3d18dbfdb84e 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -28,7 +28,7 @@ struct bd71828_regulator_data {
 	int reg_init_amnt;
 };
=20
-static const struct reg_init buck1_inits[] =3D {
+static const struct reg_init bd71828_buck1_inits[] =3D {
 	/*
 	 * DVS Buck voltages can be changed by register values or via GPIO.
 	 * Use register accesses by default.
@@ -40,7 +40,7 @@ static const struct reg_init buck1_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck2_inits[] =3D {
+static const struct reg_init bd71828_buck2_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK2_CTRL,
@@ -48,7 +48,7 @@ static const struct reg_init buck2_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck6_inits[] =3D {
+static const struct reg_init bd71828_buck6_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK6_CTRL,
@@ -56,7 +56,7 @@ static const struct reg_init buck6_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck7_inits[] =3D {
+static const struct reg_init bd71828_buck7_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK7_CTRL,
@@ -102,9 +102,9 @@ static int buck_set_hw_dvs_levels(struct device_node *n=
p,
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }
=20
-static int ldo6_parse_dt(struct device_node *np,
-			 const struct regulator_desc *desc,
-			 struct regulator_config *cfg)
+static int bd71828_ldo6_parse_dt(struct device_node *np,
+				 const struct regulator_desc *desc,
+				 struct regulator_config *cfg)
 {
 	int ret, i;
 	uint32_t uv =3D 0;
@@ -212,8 +212,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			 */
 			.lpsr_on_mask =3D BD71828_MASK_LPSR_EN,
 		},
-		.reg_inits =3D buck1_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck1_inits),
+		.reg_inits =3D bd71828_buck1_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck1_inits),
 	},
 	{
 		.desc =3D {
@@ -253,8 +253,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK2_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck2_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck2_inits),
+		.reg_inits =3D bd71828_buck2_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck2_inits),
 	},
 	{
 		.desc =3D {
@@ -399,8 +399,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK6_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck6_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck6_inits),
+		.reg_inits =3D bd71828_buck6_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck6_inits),
 	},
 	{
 		.desc =3D {
@@ -440,8 +440,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK7_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck7_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck7_inits),
+		.reg_inits =3D bd71828_buck7_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck7_inits),
 	},
 	{
 		.desc =3D {
@@ -633,7 +633,7 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			 * LDO6 only supports enable/disable for all states.
 			 * Voltage for LDO6 is fixed.
 			 */
-			.of_parse_cb =3D ldo6_parse_dt,
+			.of_parse_cb =3D bd71828_ldo6_parse_dt,
 		},
 	}, {
 		.desc =3D {
--=20
2.51.0


--MNOA3IQ8dAj0bpCB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0H4ACgkQeFA3/03a
ocWsiAgApSVT/OhJ/N/d5pftZT6izaQbs7itqR1JwXrO5jv0/AH0pqb019zRyQHL
FqnwQ4794RTMDtZHvtanis3MAiGT21XGm6U72Xj2s7gyIeS89+0g29M45VW01SmZ
Ahf4Ln3eazC/3j3JCPBLxLrArW89nefV5m5YH00QgxLVbEk8V/he6q8pmldLcdpq
L3BEZhR+LZQ8PM1PeiMtd3AQUhIOvi0bXwl/8zeVc+ZTSbHCKsYo7FbaFhSeEIag
W4etV2e5/3mOv3rF2Q76LXTleppWBRWnwXN/KqZbs0YeW3kNIC7IZrPx2G4udZN3
LDR42KhQ1eW7O6KnZcHSt/m0yuPJgw==
=Tz4X
-----END PGP SIGNATURE-----

--MNOA3IQ8dAj0bpCB--

