Return-Path: <linux-gpio+bounces-5661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C98A9946
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 13:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313332816DE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CA615FD1E;
	Thu, 18 Apr 2024 11:59:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1015FCF1;
	Thu, 18 Apr 2024 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441545; cv=none; b=ESZH353XXMnyndG8sboDx/QgJF292SuwSpeXEA895nlA0U/Xd3oVluqAennAicF1xIMPFSN/iQyLBn/slMvz44A1wAHTl3UNiajXjDwP7Kv5LjMoH0+SMMHWu4O3QLdnDX5yIsVW0HduD4STitgGelBVmpU7I/Ig7M/Kpjh8XhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441545; c=relaxed/simple;
	bh=baJ1OyVL35MF6ElETwTtGa36M7cQ5eMdq/awVTBARQc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i+3CXmV6ka1qLnibFhTUa3CmVeLv//8mwsuxdGZuuTkfdsFkEy63/0IYH354F8UlhQbO3q4QpSZ7PwqUGj7n5kj1GibhsYD4ELHqYpygIK2cNQHyElsKPMpGcxapuoU5+vbG6yrjhnzciPHCljqsKx6lLBuSoDgEBd2iTvwqOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VKx7W1XxRz1R5T2;
	Thu, 18 Apr 2024 19:56:07 +0800 (CST)
Received: from kwepemi500024.china.huawei.com (unknown [7.221.188.100])
	by mail.maildlp.com (Postfix) with ESMTPS id EC7B018006B;
	Thu, 18 Apr 2024 19:59:00 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 18 Apr
 2024 19:59:00 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<andriy.shevchenko@intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<liwei391@huawei.com>
Subject: [PATCH v2 resend] pinctrl: devicetree: fix refcount leak in pinctrl_dt_to_map()
Date: Thu, 18 Apr 2024 19:58:13 +0800
Message-ID: <20240418115813.93241-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500024.china.huawei.com (7.221.188.100)

If we fail to allocate propname buffer, we need to drop the reference
count we just took, otherwise it will lead reference leak. Here the
error exit path is modified to jump to the err label and call
pinctrl_dt_free_maps() which would drop the counter.

In the meantime, if it is found that the property 'pinctrl-0' is not
present, ENODEV is returned and also jump to the err label and call the
free function, in case the Smatch tool complains.

Fixes: 91d5c5060ee2 ("pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map")
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
v2: add a comment and modify the commit message, without any logical
    changes.
---
 drivers/pinctrl/devicetree.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index df1efc2e5202..37069e40af2b 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -220,14 +220,17 @@ int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
 	for (state = 0; ; state++) {
 		/* Retrieve the pinctrl-* property */
 		propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
-		if (!propname)
-			return -ENOMEM;
+		if (!propname) {
+			ret = -ENOMEM;
+			goto err;
+		}
 		prop = of_find_property(np, propname, &size);
 		kfree(propname);
 		if (!prop) {
 			if (state == 0) {
-				of_node_put(np);
-				return -ENODEV;
+				/* Return -ENODEV if the property 'pinctrl-0' is not present. */
+				ret = -ENODEV;
+				goto err;
 			}
 			break;
 		}
--
2.25.1


