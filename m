Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955C86A26DB
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 03:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjBYCuf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 21:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYCuf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 21:50:35 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8FF36699
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 18:50:34 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id b16so921785iln.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 18:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKKEYQoCM0g01h3qkxIdgeyEK1Tl9v//zTRgithkokY=;
        b=O1V0hV6RDlHbCpR+s/45Ooj/5xygVpSzYkf6SGJWxqmpjYKGrKr4hh5hzC/FcapVfR
         ZZYSwyQhSsmb7DK3c9+nzjUaS4zn3DAiRpa6VeveqxEQTU9+KWyQiLlGJkszJW+sHCNj
         LXefvWuPfEDlHE700ztYT+FFiRr+2F3+uY+ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKKEYQoCM0g01h3qkxIdgeyEK1Tl9v//zTRgithkokY=;
        b=312HHxRD3UsejB3cMF0IupYRPaBzeg5V7aLkk8FKYspUSbauK24DnSO1xgnurXktGB
         FLWuk3B2T/HiGtv09qczbaLc7HVyFNZtZ2hAbLL+m/ELXgFapl27K6vghEk5cB3FudUm
         qjLKQkyyiDAhP/fLRCrmncpmDL+9CZcozxiFyy8cqC0f8naYvMWf3EIJmZXC4xCX9ufD
         mxoC4t05p+yqxsmncNySS5fcVmke5PFXKFGF/YRMBTSq8onwXZ4hgRynScW4pMeqPULf
         0qezWeJjCnMLTiXwLqUSf01fnyiaLqxhssfcKkP+VDbeGarwyyc3/HrtqMNapNxKzqXt
         12FQ==
X-Gm-Message-State: AO0yUKURMn/NYjdqG43JZwHcCPg2FHzegNg4uOW5z6VCsiN/v6zxKj9z
        pZL9LjFFPoIPSe09ey1iaiVKdNghsDgP9/uZ
X-Google-Smtp-Source: AK7set+jX56UHIMzsUJ/c9/bwMsxIcrLTAG49sJZKbGvNoMwnuZSm9bELQKzXaQRUWCiZVFaQFUXog==
X-Received: by 2002:a05:6e02:1051:b0:317:34d1:e4dc with SMTP id p17-20020a056e02105100b0031734d1e4dcmr448553ilj.23.1677293433098;
        Fri, 24 Feb 2023 18:50:33 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id j19-20020a02a693000000b003c4e02148e5sm169966jam.53.2023.02.24.18.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 18:50:32 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,2/2] build: add Android.bp to build within Android tree
Date:   Fri, 24 Feb 2023 18:50:22 -0800
Message-Id: <20230225025022.3871665-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225025022.3871665-1-benl@squareup.com>
References: <20230225025022.3871665-1-benl@squareup.com>
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
---
 Android.bp | 129 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Android.bp

diff --git a/Android.bp b/Android.bp
new file mode 100644
index 0000000..55ddcc8
--- /dev/null
+++ b/Android.bp
@@ -0,0 +1,129 @@
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
+    cpp_std: "gnu++17",
+    cflags: [
+        "-DGPIOD_VERSION_STR=\"2.0-rc3\"",
+        "-DHAVE_GETPROGNAME=1",
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

