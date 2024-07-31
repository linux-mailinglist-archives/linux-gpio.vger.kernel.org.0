Return-Path: <linux-gpio+bounces-8491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B015943640
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 21:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6631C22A7E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 19:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F53616FF39;
	Wed, 31 Jul 2024 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz2lxk8R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE51607A4;
	Wed, 31 Jul 2024 19:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453258; cv=none; b=Cwra+HEZuRzbtbBDQYHnnU5hmTQ+4iB208nssEong+dBaejjxsyknsU6Ots+BJsK0UtQjG/VQtni37MFkpRS0z0tcrC+8SfuZWzOdncknisR9zKqw6RpLkiPMptBaRUneKAGSkk2wQJwrFYOxu5i6RqcBFr8d8Y2NtRrOtELcDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453258; c=relaxed/simple;
	bh=ubh3NLrklndLBiuUONv6qIaq58iV67suw8/xEa83+Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPivOm0gF91Cz3g9ialMBC4kV+BpiYRGi6qa+19hLs/JfvV5SDtI3knx/SlnkXbGDYhW5bwQyF37xAhJ5/YvYTjd8QYBgczypG1QDNgpPeSj7oHa/oyXjmFbuez4tjHnEPyM7C0CL57rKo2RFbCqO7EZwh52QyfNNuFUP8++scQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz2lxk8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D50C116B1;
	Wed, 31 Jul 2024 19:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453258;
	bh=ubh3NLrklndLBiuUONv6qIaq58iV67suw8/xEa83+Qw=;
	h=From:To:Cc:Subject:Date:From;
	b=hz2lxk8Rlt6QZc1C1Lk0LOHWeqWymGDaLPmM2IP6MJuKfOE3BHx5eDqAq6YQ8wALu
	 dz5LesUs5DdW7rwkiVQ0it2/nlnn0e8i63/Sg8cWAuM2hoh6CtvnYJ+6OxyY8HjxfX
	 0TvcegbX0EhP8HTYq3a6C2qNLxIqOuzyKktqQ7nNAxJDjLl9rfqDzlbU5T/5bRxKDd
	 0ngxttAnY83AyKk+adYDpMhjh9UdnUhYiSnFoeht0jKJnSuukpoWPiqdkD2lSnjJrn
	 Sy6/XQ8Sb64+NVzxaFsdCZko+4iv8xMHv33r5WJ9XkymSDKIL9X2C/yYE1qduSaEhB
	 US6+iEUJ87VKQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: Use of_property_read_bool()
Date: Wed, 31 Jul 2024 13:13:01 -0600
Message-ID: <20240731191312.1710417-23-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_read_bool() to read boolean properties rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index e12316c42698..87e958d827bf 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -1044,11 +1044,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 
 	hw->nbase = hw->soc->nbase_names;
 
-	if (of_find_property(hw->dev->of_node,
-			     "mediatek,rsel-resistance-in-si-unit", NULL))
-		hw->rsel_si_unit = true;
-	else
-		hw->rsel_si_unit = false;
+	hw->rsel_si_unit = of_property_read_bool(hw->dev->of_node,
+						 "mediatek,rsel-resistance-in-si-unit");
 
 	spin_lock_init(&hw->lock);
 
-- 
2.43.0


