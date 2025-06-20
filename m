Return-Path: <linux-gpio+bounces-21900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0757FAE10D9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 03:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B0087A6CFA
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 01:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBCC72630;
	Fri, 20 Jun 2025 01:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I3jJ0Jah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9F030E820;
	Fri, 20 Jun 2025 01:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750384450; cv=none; b=GDc3Os1yTclXGl5Mpmk/KBDdcxlhQfS28vOapJWfDGUn0/z/iglW5BZ43whOiKtc0L93nNk8gKUavdpbZgKe87V/Jqr7juN9GvNG8h1cTiaAyrz2YOuIj50KeYSchbUXioZkiMoVv+NPh0TQ/eIpjUHHPCdDSfLKvag7lIOeGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750384450; c=relaxed/simple;
	bh=HgKJ66InTHc5FcGkiLK7686jr3/n9jhyfn/anAugw0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G+mkTAD3nJm6N2uooGzca8Za8lRc1X71IfzJmOUp+ZnrN7rP4qrv66KqztQHSdn/H1NBzuG4Olg5Q+0E9RFQTrakgugZvvv+UOmTAM7U0NGCWsowLDsk2nvSHuDGlmHU/wV2+IuL97gOMQGfYaoDr8gkALXbOmY2B7wXzoRdZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I3jJ0Jah; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=je
	Mo98SG+3dISIhlQop9C8b7HiFoi5Bn5yZa+1PM7Go=; b=I3jJ0Jah6hpt1VOky1
	4GRcq8n5/JtBbOhcDMBAEWiNZjkMafBptWOU1viNRVWr4ga7qFRfqcNSRTY6fP4h
	03hlt830HJBPjLbFoOvt4KVEA5DbY+gSNQ3WqIjYfHwWD7lqK/J2bJdh2mB49sXM
	XCHHtX0EHl+Xy7j/qsvlC3uso=
Received: from 163.com (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnpiEtv1RoUz5tAA--.15576S2;
	Fri, 20 Jun 2025 09:53:49 +0800 (CST)
From: Yuan Chen <chenyuan_fl@163.com>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenyuan_fl@163.com,
	Yuan Chen <chenyuan@kylinos.cn>
Subject: [PATCH] pinctrl: berlin: fix memory leak in berlin_pinctrl_build_state()
Date: Fri, 20 Jun 2025 09:53:43 +0800
Message-Id: <20250620015343.21494-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnpiEtv1RoUz5tAA--.15576S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4UXrW5ZFy3Xr4rAr1kXwb_yoW8XFW5pa
	98CF1jkr1UJr4Iqr1rJrZavFy3Gan7tw4UW34jg347Zw45JryktFs8KryYq3yDu398Ar1S
	va15ZwnFv3ZayrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pioa0DUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiUQdyvWhUs9eAxgACsF

From: Yuan Chen <chenyuan@kylinos.cn>

In the original implementation, krealloc() failure handling incorrectly
assigned the original memory pointer to NULL after kfree(), causing a
memory leak when reallocation failed.

Fixes: de845036f997 ("pinctrl: berlin: fix error return code of berlin_pinctrl_build_state()")
Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
---
 drivers/pinctrl/berlin/berlin.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index c372a2a24be4..9dc2da8056b7 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -204,6 +204,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	const struct berlin_desc_group *desc_group;
 	const struct berlin_desc_function *desc_function;
 	int i, max_functions = 0;
+	struct pinfunction *new_functions;
 
 	pctrl->nfunctions = 0;
 
@@ -229,12 +230,15 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		}
 	}
 
-	pctrl->functions = krealloc(pctrl->functions,
+	new_functions = krealloc(pctrl->functions,
 				    pctrl->nfunctions * sizeof(*pctrl->functions),
 				    GFP_KERNEL);
-	if (!pctrl->functions)
+	if (!new_functions) {
+		kfree(pctrl->functions);
 		return -ENOMEM;
+	}
 
+	pctrl->functions = new_functions;
 	/* map functions to theirs groups */
 	for (i = 0; i < pctrl->desc->ngroups; i++) {
 		desc_group = pctrl->desc->groups + i;
-- 
2.25.1


