Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7713142CE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhBHWYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49989 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhBHWYt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:49 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M734j-1lHC4P0AKV-008f14; Mon, 08 Feb 2021 23:22:14 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 04/12] of: base: introduce of_match_string()
Date:   Mon,  8 Feb 2021 23:21:55 +0100
Message-Id: <20210208222203.22335-5-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:+rmg5D19d+Ip9CTiWXfPmk4J3BzxCGSQxH0xzlf9U9ohHk3kzUE
 AoiRnIHtt9yPEcSBC1+mSLXnuBPsSiFOP1cC1GriljwvSx0uiM+570LyYcQ6gkgJ+ET0xsp
 Z7yMlfIGGkRC9+fHFbGWwBRD6iwxSugsKTEI4rBmvr0s20NN0xgpuz/B/DgtRnsJB6wXQuT
 zkaAyIRcgOL3SsJB9keBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M5TiMKqNSGs=:Axv0bH84KLPJLgXBidEf4l
 ZH5uLsI0oA78oPCP+lXvTqFdU/txTz5lhKzBc5xqSEUoQDqY2I6eIPnVvfcFHw1Kz8FtKSKk8
 8HhutFhiSgR0VEGxbgSrYj9WvuH9mPs5FPOLIVeb5F+b3zcChd9qviZykxhXFnx4I37AkVeg7
 qinqrf5HY0oFlx+g1kaHFqAftyghljP5s/3ewIGjRapC/E4U2VE9LCZYqq3BZszMLcbMVx+9/
 c391TGqmQ2uBg7V5fWagykWoapsSKo+mur0u0U6D2j6b/cv16bm94WrXutqimk4YCG43WS2Qw
 zrx9v7Z+j8e52O65Z2DvqCm8EY1SmGMX1aCpws+TB52emxWLXX5kcHN985m+zb7VUPBWO/7JF
 Ep0vq6rlJVYNY/ckiA3Hxv+LVs+2jiN5SfVDWdo7SHxpg/L1cghuc3MemqLLa
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce a new helper function that looks up a given propery and
matches all string elements against a given string. This is useful
if we want to check wether one string element of some property
matches a given string.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/of/base.c  | 32 ++++++++++++++++++++++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e5ef611ed233..649c2a32bb48 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -287,6 +287,38 @@ const void *of_get_property(const struct device_node *np, const char *name,
 EXPORT_SYMBOL(of_get_property);
 
 /*
+ * of_match_string - match a propery against given string
+ * @node: device_node to look up at
+ * @name: name of the property
+ * @value: value to match against
+ *
+ * Look for property by name and match all string elements against value.
+ * Returns true if the property exists and any one of the string elements
+ * matches the given value.
+ */
+bool of_match_string(const struct device_node *node, const char* name,
+		     const char* value)
+{
+	struct property *prop;
+	const char *walk;
+
+	if (!name || !value)
+		return false;
+
+	prop = of_find_property(node, name, NULL);
+	if (!prop)
+		return false;
+
+	for (walk=of_prop_next_string(prop, NULL); walk;
+	     walk=of_prop_next_string(prop, walk)) {
+		if (strcmp(walk, value)==0)
+			return true;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(of_match_string);
+
+/*
  * arch_match_cpu_phys_id - Match the given logical CPU and physical id
  *
  * @cpu: logical cpu index of a core/thread
diff --git a/include/linux/of.h b/include/linux/of.h
index dbf2c7442389..3612429632f4 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -355,6 +355,8 @@ extern bool of_device_is_big_endian(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,
 				const char *name,
 				int *lenp);
+extern bool of_match_string(const struct device_node *node, const char* name,
+			    const char* value);
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
-- 
2.11.0

