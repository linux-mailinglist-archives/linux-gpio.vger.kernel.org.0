Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDAD33AE48
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhCOJOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCOJOK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:14:10 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC17BC06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:09 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a18so8237497wrc.13
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4SxFZ2/z04LDFxgHqyBoGQvdfw+6RqGbZM8dagLyJw=;
        b=MMCOFZNijZ6BqZJip7OELTgyUa/YPCPJPKzz7iWl/F27ZDpuX1elMirYsMb6RL0QIi
         ysUpX8LVdt0a+8zRmxdvwIlcUE5zlbyRFM10kavUmYZ9JxnshhSzUWgnRuYrGZX0JIQx
         AnWdSvQqSm+cody+GG/FVnJ7DbW55owvtwbGFQqt0QRBoRu4b+xMDwoZWUm91LI8hUrb
         nw54SmHtxWHERf6/BCCQwMcYjFdoIHTZKsFsoh3HL/hRIKuiBhuh7ZVKwp10+ZZRWGo9
         FtMEpxZbCRS36HKv5Rm0K9kQ11/Q2xanNy752T+O+ESOusPjMnCZeGwpSZQenzqtQAWA
         2M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4SxFZ2/z04LDFxgHqyBoGQvdfw+6RqGbZM8dagLyJw=;
        b=FfdtfeU75UHimY+RCSJCEIjeKdswLVdU5LxkAFUM+wh4diO+GU3xwCn+GutbBfDJKC
         bL7k8rAYjApjrl8FntS41G9vF8NC5ctVgG81vobl+zIvur+bh1KS0/FjN0Q2CxqUXj0y
         aqcYEIVkncUThD/foc8ZmSDW60Yl515RYAQaAigNdVns1l99JACxsYKSJfJPy5IFnhN3
         Ir7wgyOE4zoqvvjNrHH99h1GT/NZpei+Lra7kFfXSW/f633ld0n+2Shp3u404wH6I/dI
         iHxQ/NLKeDXZQG/sNEJfEIc4rIVwb+1mHCJk/g+ECF9LPFZXVKG0ZwsP6QkXrqOJEi0b
         +D3w==
X-Gm-Message-State: AOAM532Wvq+xPAXjGZA/YDEyNHl1voCQ4ukcmMQlLBn+p91wUMMUJ104
        LNEY/HttFqBHMdFh9IBBMITo9Q==
X-Google-Smtp-Source: ABdhPJz7fCj+Gb5h4hry9abxN/prOa4QiMz0iK/IRgnzmONU4nw0g4mvWcQhuXZh0j8qQ959yqUJYA==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr26905142wru.218.1615799648564;
        Mon, 15 Mar 2021 02:14:08 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:08 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 02/11] configfs: use (1UL << bit) for internal flags
Date:   Mon, 15 Mar 2021 10:13:51 +0100
Message-Id: <20210315091400.13772-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
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
2.30.1

