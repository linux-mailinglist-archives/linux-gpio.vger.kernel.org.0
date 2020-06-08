Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD281F1500
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 11:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgFHJHC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 05:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgFHJHA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 05:07:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC19C08C5C3
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 02:06:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so16513341wrc.7
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmRvg9WdMz9PqUAVOc9PSpLim4YbFsqD5z6Ld3A8lwc=;
        b=b/xwEg+jNXT6MZb0idR012OZ8lh6rDiv1uorT95uQ0YpLhQvAOa+O4cV4t32itPa2v
         nDJy7IGpIsYIIUKvJ4iciRn4IafEGdBgqiGEuAviWGZt1/VJhmhXB6MFjqUBowB0ZLyy
         TKm2hwxPkXEaWuDtvDJtnJkFoSy3wR5JW3pexC/6y4LbrnWlZaEfiItose4j/LbO3JEa
         OLRFRNHXwH0ZGtLRvd/0C2DlVVizAOcYKZvnaBdREkScQDuoxoA2rYXaKtXprsBcr39X
         H5iXEMbyjKXpULAZVlz+ILnqRsto9gtDfqatpqem8FLTeBBF56ZfgprmQil8ccR5NaVi
         RV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmRvg9WdMz9PqUAVOc9PSpLim4YbFsqD5z6Ld3A8lwc=;
        b=oUv5qbXiDeyJhIjSVGbgyV6pgzvZjfnyTLpQHfVr9HSxNIq4oc0JAltn6LHYR7HUfu
         M8cqw5GKuo3dUZFbOUaTW3P91PoqJJZkuUQFP2yOIlIW2T/lc91B8fSOOQ4jCWS3Qr6p
         l2TQT3sRF406fpIKnFVooWvbstmXk2IVsG4krecTacXX3kfTYQQXZAe4tk7xsT+hAR3A
         m952jdYCtneyxCAEQchNjoZaSug9rMTqD44S93InEWecG+CQhOiwly4+IJubXpFPUTim
         ckC2cCQ8i1ZDMNHDNEhNWyTHvaAwvr0WJjraQR4J3mVbxtTO0Ze7GReL7WtacEbfwYVU
         Ypng==
X-Gm-Message-State: AOAM531rwTlZ4Nj3hFn731hsBJicxystvII2nFwqo8iggWsU5d58Ra9x
        L/4QjI9ve5ujls2SGs8mlK1UptrdLRQ=
X-Google-Smtp-Source: ABdhPJzSL1Z85pYXXJ3nu4TQ0YXX0lmRLCqHvSq0k3owGT/rIKF0BP4FySEhqOulzUvPqK/WazzcTA==
X-Received: by 2002:adf:8b55:: with SMTP id v21mr23434530wra.187.1591607217829;
        Mon, 08 Jun 2020 02:06:57 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000f89b400cc883edd44ec4519.ipv6.abo.wanadoo.fr. [2a01:cb00:f89:b400:cc88:3edd:44ec:4519])
        by smtp.gmail.com with ESMTPSA id f9sm15378727wrf.74.2020.06.08.02.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:06:57 -0700 (PDT)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-gpio@vger.kernel.org
Cc:     Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [libgpiod][PATCH 3/3] Android.bp: initial addition
Date:   Mon,  8 Jun 2020 11:06:52 +0200
Message-Id: <20200608090652.805516-4-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- Defines both shared and static versions of libgpiod
- Defines all the libs/tools as vendor (installed in /vendor)

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

One thing that isn't ideal here is to set GPIOD_VERSION_STR manually,
that will require to keep track of it for all versions.

Not sure if there's a better way to provide that value to Android.bp.

Regards,
Gary
---
 Android.bp | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Android.bp

diff --git a/Android.bp b/Android.bp
new file mode 100644
index 0000000..6c437df
--- /dev/null
+++ b/Android.bp
@@ -0,0 +1,95 @@
+cc_library_shared {
+    name: "libgpiod",
+    vendor: true,
+    srcs: [
+        "lib/core.c",
+        "lib/ctxless.c",
+        "lib/helpers.c",
+        "lib/iter.c",
+        "lib/misc.c",
+    ],
+    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
+    export_include_dirs: ["include"],
+    local_include_dirs: ["include"],
+}
+
+cc_library_static {
+    name: "libgpiod_static",
+    vendor: true,
+    srcs: [
+        "lib/core.c",
+        "lib/ctxless.c",
+        "lib/helpers.c",
+        "lib/iter.c",
+        "lib/misc.c",
+    ],
+    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
+    export_include_dirs: ["include"],
+    local_include_dirs: ["include"],
+}
+
+cc_binary {
+    name: "gpiodetect",
+    vendor: true,
+    srcs: [
+        "tools/tools-common.c",
+        "tools/gpiodetect.c",
+    ],
+    shared_libs: ["libgpiod"],
+    cflags: ["-Werror"],
+}
+
+cc_binary {
+    name: "gpiofind",
+    vendor: true,
+    srcs: [
+        "tools/tools-common.c",
+        "tools/gpiofind.c",
+    ],
+    shared_libs: ["libgpiod"],
+    cflags: ["-Werror"],
+}
+
+cc_binary {
+    name: "gpioget",
+    vendor: true,
+    srcs: [
+        "tools/tools-common.c",
+        "tools/gpioget.c",
+    ],
+    shared_libs: ["libgpiod"],
+    cflags: ["-Werror"],
+}
+
+cc_binary {
+    name: "gpioinfo",
+    vendor: true,
+    srcs: [
+        "tools/tools-common.c",
+        "tools/gpioinfo.c",
+    ],
+    shared_libs: ["libgpiod"],
+    cflags: ["-Werror"],
+}
+
+cc_binary {
+    name: "gpiomon",
+    vendor: true,
+    srcs: [
+        "tools/tools-common.c",
+        "tools/gpiomon.c",
+    ],
+    shared_libs: ["libgpiod"],
+    cflags: ["-Werror"],
+}
+
+cc_binary {
+    name: "gpioset",
+    vendor: true,
+    srcs: [
+        "tools/tools-common.c",
+        "tools/gpioset.c",
+    ],
+    shared_libs: ["libgpiod"],
+    cflags: ["-Werror"],
+}
-- 
2.26.2

