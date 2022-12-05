Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2EF642940
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbiLENWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiLENWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:22:25 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657231C927
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:22:23 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D16ED5C00F4
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 08:22:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 05 Dec 2022 08:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1670246541; x=1670332941; bh=Bg
        6F3mOEmrQsn+IeTcx6qFny54XneeogI3UwqyGXFks=; b=imrtqaTKPlRlTv0SO3
        otOvk1JVBBhtAUTH2C1cLYYXCPoMBhtcT7PvXIF9Db6plthBrrUxWqucMg+zdiVR
        4qr2gMESwmHb9elDKCUiHxV0+gNnLe7aZ62mrXGDwatcAzHWq37/JF9cNQPZMQQP
        RaL6/wha8cC+U/U7CynBDgCDNui7zR506dEsSpfIfpjhc6+5pTnH6NYlsrmPR3m1
        iTjGCdrjZoYOq0Z0OjrS23VcqbBJeAYlzmQjaCoIvjJWXmOGqY/1n/Yqv+HY/gRz
        EXLO6VXm+DKZ14DCVHmZxlnUV+01eTAV4oKOHZENHdcNl+NU0MOmRObz7RN2sDt5
        zs5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1670246541; x=1670332941; bh=Bg6F3mOEmrQsn
        +IeTcx6qFny54XneeogI3UwqyGXFks=; b=LTaFdEBBdKpJPfeH9bGdYfyRlMiUf
        W8IKK6Xmph4RvFL0fjCLYY5S0QBJ8yvbmZnPwzaD65DIpvSiQ5ndeDo+j6n13MIr
        Iy+nSIzajIbbnlbBaBESOeMSmIUatTzTOpWRH/PsDYhTzNcr+R6mrkJHiyLU6I5w
        +W3NTO6SOHGtX9aro7n4mvk6g2T07SwVV9wWNt/WC45LQlO5DtbOaJ41boa1zQIP
        ipiTcDDTMi9/gp5TmYU1fvqgsbYnJEybMw53QjeM0rkxSbslprMZ39Wzk8gB0HjK
        ymhB0fmdx+Zhox02Sfq1SBoQMw+hRq6I2hUVUzuOVz9Z7wcRhz37zz4EA==
X-ME-Sender: <xms:jfCNY2q6XvpChNvXQ4nNrHtTlNMxrh8ZL2UMSLpz40SplMrwAaoabw>
    <xme:jfCNY0q3fsP4iW9uyAC-po-hCEp1shEhKnhrsQDPTb0saC1UI2XRbLptXJdEReLqw
    AGj8r38su6eo8H_sw>
X-ME-Received: <xmr:jfCNY7PeODEizmOI8cwAVu58w8Q7QYW7Ai33FjDSOKVun9k0c5AEaMzlTJunhoIbmzhVx84ghKjoRXz6dUwjDi2MwuWE49qWe1WbcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:jfCNY14QM9mPDBqtFFPJHWASu8JL9hKgtQHXBsHQvvLcAsf9GuywcA>
    <xmx:jfCNY14wXjJQL987J6f8afPc5NXgWodSvArSROSBYTCkBDnO760aPA>
    <xmx:jfCNY1ioHa1adp532IRtKL8P9tCq5LW6WZ199RkgBJZV0kCadhrB-w>
    <xmx:jfCNY2XJosraBOCB_qLwldh_VIh4zYNULAeSMARBDjpwjVwt1UKmXw>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-gpio@vger.kernel.org>; Mon, 5 Dec 2022 08:22:20 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod][WIP PATCH 1/2] Introduce meson as a build system
Date:   Mon,  5 Dec 2022 23:52:06 +1030
Message-Id: <20221205132207.94775-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221205132207.94775-1-andrew@aj.id.au>
References: <20221205132207.94775-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

So far meson builds the core library, tools and tests, as well as the
C++, Python and Rust bindings.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Doxyfile.in                               |  2 +-
 bindings/cxx/examples/meson.build         |  9 +++
 bindings/cxx/gpiodcxx/meson.build         | 19 +++++
 bindings/cxx/meson.build                  | 49 ++++++++++++
 bindings/cxx/tests/meson.build            | 26 +++++++
 bindings/meson.build                      | 14 ++++
 bindings/python/examples/meson.build      | 12 +++
 bindings/python/gpiod/ext/meson.build     | 14 ++++
 bindings/python/gpiod/meson.build         | 17 +++++
 bindings/python/meson.build               | 16 ++++
 bindings/python/tests/gpiosim/meson.build | 12 +++
 bindings/python/tests/meson.build         | 17 +++++
 bindings/rust/gpiosim-sys/build.rs        |  9 ++-
 bindings/rust/libgpiod-sys/build.rs       |  9 ++-
 bindings/rust/meson.build                 | 30 ++++++++
 include/meson.build                       |  7 ++
 lib/meson.build                           | 30 ++++++++
 man/meson.build                           | 21 ++++++
 meson.build                               | 91 +++++++++++++++++++++++
 meson_options.txt                         |  9 +++
 tests/gpiosim/meson.build                 | 24 ++++++
 tests/meson.build                         | 30 ++++++++
 tools/meson.build                         | 69 +++++++++++++++++
 23 files changed, 529 insertions(+), 7 deletions(-)
 create mode 100644 bindings/cxx/examples/meson.build
 create mode 100644 bindings/cxx/gpiodcxx/meson.build
 create mode 100644 bindings/cxx/meson.build
 create mode 100644 bindings/cxx/tests/meson.build
 create mode 100644 bindings/meson.build
 create mode 100644 bindings/python/examples/meson.build
 create mode 100644 bindings/python/gpiod/ext/meson.build
 create mode 100644 bindings/python/gpiod/meson.build
 create mode 100644 bindings/python/meson.build
 create mode 100644 bindings/python/tests/gpiosim/meson.build
 create mode 100644 bindings/python/tests/meson.build
 create mode 100644 bindings/rust/meson.build
 create mode 100644 include/meson.build
 create mode 100644 lib/meson.build
 create mode 100644 man/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 tests/gpiosim/meson.build
 create mode 100644 tests/meson.build
 create mode 100644 tools/meson.build

diff --git a/Doxyfile.in b/Doxyfile.in
index 9c85e2113edc..5e2b59c3631b 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -6,7 +6,7 @@
 # General configuration
 PROJECT_NAME           = libgpiod
 PROJECT_NUMBER         = @VERSION_STR@
-OUTPUT_DIRECTORY       = doc
+OUTPUT_DIRECTORY       = @DOC_DIR@
 OUTPUT_LANGUAGE        = English
 EXTRACT_ALL            = NO
 EXTRACT_PRIVATE        = NO
diff --git a/bindings/cxx/examples/meson.build b/bindings/cxx/examples/meson.build
new file mode 100644
index 000000000000..ffbd6c009ae8
--- /dev/null
+++ b/bindings/cxx/examples/meson.build
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+executable('gpiodetectcxx', 'gpiodetectcxx.cpp', dependencies: gpiodcxx_dep)
+executable('gpiofindcxx', 'gpiofindcxx.cpp', dependencies: gpiodcxx_dep)
+executable('gpiogetcxx', 'gpiogetcxx.cpp', dependencies: gpiodcxx_dep)
+executable('gpioinfocxx', 'gpioinfocxx.cpp', dependencies: gpiodcxx_dep)
+executable('gpiomoncxx', 'gpiomoncxx.cpp', dependencies: gpiodcxx_dep)
+executable('gpiosetcxx', 'gpiosetcxx.cpp', dependencies: gpiodcxx_dep)
diff --git a/bindings/cxx/gpiodcxx/meson.build b/bindings/cxx/gpiodcxx/meson.build
new file mode 100644
index 000000000000..a0f416ba8a74
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/meson.build
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+install_headers('chip.hpp',
+		'chip-info.hpp',
+		'edge-event-buffer.hpp',
+		'edge-event.hpp',
+		'exception.hpp',
+		'info-event.hpp',
+		'line.hpp',
+		'line-config.hpp',
+		'line-info.hpp',
+		'line-request.hpp',
+		'line-settings.hpp',
+		'misc.hpp',
+		'request-builder.hpp',
+		'request-config.hpp',
+		'timestamp.hpp',
+		subdir: 'gpiodcxx')
diff --git a/bindings/cxx/meson.build b/bindings/cxx/meson.build
new file mode 100644
index 000000000000..4bb43111ce18
--- /dev/null
+++ b/bindings/cxx/meson.build
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+add_languages('cpp', native: false)
+
+gpiodcxx_abi_version = '1.1.1'
+
+gpiodcxx = library('gpiodcxx',
+		   'chip.cpp',
+		   'chip-info.cpp',
+		   'edge-event-buffer.cpp',
+		   'edge-event.cpp',
+		   'exception.cpp',
+		   'info-event.cpp',
+		   'internal.cpp',
+		   'line.cpp',
+		   'line-config.cpp',
+		   'line-info.cpp',
+		   'line-request.cpp',
+		   'line-settings.cpp',
+		   'misc.cpp',
+		   'request-builder.cpp',
+		   'request-config.cpp',
+		   cpp_args: '-DGPIOD_CXX_BUILD',
+		   include_directories: gpiod_includes,
+		   gnu_symbol_visibility: 'hidden',
+		   version: gpiodcxx_abi_version,
+		   dependencies: gpiod_dep,
+	           install: true)
+
+pkg.generate(gpiodcxx,
+	     name: 'libgpiodcxx',
+	     description: 'C++ bindings for libgpiod')
+
+gpiodcxx_dep = declare_dependency(link_with: gpiodcxx,
+				  include_directories: include_directories('.'),
+				  dependencies: gpiod_dep,
+				  version: gpiodcxx_abi_version)
+
+install_headers('gpiod.hpp')
+subdir('gpiodcxx')
+
+if get_option('examples')
+    subdir('examples')
+endif
+
+if get_option('tests')
+    subdir('tests')
+endif
diff --git a/bindings/cxx/tests/meson.build b/bindings/cxx/tests/meson.build
new file mode 100644
index 000000000000..9dc8fdf491c5
--- /dev/null
+++ b/bindings/cxx/tests/meson.build
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+catch2_dep = dependency('catch2')
+
+executable('gpiod-cxx-test',
+	   'check-kernel.cpp',
+	   'gpiod-cxx-test-main.cpp',
+	   'gpiosim.cpp',
+	   'helpers.cpp',
+	   'tests-chip.cpp',
+	   'tests-chip-info.cpp',
+	   'tests-edge-event.cpp',
+	   'tests-info-event.cpp',
+	   'tests-line.cpp',
+	   'tests-line-config.cpp',
+	   'tests-line-info.cpp',
+	   'tests-line-request.cpp',
+	   'tests-line-settings.cpp',
+	   'tests-misc.cpp',
+	   'tests-request-config.cpp',
+	   dependencies: [ catch2_dep,
+			   gpiodcxx_dep,
+			   gpiosim_dep,
+			   threads_dep ],
+	   install: true)
diff --git a/bindings/meson.build b/bindings/meson.build
new file mode 100644
index 000000000000..bf7ad3669b5b
--- /dev/null
+++ b/bindings/meson.build
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+if get_option('bindings').contains('cxx')
+    subdir('cxx')
+endif
+
+if get_option('bindings').contains('python')
+    subdir('python')
+endif
+
+if get_option('bindings').contains('rust')
+    subdir('rust')
+endif
diff --git a/bindings/python/examples/meson.build b/bindings/python/examples/meson.build
new file mode 100644
index 000000000000..f8cd2455fbcd
--- /dev/null
+++ b/bindings/python/examples/meson.build
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+install_data('gpiodetect.py',
+	     'gpiofind.py',
+	     'gpioget.py',
+	     'gpioinfo.py',
+	     'gpiomon.py',
+	     'gpioset.py',
+	     'helpers.py',
+	     install_dir: get_option('datadir') / meson.project_name(),
+	     install_mode: 'rwxr-xr-x')
diff --git a/bindings/python/gpiod/ext/meson.build b/bindings/python/gpiod/ext/meson.build
new file mode 100644
index 000000000000..0128ae26a085
--- /dev/null
+++ b/bindings/python/gpiod/ext/meson.build
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+gpiodpyext = python3.extension_module('_ext',
+				      'chip.c',
+				      'common.c',
+				      'line-config.c',
+				      'line-settings.c',
+				      'module.c',
+				      'request.c',
+				      c_args: '-D_GNU_SOURCE',
+				      dependencies: [gpiod_dep, python3_dep],
+				      subdir: 'gpiod',
+				      install: true)
diff --git a/bindings/python/gpiod/meson.build b/bindings/python/gpiod/meson.build
new file mode 100644
index 000000000000..90d4517d5361
--- /dev/null
+++ b/bindings/python/gpiod/meson.build
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+subdir('ext')
+
+python3.install_sources('chip_info.py',
+			'chip.py',
+			'edge_event.py',
+			'exception.py',
+			'info_event.py',
+			'__init__.py',
+			'internal.py',
+			'line_info.py',
+			'line.py',
+			'line_request.py',
+			'line_settings.py',
+			subdir: 'gpiod')
diff --git a/bindings/python/meson.build b/bindings/python/meson.build
new file mode 100644
index 000000000000..26f7ff13e0dd
--- /dev/null
+++ b/bindings/python/meson.build
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+python = import('python')
+python3 = python.find_installation('python3')
+python3_dep = python3.dependency()
+
+subdir('gpiod')
+
+if get_option('examples')
+    subdir('examples')
+endif
+
+if get_option('tests')
+    subdir('tests')
+endif
diff --git a/bindings/python/tests/gpiosim/meson.build b/bindings/python/tests/gpiosim/meson.build
new file mode 100644
index 000000000000..82ea6d07df4d
--- /dev/null
+++ b/bindings/python/tests/gpiosim/meson.build
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+gpiodsimpyext = python3.extension_module('_ext',
+					 'ext.c',
+					 c_args: '-D_GNU_SOURCE',
+					 dependencies: [gpiosim_dep, python3_dep],
+					 subdir: 'gpiod/tests/gpiosim',
+					 install: true)
+python3.install_sources('chip.py',
+		        '__init__.py',
+		        subdir: 'gpiod/tests/gpiosim')
diff --git a/bindings/python/tests/meson.build b/bindings/python/tests/meson.build
new file mode 100644
index 000000000000..e33a24e7da0f
--- /dev/null
+++ b/bindings/python/tests/meson.build
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+subdir('gpiosim')
+
+python3.install_sources('helpers.py',
+			'__init__.py',
+			'__main__.py',
+			'tests_chip_info.py',
+			'tests_chip.py',
+			'tests_edge_event.py',
+			'tests_info_event.py',
+			'tests_line_info.py',
+			'tests_line_request.py',
+			'tests_line_settings.py',
+			'tests_module.py',
+			subdir: 'gpiod/tests')
diff --git a/bindings/rust/gpiosim-sys/build.rs b/bindings/rust/gpiosim-sys/build.rs
index 0651c6115322..86312af20e36 100644
--- a/bindings/rust/gpiosim-sys/build.rs
+++ b/bindings/rust/gpiosim-sys/build.rs
@@ -9,15 +9,17 @@ use std::path::PathBuf;
 
 fn generate_bindings() {
     // Tell cargo to invalidate the built crate whenever following files change
-    println!("cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.h");
+    let source_dep = env::var("GPIOD_CARGO_SIM_SOURCE_DEP").unwrap();
+    println!("cargo:rerun-if-changed={source_dep}");
 
     // The bindgen::Builder is the main entry point
     // to bindgen, and lets you build up options for
     // the resulting bindings.
+    let header_dep = env::var("GPIOD_CARGO_SIM_HEADER_DEP").unwrap();
     let bindings = bindgen::Builder::default()
         // The input header we would like to generate
         // bindings for.
-        .header("../../../tests/gpiosim/gpiosim.h")
+        .header(header_dep)
         // Tell cargo to invalidate the built crate whenever any of the
         // included header files changed.
         .parse_callbacks(Box::new(bindgen::CargoCallbacks))
@@ -38,6 +40,7 @@ fn main() {
 
     println!("cargo:rustc-link-lib=kmod");
     println!("cargo:rustc-link-lib=mount");
-    println!("cargo:rustc-link-search=./../../tests/gpiosim/.libs/");
+    let link_dir = env::var("GPIOD_CARGO_SIM_LINK_DIR").unwrap();
+    println!("cargo:rustc-link-search={link_dir}");
     println!("cargo:rustc-link-lib=static=gpiosim");
 }
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index 274069eb9e9d..4dd6c54c935f 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -9,15 +9,17 @@ use std::path::PathBuf;
 
 fn generate_bindings() {
     // Tell cargo to invalidate the built crate whenever following files change
-    println!("cargo:rerun-if-changed=../../../include/gpiod.h");
+    let source_dep = env::var("GPIOD_CARGO_LIB_SOURCE_DEP").unwrap();
+    println!("cargo:rerun-if-changed={source_dep}");
 
     // The bindgen::Builder is the main entry point
     // to bindgen, and lets you build up options for
     // the resulting bindings.
+    let header_dep = env::var("GPIOD_CARGO_LIB_HEADER_DEP").unwrap();
     let bindings = bindgen::Builder::default()
         // The input header we would like to generate
         // bindings for.
-        .header("../../../include/gpiod.h")
+        .header(header_dep)
         // Tell cargo to invalidate the built crate whenever any of the
         // included header files changed.
         .parse_callbacks(Box::new(bindgen::CargoCallbacks))
@@ -36,6 +38,7 @@ fn generate_bindings() {
 fn main() {
     generate_bindings();
 
-    println!("cargo:rustc-link-search=./../../lib/.libs/");
+    let link_dir = env::var("GPIOD_CARGO_LIB_LINK_DIR").unwrap();
+    println!("cargo:rustc-link-search={link_dir}");
     println!("cargo:rustc-link-lib=static=gpiod");
 }
diff --git a/bindings/rust/meson.build b/bindings/rust/meson.build
new file mode 100644
index 000000000000..68f27f473282
--- /dev/null
+++ b/bindings/rust/meson.build
@@ -0,0 +1,30 @@
+cargo = find_program('cargo')
+cargo_manifest = files('Cargo.toml')
+cargo_build_dir = meson.project_build_root() / 'cargo-build'
+cargo_build_cmd = [cargo, 'build', '--manifest-path', cargo_manifest, '--target-dir', cargo_build_dir, '--release', '--lib']
+
+if get_option('tests')
+    cargo_build_cmd += '--tests'
+endif
+
+if get_option('examples')
+    cargo_build_cmd += '--examples'
+endif
+
+cargo_env = environment()
+gpiod_h_p = meson.project_source_root() / '@0@'.format(gpiod_h[0])
+cargo_env.set('GPIOD_CARGO_LIB_SOURCE_DEP', gpiod_h_p)
+cargo_env.set('GPIOD_CARGO_LIB_HEADER_DEP', gpiod_h_p)
+cargo_env.set('GPIOD_CARGO_LIB_LINK_DIR', meson.project_build_root() / 'lib')
+gpiosim_h_p = meson.project_source_root() / '@0@'.format(gpiosim_h[0])
+cargo_env.set('GPIOD_CARGO_SIM_SOURCE_DEP', gpiosim_h_p)
+cargo_env.set('GPIOD_CARGO_SIM_HEADER_DEP', gpiosim_h_p)
+cargo_env.set('GPIOD_CARGO_SIM_LINK_DIR', meson.project_build_root() / 'tests' / 'gpiosim')
+
+cargo_build = custom_target('cargo-build',
+			    input: 'Cargo.toml',
+			    output: 'cargo-build',
+			    env: cargo_env,
+			    command: cargo_build_cmd,
+			    build_by_default: true,
+			    install: false)
diff --git a/include/meson.build b/include/meson.build
new file mode 100644
index 000000000000..ca3337e5990f
--- /dev/null
+++ b/include/meson.build
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+gpiod_includes = include_directories('.')
+
+gpiod_h = files('gpiod.h')
+install_headers(gpiod_h)
diff --git a/lib/meson.build b/lib/meson.build
new file mode 100644
index 000000000000..159a176b0130
--- /dev/null
+++ b/lib/meson.build
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+gpiod_abi_version = '2.2.1'
+
+gpiod = library('gpiod',
+		'chip.c',
+		'chip-info.c',
+		'edge-event.c',
+		'info-event.c',
+		'internal.c',
+		'line-config.c',
+		'line-info.c',
+		'line-request.c',
+		'line-settings.c',
+		'misc.c',
+		'request-config.c',
+		c_args: ['-include', '@0@'.format(config_h)],
+		include_directories: gpiod_includes,
+		gnu_symbol_visibility: 'hidden',
+		version: gpiod_abi_version,
+		install: true)
+
+pkg.generate(gpiod,
+	     name: 'libgpiod',
+	     description: 'Library and tools for the Linux GPIO chardev')
+
+gpiod_dep = declare_dependency(link_with: gpiod,
+			       include_directories: gpiod_includes,
+			       version: gpiod_abi_version)
diff --git a/man/meson.build b/man/meson.build
new file mode 100644
index 000000000000..8430429932e9
--- /dev/null
+++ b/man/meson.build
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+if get_option('documentation').contains('man')
+    help2man = find_program('help2man')
+    genmanpage = [ help2man,
+		   '@INPUT@',
+		   '--include=@CURRENT_SOURCE_DIR@/template',
+		   '--output=@OUTPUT@',
+		   '--no-info' ]
+    man1 = get_option('prefix') / get_option('mandir') / 'man1'
+    foreach t : tools
+	custom_target('@0@.1'.format(t.name()),
+		      input: t,
+		      output: '@BASENAME@.1',
+		      depend_files: 'template',
+		      command: genmanpage,
+		      install: true,
+		      install_dir: man1)
+    endforeach
+endif
diff --git a/meson.build b/meson.build
new file mode 100644
index 000000000000..02f355aae50b
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+project('libgpiod', 'c',
+	default_options: [ 'buildtype=debugoptimized',
+			   'warning_level=2',
+			   'c_std=gnu99',
+			   'cpp_std=gnu++17',
+			   'default_library=both' ],
+	version: '2.0.0',
+	license: 'LGPL-2.1-or-later',
+	meson_version: '>=0.58.2')
+
+add_project_arguments('-D_GNU_SOURCE', language: 'c')
+
+pkg = import('pkgconfig')
+
+cc = meson.get_compiler('c')
+
+version = meson.project_version().split('.')
+extra_version = '.'.join([version[0], version[1]]) + '-devel'
+config = configuration_data()
+config.set_quoted('GPIOD_VERSION_STR', extra_version)
+config_h = configure_file(output: 'config.h', configuration: config)
+
+# TODO: Deal with AC_FUNC_MALLOC
+
+lib_header_deps = [ 'getopt.h',
+		    'dirent.h',
+		    'sys/poll.h',
+		    'sys/sysmacros.h',
+		    'linux/version.h',
+		    'linux/const.h',
+		    'linux/ioctl.h',
+		    'linux/types.h' ]
+
+foreach h : lib_header_deps
+    if not cc.has_header(h)
+	error(f'@h@ not found (needed to build the library)')
+    endif
+endforeach
+
+lib_function_deps = { 'ioctl' : '#include <sys/ioctl.h>',
+		      'asprintf' : '#include <stdio.h>',
+		      'scandir' : '#include <dirent.h>',
+		      'alphasort' : '#include <dirent.h>',
+		      'ppoll' : '#include <poll.h>',
+		      'realpath' : '#include <stdlib.h>' }
+
+foreach fn, prefix : lib_function_deps
+    if not cc.has_function(fn, prefix: prefix, args: '-D_GNU_SOURCE')
+	error(f'@fn@ not found (needed to build the library)')
+    endif
+endforeach
+
+subdir('include')
+subdir('lib')
+
+if get_option('documentation').contains('inline')
+    doxygen = find_program('doxygen')
+    find_program('dot') # Required by doxygen
+    doc_dir = meson.current_build_dir()
+    doxyconf = configuration_data()
+    doxyconf.set('VERSION_STR', extra_version)
+    doxyconf.set('DOC_DIR', doc_dir)
+    doxyconf.set('top_srcdir', meson.current_source_dir())
+    doxyfile = configure_file(input: 'Doxyfile.in',
+			      output: 'Doxyfile',
+			      configuration: doxyconf)
+    doxygen_install_dir = get_option('datadir') / 'doc' / meson.project_name()
+    custom_target('doxygen',
+		  input: doxyfile,
+		  output: ['html', 'man', 'xml'],
+		  command: [doxygen, doxyfile],
+		  install: true,
+	          install_dir: doxygen_install_dir)
+endif
+
+if get_option('tests')
+    threads_dep = dependency('threads')
+    subdir('tests')
+endif
+
+foreach b : get_option('bindings')
+    subdir('bindings' / b)
+endforeach
+
+if get_option('tools')
+    subdir('tools')
+    subdir('man')
+endif
diff --git a/meson_options.txt b/meson_options.txt
new file mode 100644
index 000000000000..1df374b4a6eb
--- /dev/null
+++ b/meson_options.txt
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2021 IBM Corp.
+
+option('bindings', type: 'array', choices: ['cxx', 'python', 'rust'], description: 'Language bindings for libgpiod', value: [])
+option('documentation', type: 'array', choices: ['man', 'inline'], description: 'Generate documentation for the tools and library', value: ['man'])
+option('examples', type: 'boolean', description: 'enabling building code examples', value: 'false')
+option('gpioset-interactive', type: 'feature', description: 'enable gpioset interactive mode', value: 'auto')
+option('tests', type: 'boolean', description: 'enable libgpiod tests', value: 'false')
+option('tools', type: 'boolean', description: 'enable libgpiod command-line tools', value: 'false')
diff --git a/tests/gpiosim/meson.build b/tests/gpiosim/meson.build
new file mode 100644
index 000000000000..4b99452dc12e
--- /dev/null
+++ b/tests/gpiosim/meson.build
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+kmod_dep = dependency('libkmod', version: '>=18')
+mount_dep = dependency('mount', version: '>=2.33.1')
+
+gpiosim_includes = include_directories('.')
+
+gpiosim_abi_version = '0.0.1'
+gpiosim = library('gpiosim',
+                  'gpiosim.c',
+                  c_args: ['-include', '@0@'.format(config_h)],
+                  dependencies: [kmod_dep, mount_dep],
+                  include_directories: gpiod_includes,
+                  gnu_symbol_visibility: 'hidden',
+                  version: gpiosim_abi_version,
+                  install: true)
+
+gpiosim_dep = declare_dependency(link_with: gpiosim,
+                                 include_directories: gpiosim_includes,
+                                 version: gpiosim_abi_version)
+
+gpiosim_h = files('gpiosim.h')
+install_headers(gpiosim_h)
diff --git a/tests/meson.build b/tests/meson.build
new file mode 100644
index 000000000000..32f7e6c42f12
--- /dev/null
+++ b/tests/meson.build
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+subdir('gpiosim')
+
+glib_dep = dependency('glib-2.0', version: '>=2.50')
+gobject_dep = dependency('gobject-2.0', version: '>=2.50')
+
+executable('gpiod-test',
+	   'gpiod-test.c',
+	   'gpiod-test-helpers.c',
+	   'gpiod-test-sim.c',
+	   'tests-chip.c',
+	   'tests-chip-info.c',
+	   'tests-edge-event.c',
+	   'tests-info-event.c',
+	   'tests-line-config.c',
+	   'tests-line-info.c',
+	   'tests-line-request.c',
+	   'tests-line-settings.c',
+	   'tests-misc.c',
+	   'tests-request-config.c',
+	   c_args: '-DG_LOG_DOMAIN="gpiod-test"',
+	   dependencies: [ glib_dep,
+			   gobject_dep,
+			   gpiod_dep,
+			   gpiosim_dep,
+			   kmod_dep,
+			   threads_dep ],
+	   install: true)
diff --git a/tools/meson.build b/tools/meson.build
new file mode 100644
index 000000000000..f7f1fc9b10c0
--- /dev/null
+++ b/tools/meson.build
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
+if not cc.has_function('daemon', prefix: '#include <unistd.h>', args: '-D_GNU_SOURCE')
+    error(f'@fn@ not found (needed to build tools')
+endif
+
+tools_common_dep = declare_dependency(sources: ['tools-common.c', 'tools-common.h'])
+
+tools_c_args = ['-include', '@0@'.format(config_h)]
+tools_deps = [ gpiod_dep, tools_common_dep ]
+
+tools = []
+
+gpiodetect = executable('gpiodetect',
+			'gpiodetect.c',
+			c_args: tools_c_args,
+			dependencies: tools_deps,
+			install: true)
+tools += gpiodetect
+
+gpioinfo = executable('gpioinfo',
+		      'gpioinfo.c',
+		      c_args: tools_c_args,
+		      dependencies: tools_deps,
+		      install: true)
+tools += gpioinfo
+
+gpioget = executable('gpioget',
+		     'gpioget.c',
+		     c_args: tools_c_args,
+		     dependencies: tools_deps,
+		     install: true)
+tools += gpioget
+
+gpioset_c_args = tools_c_args
+gpioset_deps = tools_deps
+edit_dep = dependency('libedit', version: '>=3.1', required: get_option('gpioset-interactive'))
+if edit_dep.found()
+    gpioset_c_args += '-DGPIOSET_INTERACTIVE'
+    gpioset_deps += edit_dep
+endif
+gpioset = executable('gpioset',
+		     'gpioset.c',
+		     c_args: gpioset_c_args,
+		     dependencies: gpioset_deps,
+		     install: true)
+tools += gpioset
+
+gpiomon = executable('gpiomon',
+		     'gpiomon.c',
+		     c_args: tools_c_args,
+		     dependencies: tools_deps,
+		     install: true)
+tools += gpiomon
+
+gpionotify = executable('gpionotify',
+			'gpionotify.c',
+			c_args: tools_c_args,
+			dependencies: tools_deps,
+			install: true)
+tools += gpionotify
+
+if get_option('tests')
+    install_data('gpio-tools-test',
+		 'gpio-tools-test.bats',
+		 install_dir: get_option('bindir'),
+		 install_mode: 'rwxr-xr-x')
+endif
-- 
2.37.2

