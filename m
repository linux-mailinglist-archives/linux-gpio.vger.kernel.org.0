Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160B53142CC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBHWYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47129 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhBHWYs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:48 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MvrRB-1m1Lbn43eh-00stt0; Mon, 08 Feb 2021 23:22:13 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 02/12] of: base: introduce of_find_node_by_phandle_from()
Date:   Mon,  8 Feb 2021 23:21:53 +0100
Message-Id: <20210208222203.22335-3-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:ry3tr0lI+PQkmkLr//2b6GfCbmACQuG1weOU8C7zi3OIOShrzAX
 KZYIZMNxk3imLFpt9WqyuTLIA4/Ey5/kHs/aTl8qdF3B1o20hMytkQmBXZQOhazzuVlkS1/
 Y/R+KBhHdefL0pWd4ccpIOulWiGptaTq2vQmwAPWqUAQlTat+HghNL0OSEnIoiCCz5xJYYr
 WbPmFyeerXQvua2JyBLxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QSIQk1vZ/A4=:TeQE94IkBOZ6Cy8OV1zn0O
 F4cui0rWYvrwlktcamo9z/hu7liVWTzMVAZGfNTm+4pAs38ftxLvXDtEPSDYPriYD4L+MU6Y6
 Ug5zyUMkY76puEo64wVEL+BvTPG/rv4aN8tL3JT/SBoLsxISNo7wcZ7GEh8o03K2y267eiRsj
 V47jPzxl775feQHYz3QDNUKQYxAPvIZJcjITmTI0ySqslyQLduWH9u82gvTAvkr9Cwk19ly7x
 NS2b5gMzBzs5W6f2LlUJ+LE5jJvPsN9vdFDruS5OMj+0OHK9blm8iS66/hpiTDJQyTNYkmXfC
 BesErPh6htPBtv3JCQCPbyJ7Zl5Yl9N7tV0Vc0G4PcPsOD+CLhw0WV+FT/kCqVrnCp0fEcna3
 EoLE7XnNGvboBMTEzb44WlOox51fDL+jraqK/0ZtKF4W2MW7U+EEQjR79GeRQ
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introducing a variant of of_find_node_by_phandle() that starts off a
different root node. This root can also point to an detached oftree,
which has no relations to primary oftree, even on platforms that natively
don't have oftree at all (eg. ACPI platforms).

Note that this has nothing to do with oftree overlays.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/of/base.c  | 14 +++++++++-----
 include/linux/of.h |  7 ++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8a348f0d3c5e..6b3d1e817808 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1187,13 +1187,15 @@ int of_modalias_node(struct device_node *node, char *modalias, int len)
 EXPORT_SYMBOL_GPL(of_modalias_node);
 
 /**
- * of_find_node_by_phandle - Find a node given a phandle
+ * of_find_node_by_phandle_from - Find a node given a phandle
+ * @root:	root of the tree (on NULL default to of_root)
  * @handle:	phandle of the node to find
  *
  * Returns a node pointer with refcount incremented, use
  * of_node_put() on it when done.
  */
-struct device_node *of_find_node_by_phandle(phandle handle)
+struct device_node *of_find_node_by_phandle_from(struct device_node *root,
+						 phandle handle)
 {
 	struct device_node *np = NULL;
 	unsigned long flags;
@@ -1211,19 +1213,21 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 		np = phandle_cache[handle_hash];
 
 	if (!np) {
-		for_each_of_allnodes(np)
+		for_each_of_allnodes_from(root, np) {
 			if (np->phandle == handle &&
 			    !of_node_check_flag(np, OF_DETACHED)) {
-				phandle_cache[handle_hash] = np;
+				if (!root)
+					phandle_cache[handle_hash] = np;
 				break;
 			}
+		}
 	}
 
 	of_node_get(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
-EXPORT_SYMBOL(of_find_node_by_phandle);
+EXPORT_SYMBOL(of_find_node_by_phandle_from);
 
 void of_print_phandle_args(const char *msg, const struct of_phandle_args *args)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index 4b27c9a27df3..c285141653e5 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -282,7 +282,12 @@ static inline struct device_node *of_find_node_by_path(const char *path)
 	return of_find_node_opts_by_path(path, NULL);
 }
 
-extern struct device_node *of_find_node_by_phandle(phandle handle);
+extern struct device_node *of_find_node_by_phandle_from(
+	struct device_node* root, phandle handle);
+static inline struct device_node *of_find_node_by_phandle(phandle handle)
+{
+	return of_find_node_by_phandle_from(NULL, handle);
+}
 extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
 extern struct device_node *of_get_next_child(const struct device_node *node,
-- 
2.11.0

