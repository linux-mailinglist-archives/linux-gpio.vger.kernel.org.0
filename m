Return-Path: <linux-gpio+bounces-6768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CAC8D2537
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B791F29CA3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E3F178393;
	Tue, 28 May 2024 19:50:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEBA17DE03
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925813; cv=none; b=QCk9cWGmzKYhrNc0AwcwpIcgHZD4YvNPKLslRzXcQoix5lkpupzaLWF7pB7SpILpgTR9D7fAu6NfMeEwBzhp7fUy8NHcncfvoCQuycydJm+bf10lWlC1WAr2g6d6tqG09oAUFd+ImAxU13N92dLHPGeTPyCwKsp4m+323lFKqaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925813; c=relaxed/simple;
	bh=AtdSj8Gi5BjDdlTV9ZqdN7OUIGwv22hj9Vwr0vi/QVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QGUjFH1sDaxp7BYYccUobdV/9FTQh/CXR9VJ46VqN31DyG5ub+VsqIg5jy6dgO1xj/SvNcHYg0Wb7hXonONkL3MaMlYzqNb4lkJhT4EFArPiKQSYn8VJ4VI9wWwDKScX58ubDeTZgqdbYTiAeSBcJ24eSbs5K1hmgmtzuhKcal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 7b843f1e-1d2b-11ef-8d3a-005056bd6ce9;
	Tue, 28 May 2024 22:50:06 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 11/11] pinctrl: pinmux: Remove unused members from struct function_desc
Date: Tue, 28 May 2024 22:45:02 +0300
Message-ID: <20240528194951.1489887-12-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

All drivers are converted to use embedded struct pinfunction.
Remove unused members from struct function_desc.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinmux.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 9b57c1cc9d50..2965ec20b77f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -134,16 +134,10 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
 /**
  * struct function_desc - generic function descriptor
  * @func: generic data of the pin function (name and groups of pins)
- * @name: name of the function
- * @group_names: array of pin group names
- * @num_group_names: number of pin group names
  * @data: pin controller driver specific data
  */
 struct function_desc {
 	struct pinfunction func;
-	const char *name;
-	const char * const *group_names;
-	int num_group_names;
 	void *data;
 };
 
@@ -151,9 +145,6 @@ struct function_desc {
 #define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
 (struct function_desc) {					\
 	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
-	.name = _name,						\
-	.group_names = _grps,					\
-	.num_group_names = _num_grps,				\
 	.data = _data,						\
 }
 
-- 
2.45.1


