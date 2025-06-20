Return-Path: <linux-gpio+bounces-21898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E51AE1089
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 03:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97E065A0026
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 01:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F881758B;
	Fri, 20 Jun 2025 01:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S2aHwtrP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9430763CF;
	Fri, 20 Jun 2025 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381472; cv=none; b=sppGvoo9ReeTscjtIzQDIklkZ/7rRhJTyrmJvjWs1sX1dpnvHQQcD0Z1KXtS1oET/f/tocWipdmKBbCVd81jbJ16eT1knjC/shs9gUJtw84R4W/qNUFNlLi0Dbt5pbxi/jJvvWeDRWMCLYT3fBDwQ9uVLPDOB04+6HiRvv6qI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381472; c=relaxed/simple;
	bh=1RU9OFwdAOgI84I9GEHqAphNSYKWAXhPW6s13EAF1Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RkE47B2yV31BDTGhU77tl748RznVx/9r1kdzs5WXJhtdqcicnhy2nYrYpYnTdmIhvITuOiM7Yo76epJBTRryZUufCHNFoN+kVRpJQAgx5G//05sWfzplLNIToGCIbNJEyBif+cvpgLrBZkw+xyS58W4T508UqLkNAsUsJZBAz4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S2aHwtrP; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8/
	2XLIJnNinS9+K18/3lu/lVK35HJN1wS4il3Erb/Fo=; b=S2aHwtrPdIB5hr7uA+
	v2AOZf1lXUj73jKH/JRl7oJY9VIaz2wpvyfFIMUmQZehwkTlMBKHiSlgPivcRpma
	oXoLMXd9J1QyUMbOaOqh1FJa//L9Rr8dAOaM+QvjwA6ij+MCZLnUTueve4Cpjaw5
	A/oJpP6S/wFYOzt+bs5/foHUY=
Received: from 163.com (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAHrIF3s1Ro7thPAQ--.27905S2;
	Fri, 20 Jun 2025 09:03:53 +0800 (CST)
From: chenyuan <chenyuan_fl@163.com>
To: linus.walleij@linaro.org,
	wens@csie.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	chenyuan <chenyuan@kylinos.cn>
Subject: [PATCH] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
Date: Fri, 20 Jun 2025 09:03:45 +0800
Message-Id: <20250620010345.11247-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAHrIF3s1Ro7thPAQ--.27905S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw45KF45JF17Xr1UGF48JFb_yoW8Xryxpa
	yfGry5Ar4rJF4Sg3yay398ZFy3Gan7J3y5G3Wj934Yvrn8Arn8Xr15KFWjyw4DCrWrXr1S
	vF4DA3429r1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEL0e9UUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiUQxyvWhUp3X19gAAs-

From: chenyuan <chenyuan@kylinos.cn>

In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinctrl_map
array, the function returns -ENOMEM directly without freeing the previously
allocated *map buffer. This results in a memory leak of the original kmalloc_array
allocation.

Fix: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
Signed-off-by: chenyuan <chenyuan@kylinos.cn>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daa..d63859a2a64e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -408,6 +408,7 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	const char *function, *pin_prop;
 	const char *group;
 	int ret, npins, nmaps, configlen = 0, i = 0;
+	struct pinctrl_map *new_map;
 
 	*map = NULL;
 	*num_maps = 0;
@@ -482,9 +483,13 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	 * We know have the number of maps we need, we can resize our
 	 * map array
 	 */
-	*map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
-	if (!*map)
-		return -ENOMEM;
+	new_map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
+	if (!new_map) {
+		ret = -ENOMEM;
+		goto err_free_map;
+	}
+
+	*map = new_map;
 
 	return 0;
 
-- 
2.25.1


