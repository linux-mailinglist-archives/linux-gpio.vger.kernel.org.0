Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E90CB6A26E3
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjBYDIx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDIx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:08:53 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3202DEB5C
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:52 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id h10so903258ila.11
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqdL+0GFo/wsuQ9jU87QtviOhuhArOTAzgFs4xuF34k=;
        b=TcXFRRqh+0cofTJAZnt5D+KMNgPb9vUvUIc2uWYSV8xe0eQuBxMz4dWVp0+aqK+bxu
         u1LYPJc7feg170OYxPW6QsqZlj2lV+sVVcXzr1MACg6Tp1ZbTdBH2kOqrQwbBGBqrkrN
         aWPAmjY3b1lvnFNtzpkPIQekko3FHLlvbRZVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqdL+0GFo/wsuQ9jU87QtviOhuhArOTAzgFs4xuF34k=;
        b=fLv0fuvh1PcQnf+0KHUtfR+NMLdbjQdpW4Am138wYDX4F+9IrclLESeLBZoXlq8reG
         75j8xO6BOJJAekD/4MqLvKViTcTywW72XPvI9DY6rfE/S1UsoZ2TUllGJylJWmKxSxYr
         5gBvSDhCfaq5qWpR7wbmvb2QYoUKQuA/4Yv7Ynv5WdTKrxKS8QuL0x9uYBqFXSLEmkNW
         CLdArJh9pBtKwGppEDw5wfgxkpo6+aAf8LUbIBZ6kRJ7VCfM7m4jTo/hrqsZgATno4ON
         GyFwgx3Lcyu0daDK56kpF7qG7Ae/gI/pKEhP6K4KVfK1kL0o2gS9LrH+yTg5x4qd8fS0
         9aQA==
X-Gm-Message-State: AO0yUKXmA3XY/RmCpTB3CzC9Jyetr1CzfgyP3pJf36jW4RHiVHrqUZmM
        w+HoO3EEp6cbpQEuXj+gNkeN3BWpQLzW4iJH
X-Google-Smtp-Source: AK7set8vjXiuQ3KAVz0rE9cV2MJ1qmA/rIaTOSP+crNf42jcG6hMSQqECkQ4HJarP1+DWhXnVEeaBg==
X-Received: by 2002:a05:6e02:214b:b0:315:74be:428b with SMTP id d11-20020a056e02214b00b0031574be428bmr16755945ilv.28.1677294531142;
        Fri, 24 Feb 2023 19:08:51 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id h21-20020a02c735000000b0038a3b8aaf11sm183634jao.37.2023.02.24.19.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:08:50 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v1.6.x,3/3] build: add Android.bp to build within Android tree
Date:   Fri, 24 Feb 2023 19:08:13 -0800
Message-Id: <20230225030813.3885661-4-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225030813.3885661-1-benl@squareup.com>
References: <20230225030813.3885661-1-benl@squareup.com>
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

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 Android.bp | 126 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Android.bp

diff --git a/Android.bp b/Android.bp
new file mode 100644
index 0000000..82a2f98
--- /dev/null
+++ b/Android.bp
@@ -0,0 +1,126 @@
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
+        // Not great to mix sources and includes in this dir.
+        "bindings/cxx",
+    ],
+}
+
+cc_defaults {
+    name: "libgpiod_defaults",
+    device_specific: true,
+    cpp_std: "gnu++11",
+    cflags: [
+        "-DGPIOD_VERSION_STR=\"1.6.x\"",
+        "-DHAVE_GETPROGNAME=1",
+    ],
+    cppflags: [
+        // Google C++ style is to not use exceptions, but this library does
+        // use them.
+        "-fexceptions",
+    ],
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
+        "gpiofind",
+        "gpioget",
+        "gpioinfo",
+        "gpiomon",
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
+    name: "gpiofind",
+    defaults: [
+        "libgpiod_defaults",
+        "libgpiod_tools_defaults",
+    ],
+    srcs: [
+        "tools/gpiofind.c",
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

