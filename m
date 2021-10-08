Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3E54265B2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 10:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhJHITn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 04:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbhJHITm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 04:19:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D144BC061760
        for <linux-gpio@vger.kernel.org>; Fri,  8 Oct 2021 01:17:46 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t2so27119123wrb.8
        for <linux-gpio@vger.kernel.org>; Fri, 08 Oct 2021 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N6iEJB4pcSblX4SdZfQ+pj8u1PpQ7EP4J6z216v/Emw=;
        b=vGw3X8yO89TItyj+jMgmELxwnXdGLcyFfexOwH/fc6JFQPHL/+8pAOe7Pl8wV2ZJzG
         RbH3vOUv4O9mCg6OlDscJwtdd97Lun/ak0v/RzFscaNocOU3nioAbzSkFMyz5PW9a7x1
         c+/YqujqZHKvl1rKE562fwHUrzEgLv/EKkZuXDhfFFTr9lN2bBBe6O4WnzhTSeqolpCD
         Y7raqkZtQppZk7UJgZsfKZxD3zDrOSp5tvG+SOlxxJlANsQk+oZ4frMQInpmNJkxHo1N
         WMAntgt3zHGEHxVw+9L5OTvTMwQ2Mc6fSpkEj1R4q2Adkpv1cCedkT+DVVBGQyGCLs6L
         BNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N6iEJB4pcSblX4SdZfQ+pj8u1PpQ7EP4J6z216v/Emw=;
        b=55e+yLkDI84taMWWRBjGPOAA0yESGaN1hJwcF1diK/po66auk6yfCKVhpqvlfEhNeO
         t+PdtFavhA2Qgsg/HhtoUQDbrMlLBBl4jGGyCm3JjmFDQpqHv9qNevpQ14KJjjxnzijV
         LSq0mHNF9T5KluiovMLWjCMC6BX74+eLk6E5N/eUfGcBaxqrBjfq9Ego3GGTCHiTgvB3
         F6akY/DdiKTd/ydXSe3jq6S6THDEyex17T4U+ump+nM3Z0QoHBgcIhAeodQ0JlNQnzcD
         j2K5QFXn2Ml8GYLMhpdOF9IUT1o2XyT7STHPXYRcJKt9S4Hl2JiGfoKp+Hj5iH6vkPJt
         nE7g==
X-Gm-Message-State: AOAM533UrkPF08MDbOIzi4FI2UauMpcy48ZXxEUH85KrIbChFgZk2RZj
        dgVyO1pyJwIL1Mn4G7HGfXeQNg==
X-Google-Smtp-Source: ABdhPJxo1cevac5/0rSCw2w5/xBAnVBjveraUMEl/Ke4EJgcGSnm5lbaUbum9WqkZEt7vylTFBZz9A==
X-Received: by 2002:a05:600c:1d1f:: with SMTP id l31mr1971391wms.44.1633681065285;
        Fri, 08 Oct 2021 01:17:45 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm1759530wrn.34.2021.10.08.01.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 01:17:45 -0700 (PDT)
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
Subject: [PATCH v7 2/8] configfs: use (1UL << bit) for internal flags
Date:   Fri,  8 Oct 2021 10:17:33 +0200
Message-Id: <20211008081739.26807-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211008081739.26807-1-brgl@bgdev.pl>
References: <20211008081739.26807-1-brgl@bgdev.pl>
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

