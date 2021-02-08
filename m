Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDD53142D1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhBHWYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:53 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:53483 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhBHWYt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:49 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MmD2M-1lZSw122Zk-00iCcL; Mon, 08 Feb 2021 23:22:13 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 03/12] of: base: record root node in interator and use it for phandle lookup
Date:   Mon,  8 Feb 2021 23:21:54 +0100
Message-Id: <20210208222203.22335-4-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:L07WfYEKaUHFQXWge6SNQV7uWaSzApb9DBlUnN7eDKenKnVc9cR
 wReeAdO0XeeuDjURl89qC/QDWRLaPENdF+n1sDQVpo59lDEM1dNCE5i9CVo/W9irbkivn3M
 U9JZI099qVXl3Nji6F8vE0xyLS9fRj77i6N+b5JmiLhvG2PReQUZYeF6B2j8IxDWHe0+SeW
 EVCW878DP7MXUa/3HgaSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3sXEFVMRuSo=:oizTkM24xt/Gez0Dn9xwqo
 7zUxaRlqh3OeBp8Jjdj06fXRypKJp9Z2gz3RDogbgfNUe6A66ucDw5DD458kDsbKX3eEiZrnf
 MgAPqiDuLpgytc9GXNdlf1QMaVGRJ+FqSf1ev+EBU9/W3VYqdgkdC28D7FHt7dKrvmJKS0Qgm
 T256AyPwTPxAGRk3yhsglxBZ6Po/XBpMvC3gEPcqmH0k8trAHOOkCXzeXTuxx5shLtdd2VvA1
 v29px/uzWeqPZkKqS/id45qb0JzSWHekMjNBPSHYOTolmwCmzPO/hs6S7dnur5leVDB3ESNDY
 5eZT47aNvvvjTkOLhTwXkrAT4S/rbWD6zTfr95T1koqx1oQ7sEXWUREX6RgKYC7B3xhcKFvrR
 +C8GmSmufHgHJJXV6pWMSjCPmBj47UZVS2cGTKSDWkf6uvCtu45wDs4aAmbdS
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For detached oftree support, find the root node and record it, on iterator
creation. If we find the root of the global oftree, record NULL, in order to
have a clear distinction between detached and non-detached cases. The recorded
root node is then used for resolving phandles.

Note that in the detached case, phandle cache can't be used, so we have a
little performance penalty on repeated phandle lookups.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/of/base.c  | 13 ++++++++++++-
 include/linux/of.h |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6b3d1e817808..e5ef611ed233 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1249,6 +1249,7 @@ int of_phandle_iterator_init(struct of_phandle_iterator *it,
 {
 	const __be32 *list;
 	int size;
+	struct device_node *walk;
 
 	memset(it, 0, sizeof(*it));
 
@@ -1270,6 +1271,16 @@ int of_phandle_iterator_init(struct of_phandle_iterator *it,
 	it->phandle_end = list;
 	it->cur = list;
 
+	/*
+	 * find the root of our tree and record it, if we're dealing with an
+	 * detached oftree - in non-detached case, we record NULL, for clear
+	 * distinction between these two cases.
+	 */
+	for (walk=(struct device_node*)np;
+	     walk->parent;
+	     walk=(struct device_node*)walk->parent);
+	it->root = ((walk == of_root) ? NULL : walk);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_phandle_iterator_init);
@@ -1297,7 +1308,7 @@ int of_phandle_iterator_next(struct of_phandle_iterator *it)
 		 * Find the provider node and parse the #*-cells property to
 		 * determine the argument length.
 		 */
-		it->node = of_find_node_by_phandle(it->phandle);
+		it->node = of_find_node_by_phandle_from(it->root, it->phandle);
 
 		if (it->cells_name) {
 			if (!it->node) {
diff --git a/include/linux/of.h b/include/linux/of.h
index c285141653e5..dbf2c7442389 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -82,6 +82,7 @@ struct of_phandle_iterator {
 	const char *cells_name;
 	int cell_count;
 	const struct device_node *parent;
+	struct device_node *root;
 
 	/* List size information */
 	const __be32 *list_end;
-- 
2.11.0

