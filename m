Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D411D32D0BB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238589AbhCDKb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238520AbhCDKb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:31:28 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26334C061765
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 02:30:09 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id 7so27042935wrz.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 02:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VTVqUZIbWOBx2vi73M7W0VDXvAw3I3R3JVZHB7Sln/A=;
        b=jqFcOBFmBW6OGc8pMVCLj1b0qqQuqt+YCkzk+Q27uBMQbo1iaTw6oEMoEV0AkHeBzR
         dWlkMEhqAPzVj08vhy2rqL3OqLGUdGOghAKhuAUT6MI+okAPLhtoAOucsEYnH2zbLaT3
         9QMIOIg3wAPG++RHWS8WI+guEtK0StMdFlXIwa4Izj6Mp8z65Bh214qQsC8XcaUfdihR
         qFmhsDb26mfxrcaKHalzQtvIQQaAr8Too5zk0OPZW/tS96T7iFF8XoJdx6gLx55GKPCg
         Txiytv9H5miJ9VWDuZpIXpO/YYqrze0SMaethq2N5T5iiDXao32SdTfEkfL/ZmtLs1cH
         mHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTVqUZIbWOBx2vi73M7W0VDXvAw3I3R3JVZHB7Sln/A=;
        b=Vj++eoZ8WHCm8V2puCXRBcRS0SFXzVrM2a/YE+kg8FmAV0kYKV4wcOuf4RZ0tbGyHB
         fzaJ/S087ALD+AU2ZW6bYLtzmdyvEUpOnSOE+KoGZ0sW7aEoOvd4sFdmVfoHDHD8bqh/
         2fTDremzdFtgyktrBrw2VyWiJev9yX1DETfdpnKrtyssukRZ2FJx6+NAy1s4aqv0K8Xr
         +6ESiGkWTYsQAd8khSTSX/0kDNGJH4Uor86netrWjuDkPSxt3nZMfwtIXqejDOBKRvnH
         iv6iv/PZr+q1v+bbRl+npGipcDQeeEYIPEw13ypXR2iM8TYENJt3wwqZQ4yck/OLi5lE
         wm+Q==
X-Gm-Message-State: AOAM531mlYQsyOtxQP1IgNWG4NVtX5PU+1/ExG2GsFrFK3lXshdyO8Mn
        ZOS5icPSJIazBH/UzitGIlgHCA==
X-Google-Smtp-Source: ABdhPJwtsEIc4u6ANMWw8IOZ9a7RTFR2HMfg/vg90IRd5QlPPB3mPTtotQP5MkKc3Mdjx0AIJURabw==
X-Received: by 2002:a05:6000:1803:: with SMTP id m3mr2828509wrh.50.1614853807980;
        Thu, 04 Mar 2021 02:30:07 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:07 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 02/12] configfs: use (1UL << bit) for internal flags
Date:   Thu,  4 Mar 2021 11:24:42 +0100
Message-Id: <20210304102452.21726-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For better readability and maintenance: use the (1UL << bit) for flag
definitions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/configfs/configfs_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index 9a3aed249692..b495c9f043d4 100644
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

