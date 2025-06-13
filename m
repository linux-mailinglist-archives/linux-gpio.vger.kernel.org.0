Return-Path: <linux-gpio+bounces-21562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746AAD9436
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 20:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B15118904DE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 18:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EB322A4FC;
	Fri, 13 Jun 2025 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KE6Ft6zn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9EE2E11AE;
	Fri, 13 Jun 2025 18:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838402; cv=none; b=Pb2HMn7GgY8MusOSOlP4d4mEMrJHzMs4U+3nkDYqdoVaFtUPzwZHCz5qHTUirRdL+mordVFzPhCQ4+kc43Uow4AnUfJinkzlRNZDdfa0VAEdcGhrnCQsycaB69GgrN1lp0SWzDlA+CX/urpX3M74QVYR3jfPv8I5Q/kKNlke1GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838402; c=relaxed/simple;
	bh=+UjCo45ou3NILqnrnMvxq6FKzcZYmL8qa/wqGQuUc+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tz/Bv6Tw/tEDMiCn7Wk8Lr2J/33wONwXiFFG3FOKE8pxYLB9Ih+19p34CJ8lFFTSw/goXBggy9QE5HFwoz1exSYMRLZ62lU8ysssH3O9fqDZpL0D7Rbvzf6o6AfvMvEkH3vQpsp75DLUqHjj9WZXgoEycjZNkGfQQrQEDpFoff0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KE6Ft6zn; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D5CB1F4F3;
	Fri, 13 Jun 2025 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749838397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cqG2PqVw3HqOIYGAG850BjgDwkb+Sht11Jx983Z/KlI=;
	b=KE6Ft6znr3dVhvxcyi44AEgdjmLtZk/4CfSHx7HX7ov1SJ6NTiyAPR+b+qJzoR/3hmsEwf
	6LmMBteem4lSIPWpJmDTwF9sN1sPi6u9dOakioXRhmuKnsfxGvBvAw5i6kIAhLnqG3jJqW
	datB0VIxCwb7ckPGrq0IcOwlsGTmvUyZjzbf6/WpW5yzUxVcip8L/mQmFYYcqsyVNaas5V
	QRh+pHHf62OTt4+O4pc2okLIGWr3W7UJz/xyK4Wy3N+PuBZ4bQFH/P/XCV3DZ0/6c9jZBI
	5nvwAJU53pHTTJvD90ZOfyGpbrZLFIjsFkcwuGLrqXkoFoQ7A9mq4lpbOSH97g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
Date: Fri, 13 Jun 2025 20:13:12 +0200
Message-ID: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteefudelfeejffehveelgefgtddvudfhudegueeijeevjeeivdfhudfgtedtheenucfkphepvdgrtddumegtsgdurgemvdefmegsjedvvdemrgdutdgrmeelfhgvkeemudgsiegvmeelledtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudgrmedvfeemsgejvddvmegruddtrgemlehfvgekmedusgeivgemleeltddupdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohephigthhhurghnghefsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepshgthhhunhhgsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesg
 hhmrghilhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

As part of a wider cleanup trying to get rid of OF specific APIs, an
incorrect (and partially unrelated) cleanup was introduced.

The goal was to replace a device_for_each_chil_node() loop including an
additional condition inside by a macro doing both the loop and the
check on a single line.

The snippet:

	device_for_each_child_node(dev, child)
		if (fwnode_property_present(child, "gpio-controller"))
			continue;

was replaced by:

	for_each_gpiochip_node(dev, child)

which expands into:

	device_for_each_child_node(dev, child)
		for_each_if(fwnode_property_present(child, "gpio-controller"))

This change is actually doing the opposite of what was initially
expected, breaking the probe of this driver, breaking at the same time
the whole boot of Nuvoton platforms (no more console, the kernel WARN()).

Revert these two changes to roll back to the correct behavior.

Fixes: 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 06ae1fe8b8c5..b51704bafd81 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -1074,7 +1074,10 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	u32 idx = 0;
 	int ret;
 
-	for_each_gpiochip_node(dev, child) {
+	device_for_each_child_node(dev, child) {
+		if (fwnode_property_present(child, "gpio-controller"))
+			continue;
+
 		npctl->nfunctions++;
 		npctl->ngroups += of_get_child_count(to_of_node(child));
 	}
@@ -1092,7 +1095,10 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	if (!npctl->groups)
 		return -ENOMEM;
 
-	for_each_gpiochip_node(dev, child) {
+	device_for_each_child_node(dev, child) {
+		if (fwnode_property_present(child, "gpio-controller"))
+			continue;
+
 		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
 		if (ret) {
 			fwnode_handle_put(child);
-- 
2.48.1


