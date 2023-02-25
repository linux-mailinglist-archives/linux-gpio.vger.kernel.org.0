Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361AC6A26E7
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjBYDMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDMq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:12:46 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FACB6BF50
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:12:46 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id y140so388732iof.6
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JDW62obxYTfeQEseJq2q6fd/qhXcO9h9IzOic8GUao=;
        b=JQlGoH7YK0QN8SFiUOrd5f9w/MH0Mk3vKrmYYwfS7IzwKsTbp+zSJH9kDe4R4Jh5Vg
         VZI5eAgufxpamgYL9DDZdx6AybV1F6nyPXm7rGf32DijuNLHOtiD6cWoJYwNH8AUBWUr
         J1KADTbwT3arr5MN0cJ95mjfvtDKKLXU2GTxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JDW62obxYTfeQEseJq2q6fd/qhXcO9h9IzOic8GUao=;
        b=QNThz1wwKKW2hVuP+y2iBoswpYMmgQScvO7zLRqp/9Ul55E4nV54qKmkHw9ruGQ5tO
         LbQKgfcucGQ5vr9/8Yw3erH15SE50YdVFh6A+SdB57ANE8PW8VWFWKSud2wi/wbOptRc
         150XTitq6B2wpYa7S8+AewFT/zTnUoylcNKbe3VREN7RrO+m8QKmlEI98xVHtV/Xsevc
         fQk+EHP5fNelS+vX53I+js+FPiLbhEZ7PjrEHhAXowyjKuZRXlh1+Z+BCWbXbQtzm++6
         MJIeKg1rMWpbi9szgXOqUnHpYKIK/KeWHy8N0RSCUxTN+Wmat/zuqKyG51MMnhtLM7Ua
         gzEw==
X-Gm-Message-State: AO0yUKWntou+vs99o+7bavGHLdlL3K51j7Mcn5q1fIXO5LQH5wfvwoAU
        WMWly1GpwRR8G9yDkdxVVkJ6+oGRMhZ32qqy
X-Google-Smtp-Source: AK7set84FoDls+xAT76YwoWJXqmZ9UGCPeQxIq3KfWxlCphk/lpDNlnSRUUCJgFI2ub8QAD+svfJrg==
X-Received: by 2002:a5e:c10e:0:b0:71c:9858:1792 with SMTP id v14-20020a5ec10e000000b0071c98581792mr9605741iol.13.1677294765080;
        Fri, 24 Feb 2023 19:12:45 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id x16-20020a92dc50000000b0030314a7f039sm260649ilq.10.2023.02.24.19.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:12:44 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v2 2/2] build: add Android.bp to build within Android tree
Date:   Fri, 24 Feb 2023 19:12:35 -0800
Message-Id: <20230225031235.3886280-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225031235.3886280-1-benl@squareup.com>
References: <20230225031235.3886280-1-benl@squareup.com>
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

