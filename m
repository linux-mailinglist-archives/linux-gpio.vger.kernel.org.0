Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717F911B3B7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 16:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387925AbfLKPoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 10:44:06 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38851 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387474AbfLKPoG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 10:44:06 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so24563267wrh.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vCDnxqsCcrgs8Skrb9redSb5XLToMsKqT71mzybQwBw=;
        b=v2f6LNEB8qn+AtPYCBQdFpxVospZ/0dOVznS9pjtc5M1tryCIQv5oK8jlMUbv3SDJz
         a+/EmfXJYtw+hZ+JHlKEsnbQMFG93vsuPCRRhB5dmu/zbRKo1VIz09RbUUdRtivPcAUs
         RCOeKFpsdcpcr0fPgtNN6ekjbH2atimAYBKdjQlxCIIUn3isFdUyXC9IF1/VE1jHfpU6
         lY0Q6d9DLmhKiK0XpOkNCNpLxXm/61y6E7ko0NqrVfUS9Vc+Gk0iQlMNJVE4phrh2Sjn
         Yzmx6sGj3SrNWLIXzJ6XMUtEJ2VflFJyGc/G5nDaTPlQiBUb/Q81A/XOMg0ho6xXrCb2
         zAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vCDnxqsCcrgs8Skrb9redSb5XLToMsKqT71mzybQwBw=;
        b=OkzYPnHJk6JbY5b9EqJkOTlYYJkjNReaq8h064O4uKRgHbJbDYLEqs/QsvGaWGqBFH
         2mSJXjUSnoGOYiOeFrTRzzYFbozgxaFtDCbPi+G1fJiT99LdhMY3M+m3/rfiIxqxQUcF
         O3CeJPOwnLRbwX0bzYrBNX7fCVfkgH7vGT854L4EtbHMZD+JQ5CREY4P00mDInrhkj8W
         HomIC+Wo67ZbNTE6AZaHjehu55E4Zki1eAhjq1pjki4OVqgjWAs7cmFhlBNgOpQ0xFHI
         pi6ke4hd6vAiA1H1yQzn23jK5HXmtdSPMt/sRFMOThPG+QXhCQ46vFQdAHQRQUOPwDU5
         7n1w==
X-Gm-Message-State: APjAAAW/2rpv/zo7C6df5AbkTVwUvTkhm4+XaYj9h9LgkNiLoXc9NXks
        vh+p67fh11T1euLCZKhNpRTFq691LM8=
X-Google-Smtp-Source: APXvYqzC8LRj3xs2frTBT7a7UVIOfE7Dee/hQcwsojftp7lsz2q4lcnWWD5q7uRHEEuoZXYEr7gM2A==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr483153wrr.312.1576079045020;
        Wed, 11 Dec 2019 07:44:05 -0800 (PST)
Received: from localhost.localdomain (lfbn-1-7161-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id d16sm2917102wrg.27.2019.12.11.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 07:44:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH] build: check linux headers version at build-time
Date:   Wed, 11 Dec 2019 16:44:02 +0100
Message-Id: <20191211154402.8946-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Original libgpiod relied on linux headers v4.8 to build but it was only
documented in README and not enforced at build-time. We now support
features first available in linux v5.5. Add a check to configure.ac that
verifies if recent enough kernel headers are available - otherwise we'd
fail only when trying to build the library.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 configure.ac | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/configure.ac b/configure.ac
index 62e2671..e939889 100644
--- a/configure.ac
+++ b/configure.ac
@@ -89,6 +89,15 @@ AC_CHECK_HEADERS([dirent.h], [], [HEADER_NOT_FOUND_LIB([dirent.h])])
 AC_CHECK_HEADERS([sys/poll.h], [], [HEADER_NOT_FOUND_LIB([sys/poll.h])])
 AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])])
 AC_CHECK_HEADERS([linux/gpio.h], [], [HEADER_NOT_FOUND_LIB([linux/gpio.h])])
+AC_CHECK_HEADERS([linux/version.h], [], [HEADER_NOT_FOUND_LIB([linux/version.h])])
+
+AC_COMPILE_IFELSE([AC_LANG_SOURCE(
+#include <linux/version.h>
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
+#error
+#endif
+)],
+[], [AC_MSG_ERROR(["libgpiod needs linux headers version >= v5.5.0"])])
 
 AC_ARG_ENABLE([tools],
 	[AC_HELP_STRING([--enable-tools],
-- 
2.23.0

