Return-Path: <linux-gpio+bounces-815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D927D8006C0
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 10:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166A51C20E5B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 09:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFEF1CFA8;
	Fri,  1 Dec 2023 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ei2Izo4C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p9a48Wwr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580CBA0;
	Fri,  1 Dec 2023 01:23:36 -0800 (PST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701422614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Dlkt5iITjDmgd8mHReFB0fl1WIjH8XvmMOEkx0Dpeg=;
	b=Ei2Izo4CxRMXUkn6Bg+EApq+n5Bd54LwB0n1mGq3okEyD5fu1tOvFOlmUrKr+/p95Bg6cx
	LYM3Bm4Qj4x6xqJEPAkpYoU59L3Iq6PuUiWN+pjn6lcJ9AHGqUOTKcccBqK6ncEr2LFry5
	Qc39YyXwjWOmsoonQ0h+vWK1zzrR2g/TqNkvV4GqNbBF2tBTAcLLVPQrLyKPPa+JP4GgoP
	Ha9CBX8+UHXW0ucKlZ4tVLEkFSK9msjIg5AythWrm4FbdPmVHOxYmmSZ+cXEo2yX5LI2ra
	284MbaEt6egwYJ9Vi7XGQ37wOdhlrcGidqhi/7GQHm6H9Dg7lykJO/kBkEvsWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701422614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Dlkt5iITjDmgd8mHReFB0fl1WIjH8XvmMOEkx0Dpeg=;
	b=p9a48Wwr2TRwuyNV19VS83ZkMfBM9TMBto2vTw8UP0cNLj6chlyNlbvhIu0LTZGY3yHenr
	MOZorrCUVNfdsUAw==
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Huan Feng <huan.feng@starfivetech.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Drew Fustini <drew@beagleboard.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: starfive: jh7110: ignore disabled device tree nodes
Date: Fri,  1 Dec 2023 10:23:28 +0100
Message-Id: <fd8bf044799ae50a6291ae150ef87b4f1923cacb.1701422582.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver always registers pin configurations in device tree. This can
cause some inconvenience to users, as pin configurations in the base
device tree cannot be disabled in the device tree overlay, even when the
relevant devices are not used.

Ignore disabled pin configuration nodes in device tree.

Fixes: 447976ab62c5 ("pinctrl: starfive: Add StarFive JH7110 sys controller=
 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/p=
inctrl/starfive/pinctrl-starfive-jh7110.c
index 640f827a9b2c..b4f799572689 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -135,7 +135,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pc=
tldev,
 	int ret;
=20
 	ngroups =3D 0;
-	for_each_child_of_node(np, child)
+	for_each_available_child_of_node(np, child)
 		ngroups +=3D 1;
 	nmaps =3D 2 * ngroups;
=20
@@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pc=
tldev,
 	nmaps =3D 0;
 	ngroups =3D 0;
 	mutex_lock(&sfp->mutex);
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		int npins =3D of_property_count_u32_elems(child, "pinmux");
 		int *pins;
 		u32 *pinmux;
--=20
2.39.2


