Return-Path: <linux-gpio+bounces-10686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89C98D2AF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEC171F2289A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 12:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDB91CF2BA;
	Wed,  2 Oct 2024 12:03:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920215D1
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870622; cv=none; b=QjDJ73vlQSzw6+MaILKOLI6XIJZxlf3IrtOLBWMuK0MxTjeO/kevagZqP1S5t25BmbPDITtzcNxGDeT49V6Ku/iP1XvfxXRXrTzqQmK0hvmw+EYDGdowEtjYhC0Gf06Gc09WH1rVWrANySN+1TPa0YPD9wKZRQCScr/pZt1baqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870622; c=relaxed/simple;
	bh=UuYqif044rovpAEdEglqzrqBjxvwVUa4V8g6JDfe8lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rDsydcag/A87pvDRCaU/oPhV1VQlJQWmDoZaYqkFxBo7LO8GpuHbt/QR4SAjiFDC1xRDih6Kh56BBJ2Vg54tXv0G4DLiY7kkxolwIQadIZf8znxO7h29jSATKTAQbzwgvV1cBebpJeni4Zf/nmFs5z7GoNR4Sb4TWtQp1obxR+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4XJYNz036VzYJ0;
	Wed,  2 Oct 2024 14:03:31 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4XJYNy27NSzTQ8;
	Wed,  2 Oct 2024 14:03:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 02 Oct 2024 14:03:03 +0200
Subject: [PATCH] pinctrl: rockchip: improve error message for incorrect
 rockchip,pins property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-pinctrl-rockchip-error-modulo-4-v1-1-4addb4e5732a@cherry.de>
X-B4-Tracking: v=1; b=H4sIAHY2/WYC/x3NwQqDMAyA4VeRnBdoOxnDVxk71JjOoGtKqmMgv
 vvKjt/l/w+obMIVhu4A449U0dzgLx3QHPOLUaZmCC703rmARTJttqIpLTRLQTZTw7dO+6rY4z2
 NPqZE7naN0CrFOMn3f3g8z/MHssiMT3EAAAA=
X-Change-ID: 20241002-pinctrl-rockchip-error-modulo-4-8fb1affc063a
To: Linus Walleij <linus.walleij@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

If one improperly writes a rockchip,pins property, the pinctrl driver
basically just states that one in the myriad of pinctrl nodes is
improper but does not tell you which one.

Instead, let's print the full name of the Device Tree node that is
improper as well as provide more context on what the expected content
is.

Note that this should be rather unnecessary if one reads the output of
the dtbs_check as it would be highlighted as an error.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/pinctrl/pinctrl-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 5c1bc4d5b662ed403ea5c8e57a8e1cad913a31a5..04e85a6037c93f415670b286f91fccada0d38fbf 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3227,7 +3227,9 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 	/* we do not check return since it's safe node passed down */
 	size /= sizeof(*list);
 	if (!size || size % 4)
-		return dev_err_probe(dev, -EINVAL, "wrong pins number or pins and configs should be by 4\n");
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOF: rockchip,pins: expected one or more of <bank pin mux CONFIG>, got %d args instead\n",
+				     np, size);
 
 	grp->npins = size / 4;
 

---
base-commit: e32cde8d2bd7d251a8f9b434143977ddf13dcec6
change-id: 20241002-pinctrl-rockchip-error-modulo-4-8fb1affc063a

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


