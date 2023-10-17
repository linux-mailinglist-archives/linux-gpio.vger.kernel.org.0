Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB0D7CC6FE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 17:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344247AbjJQPGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 11:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344257AbjJQPG3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 11:06:29 -0400
Received: from mail-lf1-x163.google.com (mail-lf1-x163.google.com [IPv6:2a00:1450:4864:20::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0F527764
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 07:56:26 -0700 (PDT)
Received: by mail-lf1-x163.google.com with SMTP id 2adb3069b0e04-507a5f2193bso3651743e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697554585; x=1698159385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgn3G5idzrq2XUS/9uXOfkL89BSCZFTdjGM/8NC+qEM=;
        b=CAdln1VFEbgVXrxGz5FWw5jX8617Qy0QrT4+H8uJh7Y7Fa6qOxddU/xSbVwgCeshzM
         ijI+wOAxx13kVEVzoKdba2HUFtLrdybsfqhImujIuUJO7Q1DHd2UKvZWS6XHK6lrZCSb
         h45fmE6pMS5nQEgyYLvYe9BhWD3QMQf03BXE2apLDRla2iQ0lMx19cSnYorSh+46+UuY
         13FSM/EUBqM04xOnkvyAd+XRBxXCjI/jd3HlPXTwYnPMQ14qJYFQW/J7espvO7pI/Nwo
         VA0XnkRZqnWIeSqOvuYcqnUJ8KNg243ZlRoxzjU93g5gkNXZx6Qqk2mInrazG29CxgV3
         GSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697554585; x=1698159385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgn3G5idzrq2XUS/9uXOfkL89BSCZFTdjGM/8NC+qEM=;
        b=F31xv6GB8mEX6XGKZn8x8ALbN9Q+7kyOhNSF10JhWU8poazlD6EbKYoL58gJgV3hrz
         3LPXSPvcJubET0LckxR8tNe+bArkzOomIjzdCsbYOYXd3TZphOK7t0WSSD14popJPe/W
         9ybPoW4ypuhhL9UN81ZzokKA8ovqP9YjVp/zxKyphf753Qd35Tqclucq6CN+K34ZPbTH
         SHNyvvZxMuMLuCaAZI7eADdnSDSXeH7E/eceUG4hVRKMQlBt5Y4PWo7heZwVbAREFlT2
         fxFWaAbD3WL6ObMqlnETt8sVOOLQdDCo+GVJX0xmKIqD0Exx/4ROutcGW4NrNCP20+pW
         KUPw==
X-Gm-Message-State: AOJu0Yxn9IqTUKRczzBmRS716u+O+tPTDrNGQykHQGv9Yo6M9C23KTVc
        rjzTgDs2r+vGFzmPMWD+G41TyS9nbdhfnGArcGiYSWLvYzl6QQ==
X-Google-Smtp-Source: AGHT+IEGPDHyABSBgBMxYOl2vhX4s+kKiNYN59lXXD72CVKpyQNLDCJsB2Ud7JHs8dSmVUlq6Rrb2B5TidDF
X-Received: by 2002:a05:6512:2033:b0:4fb:a088:cfca with SMTP id s19-20020a056512203300b004fba088cfcamr873338lfs.6.1697554584363;
        Tue, 17 Oct 2023 07:56:24 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id y9-20020ac255a9000000b0050338aa1da7sm305798lfg.41.2023.10.17.07.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:56:24 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 1/1] bindings: python: move long_description into README.md
Date:   Tue, 17 Oct 2023 15:55:49 +0100
Message-Id: <20231017145549.179355-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017145549.179355-1-phil@gadgetoid.com>
References: <20231017145549.179355-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the long_description into README.md and include some basic
information about libgpiod, and some simple Python example code.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |   1 +
 bindings/python/README.md   | 104 ++++++++++++++++++++++++++++++++++++
 bindings/python/setup.py    |   4 +-
 3 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 bindings/python/README.md

diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index c7124d4..459b317 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -2,6 +2,7 @@
 # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 include setup.py
+include README.md
 
 recursive-include gpiod *.py
 recursive-include tests *.py
diff --git a/bindings/python/README.md b/bindings/python/README.md
new file mode 100644
index 0000000..abb69da
--- /dev/null
+++ b/bindings/python/README.md
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: CC-BY-SA-4.0
+# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
+
+# gpiod
+
+These are the official Python bindings for [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/).
+
+The gpiod library has been vendored into this package for your convenience and
+this version of gpiod is independent from your system package.
+
+Binary wheels are not provided. The source package requires python3-dev.
+
+## Rationale
+
+The new character device interface guarantees all allocated resources are
+freed after closing the device file descriptor and adds several new features
+that are not present in the obsolete sysfs interface (like event polling,
+setting/reading multiple values at once or open-source and open-drain GPIOs).
+
+Unfortunately interacting with the linux device file can no longer be done
+using only standard command-line tools. This is the reason for creating a
+library encapsulating the cumbersome, ioctl-based kernel-userspace interaction
+in a set of convenient functions and opaque data structures.
+
+## Breaking Changes
+
+As of v2.0.2 we have replaced the unofficial, pure-Python "gpiod". The official
+gpiod is not backwards compatible.
+
+You should ensure you specify at least v2.0.2 for the official API. Versions
+1.5.4 and prior are the deprecated, unofficial, pure-Python bindings.
+
+## Installing
+
+You will need `python3-dev`, on Debian/Ubuntu you can install this with:
+
+```
+sudo apt install python3-dev
+```
+
+And then install gpiod with:
+
+```
+pip install gpiod
+```
+
+You can optionally depend upon your system gpiod by installing with:
+
+```
+LINK_SYSTEM_LIBGPIOD=1 pip install gpiod
+```
+
+If you still need the deprecated pure-Python bindings, install with:
+
+```
+pip install gpiod==1.5.4
+```
+
+## Examples
+
+Check a GPIO chip character device exists:
+
+```python
+import gpiod
+
+gpiod.is_gpiochip_device("/dev/gpiochip0")
+
+```
+
+Get information about a GPIO chip character device:
+
+```python
+import gpiod
+
+with gpiod.Chip("/dev/gpiochip0") as chip:
+    info = chip.get_info()
+    print(f"{info.name} [{info.label}] ({info.num_lines} lines)")
+```
+
+Blink an LED, or toggling a GPIO line:
+
+```python
+import time
+
+from gpiod.line import Direction, Value
+
+LINE = 5
+
+with gpiod.request_lines(
+    "/dev/gpiochip0",
+    consumer="blink-example",
+    config={
+        LINE: gpiod.LineSettings(
+            direction=Direction.OUTPUT, output_value=Value.ACTIVE
+        )
+    },
+) as request:
+    while True:
+        request.set_value(LINE, Value.ACTIVE)
+        time.sleep(1)
+        request.set_value(LINE, Value.INACTIVE)
+        time.sleep(1)
+```
+
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index df10e18..98b377f 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -67,8 +67,8 @@ setup(
     author="Bartosz Golaszewski",
     author_email="brgl@bgdev.pl",
     description="Python bindings for libgpiod",
-    long_description="This is a package spun out of the main libgpiod repository containing " \
-                     "python bindings to the underlying C library.",
+    long_description=open("README.md", "r").read(),
+    long_description_content_type="text/markdown",
     platforms=["linux"],
     license="LGPLv2.1",
 )
-- 
2.34.1

