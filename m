Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C7D3142E4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhBHWZU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:25:20 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:45149 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbhBHWZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:25:03 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYe6H-1lMjTA0aKB-00VdwQ; Mon, 08 Feb 2021 23:22:15 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 06/12] of: kobj: introduce of_attach_tree_sysfs()
Date:   Mon,  8 Feb 2021 23:21:57 +0100
Message-Id: <20210208222203.22335-7-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:ZtGzokklzdJEAZwPGATmrH1/M0zLFv6KzHuwBPz7+oXxl4Nxg1b
 T2WWlO6QkPZXpRM1Fek92mrgiTDDi1HM4UyPU3mKz4QBO9Pec9Z03+jXoat9A4OWPnc+qTZ
 GQpY0FB294LDM9mM68UB1WcUCHpIcSU5rAjnAwx6EpgOFzSD7ZA882En9rcIIDkIyV1dY9P
 ZiFJ84GVJGUmb+x3Lzg9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nx2Q60Qwd9I=:b8Ucwi6B5pI52GcH8caQh8
 L+DLzZZ6WY7Cu3cRAtHCxlhyENquB3BP1CIlxK9wyXd9Nf4VDBAPh4PwWKGzi+f3sZETCWcCZ
 LqjFZbz4XF2mUhd08TojxNMy2qS2pjezRtcn4hTEz6uAlKATI1c5/4K+bD3qZ8MclX+2EnQSG
 ki69/8FFFb/IZnyYP+2Ke1opL6gBtGV9wXHifv+eob+31L/66TAVVl1ORHtQFFArNoToPfFV4
 DuB1bSWhI/keD7yDi/wv6SYWhNjWYzU+uQPehAnq86ALhihBIs0Nmu738nu2KXpjVGF5PczLf
 kHq75BLEfUNsZ2iPTHrItQBAqh8flYDq6bRX/NgYtQbGdlCK0LCQw9HBHkVyfnCr30w4A3Sjv
 vWY6d0iwGvCr0kXEuSxvN0sEAOVRco5IpDWW4YN3wmKz37QevT9uy/rP3r5To
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce helper for attaching an (separate) oftree into sysfs.
This is useful, when drivers use their own internal device trees,
separate from the platform's global one, and wanna make it visible
to userspace via sysfs.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/of/kobj.c  | 17 +++++++++++++++++
 include/linux/of.h |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 511d7e8b9068..96dc5a2753f4 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -166,3 +166,20 @@ void __of_detach_node_sysfs(struct device_node *np)
 
 	of_node_put(np);
 }
+
+void of_attach_tree_sysfs(struct device_node *root, const char* base)
+{
+	struct device_node *np;
+
+	if (!root)
+		return;
+
+	/* need to from our parent, so we don't traverse above our root,
+	 * if it's actually a subtree */
+	root->parent = NULL;
+
+	__of_attach_node_sysfs(root, base);
+	for_each_of_allnodes_from(root, np)
+		__of_attach_node_sysfs(np, base);
+}
+EXPORT_SYMBOL_GPL(of_attach_tree_sysfs);
diff --git a/include/linux/of.h b/include/linux/of.h
index 3612429632f4..c2fb12ce07f9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -421,6 +421,8 @@ extern int of_update_property(struct device_node *np, struct property *newprop);
 extern int of_attach_node(struct device_node *);
 extern int of_detach_node(struct device_node *);
 
+extern void of_attach_tree_sysfs(struct device_node *root, const char* base);
+
 #define of_match_ptr(_ptr)	(_ptr)
 
 /**
@@ -1010,6 +1012,11 @@ static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
 	return PHYS_ADDR_MAX;
 }
 
+static inline void of_attach_tree_sysfs(struct device_node *root,
+					const char* base)
+{
+}
+
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
-- 
2.11.0

