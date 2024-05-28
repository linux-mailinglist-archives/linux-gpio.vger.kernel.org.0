Return-Path: <linux-gpio+bounces-6767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF158D2536
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6191F29DC5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7930178392;
	Tue, 28 May 2024 19:50:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D4F17BB34
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925812; cv=none; b=QbCKssAHaJLfO4GF7i59ThIaABTqDvMzhZn48foGl3lqCQKeox/iwTPr6Ul/SDBfOwJQFw+CooF6o0ATNF3f0xWVsI4q3cwJEDJzL48tomNiK4wzsGFa8FS7nGtKJs1wo8mzf+VJ979NNO7u2mL19tSvN6REnUcOuAN1YlJbvOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925812; c=relaxed/simple;
	bh=/YBz71iw2VP9vAVk7LnHHysVeutBwakvEIw5dgBOqkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcYEDaOR5rEIowwABIUHeOdGGSpioGL4HrfLC/ACF+mV4XDmnZOobphPVSbbiUHRcw+zxADUy+KeDlBC72ct9ToPv+SMiLvSAdUe4g4hORAvXgfUYmnn5+SQV7IMDxCs/44Wr5+zqMAvMIK0pco2FQeycF3D543k3gPD2cMfnKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 78f716eb-1d2b-11ef-8e2b-005056bdf889;
	Tue, 28 May 2024 22:50:02 +0300 (EEST)
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
Subject: [PATCH v2 06/11] pinctrl: pinmux: Embed struct pinfunction into struct function_desc
Date: Tue, 28 May 2024 22:44:57 +0300
Message-ID: <20240528194951.1489887-7-andy.shevchenko@gmail.com>
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

struct function_desc is a particular version of the struct pinfunction
with associated opaque data. Start switching pin control core and
drivers to use it explicitly.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinmux.c | 10 +++++-----
 drivers/pinctrl/pinmux.h |  5 ++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 8d69fa1b0bff..aae71a37219b 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -796,7 +796,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->name;
+	return function->func.name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -805,12 +805,12 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
  * @pctldev: pin controller device
  * @selector: function number
  * @groups: array of pin groups
- * @num_groups: number of pin groups
+ * @ngroups: number of pin groups
  */
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


