Return-Path: <linux-gpio+bounces-816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA118006C4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 10:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970AFB212B7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01A3C13C;
	Fri,  1 Dec 2023 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tGDR9eZq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A9ARbpvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37A2194;
	Fri,  1 Dec 2023 01:23:36 -0800 (PST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701422615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAuB+NWb1+h9nrirqejk/RLzcirj6WRcoSRAbARMZUA=;
	b=tGDR9eZqdwVBv7/g90Ct9HkZutigEwF7ngGXBC+BJCXQQoFHN4SZeJEcPAk1kEfZK6uhUm
	jev2BdKZEWpF96N55lxD2jYDQO8NnCDrFcmrDHV9VSQg2CvYF1KJoXjQS3Ih7oTZTIgTQb
	p+1WMxrsmgMvM6U3hx8fQKu01nBI5+XqdYV1RBPRjOQ6OHIULZ9D9NIGTKEcGo4pidOeT6
	Rcq7KgFbkeumyAQzK+S8hG2IvvAI3FV21O9L9iJSbHl1tyzcnjjYNy9qJF9yxC3sQzbjGP
	IoepgDGclqu+dwbYuaRJr0BcAsz35D9078zP+x+vnZeL/Nr4u710h/8ErzjxSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701422615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAuB+NWb1+h9nrirqejk/RLzcirj6WRcoSRAbARMZUA=;
	b=A9ARbpvm7QOTKyyBB7JLD1eW7y/nyFyioCc01jf3h7pElP7NZmdrLwXNwXLV59pcm5uQGw
	X5zAVFsE//77j/Cw==
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
Subject: [PATCH 2/2] pinctrl: starfive: jh7100: ignore disabled device tree nodes
Date: Fri,  1 Dec 2023 10:23:29 +0100
Message-Id: <fe4c15dcc3074412326b8dc296b0cbccf79c49bf.1701422582.git.namcao@linutronix.de>
In-Reply-To: <fd8bf044799ae50a6291ae150ef87b4f1923cacb.1701422582.git.namcao@linutronix.de>
References: <fd8bf044799ae50a6291ae150ef87b4f1923cacb.1701422582.git.namcao@linutronix.de>
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

Fixes: ec648f6b7686 ("pinctrl: starfive: Add pinctrl driver for StarFive So=
Cs")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/p=
inctrl/starfive/pinctrl-starfive-jh7100.c
index 530fe340a9a1..561fd0c6b9b0 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -492,7 +492,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *=
pctldev,
=20
 	nmaps =3D 0;
 	ngroups =3D 0;
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		int npinmux =3D of_property_count_u32_elems(child, "pinmux");
 		int npins   =3D of_property_count_u32_elems(child, "pins");
=20
@@ -527,7 +527,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *=
pctldev,
 	nmaps =3D 0;
 	ngroups =3D 0;
 	mutex_lock(&sfp->mutex);
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		int npins;
 		int i;
=20
--=20
2.39.2


