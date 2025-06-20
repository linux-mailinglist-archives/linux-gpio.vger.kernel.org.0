Return-Path: <linux-gpio+bounces-21899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B51AE10B6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 03:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC7C3B8112
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 01:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC0645038;
	Fri, 20 Jun 2025 01:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NoZcchrT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1297B35950;
	Fri, 20 Jun 2025 01:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382866; cv=none; b=r+E4sUQgZE6xGqhkLhQLPM79qBtvsyQwJB40hh2ik/YJRxaRroAGy54dnidqNq3ogE62wVkL+2RMkNbbfoZieD7nedhqQdcpeneqhjPS3p7378CNp9Kx5l4WaZ/d6vvI6uLxpFYxOqiNmwsCldx7zXh3bCSUZxt3FN5BAItLtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382866; c=relaxed/simple;
	bh=jRrcd3jIEsF31VWDqmff6c9MGZTpyAF3UKfV3oVeAUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=twRNaEJ1kJ/Sfh8t8Dpb2z9ZKOVF8fpiZ/8EClXLxnQ+AahYZZGmuE7sGn+nSxg7SugvaMcZ4hW+1qHeONYWRi5wHwQo5l3TEOx4zn+HuJn3XWDBqLW7ktMbGjij0UyHPmOD2lfx9iy2Hhe1AOnIORqysJywm4bW4dusmJ+tdvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NoZcchrT; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ie
	mo//66rGggfhMsVrvcGWLgvsP6AIerLHEFJXsGHqE=; b=NoZcchrTVa7ylagmGp
	10DCENAV5t5AdQUraRYv0/832vC7XNiZLVYGPoJNFCx2mHGwgy4k6o7BdgByZCe7
	Y5GUcT1qcydPv87OTVOqXMhRIbP3r/51fL7637uWfl4V/ZCwY1ezkqurkJOmuyLq
	2xxTEmb0EiyjiM8bch+IEEe4Q=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCX4izzuFRoCzlJAg--.49566S2;
	Fri, 20 Jun 2025 09:27:15 +0800 (CST)
From: Yuan Chen <chenyuan_fl@163.com>
To: linus.walleij@linaro.org,
	wens@csie.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	Yuan Chen <chenyuan@kylinos.cn>
Subject: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
Date: Fri, 20 Jun 2025 09:27:08 +0800
Message-Id: <20250620012708.16709-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250620010345.11247-1-chenyuan_fl@163.com>
References: <20250620010345.11247-1-chenyuan_fl@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX4izzuFRoCzlJAg--.49566S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw45KF45JF17Xr1UJw45GFg_yoW8Xryfpa
	1fGry5Ar4rJF4Sg3y3A398WFy3Gan7JrW5G3Wj934Yvrn8Arn5XF15KFWjyw4DCrWrXr1S
	vF4DA3429F1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEAR6UUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiJxJyvWhUsxR6wQABsb

From: Yuan Chen <chenyuan@kylinos.cn>

In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinctrl_map
array, the function returns -ENOMEM directly without freeing the previously
allocated *map buffer. This results in a memory leak of the original kmalloc_array
allocation.

Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
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


