Return-Path: <linux-gpio+bounces-29045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A77C82750
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 21:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BD004E19F5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 20:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E102E613A;
	Mon, 24 Nov 2025 20:57:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D57258ECC;
	Mon, 24 Nov 2025 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764017826; cv=none; b=Z1vActLKt4kETrc52JZmmGzEarLRLATc+uIwIiq4/ATVpBTPgCGmxVt2qpJi9nP3pP+wmjasbucjacHIIQDjpGkksCvk8ifF2aq2TNKI+lAjLrrxY0KPCTRTC5RzFQ+AhEX8sOC7hpA56nySfvDMWdUjXHWn5VZyPAbp2XaAr6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764017826; c=relaxed/simple;
	bh=Pc8UN9YVeoEwyVurkGglaWNeVYL23hjnDmUy/nwLgX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjtfcJhW3Ba7TUNg9kqekPaXaP6/Y1pwOC6NvulrruNBYIioupHorqTBbvtk2UAtXNhF/slFSYFUTo2JICgUYIkd21LQCaX56Sg9SV7p4rBxnmxVLyPOn8ALvLCQHy42eneOv+9tjr64nry0vq3gkqMHRC9oOVj7KHm+Zei5E7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3679A2ABFA1;
	Mon, 24 Nov 2025 21:56:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id B53CdOYX8L0m; Mon, 24 Nov 2025 21:56:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3DACA2ABFDC;
	Mon, 24 Nov 2025 21:56:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RfuquAeH4ek5; Mon, 24 Nov 2025 21:56:54 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id E1FDC2ABFA1;
	Mon, 24 Nov 2025 21:56:53 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	brgl@kernel.org,
	linus.walleij@linaro.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] gpiolib: Warn if a single GPIO is expected but a list is found
Date: Mon, 24 Nov 2025 21:56:49 +0100
Message-ID: <20251124205649.3560456-1-richard@nod.at>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Device tree properties such as reset-gpios can contain one or more
GPIOs but the vast majority of device drivers query only for a single
GPIO desc.
Add some aid to detect the case when someone defines multiple GPIOs
but a driver expected only one.
This would have saved me an hour today.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/gpio/gpiolib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cd8800ba5825f..d57d83cc4074e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4601,6 +4601,10 @@ static struct gpio_desc *gpiod_find_by_fwnode(stru=
ct fwnode_handle *fwnode,
 	const char *name =3D function_name_or_default(con_id);
 	struct gpio_desc *desc =3D ERR_PTR(-ENOENT);
=20
+	if (gpiod_count(consumer, con_id) > 1)
+		dev_warn(consumer, "gpio property \"%s\" in %pfw has more than one ele=
ments, expected only one!\n",
+			 con_id, fwnode);
+
 	if (is_of_node(fwnode)) {
 		dev_dbg(consumer, "using DT '%pfw' for '%s' GPIO lookup\n", fwnode, na=
me);
 		desc =3D of_find_gpio(to_of_node(fwnode), con_id, idx, lookupflags);
--=20
2.51.0


