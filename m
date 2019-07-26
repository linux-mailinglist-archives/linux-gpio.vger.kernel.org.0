Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E597729F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2019 22:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGZUQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jul 2019 16:16:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:21278 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfGZUQl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Jul 2019 16:16:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2019 13:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,312,1559545200"; 
   d="scan'208";a="194402408"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2019 13:16:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DF860130; Fri, 26 Jul 2019 23:16:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: baytrail: Re-use data structures from pinctrl-intel.h (part 2)
Date:   Fri, 26 Jul 2019 23:16:36 +0300
Message-Id: <20190726201636.53129-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We have some data structures duplicated across the drivers.
Let's deduplicate them by using ones that being provided by
pinctrl-intel.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 65 +++++++++---------------
 drivers/pinctrl/intel/pinctrl-intel.h    |  6 ++-
 2 files changed, 27 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 14a81943c5ab..db6c5ca9e2d6 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -98,13 +98,6 @@ struct byt_gpio_pin_context {
 	u32 val;
 };
 
-struct byt_community {
-	unsigned int pin_base;
-	size_t npins;
-	const unsigned int *pad_map;
-	void __iomem *reg_base;
-};
-
 #define COMMUNITY(p, n, map)		\
 	{				\
 		.pin_base	= (p),	\
@@ -112,26 +105,14 @@ struct byt_community {
 		.pad_map	= (map),\
 	}
 
-struct byt_pinctrl_soc_data {
-	const char *uid;
-	const struct pinctrl_pin_desc *pins;
-	size_t npins;
-	const struct intel_pingroup *groups;
-	size_t ngroups;
-	const struct intel_function *functions;
-	size_t nfunctions;
-	const struct byt_community *communities;
-	size_t ncommunities;
-};
-
 struct byt_gpio {
 	struct gpio_chip chip;
 	struct platform_device *pdev;
 	struct pinctrl_dev *pctl_dev;
 	struct pinctrl_desc pctl_desc;
 	raw_spinlock_t lock;
-	const struct byt_pinctrl_soc_data *soc_data;
-	struct byt_community *communities_copy;
+	const struct intel_pinctrl_soc_data *soc_data;
+	struct intel_community *communities_copy;
 	struct byt_gpio_pin_context *saved_context;
 };
 
@@ -383,11 +364,11 @@ static const struct intel_function byt_score_functions[] = {
 	FUNCTION("gpio", byt_score_gpio_groups),
 };
 
-static const struct byt_community byt_score_communities[] = {
+static const struct intel_community byt_score_communities[] = {
 	COMMUNITY(0, BYT_NGPIO_SCORE, byt_score_pins_map),
 };
 
-static const struct byt_pinctrl_soc_data byt_score_soc_data = {
+static const struct intel_pinctrl_soc_data byt_score_soc_data = {
 	.uid		= BYT_SCORE_ACPI_UID,
 	.pins		= byt_score_pins,
 	.npins		= ARRAY_SIZE(byt_score_pins),
@@ -496,11 +477,11 @@ static const struct intel_function byt_sus_functions[] = {
 	FUNCTION("gpio", byt_sus_gpio_groups),
 };
 
-static const struct byt_community byt_sus_communities[] = {
+static const struct intel_community byt_sus_communities[] = {
 	COMMUNITY(0, BYT_NGPIO_SUS, byt_sus_pins_map),
 };
 
-static const struct byt_pinctrl_soc_data byt_sus_soc_data = {
+static const struct intel_pinctrl_soc_data byt_sus_soc_data = {
 	.uid		= BYT_SUS_ACPI_UID,
 	.pins		= byt_sus_pins,
 	.npins		= ARRAY_SIZE(byt_sus_pins),
@@ -549,11 +530,11 @@ static const unsigned int byt_ncore_pins_map[BYT_NGPIO_NCORE] = {
 	3, 6, 10, 13, 2, 5, 9, 7,
 };
 
-static const struct byt_community byt_ncore_communities[] = {
+static const struct intel_community byt_ncore_communities[] = {
 	COMMUNITY(0, BYT_NGPIO_NCORE, byt_ncore_pins_map),
 };
 
-static const struct byt_pinctrl_soc_data byt_ncore_soc_data = {
+static const struct intel_pinctrl_soc_data byt_ncore_soc_data = {
 	.uid		= BYT_NCORE_ACPI_UID,
 	.pins		= byt_ncore_pins,
 	.npins		= ARRAY_SIZE(byt_ncore_pins),
@@ -561,17 +542,17 @@ static const struct byt_pinctrl_soc_data byt_ncore_soc_data = {
 	.ncommunities	= ARRAY_SIZE(byt_ncore_communities),
 };
 
-static const struct byt_pinctrl_soc_data *byt_soc_data[] = {
+static const struct intel_pinctrl_soc_data *byt_soc_data[] = {
 	&byt_score_soc_data,
 	&byt_sus_soc_data,
 	&byt_ncore_soc_data,
 	NULL
 };
 
-static struct byt_community *byt_get_community(struct byt_gpio *vg,
-					       unsigned int pin)
+static struct intel_community *byt_get_community(struct byt_gpio *vg,
+						 unsigned int pin)
 {
-	struct byt_community *comm;
+	struct intel_community *comm;
 	int i;
 
 	for (i = 0; i < vg->soc_data->ncommunities; i++) {
@@ -586,7 +567,7 @@ static struct byt_community *byt_get_community(struct byt_gpio *vg,
 static void __iomem *byt_gpio_reg(struct byt_gpio *vg, unsigned int offset,
 				  int reg)
 {
-	struct byt_community *comm = byt_get_community(vg, offset);
+	struct intel_community *comm = byt_get_community(vg, offset);
 	u32 reg_offset;
 
 	if (!comm)
@@ -605,7 +586,7 @@ static void __iomem *byt_gpio_reg(struct byt_gpio *vg, unsigned int offset,
 		break;
 	}
 
-	return comm->reg_base + reg_offset + reg;
+	return comm->pad_regs + reg_offset + reg;
 }
 
 static int byt_get_groups_count(struct pinctrl_dev *pctldev)
@@ -1211,7 +1192,7 @@ static void byt_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	u32 conf0, val;
 
 	for (i = 0; i < vg->soc_data->npins; i++) {
-		const struct byt_community *comm;
+		const struct intel_community *comm;
 		const char *pull_str = NULL;
 		const char *pull = NULL;
 		void __iomem *reg;
@@ -1566,7 +1547,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 }
 
 static int byt_set_soc_data(struct byt_gpio *vg,
-			    const struct byt_pinctrl_soc_data *soc_data)
+			    const struct intel_pinctrl_soc_data *soc_data)
 {
 	int i;
 
@@ -1579,13 +1560,13 @@ static int byt_set_soc_data(struct byt_gpio *vg,
 		return -ENOMEM;
 
 	for (i = 0; i < soc_data->ncommunities; i++) {
-		struct byt_community *comm = vg->communities_copy + i;
+		struct intel_community *comm = vg->communities_copy + i;
 
 		*comm = vg->soc_data->communities[i];
 
-		comm->reg_base = devm_platform_ioremap_resource(vg->pdev, 0);
-		if (IS_ERR(comm->reg_base))
-			return PTR_ERR(comm->reg_base);
+		comm->pad_regs = devm_platform_ioremap_resource(vg->pdev, 0);
+		if (IS_ERR(comm->pad_regs))
+			return PTR_ERR(comm->pad_regs);
 	}
 
 	return 0;
@@ -1599,8 +1580,8 @@ static const struct acpi_device_id byt_gpio_acpi_match[] = {
 
 static int byt_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct byt_pinctrl_soc_data *soc_data = NULL;
-	const struct byt_pinctrl_soc_data **soc_table;
+	const struct intel_pinctrl_soc_data *soc_data = NULL;
+	const struct intel_pinctrl_soc_data **soc_table;
 	struct acpi_device *acpi_dev;
 	struct byt_gpio *vg;
 	int i, ret;
@@ -1609,7 +1590,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	if (!acpi_dev)
 		return -ENODEV;
 
-	soc_table = (const struct byt_pinctrl_soc_data **)device_get_match_data(&pdev->dev);
+	soc_table = (const struct intel_pinctrl_soc_data **)device_get_match_data(&pdev->dev);
 
 	for (i = 0; soc_table[i]; i++) {
 		if (!strcmp(acpi_dev->pnp.unique_id, soc_table[i]->uid)) {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index a8e958f1dcf5..50a290093ea8 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -78,6 +78,7 @@ struct intel_padgroup {
  * @is_offset: Register offset of GPI_IS from @regs. If %0 then uses the
  *             default (%0x100).
  * @ie_offset: Register offset of GPI_IE from @regs.
+ * @features: Additional features supported by the hardware
  * @pin_base: Starting pin of pins in this community
  * @gpp_size: Maximum number of pads in each group, such as PADCFGLOCK,
  *            HOSTSW_OWN,  GPI_IS, GPI_IE, etc. Used when @gpps is %NULL.
@@ -85,9 +86,9 @@ struct intel_padgroup {
  *			 minimum. Use %0 if the number of registers can be
  *			 determined by the size of the group.
  * @npins: Number of pins in this community
- * @features: Additional features supported by the hardware
  * @gpps: Pad groups if the controller has variable size pad groups
  * @ngpps: Number of pad groups in this community
+ * @pad_map: Optional non-linear mapping of the pads
  * @regs: Community specific common registers (reserved for core driver)
  * @pad_regs: Community specific pad registers (reserved for core driver)
  *
@@ -104,13 +105,14 @@ struct intel_community {
 	unsigned int hostown_offset;
 	unsigned int is_offset;
 	unsigned int ie_offset;
+	unsigned int features;
 	unsigned int pin_base;
 	unsigned int gpp_size;
 	unsigned int gpp_num_padown_regs;
 	size_t npins;
-	unsigned int features;
 	const struct intel_padgroup *gpps;
 	size_t ngpps;
+	const unsigned int *pad_map;
 	/* Reserved for the core driver */
 	void __iomem *regs;
 	void __iomem *pad_regs;
-- 
2.20.1

