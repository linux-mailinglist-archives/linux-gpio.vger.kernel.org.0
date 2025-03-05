Return-Path: <linux-gpio+bounces-17127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80AA50541
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 17:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E8893A912B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 16:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F771A23B1;
	Wed,  5 Mar 2025 16:38:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C1E18DF8D;
	Wed,  5 Mar 2025 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192696; cv=none; b=qys9EXqADTtkuvmpCmNDCd9j7ea3trKj+BiOnjWSEuuQwI74y1VyTHnUjPlOvzNtuWl2mLLmkQhNRBopDRW3kHAh2AlwVga+CmuSdZ4VbzbVsYDPc3avabEC+jRDLEmvDlZ8LzXKHaElorBAQkrYB0izvMez6BbwTr6DVDnRdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192696; c=relaxed/simple;
	bh=pOsUmy8q7SFXtRB+nB95ztJwXFd1eWeqK2uicbiqJHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QLeqMhDDVLP3ZZK2nyLO0ve60GTLvRXmKNgqXLaYmUME1AJnZtV9+to5Q1cvmC76MlYPiDh86gAg5BbJ7WvL76UCFkFi4Squ/uNUagNiN45F51JamwNTjA0qq+GrfcI8bCK5IBtyVOfBmSLTP3oaYVLymgkV12b3pm14Qo7N3LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: MlfZZ+71TH6yMtp9vx2vsg==
X-CSE-MsgGUID: wdZostsNQs+xEhUPxTTBjw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2025 01:38:13 +0900
Received: from mulinux.home (unknown [10.226.92.17])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 507464017975;
	Thu,  6 Mar 2025 01:38:10 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] pinctrl: renesas: rza2: Fix missing of_node_put() call
Date: Wed,  5 Mar 2025 16:37:53 +0000
Message-Id: <20250305163753.34913-5-fabrizio.castro.jz@renesas.com>
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

Fixes: b59d0e782706 ("pinctrl: Add RZ/A2 pin and gpio controller")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index a654ede01f70..3b5812963850 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -259,6 +259,8 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 		return ret;
 	}
 
+	of_node_put(of_args.np);
+
 	if ((of_args.args[0] != 0) ||
 	    (of_args.args[1] != 0) ||
 	    (of_args.args[2] != priv->npins)) {
-- 
2.34.1


