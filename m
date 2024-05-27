Return-Path: <linux-gpio+bounces-6696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 823DC8D0F79
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 23:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36BF11F22554
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 21:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA0F16133E;
	Mon, 27 May 2024 21:27:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B2168C00
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845278; cv=none; b=DsdCwrCVk+mx6mObwUwHENpULiykkPWY3y7ZgOeW1tVwMAaA2bc33Un80CIeys9RYVMad6eTojcsK1CHcFE3usUeSaq4FrX/aWb/P2GPW08wc8MD+37DXJ4A0oVSnzN/C4uB0Uvb1Ie9kM39cBmCBgVm+JO1zGqFQuT6nsPGHEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845278; c=relaxed/simple;
	bh=kk8RhK9dejVAoyIbBmlQksohT7MNO5EKhQf+Y1998jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7gthBVr4kVkP4mgPMbxl+QkSTFrz+6zrrfAXw8RLaikJdYReSn3VMNccMNi5qN/T0eoiDxJoduUdBgQOOZC38xhlWknmhvNIOoCY5512shjkwHSjxWj9JhGUUyf82htvf+yjMZRcWZFGrEv1z0bakaBjtnD+u8364JV49vIEfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id fa7a8594-1c6f-11ef-80bc-005056bdfda7;
	Tue, 28 May 2024 00:27:54 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH v1 06/11] pinctrl: pinmux: Embed struct pinfunction into struct function_desc
Date: Tue, 28 May 2024 00:24:41 +0300
Message-ID: <20240527212742.1432960-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
References: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

struct function_desc is a particular version of the struct pinfunction
with associated opaque data. Start switching pin control core and
drivers to use it explicitly.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinmux.c | 8 ++++----
 drivers/pinctrl/pinmux.h | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 89b42e05f368..ef6334e7eab2 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -796,7 +796,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->name;
+	return function->func.name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -810,7 +810,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       unsigned int selector,
 				       const char * const **groups,
-				       unsigned int * const num_groups)
+				       unsigned int * const ngroups)
 {
 	struct function_desc *function;
 
@@ -821,8 +821,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->group_names;
-	*num_groups = function->num_group_names;
+	*groups = function->func.groups;
+	*ngroups = function->func.ngroups;
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 52e6e4db88b4..9b57c1cc9d50 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -133,12 +133,14 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
 
 /**
  * struct function_desc - generic function descriptor
+ * @func: generic data of the pin function (name and groups of pins)
  * @name: name of the function
  * @group_names: array of pin group names
  * @num_group_names: number of pin group names
  * @data: pin controller driver specific data
  */
 struct function_desc {
+	struct pinfunction func;
 	const char *name;
 	const char * const *group_names;
 	int num_group_names;
@@ -148,6 +150,7 @@ struct function_desc {
 /* Convenient macro to define a generic pin function descriptor */
 #define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
 (struct function_desc) {					\
+	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
 	.name = _name,						\
 	.group_names = _grps,					\
 	.num_group_names = _num_grps,				\
@@ -163,7 +166,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       unsigned int selector,
 				       const char * const **groups,
-				       unsigned int * const num_groups);
+				       unsigned int * const ngroups);
 
 struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 						  unsigned int selector);
-- 
2.45.1


