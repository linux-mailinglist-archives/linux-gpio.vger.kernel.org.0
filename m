Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB92B7C5365
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbjJKMQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235002AbjJKMPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:15:55 -0400
Received: from mail-ed1-x564.google.com (mail-ed1-x564.google.com [IPv6:2a00:1450:4864:20::564])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85FF44BD
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
Received: by mail-ed1-x564.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo2785472a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697026388; x=1697631188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK9dJ9jy4t0RJYplqPgZneMfZDamD+neySH+hGtkHmQ=;
        b=XPrNrkkWwkgxFgVu18nBppPXV6Qo9MOXRr+5FftiRHd7tSNYxOroFzbVH/yzPvoRuj
         43V3KRFTIiCLL0/WpGbw2zml8HGeeDS/TGhMiJsge/N3RmP90S83sM19e5fTGTwmRDhJ
         fahX51/OykoFz/1VaK1zNu/+1NecJO+j1GQrJk/TR9/rZBD2iuXtKVUI3qVVe+NHxpv7
         EGHbF93AkLJ9cN/+I+iOgQqZXP7vnyNRohQnUDynFm6kAzIA13B+0M2ZNwGaInnJMxLQ
         moz27lr1EsNmVl96F6rG3s1zNjjWlG/ay51oB25DwovlcwWJtVAmfeSSD5eggR2H83SA
         oANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026388; x=1697631188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DK9dJ9jy4t0RJYplqPgZneMfZDamD+neySH+hGtkHmQ=;
        b=p2HGbO1hLP7XtgjMlyxsKdVJMM7AY1y9F198OTWaWVlBTlh2oQEwHgCqpYyW3EcAnB
         BmodlZI9BhQbXoTmTocGsExvSgeeWyzbiOBbF1fEyEiX6IiwvFcFCugVuNCmKwxB64Gs
         aENbRyTmDwSmpX14GHwTwt5BrczWHm3C9N25heFxxOs7K8MpM2QNKQ9pi8k5SvV2ZhtC
         ncNGdH/2v/mnnlzC+tCbKKzHZ5NMeh4aadBX8erHrYm4yfZoy2o8tlR7tq7CVLTLTiqm
         gcvzZaLWBtnf4PLGVshWQpBR8tbYnD6PvDBkDp/W/YgRJM+nfgHOqSJKuSRhuN06tij2
         6bcg==
X-Gm-Message-State: AOJu0Yw8srBokCZ0ox0V2Qg8dqyUzYfx5ZoRYYx6DJPjmRMVbnlUlLHG
        udjwbcOcgZXLE+Rr5KPK14+f8wuO0ZxoDfK6xVsTmaqWOaUrMQ==
X-Google-Smtp-Source: AGHT+IHfRZFqBWV/ehzxisvbzkImR34N23PDJ53Drl6a1NeBHPEiouT8K970Ueu2wusTv7NaMTPSmuNfLYYB
X-Received: by 2002:a17:906:9c1:b0:9ae:5aa4:9fa with SMTP id r1-20020a17090609c100b009ae5aa409famr18581064eje.42.1697026387700;
        Wed, 11 Oct 2023 05:13:07 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id x6-20020a170906134600b009b9720a85dcsm1582049ejb.44.2023.10.11.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:13:07 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 1/3] bindings: python: optionally include module in sdist
Date:   Wed, 11 Oct 2023 13:12:44 +0100
Message-Id: <20231011121246.9467-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011121246.9467-1-phil@gadgetoid.com>
References: <20231011121246.9467-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Build gpiod into Python module.

Optional environment var USE_SYSTEM_GPIO=1 to
generate a module that depends upon system gpiod.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/MANIFEST.in |  4 +++
 bindings/python/include     |  1 +
 bindings/python/lib         |  1 +
 bindings/python/setup.py    | 57 ++++++++++++++++++++++++++++---------
 4 files changed, 50 insertions(+), 13 deletions(-)
 create mode 120000 bindings/python/include
 create mode 120000 bindings/python/lib

diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index c7124d4..eff8977 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -11,3 +11,7 @@ recursive-include gpiod/ext *.h
 
 recursive-include tests/gpiosim *.c
 recursive-include tests/procname *.c
+
+recursive-include lib *.c
+recursive-include lib *.h
+recursive-include include *.h
diff --git a/bindings/python/include b/bindings/python/include
new file mode 120000
index 0000000..fcffffb
--- /dev/null
+++ b/bindings/python/include
@@ -0,0 +1 @@
+../../include
\ No newline at end of file
diff --git a/bindings/python/lib b/bindings/python/lib
new file mode 120000
index 0000000..58677dd
--- /dev/null
+++ b/bindings/python/lib
@@ -0,0 +1 @@
+../../lib
\ No newline at end of file
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 66b7908..2e25981 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -19,19 +19,53 @@ class build_ext(orig_build_ext):
         rmtree(path.join(self.build_lib, "tests"), ignore_errors=True)
 
 
+with open("gpiod/version.py", "r") as fd:
+    exec(fd.read())
+
+
+sources = [
+    # gpiod Python bindings
+    "gpiod/ext/chip.c",
+    "gpiod/ext/common.c",
+    "gpiod/ext/line-config.c",
+    "gpiod/ext/line-settings.c",
+    "gpiod/ext/module.c",
+    "gpiod/ext/request.c",
+]
+
+if "USE_SYSTEM_GPIOD" in environ and environ["USE_SYSTEM_GPIOD"] == "1":
+    libraries = ["gpiod"]
+    include_dirs = ["gpiod"]
+else:
+    sources += [
+        # gpiod library
+        "lib/chip.c",
+        "lib/chip-info.c",
+        "lib/edge-event.c",
+        "lib/info-event.c",
+        "lib/internal.c",
+        "lib/line-config.c",
+        "lib/line-info.c",
+        "lib/line-request.c",
+        "lib/line-settings.c",
+        "lib/misc.c",
+        "lib/request-config.c",
+    ]
+    libraries = []
+    include_dirs = ["include", "lib", "gpiod/ext"]
+
+
 gpiod_ext = Extension(
     "gpiod._ext",
-    sources=[
-        "gpiod/ext/chip.c",
-        "gpiod/ext/common.c",
-        "gpiod/ext/line-config.c",
-        "gpiod/ext/line-settings.c",
-        "gpiod/ext/module.c",
-        "gpiod/ext/request.c",
-    ],
+    libraries=libraries,
+    sources=sources,
     define_macros=[("_GNU_SOURCE", "1")],
-    libraries=["gpiod"],
-    extra_compile_args=["-Wall", "-Wextra"],
+    include_dirs=include_dirs,
+    extra_compile_args=[
+        "-Wall",
+        "-Wextra",
+        '-DGPIOD_VERSION_STR="{}"'.format(__version__),
+    ],
 )
 
 gpiosim_ext = Extension(
@@ -54,9 +88,6 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open("gpiod/version.py", "r") as fd:
-    exec(fd.read())
-
 setup(
     name="libgpiod",
     packages=find_packages(exclude=["tests", "tests.*"]),
-- 
2.34.1

