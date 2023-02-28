Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D08B6A5015
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 01:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjB1ANn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 19:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjB1ANg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 19:13:36 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA67B6A45
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 16:13:31 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id b12so5354825ils.8
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 16:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JEGWkYSd3xHDg8Gwcx7PjafM8ucmSGf8ozVlKbIuxg=;
        b=ZPHjoyeWheZ5hvzgqMKauMttcBJqinbMQ7bxuXbgCwHEBcuOvEgQWdyWB1ipORjP2Y
         03uVjvZfXzCyMTu/osNuDzQaywyI/7Va6WrZdBupIFdOR5WdMiNQ5+PEFFRWsXcXRCmV
         PtPurX/9Pps5cTkw41x9MFZlPH0/stCkLIqjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JEGWkYSd3xHDg8Gwcx7PjafM8ucmSGf8ozVlKbIuxg=;
        b=0gV66zZYMSdtFAsUwbT2gqA3DP+wW96YlnQLIoHFMnFQeGdoGG7Ms2Vv96zqUf4IF0
         AOLppeMVXWyCypr+tQfsMWOK6JifTWcX3mWGgGnOqJPO/qAEsCHUH8aLdjb+cjuWn/La
         QmaDyVRuMKLz55ZZGWmQkXeamIeAtJV+zlv1nVIMZclFiJduNd0lwxfoJVRsiiwRSoqN
         9Z7TFM1NGnK52MqLPVhSStTWPxElhItPAtioXgplIIZAUGNaETINEaQckHZkkk05bQVK
         pN+i7fxOSPZeGjvvm9pEYUnQUk4coSzBuRCnhvbcy/u6UhF40j/B8AmcIdgVsbdAmTUR
         ye2Q==
X-Gm-Message-State: AO0yUKWJV7yl80oUorDHqYhkTV2u34/k8DTBMzJOre2sh3LwXMsJUiGL
        q30Ail71M0I+CKOaoOBpnVi2wqNUEGYYlpAaFdU=
X-Google-Smtp-Source: AK7set8Ti89Fg+jTqwYoa0yN+fBTfbsGmiSTEcQXL0jZj8svbOxtsW0zLGbsG6asmrUdk5I2ZCZyzA==
X-Received: by 2002:a92:ca0f:0:b0:315:9937:600e with SMTP id j15-20020a92ca0f000000b003159937600emr1215401ils.26.1677543210670;
        Mon, 27 Feb 2023 16:13:30 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id b23-20020a02c997000000b003b4dc9ca57asm2549529jap.13.2023.02.27.16.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 16:13:30 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v3 2/2] contrib: add sample Android.bp to build within an Android tree
Date:   Mon, 27 Feb 2023 16:13:07 -0800
Message-Id: <20230228001307.249811-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228001307.249811-1-benl@squareup.com>
References: <20230228001307.249811-1-benl@squareup.com>
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

