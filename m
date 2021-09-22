Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF148414419
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 10:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbhIVIt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 04:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234044AbhIVIt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 04:49:27 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98256C061757
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:47:57 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t7so4363248wrw.13
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N6iEJB4pcSblX4SdZfQ+pj8u1PpQ7EP4J6z216v/Emw=;
        b=tJKMqR5mV6wQkO1Lza9pUv78xCcjFGuTCtRfzTema92Ynf7feAO24op8X3hH6poRpE
         DakjujpKp+jInIV5/J9lcGXeOgXQde8+B3dn+vCdCdxKqeeVCS1hNFS3mY5Zhb7raXSj
         yObtyTKy/YvDwryomYl8MBIiXtGyZD+PzGDDyUYG1xSzWC8KACYr00TqywLpUDqHCqpM
         YSqiu5Bls0Xf4S/To4g8CoHk9pK/3OkcXrsJE6J9yZMNwyYlIEMBgUfiukUxno619duo
         hCcSpS8MmJSE8Vjnuv/B4yNlSfSr93lQLH7Rm6JdKCyyLynYLRopHWn9pImMzzH5yK+W
         dyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N6iEJB4pcSblX4SdZfQ+pj8u1PpQ7EP4J6z216v/Emw=;
        b=6qvzzU+XRfvCjubJ5GdWK9beB4KYadoPuK5KJSiwESS5MuBC0+0K2Yh/PAZIrT3Gjp
         jUxNbCzcuKSY1J8tbM+nIK/Q6xWBUs4HmoDYEiuSeEs0sSbW69DbKS/6Oe40MmtgShU2
         JnrDLJjDetS3e6OIA/CW1hD+cObVivP3wBETfSRiAaQwH+pj/8ALi4WPAMW7G3bL8PUP
         NttAUPNvCGnTWwxOS74OVt/Ybpmna0uyUXBtqPcIBVI5Gnjf4GzQ6xj3GIKkmxpoaxOi
         f/1jk+Z8EpkH/jvSgYEqb1cP/h0ri7cpVvg5BQdtIOyTUjiQfVwoircvk/POgrLFp9V+
         0zuw==
X-Gm-Message-State: AOAM531aHtVGwdeO8oIGTQi6JIJbZWnBN1apW1Xj4RTYoxDSE7yN8CyZ
        WlHg052rYByaCW8n86Krm4y4kw==
X-Google-Smtp-Source: ABdhPJzIjFIrWLY62HZf8v0OwqqfJZJHyXwQZUI280qylKxTHsPq6XHv+8UmsKmrzvEac/gDv2fJUw==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr40511080wru.245.1632300476151;
        Wed, 22 Sep 2021 01:47:56 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v10sm1591048wri.29.2021.09.22.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:47:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 2/8] configfs: use (1UL << bit) for internal flags
Date:   Wed, 22 Sep 2021 10:47:27 +0200
Message-Id: <20210922084733.5547-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
References: <20210922084733.5547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For better readability and maintenance: use the (1UL << bit) for flag
definitions.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/configfs/configfs_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index c0395363eab9..0c7a3d857fde 100644
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@ -44,16 +44,16 @@ struct configfs_dirent {
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
2.30.1

