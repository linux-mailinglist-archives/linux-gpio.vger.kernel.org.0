Return-Path: <linux-gpio+bounces-10777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0298EB89
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B7B283927
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 08:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A624013B2AF;
	Thu,  3 Oct 2024 08:25:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200FE126C04;
	Thu,  3 Oct 2024 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943958; cv=none; b=Zmz8+O5VY1wN8AX8vcQhlbK5j5RvaT/rm4L7HcaIz+1SKRBuQL3t+jVeb5rC6vowhy9BLimYACeTK36TRWeJjbWnW4atQeaAMmYL5+Hv+AVsQm2P+nMdcuWirvyOf7EI4K3OCCnv6LLXoLUyAHaRf3sUvJ1FGmBqewYEFPnN6ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943958; c=relaxed/simple;
	bh=RAp6bf0v8an72Q9/9OFojiamTjkTeqn6e2CebZqxWOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XoBLP7b/pQ1y0YC3OE84FRVi1V892anDZ4yDdjkpo8VWvXLqmTYMTURgsnJrIVj7YLWIc00T4E3I0qyE2K3l5mv33Oc+W5PkesN2p2zsg3Tx7vSCcmwX9L8j/DbrPCp4igqJlbA/VJWl/iIVCtlUuFj+eAMs22GprpTzbHBQJBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,173,1725289200"; 
   d="scan'208";a="220676587"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2024 17:25:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.119])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5C4C341B69E0;
	Thu,  3 Oct 2024 17:25:52 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Fix missing return statement
Date: Thu,  3 Oct 2024 09:25:48 +0100
Message-ID: <20241003082550.33341-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the missing return statement on the error path for
rzg2l_pinctrl_register().

Fixes: f73f63b24491 ("pinctrl: renesas: rzg2l: Use dev_err_probe()")
Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Closes: https://lore.kernel.org/all/OS0PR01MB638837327E5487B71D88A70392712@OS0PR01MB6388.jpnprd01.prod.outlook.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Fixed mail id of Nobuhiro Iwamatsu in Reported-by tag
 * Replaced tab with space charater after return statement
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5a403915fed2..3a81837b5e62 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2710,7 +2710,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 
 	ret = pinctrl_enable(pctrl->pctl);
 	if (ret)
-		dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");
+		return dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");
 
 	ret = rzg2l_gpio_register(pctrl);
 	if (ret)
-- 
2.43.0


