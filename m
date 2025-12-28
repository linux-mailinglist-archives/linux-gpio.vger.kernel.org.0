Return-Path: <linux-gpio+bounces-29969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DACE556B
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 19:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1C96300AB2E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCEE23A58F;
	Sun, 28 Dec 2025 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="hAsqc5/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF922A7F1;
	Sun, 28 Dec 2025 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766945175; cv=none; b=FJyAgqyR73n3WIYF3qhOEbtSsjlpjsta0gTpTob4P6z15pRwKyG+3BRN5xIxHx6rVocEJsiHq+CP4rgikr6nWnxzXZMsYDCqC2KjdoVXO+/7K8EjByyw7bAPZOdB0gM1cQEyW+ed61BuFgY4fDOM+u/LsLgG1ZWK70xUQK30ulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766945175; c=relaxed/simple;
	bh=2WBWmLDvI+3uWaI6iGjj/oIiCNEaKia41qm7RafJtQM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XbzvOMyws8zkxkeKBP8/llQjOEENehZBpFpaVsiZ8EEO3FGh32FGwqFgjwn4kQNHNMAaBDy023aKkfAk1iUu8w+jCyYLnQKDRktnRlJAil26w6lZBbX6QNloe577H5inEsqGpPCc82kgNcwlgxLDQbFFBg138CuSQAiaOjkOG2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=hAsqc5/m; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945156; x=1767204356;
	bh=Iimb+k4FWtKsauCwXJMg2NmIw/RYvYhly8/W3jnsDME=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hAsqc5/mtwasv2h7vm6JImYTC5XGg2/j+Z2JaxXJ5iFhr7cqX6FUzqIAWSd6gi8SS
	 ze0MGLcufVBc0Oi8HtDVySI+SBn29SPTBXx2TFQ6prZU2YTQqOTbEuGd86uh1VOBtq
	 lcxLkW3/DxHWT1M612bBMlym5Pj95YNzTwgUpdcdGY8hqIUSqX2VBw4Hl6YiLLsYIL
	 8GbLEXQn7o2pbxHGBCn8lW005c8I+kruTzJQX0LMBSQQIxfWFumExM7ttPFMzj+inp
	 mMBZdt32C/8fMCilAW7PUVBPMcnO8WoUWLofZh02ofYfk34bLZcyVMSVIE9oZkWbuq
	 b5Smt4iuYYAzQ==
Date: Sun, 28 Dec 2025 18:05:55 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 3/3] pinctrl: samsung: Add Exynos9610 pinctrl configuration
Message-ID: <20251228-exynos9610-pinctrl-v2-3-c9bbeee4c54b@chimac.ro>
In-Reply-To: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: bb7879cbc9d07814358c81cae2b54fee2b09a00b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add pinctrl configuration for Exynos9610. The bank types
used are the same as on Exynos850 and gs101, so we can
reuse the macros.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 117 +++++++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
 3 files changed, 120 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinct=
rl/samsung/pinctrl-exynos-arm64.c
index 627dca504d7a..fe9f92cb037e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1770,6 +1770,123 @@ const struct samsung_pinctrl_of_match_data exynos88=
95_of_data __initconst =3D {
 =09.num_ctrl=09=3D ARRAY_SIZE(exynos8895_pin_ctrl),
 };
=20
+/* pin banks of exynos9610 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos9610_pin_banks0[] __initco=
nst =3D {
+=09EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc0"),
+=09GS101_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00, 0x00),
+=09GS101_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04, 0x08),
+=09GS101_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08, 0x0c),
+=09EXYNOS850_PIN_BANK_EINTN(5, 0x080, "gpq0"),
+};
+
+/* pin banks of exynos9610 pin-controller 1 (CMGP) */
+static const struct samsung_pin_bank_data exynos9610_pin_banks1[] __initco=
nst =3D {
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8", 0x20),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9", 0x24),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm13", 0x34),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm14", 0x38),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm15", 0x3C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x2A0, "gpm21", 0x54),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x2C0, "gpm22", 0x58),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x2E0, "gpm23", 0x5C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x300, "gpm24", 0x60),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x320, "gpm25", 0x64),
+};
+
+/* pin banks of exynos9610 pin-controller 2 (DISPAUD) */
+static const struct samsung_pin_bank_data exynos9610_pin_banks2[] __initco=
nst =3D {
+=09GS101_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00, 0x00),
+=09GS101_PIN_BANK_EINTG(4, 0x020, "gpb1", 0x04, 0x08),
+=09GS101_PIN_BANK_EINTG(5, 0x040, "gpb2", 0x08, 0x0c),
+};
+
+/* pin banks of exynos9610 pin-controller 3 (FSYS) */
+static const struct samsung_pin_bank_data exynos9610_pin_banks3[] __initco=
nst =3D {
+=09GS101_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00, 0x00),
+=09GS101_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04, 0x04),
+=09GS101_PIN_BANK_EINTG(6, 0x040, "gpf2", 0x08, 0x0c),
+};
+
+/* pin banks of exynos9610 pin-controller 4 (TOP) */
+static const struct samsung_pin_bank_data exynos9610_pin_banks4[] __initco=
nst =3D {
+=09GS101_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00, 0x00),
+=09GS101_PIN_BANK_EINTG(6, 0x020, "gpp1", 0x04, 0x08),
+=09GS101_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08, 0x10),
+=09GS101_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C, 0x18),
+=09GS101_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10, 0x20),
+=09GS101_PIN_BANK_EINTG(5, 0x0A0, "gpc2", 0x14, 0x28),
+=09GS101_PIN_BANK_EINTG(8, 0x0C0, "gpg0", 0x18, 0x30),
+=09GS101_PIN_BANK_EINTG(8, 0x0E0, "gpg1", 0x1C, 0x38),
+=09GS101_PIN_BANK_EINTG(8, 0x100, "gpg2", 0x20, 0x40),
+=09GS101_PIN_BANK_EINTG(6, 0x120, "gpg3", 0x24, 0x48),
+=09GS101_PIN_BANK_EINTG(3, 0x140, "gpg4", 0x28, 0x50),
+};
+
+/* pin banks of exynos9610 pin-controller 5 (SHUB) */
+static const struct samsung_pin_bank_data exynos9610_pin_banks5[] __initco=
nst =3D {
+=09EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gph0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTG(3, 0x020, "gph1", 0x04),
+};
+
+static const struct samsung_pin_ctrl exynos9610_pin_ctrl[] __initconst =3D=
 {
+=09{
+=09=09/* pin-controller instance 0 ALIVE data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks0,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks0),
+=09=09.eint_wkup_init =3D exynos_eint_wkup_init,
+=09=09.suspend=09=3D exynos_pinctrl_suspend,
+=09=09.resume=09=09=3D exynos_pinctrl_resume,
+=09}, {
+=09=09/* pin-controller instance 1 CMGP data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks1,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks1),
+=09=09.eint_wkup_init =3D exynos_eint_wkup_init,
+=09=09.suspend=09=3D exynos_pinctrl_suspend,
+=09=09.resume=09=09=3D exynos_pinctrl_resume,
+=09}, {
+=09=09/* pin-controller instance 2 DISPAUD data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks2,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks2),
+=09}, {
+=09=09/* pin-controller instance 3 FSYS data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks3,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks3),
+=09=09.suspend=09=3D exynos_pinctrl_suspend,
+=09=09.resume=09=09=3D exynos_pinctrl_resume,
+=09}, {
+=09=09/* pin-controller instance 4 TOP data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks4,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks4),
+=09=09.suspend=09=3D exynos_pinctrl_suspend,
+=09=09.resume=09=09=3D exynos_pinctrl_resume,
+=09}, {
+=09=09/* pin-controller instance 5 SHUB data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks5,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks5),
+=09},
+};
+
+const struct samsung_pinctrl_of_match_data exynos9610_of_data __initconst =
=3D {
+=09.ctrl=09=09=3D exynos9610_pin_ctrl,
+=09.num_ctrl=09=3D ARRAY_SIZE(exynos9610_pin_ctrl),
+};
+
 /*
  * Pinctrl driver data for Tesla FSD SoC. FSD SoC includes three
  * gpio/pin-mux/pinconfig controllers.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/sa=
msung/pinctrl-samsung.c
index e374effba25a..5ac6f6b02327 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1504,6 +1504,8 @@ static const struct of_device_id samsung_pinctrl_dt_m=
atch[] =3D {
 =09=09.data =3D &exynos8890_of_data },
 =09{ .compatible =3D "samsung,exynos8895-pinctrl",
 =09=09.data =3D &exynos8895_of_data },
+=09{ .compatible =3D "samsung,exynos9610-pinctrl",
+=09=09.data =3D &exynos9610_of_data },
 =09{ .compatible =3D "samsung,exynos9810-pinctrl",
 =09=09.data =3D &exynos9810_of_data },
 =09{ .compatible =3D "samsung,exynos990-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/sa=
msung/pinctrl-samsung.h
index 0f7b2ea98158..937600430a6e 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -398,6 +398,7 @@ extern const struct samsung_pinctrl_of_match_data exyno=
s7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8890_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos9610_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;

--=20
2.51.0



