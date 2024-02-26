Return-Path: <linux-gpio+bounces-3774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3498680B9
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 20:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D81E1C29D78
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 19:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D550130E38;
	Mon, 26 Feb 2024 19:16:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AA0130E24;
	Mon, 26 Feb 2024 19:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708974982; cv=none; b=SWvQHS0Tt1JuUcm/K7qSnUSEJ8BbTKvqisAcct/O2TrPC1JGnDYOzsOdAy6ngW7bsiJVWr8fifqGtb0n0P27MRNbFH1mceyVSEfugVSLP9+mlZJ4zQEaFFGdfzk9RY3hUxsSwzT8hq/Gk+M6Ac/19qOr45xCvIpLbVbaujp0itM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708974982; c=relaxed/simple;
	bh=2K+4dJkfzJO3CTmFsrmJ2rZdwFz5XaB7mdFBJ8nMHgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6JNcu4DCHayCHB7QzmP4uenXQqVB9dsCHgqQ9ljHmw/ZdyqNpIVY9FXCISRl0qXeAD1q/OJ8P7OA+0cFy40IbbrWn76++thOecXiRF8Rs7bn4OkowsiHJTaK4jhANROYdbkR1dwVKoJemnl5Klv3ObGVgDOjR7vGolxDAU3K34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,186,1705330800"; 
   d="scan'208";a="195382660"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2024 04:16:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7E791408E1E2;
	Tue, 27 Feb 2024 04:16:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] pinctrl: da9062: Add OF table
Date: Mon, 26 Feb 2024 19:16:07 +0000
Message-Id: <20240226191607.397386-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add OF table as per the binding so that driver get instantiated and
bind automatically when the driver is built as a module.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/pinctrl-da9062.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 3998b27cbe0e..22e3cd2cc963 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -281,10 +281,17 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(&pdev->dev, &pctl->gc, pctl);
 }
 
+static const struct of_device_id da9062_compatible_reg_id_table[] = {
+	{ .compatible = "dlg,da9062-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da9062_compatible_reg_id_table);
+
 static struct platform_driver da9062_pctl_driver = {
 	.probe = da9062_pctl_probe,
 	.driver = {
 		.name	= "da9062-gpio",
+		.of_match_table = da9062_compatible_reg_id_table,
 	},
 };
 module_platform_driver(da9062_pctl_driver);
-- 
2.25.1


