Return-Path: <linux-gpio+bounces-17125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3689A50537
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 17:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24773A9F2E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 16:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E672512ED;
	Wed,  5 Mar 2025 16:38:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAAA24E013;
	Wed,  5 Mar 2025 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192690; cv=none; b=DyPFzhACJD4k8h+diqHPuxM0qoo/TPMppo0TOmETnogTtnF05sXZqfILyG4lwr4qPtZ+bttnceYqJpeul2LqC1YeQxuOT/D1tbYdtWNQwhZqJib4gR9Z67VN3CywkGujdeiniMEr5sp9Iez7pTVswtZl0FC7oS92G2mSbmL5+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192690; c=relaxed/simple;
	bh=4IbP09lBVQfq6U5X9J3XqAo4agzaWXLdUAtswp7Yiuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mCeuXvsnqGfFYds3nWzCizI8bR/zaVw9rJP0j9mPbFq8mPfvvhusb4wEvVMU5tcSZGFFVpbZaDMQIn/fNEGJtFUiXxjebGlpYfgdH/Vbh3UnluZl97b0n29IlWANv5PpoMdYxoDwXaDeXzkZzMU6AeYGxyabGOo+cGQli8BoSmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: CoI9aXoGTr6l1yhmeI41fQ==
X-CSE-MsgGUID: 93mWPgOaRPuHmZg2Ai22TA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2025 01:38:06 +0900
Received: from mulinux.home (unknown [10.226.92.17])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F309400F792;
	Thu,  6 Mar 2025 01:38:04 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] pinctrl: renesas: rzg2l: Fix missing of_node_put() call
Date: Wed,  5 Mar 2025 16:37:51 +0000
Message-Id: <20250305163753.34913-3-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_parse_phandle_with_fixed_args() requires its caller to
call into of_node_put() on the node pointer from the output
structure, but such a call is currently missing.

Call into of_node_put() to rectify that.

Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9280bc37a623..c72e250f4a15 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2763,6 +2763,8 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	if (ret)
 		return dev_err_probe(pctrl->dev, ret, "Unable to parse gpio-ranges\n");
 
+	of_node_put(of_args.np);
+
 	if (of_args.args[0] != 0 || of_args.args[1] != 0 ||
 	    of_args.args[2] != pctrl->data->n_port_pins)
 		return dev_err_probe(pctrl->dev, -EINVAL,
-- 
2.34.1


