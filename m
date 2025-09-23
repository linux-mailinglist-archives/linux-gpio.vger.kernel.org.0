Return-Path: <linux-gpio+bounces-26529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E15B97213
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 19:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEE5A4A8316
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 17:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBAF2DF13D;
	Tue, 23 Sep 2025 17:50:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06EC29B228;
	Tue, 23 Sep 2025 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758649823; cv=none; b=NrhuN53nZzFVPDUHSghfrT8dXDqtcnnYfrR0iMZ6XPo5xRWYLjYtzWhprqorIFcin9snXrw3Si8UfC2Q4x9qPDTb+KnzBwQzqAkmOUOPve77vTaxCghxw5X9yn0MgVUv4N0lpaDOamNf5EP5ZIq2W7An2m2UKh16dl82qGolfKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758649823; c=relaxed/simple;
	bh=3MzZor+wv1b+LtEEulN63K5j/gISYaHE/QyOscIN/2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWnr3KwCimlJb06q6q3ZsHgrA7sqpHwgef/hE6k7NKM2pVKsmhCMOJ04pDUj4q3Kq2RIy7b+FfrdgsAKpFvAGbZR8XsnqBMuyHBYS1X3YC7sUz9R56k1yXdSJTvInYXO2ggxkGxV44FFbcJzOTuXT/aYD8e8oQJilemp/rpTi6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Z3Gm9Z44RTCrZpFLzthbPQ==
X-CSE-MsgGUID: wYlBcxyoS2W7tt2kT0jCyg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2025 02:50:19 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.64])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 904CF403D61D;
	Wed, 24 Sep 2025 02:50:17 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: 
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: remove extra semicolons
Date: Tue, 23 Sep 2025 20:49:50 +0300
Message-ID: <20250923174951.1136259-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Semicolons after end of function braces are unnecessary, remove them.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f524af6f586f..51b7e4291ff4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -568,7 +568,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
 
 	spin_unlock_irqrestore(&pctrl->lock, flags);
-};
+}
 
 static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int func_selector,
@@ -608,7 +608,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static int rzg2l_map_add_config(struct pinctrl_map *map,
 				const char *group_or_pin,
@@ -1413,7 +1413,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	*config = pinconf_to_config_packed(param, arg);
 
 	return 0;
-};
+}
 
 static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
@@ -1613,7 +1613,7 @@ static int rzg2l_pinctrl_pinconf_group_set(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static int rzg2l_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
 					   unsigned int group,
@@ -1640,7 +1640,7 @@ static int rzg2l_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
 	}
 
 	return 0;
-};
+}
 
 static const struct pinctrl_ops rzg2l_pinctrl_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
-- 
2.51.0


