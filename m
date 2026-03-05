Return-Path: <linux-gpio+bounces-32546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOfIMeBRqWkj4wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:50:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D620EF26
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E5B9300A315
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018E9375F62;
	Thu,  5 Mar 2026 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca1532pg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A964288D2;
	Thu,  5 Mar 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704219; cv=none; b=CtZta8m+RZHGKJwJ+0vzcfXAxOTFl1ha7Moa13FclMDR7V2CXj6ycl4+vnABi3LfyN0jdheggTg/uXv3aCucwPQGxxGppRBskvGsXz8JUVSeCCvmmeDDghKQwQmfWSAxsW3BOSdWTPogjIkWoluqEpBbMfEs24W3J22x1Gev9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704219; c=relaxed/simple;
	bh=8c2Rl1swbHkgm9Lbj6JbBy0O2oZxZi51yVKmV74Sozo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RAP5dsUUwDkherCfRjialAvkaS8q+1zJ1bwjnzM8Kn+txoE4PnpZDeoiNMHsN5oDKPruL/oW0vP4qguFAYL4ANtWqgWsBYhNEKIbOcjz8+4mSTVmyIwN8eZDcMMYojyal++jD1gcv1woEoObfkABJi4xkmH57oOItNZ5vQkjtcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca1532pg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772704219; x=1804240219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8c2Rl1swbHkgm9Lbj6JbBy0O2oZxZi51yVKmV74Sozo=;
  b=Ca1532pgaWyp7ofg4Ryr4EmRlB+GQXz5GKA6DKf63eF3GS3jyEK6Hsi/
   7yifQPCijRbtzI8vIqm9doB5pkYf12Pa4Au2Q8tfblPVmhvNzmQPPMLvI
   YwsQVEZwNGeOoWfCJzyzHUmuLiNueAbszfSaVNop7mgFbt9N5TYX4jOVR
   mTuRnzHNcHkNNmVe7LweO7EhzTLueJMkgbJ/6CBqV0vKglXOeCjHMFmIt
   IlHte+1aHyR/I5yU8hI309Or1IIzP2sJUqbT1LaCQTBUDmH5vPm/pAm+8
   O5LGKSZ9c6Zk68ng4+6asjoPlbQm6fdhHadPw75OCr2b2osPuiVMa8MsU
   w==;
X-CSE-ConnectionGUID: ALR+QoJvT1K6gsJYjzLpZA==
X-CSE-MsgGUID: O4UU82rPS9eAQdOQWNaajg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77389760"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="77389760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:50:19 -0800
X-CSE-ConnectionGUID: 0DxxQjEdRjmaK8WMLPle7w==
X-CSE-MsgGUID: 49ipdGsCSmCU2v22ETmDrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="218591268"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 01:50:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B62C295; Thu, 05 Mar 2026 10:50:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: pinconf-generic: Use only fwnode API in parse_dt_cfg()
Date: Thu,  5 Mar 2026 10:50:14 +0100
Message-ID: <20260305095014.3221492-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 706D620EF26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32546-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

The parse_dt_cfg() uses OF and fwnode APIs. Fix this inconsistency by
fully switching it to use fwnode API and rename the function accordingly.

While at it, add missing linux/property.h inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinconf-generic.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 7929127c8839..61b5b3fb94ce 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/seq_file.h>
 
@@ -205,19 +206,19 @@ static const struct pinconf_generic_params dt_params[] = {
 };
 
 /**
- * parse_dt_cfg() - Parse DT pinconf parameters
- * @np:	DT node
+ * parse_fw_cfg() - Parse firmware pinconf parameters
+ * @fwnode:	firmware node
  * @params:	Array of describing generic parameters
  * @count:	Number of entries in @params
  * @cfg:	Array of parsed config options
  * @ncfg:	Number of entries in @cfg
  *
- * Parse the config options described in @params from @np and puts the result
+ * Parse the config options described in @params from @fwnode and puts the result
  * in @cfg. @cfg does not need to be empty, entries are added beginning at
  * @ncfg. @ncfg is updated to reflect the number of entries after parsing. @cfg
  * needs to have enough memory allocated to hold all possible entries.
  */
-static int parse_dt_cfg(struct device_node *np,
+static int parse_fw_cfg(struct fwnode_handle *fwnode,
 			const struct pinconf_generic_params *params,
 			unsigned int count, unsigned long *cfg,
 			unsigned int *ncfg)
@@ -233,7 +234,7 @@ static int parse_dt_cfg(struct device_node *np,
 		const struct pinconf_generic_params *par = &params[i];
 
 		if (par->values && par->num_values) {
-			ret = fwnode_property_match_property_string(of_fwnode_handle(np),
+			ret = fwnode_property_match_property_string(fwnode,
 								    par->property,
 								    par->values, par->num_values);
 			if (ret == -ENOENT)
@@ -243,7 +244,7 @@ static int parse_dt_cfg(struct device_node *np,
 				ret = 0;
 			}
 		} else {
-			ret = of_property_read_u32(np, par->property, &val);
+			ret = fwnode_property_read_u32(fwnode, par->property, &val);
 		}
 
 		/* property not found */
@@ -258,8 +259,8 @@ static int parse_dt_cfg(struct device_node *np,
 		if (par->param <= count) {
 			ret = test_and_set_bit(par->param, properties);
 			if (ret) {
-				pr_err("%s: conflicting setting detected for %s\n",
-				       np->name, par->property);
+				pr_err("%pfw: conflicting setting detected for %s\n",
+				       fwnode, par->property);
 				bitmap_free(properties);
 				return -EINVAL;
 			}
@@ -272,8 +273,8 @@ static int parse_dt_cfg(struct device_node *np,
 
 	if (test_bit(PIN_CONFIG_DRIVE_STRENGTH, properties) &&
 			test_bit(PIN_CONFIG_DRIVE_STRENGTH_UA, properties))
-		pr_err("%s: cannot have multiple drive strength properties\n",
-		       np->name);
+		pr_err("%pfw: cannot have multiple drive strength properties\n",
+		       fwnode);
 
 	test = test_bit(PIN_CONFIG_BIAS_BUS_HOLD, properties) +
 		test_bit(PIN_CONFIG_BIAS_DISABLE, properties) +
@@ -282,15 +283,15 @@ static int parse_dt_cfg(struct device_node *np,
 		test_bit(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, properties) +
 		test_bit(PIN_CONFIG_BIAS_PULL_DOWN, properties);
 	if (test > 1)
-		pr_err("%s: cannot have multiple bias configurations\n",
-		       np->name);
+		pr_err("%pfw: cannot have multiple bias configurations\n",
+		       fwnode);
 
 	test = test_bit(PIN_CONFIG_DRIVE_OPEN_DRAIN, properties) +
 		test_bit(PIN_CONFIG_DRIVE_OPEN_SOURCE, properties) +
 		test_bit(PIN_CONFIG_DRIVE_PUSH_PULL, properties);
 	if (test > 1)
-		pr_err("%s: cannot have multiple drive configurations\n",
-		       np->name);
+		pr_err("%pfw: cannot have multiple drive configurations\n",
+		       fwnode);
 
 	bitmap_free(properties);
 	return 0;
@@ -371,6 +372,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 				    unsigned long **configs,
 				    unsigned int *nconfigs)
 {
+	struct fwnode_handle *fwnode = of_fwnode_handle(np);
 	unsigned long *cfg;
 	unsigned int max_cfg, ncfg = 0;
 	int ret;
@@ -386,12 +388,12 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	if (!cfg)
 		return -ENOMEM;
 
-	ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
+	ret = parse_fw_cfg(fwnode, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
 	if (ret)
 		goto out;
 	if (pctldev && pctldev->desc->num_custom_params &&
 		pctldev->desc->custom_params) {
-		ret = parse_dt_cfg(np, pctldev->desc->custom_params,
+		ret = parse_fw_cfg(fwnode, pctldev->desc->custom_params,
 				   pctldev->desc->num_custom_params, cfg, &ncfg);
 		if (ret)
 			goto out;
-- 
2.50.1


