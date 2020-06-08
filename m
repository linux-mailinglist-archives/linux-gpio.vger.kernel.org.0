Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42571F1A45
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgFHNnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:2281 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729737AbgFHNnG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:06 -0400
IronPort-SDR: GdvxRa0FANwHikpLVVpc0DgQcxjPORATnlrtSH/I0rap9OR5zqc2o1iaqSsLNvn5dZgDgsQ2gx
 PwjUwQkJsaNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:05 -0700
IronPort-SDR: h/PFo407aJk9EmuzuzJ6NoYruAzwMV2F6U/qEK6AomvC3IvWFbwJDLCTkwWryOuqkQaEBBWGuN
 jm6RXcguRyJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="288473531"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 06:43:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C9DE925A; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/6] mfd: core: Propagate software node group to the sub devices
Date:   Mon,  8 Jun 2020 16:42:57 +0300
Message-Id: <20200608134300.76091-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

When ever device properties are supplied for a sub device, a software node
(fwnode) is actually created and then associated with that device. By allowing
the drivers to supply the complete software node group instead of just the
properties in it, the drivers can take advantage of the other features the
software nodes have on top of supplying the device properties.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/mfd-core.c   | 31 +++++++++++++++++++++++++++----
 include/linux/mfd/core.h |  3 +++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index f5a73af60dd4..1a256f64dc9d 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -173,7 +173,24 @@ static int mfd_add_device(struct device *parent, int id,
 			goto fail_alias;
 	}
 
-	if (cell->properties) {
+	/* If software node group exists, use it, otherwise try properties */
+	if (cell->node_group) {
+		struct fwnode_handle *fwnode;
+
+		ret = software_node_register_node_group(cell->node_group);
+		if (ret)
+			goto fail_alias;
+
+		/*
+		 * The very first software node in the group is related to
+		 * the device itself. The rest can be device-less children to
+		 * fulfill the case of sub nodes (LEDs, GPIO keys, etc).
+		 */
+		fwnode = software_node_fwnode(cell->node_group[0]);
+
+		/* Assign this firmware node as a secondary one of the device */
+		set_secondary_fwnode(&pdev->dev, fwnode);
+	} else if (cell->properties) {
 		ret = platform_device_add_properties(pdev, cell->properties);
 		if (ret)
 			goto fail_alias;
@@ -213,18 +230,18 @@ static int mfd_add_device(struct device *parent, int id,
 			if (has_acpi_companion(&pdev->dev)) {
 				ret = acpi_check_resource_conflict(&res[r]);
 				if (ret)
-					goto fail_alias;
+					goto fail_resources;
 			}
 		}
 	}
 
 	ret = platform_device_add_resources(pdev, res, cell->num_resources);
 	if (ret)
-		goto fail_alias;
+		goto fail_resources;
 
 	ret = platform_device_add(pdev);
 	if (ret)
-		goto fail_alias;
+		goto fail_resources;
 
 	if (cell->pm_runtime_no_callbacks)
 		pm_runtime_no_callbacks(&pdev->dev);
@@ -233,6 +250,9 @@ static int mfd_add_device(struct device *parent, int id,
 
 	return 0;
 
+fail_resources:
+	set_secondary_fwnode(&pdev->dev, NULL);
+	software_node_unregister_node_group(cell->node_group);
 fail_alias:
 	regulator_bulk_unregister_supply_alias(&pdev->dev,
 					       cell->parent_supplies,
@@ -294,6 +314,9 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	pdev = to_platform_device(dev);
 	cell = mfd_get_cell(pdev);
 
+	set_secondary_fwnode(&pdev->dev, NULL);
+	software_node_unregister_node_group(cell->node_group);
+
 	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
 					       cell->num_parent_supplies);
 
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index d01d1299e49d..9a998568759f 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -72,6 +72,9 @@ struct mfd_cell {
 	/* device properties passed to the sub devices drivers */
 	struct property_entry *properties;
 
+	/* Software node group for the sub device */
+	const struct software_node **node_group;
+
 	/*
 	 * Device Tree compatible string
 	 * See: Documentation/devicetree/usage-model.txt Chapter 2.2 for details
-- 
2.27.0.rc2

