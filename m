Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93826ACCED
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 19:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjCFSqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 13:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCFSqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 13:46:12 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3368C3E625
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 10:46:09 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id i4so6906300ils.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 10:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google; t=1678128368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JEGWkYSd3xHDg8Gwcx7PjafM8ucmSGf8ozVlKbIuxg=;
        b=MWS5zYM/NZCrhZOJKjCX6L4+GuCZEEkXqAYmAhjt9dhf7w/JMWO3/X1/Qh3oQXtRUZ
         sDQu3jQ6aOcXPddiRldhyAAwg50/Qu8Qo7fXJmkQC79D6uhWXvePCCX9hHYeWvWBcXwh
         zcGrrw3zhwFpCNzDD6BrFgG6UuVvgXd/xrX7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JEGWkYSd3xHDg8Gwcx7PjafM8ucmSGf8ozVlKbIuxg=;
        b=KMU8RjYhAmJjPFlE2nKvCETKT2tnPz08Mk7c74cNFVxwWinGbj2NwJpqpuMzbSV2nd
         lEFWnp1/IRXfKXcpWsvqlKjuNd+m8YBm4UNKEy4IF02OsENN3wBepUPRlRBXWBrxRBHg
         FY6aUucQP6anmXye1nKL0D8lDUUKWog1Ll2iqoYZf48FzA356wDcqNE9joQ2G6wPKSAN
         0b7GfQ2DwwHVh1Wlz3vqYb1hDCtGuFpypHjkai+f0G5Wahca38glRODlNX2k0w8QjVct
         iK5t3CsekhDy6LojKdm4eumkWnZ9AsC+D48k7UN+EWP+YQL5jU2J1ZYg2fiZskWc2/4H
         K4oA==
X-Gm-Message-State: AO0yUKV4hFSjO7OTHzAm8glX5d0LsmZcveUXAL0Eak5lKOzZrAasGm/k
        7FpDZ6zeuKn7nwhBiNFLX/eOSoYefCnAZabc35U=
X-Google-Smtp-Source: AK7set+DviPlALYohmJAlwVt93MKAElONPDO6p8yrqjhr2ymt1z1ttTOCbXFEKjBuICpD7uNHV9uOQ==
X-Received: by 2002:a05:6e02:1d83:b0:317:b8a5:6d2d with SMTP id h3-20020a056e021d8300b00317b8a56d2dmr10466886ila.17.1678128368143;
        Mon, 06 Mar 2023 10:46:08 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id b12-20020a02c98c000000b003c502198ffbsm3505744jap.22.2023.03.06.10.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 10:46:07 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v4 2/2] contrib: add sample Android.bp to build within an Android tree
Date:   Mon,  6 Mar 2023 10:45:45 -0800
Message-Id: <20230306184545.1316993-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306184545.1316993-1-benl@squareup.com>
References: <20230306184545.1316993-1-benl@squareup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add an Android.bp file for Soong, the Android build system, to build
the library including C++ bindings along with all the CLI tools.

This reference Android build file will live in a contrib/ folder to
indiciate it is a less-maintained part of libgpiod. It will need to
be moved to the root directory in order to use it, though, as Soong
doesn't let Blueprint files reference sources in a parent directory.

  error: external/libgpiod/contrib/Android.bp:5:1: module "libgpiod" variant "...": Path is outside directory: ../include
  error: external/libgpiod/contrib/Android.bp:5:1: module "libgpiod" variant "...": Path is outside directory: ../bindings/cxx
  error: external/libgpiod/contrib/Android.bp:5:1: module "libgpiod" variant "...": Path is outside directory: ../lib/*.c
  error: external/libgpiod/contrib/Android.bp:5:1: module "libgpiod" variant "...": Path is outside directory: ../bindings/cxx/*.cpp

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 contrib/Android.bp | 136 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 contrib/Android.bp

diff --git a/contrib/Android.bp b/contrib/Android.bp
new file mode 100644
index 0000000..fbc2196
--- /dev/null
+++ b/contrib/Android.bp
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Benjamin Li <benl@squareup.com>
+
+// Instructions:
+// - Check out this repository as external/libgpiod.
+// - Move this build file to the project's root directory.
+
+//
+// libgpiod main library
+//
+
+cc_library {
+    name: "libgpiod",
+    defaults: [
+        "libgpiod_defaults",
+    ],
+    srcs: [
+        "lib/*.c",
+        "bindings/cxx/*.cpp",
+    ],
+    export_include_dirs: [
+        "include",
+        "bindings/cxx",
+    ],
+}
+
+cc_defaults {
+    name: "libgpiod_defaults",
+    device_specific: true,
+    cpp_std: "gnu++17",
+    cflags: [
+        // You may want to edit this with the version from configure.ac of
+        // the release you are using.
+        "-DGPIOD_VERSION_STR=\"unstable\"",
+    ],
+    cppflags: [
+        // Google C++ style is to not use exceptions, but this library does
+        // use them.
+        "-fexceptions",
+    ],
+    // Google C++ style is to not use runtime type information, but this
+    // library does use it.
+    rtti: true,
+}
+
+//
+// libgpiod tools
+//
+
+phony {
+    name: "libgpiod_tools",
+    required: [
+        "gpiodetect",
+        "gpioget",
+        "gpioinfo",
+        "gpiomon",
+        "gpionotify",
+        "gpioset",
+    ],
+}
+
+cc_binary {
+    name: "gpiodetect",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpiodetect.c",
+    ],
+}
+
+cc_binary {
+    name: "gpioget",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpioget.c",
+    ],
+}
+
+cc_binary {
+    name: "gpioinfo",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpioinfo.c",
+    ],
+}
+
+cc_binary {
+    name: "gpiomon",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpiomon.c",
+    ],
+}
+
+cc_binary {
+    name: "gpionotify",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpionotify.c",
+    ],
+}
+
+cc_binary {
+    name: "gpioset",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpioset.c",
+    ],
+}
+
+cc_defaults {
+    name: "libgpiod_tools_defaults",
+    srcs: [
+        "tools/tools-common.c",
+    ],
+    shared_libs: [
+        "libgpiod",
+    ],
+}
-- 
2.25.1

