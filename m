Return-Path: <linux-gpio+bounces-8489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71A943616
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 21:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72B95283819
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 19:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C73D13775E;
	Wed, 31 Jul 2024 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeeZtwBA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBE12CD8B;
	Wed, 31 Jul 2024 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453217; cv=none; b=a9dM/xW5AQ8M82EZvtJh3ro2UxCPGhIFS2iR1snAawlRlHWcm4soka7ljnXDBSQzr9Y11t4XjnMybprRX/MpTpbIUwSaOu6LQPGEETdVs/EaAhIcKS2z11hL7HTSwgN8s/QRndBQVvt4dkYPogGu++fuTMHLJUWHJ6HRrrHB9zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453217; c=relaxed/simple;
	bh=hOU/2ld5kf2bldZq16dLixHCIlSUJ7gODRhc167/YF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJ+fi2u+725S8MMWtaiCYZLQEeRfkMBo1QRaIvC+wS2JKKOSM9ichK4XooIpRqfo8U88Se5MrRF1XjuZZIoZi+SUv/m2uF8L+haSEYexaWPOdV3RNlroDwT6JTQK0PdBmfrP/uDnUL5oraxSpge3iS75OeanL0B/A+gPXvwmlZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeeZtwBA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26D8C4AF09;
	Wed, 31 Jul 2024 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453217;
	bh=hOU/2ld5kf2bldZq16dLixHCIlSUJ7gODRhc167/YF0=;
	h=From:To:Cc:Subject:Date:From;
	b=SeeZtwBAmUfIkYk4PWKWiUXJRmHJEJygOK9WabmeYbzh+4+g9b04ceZJSs/cjCUpO
	 UiPPoiHvGdkV0pmf+o12DwPaQRoy/Fj6FIsTrd4DuNH58tnknvGQ8abS6Rh6+UNOkx
	 ce2cBqSweF6Naa1EDEyoDP1MmeJi+EHbAnsYpfVK0fkV1ViAlD/2NZRGpiNeTfx/FE
	 quWOrGxalVSGTWhZgTt/iazEg8hsjB5lf9DEUMRqnHLeCo00HA7afKyWXGDK1g2k8L
	 75qK96YtzBjPJvGoz77TMBivuxj39Hgf3D9jKAYHzfdqwztncskhBmkq53O3RYOx8R
	 O2eh+4UMZjAyA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:41 -0600
Message-ID: <20240731191312.1710417-3-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_present() to test for property presence rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f6af5e7be4d1..6683e531df52 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1058,13 +1058,13 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 	int index = 0, ret, trim;
 	const char *name;
 	static const char group_names_propname[] = "gpio-ranges-group-names";
-	struct property *group_names;
+	bool has_group_names;
 
 	np = dev_of_node(&chip->gpiodev->dev);
 	if (!np)
 		return 0;
 
-	group_names = of_find_property(np, group_names_propname, NULL);
+	has_group_names = of_property_present(np, group_names_propname);
 
 	for (;; index++) {
 		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
@@ -1085,7 +1085,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 
 		if (pinspec.args[2]) {
 			/* npins != 0: linear range */
-			if (group_names) {
+			if (has_group_names) {
 				of_property_read_string_index(np,
 						group_names_propname,
 						index, &name);
@@ -1123,7 +1123,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 				break;
 			}
 
-			if (!group_names) {
+			if (!has_group_names) {
 				pr_err("%pOF: GPIO group range requested but no %s property.\n",
 					np, group_names_propname);
 				break;
-- 
2.43.0


