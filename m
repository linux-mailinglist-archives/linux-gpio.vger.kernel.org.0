Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DE92F7752
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 12:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbhAOLOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 06:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbhAOLOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 06:14:07 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1512C061799
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:13:25 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d26so8846778wrb.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dzBIBC0fhIl1XSSH6o1Y94mhuL4g5zkjFrYGUjls+eg=;
        b=XmuU+H9N42TMrH0RYk4v1pPOa1GXDIBaC9TW9oIfte3ZWUA0fKvDGDvzVZkKcmC7B2
         16BEHyCM0urQBL2EoVI+8/X4cxqunmI5xoeu5FIDW8+E5VPaYpk5McxG/3WXl70CTtjT
         lsjiNon8zP1kD+DQ0zH97oW/Pb0iDjOufeapp1qQe5/aPmGxe/4qj3y5jPITZMsnhh6t
         wyW6icK8qozixmxs7ENmv9vtW1gf4Ff9uzdAJWyfrVmRBeBcssydx5I3zFO0WgA0IACH
         Ndri40eE4rIwV05OIXd8ybZbE0wZM6Lhq3p6mQ+xllSJ7UHfE+ckUjQS3zwt6Xtc4CxY
         ZAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzBIBC0fhIl1XSSH6o1Y94mhuL4g5zkjFrYGUjls+eg=;
        b=kTa7q6IZ72kWVNoor+P9nEoCcrLTVzGDbd4aRstVVmjvuSyMiKeRPhz1aKwct9OqcA
         I68OGVGK8EgqkIQh4ux13VOxdqkFiokHgUsLdLzMgr5eh5gaROWHl69DRyAmU61FHQgT
         xBkk2xtQF5IU/cZX/qbger41C06i5bakqE1wgheZlBJuvzNPK31B26Z5gCbzj8FedcDJ
         eAsiDzjOHfInyWl7/+UAJiA1SmRcFo1GkyA4oNZbo7IgJD6wGeKvfJan8MM83CwgGWdy
         m+J5YnSiWImR16JoeYSqKrhylD6uEcUuIbWc7mSkm5m4eUHdKg7AFcfu6I3lAPHSh12w
         EmqA==
X-Gm-Message-State: AOAM533YHIziOflxM6fzPxq3r/ih3ZQZe2OQ/aXdt/dMdwWEp1Dqznoq
        8kY34JEGUuVarC04E5BeY8TIkQ==
X-Google-Smtp-Source: ABdhPJxfNle5rxjzF83VOUfwUYgoBHOo8P9VI3PSN+mzfrFHdqImR/HGffbJltytsytmJrJcGr+fqw==
X-Received: by 2002:adf:eac1:: with SMTP id o1mr12469664wrn.256.1610709204819;
        Fri, 15 Jan 2021 03:13:24 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l1sm15048822wrq.64.2021.01.15.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:13:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 2/4] configfs: use (1UL << bit) for internal flags
Date:   Fri, 15 Jan 2021 12:13:09 +0100
Message-Id: <20210115111311.31601-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115111311.31601-1-brgl@bgdev.pl>
References: <20210115111311.31601-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For better readability and maintenance: use the (1UL << bit) for flag
definitions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 fs/configfs/configfs_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index 22dce2d35a4b..2d21bba92acf 100644
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@ -46,16 +46,16 @@ struct configfs_dirent {
 	struct configfs_fragment *s_frag;
 };
 
-#define CONFIGFS_ROOT		0x0001
-#define CONFIGFS_DIR		0x0002
-#define CONFIGFS_ITEM_ATTR	0x0004
-#define CONFIGFS_ITEM_BIN_ATTR	0x0008
-#define CONFIGFS_ITEM_LINK	0x0020
-#define CONFIGFS_USET_DIR	0x0040
-#define CONFIGFS_USET_DEFAULT	0x0080
-#define CONFIGFS_USET_DROPPING	0x0100
-#define CONFIGFS_USET_IN_MKDIR	0x0200
-#define CONFIGFS_USET_CREATING	0x0400
+#define CONFIGFS_ROOT			(1UL << 0)
+#define CONFIGFS_DIR			(1UL << 1)
+#define CONFIGFS_ITEM_ATTR		(1UL << 2)
+#define CONFIGFS_ITEM_BIN_ATTR		(1UL << 3)
+#define CONFIGFS_ITEM_LINK		(1UL << 5)
+#define CONFIGFS_USET_DIR		(1UL << 6)
+#define CONFIGFS_USET_DEFAULT		(1UL << 7)
+#define CONFIGFS_USET_DROPPING		(1UL << 8)
+#define CONFIGFS_USET_IN_MKDIR		(1UL << 9)
+#define CONFIGFS_USET_CREATING		(1UL << 10)
 #define CONFIGFS_NOT_PINNED	(CONFIGFS_ITEM_ATTR | CONFIGFS_ITEM_BIN_ATTR)
 
 extern struct mutex configfs_symlink_mutex;
-- 
2.29.1

