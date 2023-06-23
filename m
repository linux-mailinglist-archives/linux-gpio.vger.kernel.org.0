Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB0473AF80
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjFWEkE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjFWEkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:40:02 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5BA2128
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:59 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-3f9eea9d0a1so3771951cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495198; x=1690087198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N8+i6cDajhzbtCQrXq/0cc1Y/3j3/6u3W3lCYEaJgQ=;
        b=EsGuyTmdDjGBgTRFduduAiXdmUVNxrJTN9pgclkm5uUXsMICV2Ku0TVSbZJivFV7Wv
         6DnJdffNHzHipKxuPGwtutGg4izpC71pfqTs98np7u3lApl01YMLWcdsEVOrfRntLO7Q
         6APSFO5fJXjhiee8ge/xedUttVfnypxWX8Pvcv2SeojqpyVk5f/Wn+5zfQuLUuf+L0S+
         jmjNDOgmtcu0lboxj9GYmJEaGtKlI7yTnmbnSYPrzD6z/WrIpqz95IRJLj6+ViI9NtHl
         1s4vHesY9c1uXu/2RjuBMpY4cFN8dR5LG7Xm3BZA2Ndthxkhik8wl+bEbtNwwA5OwLnv
         OUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495198; x=1690087198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N8+i6cDajhzbtCQrXq/0cc1Y/3j3/6u3W3lCYEaJgQ=;
        b=U6RvPMwOMIJS0kW6DwBwwJjn2vQZ0UnjAXjqty8749GjrJqPVDN++TAGc0glqDQp91
         YiNUuKh2e8574WfEWoY8zfeNTv5uoHSTKaY/iXfQ36bwfAppAcRDqzMeAbt7cFxC+kDp
         LGQVdQEOFty8YyZ4+Ac+k4n5x3smlb2XeoyQq6gQXVTRU0PMC2ReZTLWZaRP2xfr4HPP
         54pLaMgpo5fOEYL6AfL6rQKebUd5kL7tdUrUFe4YuNnHp4K992bYe2tAy1QCCgML9OBs
         gzYnQbHUfQB3rDdQvvt+MdBSNfnw0eviynEIXjJY9IDm2dnE7KP9FLcBXmvwJW0JhVqB
         IeEg==
X-Gm-Message-State: AC+VfDz4OLs2HZXO5H3zV5sNlQYxFRDsOHZ+sDDJWw0rjIKYI+EHGjeu
        k8sK3BETjoSO/jrvpvX+QquliVKvMvU=
X-Google-Smtp-Source: ACHHUZ4Ryiu7Mju9Zd6Y67zjEZiHDGRCq6cJAVAc81LAudv7a7tipOXK5BCPKCdrlTCS0POlo2SyNg==
X-Received: by 2002:a05:622a:13cd:b0:3ff:1ef7:9d03 with SMTP id p13-20020a05622a13cd00b003ff1ef79d03mr14642244qtk.63.1687495197942;
        Thu, 22 Jun 2023 21:39:57 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:39:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 4/8] bindings: cxx: examples: replace tools examples with use case examples
Date:   Fri, 23 Jun 2023 12:38:57 +0800
Message-ID: <20230623043901.16764-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace tool examples with use case examples drawn from the tools.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/examples/.gitignore              | 16 +++--
 bindings/cxx/examples/Makefile.am             | 42 +++++++-----
 bindings/cxx/examples/find_line_by_name.cpp   | 42 ++++++++++++
 bindings/cxx/examples/get_chip_info.cpp       | 27 ++++++++
 bindings/cxx/examples/get_line_info.cpp       | 39 +++++++++++
 .../cxx/examples/get_multiple_line_values.cpp | 40 ++++++++++++
 bindings/cxx/examples/gpiodetectcxx.cpp       | 30 ---------
 bindings/cxx/examples/gpiofindcxx.cpp         | 32 ---------
 bindings/cxx/examples/gpiogetcxx.cpp          | 40 ------------
 bindings/cxx/examples/gpioinfocxx.cpp         | 61 -----------------
 bindings/cxx/examples/gpiomoncxx.cpp          | 65 -------------------
 bindings/cxx/examples/gpionotifycxx.cpp       | 55 ----------------
 bindings/cxx/examples/gpiosetcxx.cpp          | 53 ---------------
 .../examples/reconfigure_input_to_output.cpp  | 56 ++++++++++++++++
 .../examples/toggle_multiple_line_values.cpp  | 63 ++++++++++++++++++
 bindings/cxx/examples/watch_line_info.cpp     | 49 ++++++++++++++
 bindings/cxx/examples/watch_line_rising.cpp   | 64 ++++++++++++++++++
 .../examples/watch_multiple_line_values.cpp   | 60 +++++++++++++++++
 18 files changed, 473 insertions(+), 361 deletions(-)
 create mode 100644 bindings/cxx/examples/find_line_by_name.cpp
 create mode 100644 bindings/cxx/examples/get_chip_info.cpp
 create mode 100644 bindings/cxx/examples/get_line_info.cpp
 create mode 100644 bindings/cxx/examples/get_multiple_line_values.cpp
 delete mode 100644 bindings/cxx/examples/gpiodetectcxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiofindcxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiogetcxx.cpp
 delete mode 100644 bindings/cxx/examples/gpioinfocxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiomoncxx.cpp
 delete mode 100644 bindings/cxx/examples/gpionotifycxx.cpp
 delete mode 100644 bindings/cxx/examples/gpiosetcxx.cpp
 create mode 100644 bindings/cxx/examples/reconfigure_input_to_output.cpp
 create mode 100644 bindings/cxx/examples/toggle_multiple_line_values.cpp
 create mode 100644 bindings/cxx/examples/watch_line_info.cpp
 create mode 100644 bindings/cxx/examples/watch_line_rising.cpp
 create mode 100644 bindings/cxx/examples/watch_multiple_line_values.cpp

diff --git a/bindings/cxx/examples/.gitignore b/bindings/cxx/examples/.gitignore
index 268b3f6..0f9b39e 100644
--- a/bindings/cxx/examples/.gitignore
+++ b/bindings/cxx/examples/.gitignore
@@ -1,14 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
-gpiodetectcxx
-gpiofindcxx
-gpiogetcxx
-gpioinfocxx
-gpiomoncxx
-gpionotifycxx
-gpiosetcxx
 async_watch_line_value
+find_line_by_name
+get_chip_info
+get_line_info
 get_line_value
+get_multiple_line_values
+reconfigure_input_to_output
 toggle_line_value
+toggle_multiple_line_values
+watch_line_info
+watch_line_rising
 watch_line_value
+watch_multiple_line_values
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index 0213973..64ced20 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -6,36 +6,42 @@ AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17
 AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
 
 noinst_PROGRAMS = \
-	gpiodetectcxx \
-	gpiofindcxx \
-	gpiogetcxx \
-	gpioinfocxx \
-	gpiomoncxx \
-	gpionotifycxx \
-	gpiosetcxx \
 	async_watch_line_value \
+	find_line_by_name \
+	get_chip_info \
+	get_line_info \
 	get_line_value \
+	get_multiple_line_values \
+	reconfigure_input_to_output \
 	toggle_line_value \
-	watch_line_value
+	toggle_multiple_line_values \
+	watch_line_info \
+	watch_line_rising \
+	watch_line_value \
+	watch_multiple_line_values
 
-gpiodetectcxx_SOURCES = gpiodetectcxx.cpp
+async_watch_line_value_SOURCES = async_watch_line_value.cpp
 
-gpiofindcxx_SOURCES = gpiofindcxx.cpp
+find_line_by_name_SOURCES = find_line_by_name.cpp
 
-gpiogetcxx_SOURCES = gpiogetcxx.cpp
+get_chip_info_SOURCES = get_chip_info.cpp
 
-gpioinfocxx_SOURCES = gpioinfocxx.cpp
+get_line_info_SOURCES = get_line_info.cpp
 
-gpiomoncxx_SOURCES = gpiomoncxx.cpp
+get_line_value_SOURCES = get_line_value.cpp
 
-gpionotifycxx_SOURCES = gpionotifycxx.cpp
+get_multiple_line_values_SOURCES = get_multiple_line_values.cpp
 
-gpiosetcxx_SOURCES = gpiosetcxx.cpp
+reconfigure_input_to_output_SOURCES = reconfigure_input_to_output.cpp
 
-async_watch_line_value_SOURCES = async_watch_line_value.cpp
+toggle_line_value_SOURCES = toggle_line_value.cpp
 
-get_line_value_SOURCES = get_line_value.cpp
+toggle_multiple_line_values_SOURCES = toggle_multiple_line_values.cpp
 
-toggle_line_value_SOURCES = toggle_line_value.cpp
+watch_line_info_SOURCES = watch_line_info.cpp
 
 watch_line_value_SOURCES = watch_line_value.cpp
+
+watch_line_rising_SOURCES = watch_line_rising.cpp
+
+watch_multiple_line_values_SOURCES = watch_multiple_line_values.cpp
diff --git a/bindings/cxx/examples/find_line_by_name.cpp b/bindings/cxx/examples/find_line_by_name.cpp
new file mode 100644
index 0000000..4529ed6
--- /dev/null
+++ b/bindings/cxx/examples/find_line_by_name.cpp
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of finding a line with the given name. */
+
+#include <cstdlib>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <iostream>
+
+namespace
+{
+
+/* Example configuration - customize to suit your situation */
+const ::std::string line_name = "GPIO19";
+
+} /* namespace */
+
+int main(void)
+{
+	/*
+	 * Names are not guaranteed unique, so this finds the first line with
+	 * the given name.
+	 */
+	for (const auto &entry :
+	     ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path())) {
+			::gpiod::chip chip(entry.path());
+
+			auto offset = chip.get_line_offset_from_name(line_name);
+			if (offset >= 0) {
+				::std::cout << line_name << ": "
+					    << chip.get_info().name() << " "
+					    << offset << ::std::endl;
+				return EXIT_SUCCESS;
+			}
+		}
+	}
+	::std::cout << "line '" << line_name << "' not found" << ::std::endl;
+
+	return EXIT_FAILURE;
+}
diff --git a/bindings/cxx/examples/get_chip_info.cpp b/bindings/cxx/examples/get_chip_info.cpp
new file mode 100644
index 0000000..073a6c3
--- /dev/null
+++ b/bindings/cxx/examples/get_chip_info.cpp
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading the info for a chip. */
+
+#include <cstdlib>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <iostream>
+
+namespace {
+
+/* Example configuration - customize to suit your situation */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+
+} /* namespace */
+
+int main(void)
+{
+	::gpiod::chip chip(chip_path);
+	auto info = chip.get_info();
+
+	::std::cout << info.name() << " [" << info.label() << "] ("
+		    << info.num_lines() << " lines)" << ::std::endl;
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/get_line_info.cpp b/bindings/cxx/examples/get_line_info.cpp
new file mode 100644
index 0000000..f2f071e
--- /dev/null
+++ b/bindings/cxx/examples/get_line_info.cpp
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading the info for a line. */
+
+#include <cstdlib>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <iomanip>
+#include <iostream>
+
+namespace {
+
+/* Example configuration - customize to suit your situation */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offset line_offset = 3;
+
+} /* namespace */
+
+int main(void)
+{
+	auto chip = ::gpiod::chip(chip_path);
+	auto info = chip.get_line_info(line_offset);
+
+	::std::cout << "line " << ::std::setw(3) << info.offset() << ": "
+		    << ::std::setw(12)
+		    << (info.name().empty() ? "unnamed" : info.name()) << " "
+		    << ::std::setw(12)
+		    << (info.consumer().empty() ? "unused" : info.consumer())
+		    << " " << ::std::setw(8)
+		    << (info.direction() == ::gpiod::line::direction::INPUT ?
+				"input" :
+				"output")
+		    << " " << ::std::setw(10)
+		    << (info.active_low() ? "active-low" : "active-high")
+		    << ::std::endl;
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/get_multiple_line_values.cpp b/bindings/cxx/examples/get_multiple_line_values.cpp
new file mode 100644
index 0000000..d1f22e7
--- /dev/null
+++ b/bindings/cxx/examples/get_multiple_line_values.cpp
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading multiple lines. */
+
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iostream>
+
+namespace {
+
+/* Example configuration - customize to suit your situation */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offsets line_offsets = { 5, 3, 7 };
+
+} /* namespace */
+
+int main(void)
+{
+	auto request = ::gpiod::chip(chip_path)
+			       .prepare_request()
+			       .set_consumer("get-multiple-line-values")
+			       .add_line_settings(
+				       line_offsets,
+				       ::gpiod::line_settings().set_direction(
+					       ::gpiod::line::direction::INPUT))
+			       .do_request();
+
+	auto values = request.get_values();
+
+	for (size_t i = 0; i < line_offsets.size(); i++)
+		::std::cout << line_offsets[i] << "="
+			    << (values[i] == ::gpiod::line::value::ACTIVE ?
+					"Active" :
+					"Inactive")
+			    << ' ';
+	::std::cout << ::std::endl;
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/gpiodetectcxx.cpp b/bindings/cxx/examples/gpiodetectcxx.cpp
deleted file mode 100644
index 7dbb0e0..0000000
--- a/bindings/cxx/examples/gpiodetectcxx.cpp
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* C++ reimplementation of the gpiodetect tool. */
-
-#include <cstdlib>
-#include <filesystem>
-#include <gpiod.hpp>
-#include <iostream>
-
-int main(int argc, char **argv)
-{
-	if (argc != 1) {
-		::std::cerr << "usage: " << argv[0] << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
-		if (::gpiod::is_gpiochip_device(entry.path())) {
-			::gpiod::chip chip(entry.path());
-			auto info = chip.get_info();
-
-			::std::cout << info.name() << " [" <<
-				       info.label() << "] (" <<
-				       info.num_lines() << " lines)" << ::std::endl;
-		}
-	}
-
-	return EXIT_SUCCESS;
-}
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
deleted file mode 100644
index cd36be7..0000000
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* C++ reimplementation of the gpiofind tool. */
-
-#include <gpiod.hpp>
-
-#include <cstdlib>
-#include <filesystem>
-#include <iostream>
-
-int main(int argc, char **argv)
-{
-	if (argc != 2) {
-		::std::cerr << "usage: " << argv[0] << " <line name>" << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
-		if (::gpiod::is_gpiochip_device(entry.path())) {
-			::gpiod::chip chip(entry.path());
-
-			auto offset = chip.get_line_offset_from_name(argv[1]);
-			if (offset >= 0) {
-				::std::cout << chip.get_info().name() << " " << offset << ::std::endl;
-				return EXIT_SUCCESS;
-			}
-		}
-	}
-
-	return EXIT_FAILURE;
-}
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
deleted file mode 100644
index b0d4a7d..0000000
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ /dev/null
@@ -1,40 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* Simplified C++ reimplementation of the gpioget tool. */
-
-#include <gpiod.hpp>
-
-#include <cstdlib>
-#include <iostream>
-
-int main(int argc, char **argv)
-{
-	if (argc < 3) {
-		::std::cerr << "usage: " << argv[0] << " <chip> <line_offset0> ..." << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	::gpiod::line::offsets offsets;
-
-	for (int i = 2; i < argc; i++)
-		offsets.push_back(::std::stoul(argv[i]));
-
-	auto request = ::gpiod::chip(argv[1])
-		.prepare_request()
-		.set_consumer("gpiogetcxx")
-		.add_line_settings(
-			offsets,
-			::gpiod::line_settings()
-				.set_direction(::gpiod::line::direction::INPUT)
-		)
-		.do_request();
-
-	auto vals = request.get_values();
-
-	for (auto& it: vals)
-		::std::cout << (it == ::gpiod::line::value::ACTIVE ? "1" : "0") << ' ';
-	::std::cout << ::std::endl;
-
-	return EXIT_SUCCESS;
-}
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
deleted file mode 100644
index 3612092..0000000
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* Simplified C++ reimplementation of the gpioinfo tool. */
-
-#include <gpiod.hpp>
-
-#include <cstdlib>
-#include <filesystem>
-#include <iostream>
-
-namespace {
-
-void show_chip(const ::gpiod::chip& chip)
-{
-	auto info = chip.get_info();
-
-	::std::cout << info.name() << " - " << info.num_lines() << " lines:" << ::std::endl;
-
-	for (unsigned int offset = 0; offset < info.num_lines(); offset++) {
-		auto info = chip.get_line_info(offset);
-
-		::std::cout << "\tline ";
-		::std::cout.width(3);
-		::std::cout << info.offset() << ": ";
-
-		::std::cout.width(12);
-		::std::cout << (info.name().empty() ? "unnamed" : info.name());
-		::std::cout << " ";
-
-		::std::cout.width(12);
-		::std::cout << (info.consumer().empty() ? "unused" : info.consumer());
-		::std::cout << " ";
-
-		::std::cout.width(8);
-		::std::cout << (info.direction() == ::gpiod::line::direction::INPUT ? "input" : "output");
-		::std::cout << " ";
-
-		::std::cout.width(10);
-		::std::cout << (info.active_low() ? "active-low" : "active-high");
-
-		::std::cout << ::std::endl;
-	}
-}
-
-} /* namespace */
-
-int main(int argc, char **argv)
-{
-	if (argc != 1) {
-		::std::cerr << "usage: " << argv[0] << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
-		if (::gpiod::is_gpiochip_device(entry.path()))
-			show_chip(::gpiod::chip(entry.path()));
-	}
-
-	return EXIT_SUCCESS;
-}
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
deleted file mode 100644
index 8325bf8..0000000
--- a/bindings/cxx/examples/gpiomoncxx.cpp
+++ /dev/null
@@ -1,65 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* Simplified C++ reimplementation of the gpiomon tool. */
-
-#include <cstdlib>
-#include <gpiod.hpp>
-#include <iostream>
-
-namespace {
-
-void print_event(const ::gpiod::edge_event& event)
-{
-	if (event.type() == ::gpiod::edge_event::event_type::RISING_EDGE)
-		::std::cout << " RISING EDGE";
-	else
-		::std::cout << "FALLING EDGE";
-
-	::std::cout << " ";
-
-	::std::cout << event.timestamp_ns() / 1000000000;
-	::std::cout << ".";
-	::std::cout << event.timestamp_ns() % 1000000000;
-
-	::std::cout << " line: " << event.line_offset();
-
-	::std::cout << ::std::endl;
-}
-
-} /* namespace */
-
-int main(int argc, char **argv)
-{
-	if (argc < 3) {
-		::std::cout << "usage: " << argv[0] << " <chip> <offset0> ..." << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	::gpiod::line::offsets offsets;
-	offsets.reserve(argc - 2);
-	for (int i = 2; i < argc; i++)
-		offsets.push_back(::std::stoul(argv[i]));
-
-	auto request = ::gpiod::chip(argv[1])
-		.prepare_request()
-		.set_consumer("gpiomoncxx")
-		.add_line_settings(
-			offsets,
-			::gpiod::line_settings()
-				.set_direction(::gpiod::line::direction::INPUT)
-				.set_edge_detection(::gpiod::line::edge::BOTH)
-		)
-		.do_request();
-
-	::gpiod::edge_event_buffer buffer;
-
-	for (;;) {
-		request.read_edge_events(buffer);
-
-		for (const auto& event: buffer)
-			print_event(event);
-	}
-
-	return EXIT_SUCCESS;
-}
diff --git a/bindings/cxx/examples/gpionotifycxx.cpp b/bindings/cxx/examples/gpionotifycxx.cpp
deleted file mode 100644
index 668734c..0000000
--- a/bindings/cxx/examples/gpionotifycxx.cpp
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-/* Simplified C++ reimplementation of the gpionotify tool. */
-
-#include <cstdlib>
-#include <gpiod.hpp>
-#include <iostream>
-
-namespace {
-
-void print_event(const ::gpiod::info_event& event)
-{
-	switch (event.type()) {
-	case ::gpiod::info_event::event_type::LINE_REQUESTED:
-		::std::cout << "LINE REQUESTED";
-		break;
-	case ::gpiod::info_event::event_type::LINE_RELEASED:
-		::std::cout << "LINE RELEASED";
-		break;
-	case ::gpiod::info_event::event_type::LINE_CONFIG_CHANGED:
-		::std::cout << "CONFIG CHANGED";
-		break;
-	}
-
-	::std::cout << " ";
-
-	::std::cout << event.timestamp_ns() / 1000000000;
-	::std::cout << ".";
-	::std::cout << event.timestamp_ns() % 1000000000;
-
-	::std::cout << " line: " << event.get_line_info().offset();
-
-	::std::cout << ::std::endl;
-}
-
-} /* namespace */
-
-int main(int argc, char **argv)
-{
-	if (argc < 3) {
-		::std::cout << "usage: " << argv[0] << " <chip> <offset0> ..." << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	::gpiod::chip chip(argv[1]);
-
-	for (int i = 2; i < argc; i++)
-		chip.watch_line_info(::std::stoul(argv[i]));
-
-	for (;;)
-		print_event(chip.read_info_event());
-
-	return EXIT_SUCCESS;
-}
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
deleted file mode 100644
index f46cb85..0000000
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-/* Simplified C++ reimplementation of the gpioset tool. */
-
-#include <gpiod.hpp>
-
-#include <cstdlib>
-#include <iostream>
-
-int main(int argc, char **argv)
-{
-	if (argc < 3) {
-		::std::cerr << "usage: " << argv[0] <<
-			       " <chip> <line_offset0>=<value0> ..." << ::std::endl;
-		return EXIT_FAILURE;
-	}
-
-	::gpiod::line::offsets offsets;
-	::gpiod::line::values values;
-
-	for (int i = 2; i < argc; i++) {
-		::std::string arg(argv[i]);
-
-		size_t pos = arg.find('=');
-
-		::std::string offset(arg.substr(0, pos));
-		::std::string value(arg.substr(pos + 1, ::std::string::npos));
-
-		if (offset.empty() || value.empty())
-			throw ::std::invalid_argument("invalid offset=value mapping: " +
-						      ::std::string(argv[i]));
-
-		offsets.push_back(::std::stoul(offset));
-		values.push_back(::std::stoul(value) ? ::gpiod::line::value::ACTIVE :
-						       ::gpiod::line::value::INACTIVE);
-	}
-
-	auto request = ::gpiod::chip(argv[1])
-		.prepare_request()
-		.set_consumer("gpiosetcxx")
-		.add_line_settings(
-			offsets,
-			::gpiod::line_settings()
-				.set_direction(::gpiod::line::direction::OUTPUT)
-		)
-		.set_output_values(values)
-		.do_request();
-
-	::std::cin.get();
-
-	return EXIT_SUCCESS;
-}
diff --git a/bindings/cxx/examples/reconfigure_input_to_output.cpp b/bindings/cxx/examples/reconfigure_input_to_output.cpp
new file mode 100644
index 0000000..7d7e75c
--- /dev/null
+++ b/bindings/cxx/examples/reconfigure_input_to_output.cpp
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of requesting a line intended for bi-directional use as input and then switching to output. */
+
+#include <cstdlib>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <iostream>
+
+namespace
+{
+
+/* Example configuration - customize to suit your situation */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offset line_offset = 5;
+
+} /* namespace */
+
+int main(void)
+{
+	/* request the line initially as an input */
+	auto request = ::gpiod::chip(chip_path)
+			       .prepare_request()
+			       .set_consumer("reconfigure-input-to-output")
+			       .add_line_settings(
+				       line_offset,
+				       ::gpiod::line_settings().set_direction(
+					       ::gpiod::line::direction::INPUT))
+			       .do_request();
+
+	/* read the current line value */
+	::std::cout << line_offset << "="
+		    << (request.get_value(line_offset) ==
+					::gpiod::line::value::ACTIVE ?
+				"Active" :
+				"Inactive")
+		    << " (input)" << ::std::endl;
+
+	/* switch the line to an output and drive it low */
+	request.reconfigure_lines(::gpiod::line_config().add_line_settings(
+		line_offset,
+		::gpiod::line_settings()
+			.set_direction(::gpiod::line::direction::OUTPUT)
+			.set_output_value(::gpiod::line::value::INACTIVE)));
+
+	/* report the current driven value */
+	::std::cout << line_offset << "="
+		    << (request.get_value(line_offset) ==
+					::gpiod::line::value::ACTIVE ?
+				"Active" :
+				"Inactive")
+		    << " (output)" << ::std::endl;
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/toggle_multiple_line_values.cpp b/bindings/cxx/examples/toggle_multiple_line_values.cpp
new file mode 100644
index 0000000..a5b84bf
--- /dev/null
+++ b/bindings/cxx/examples/toggle_multiple_line_values.cpp
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of toggling multiple lines. */
+
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iostream>
+#include <thread>
+
+namespace {
+
+/* Example configuration - customize to suit your situation */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offsets line_offsets = { 5, 3, 7 };
+
+::gpiod::line::value toggle_value(::gpiod::line::value v)
+{
+	return (v == ::gpiod::line::value::ACTIVE) ?
+		       ::gpiod::line::value::INACTIVE :
+		       ::gpiod::line::value::ACTIVE;
+}
+
+void toggle_values(::gpiod::line::values &values)
+{
+	for (size_t i = 0; i < values.size(); i++)
+		values[i] = toggle_value(values[i]);
+}
+
+void print_values(::gpiod::line::offsets const &offsets,
+		  ::gpiod::line::values const &values)
+{
+	for (size_t i = 0; i < offsets.size(); i++)
+		::std::cout << offsets[i] << "=" << values[i] << ' ';
+	::std::cout << ::std::endl;
+}
+
+} /* namespace */
+
+int main(void)
+{
+	::gpiod::line::values values = { ::gpiod::line::value::ACTIVE,
+					 ::gpiod::line::value::ACTIVE,
+					 ::gpiod::line::value::INACTIVE };
+
+	auto request =
+		::gpiod::chip(chip_path)
+			.prepare_request()
+			.set_consumer("toggle-multiple-line-values")
+			.add_line_settings(
+				line_offsets,
+				::gpiod::line_settings().set_direction(
+					::gpiod::line::direction::OUTPUT))
+			.set_output_values(values)
+			.do_request();
+
+	for (;;) {
+		print_values(line_offsets, values);
+		std::this_thread::sleep_for(std::chrono::seconds(1));
+		toggle_values(values);
+		request.set_values(line_offsets, values);
+	}
+}
diff --git a/bindings/cxx/examples/watch_line_info.cpp b/bindings/cxx/examples/watch_line_info.cpp
new file mode 100644
index 0000000..fe37f18
--- /dev/null
+++ b/bindings/cxx/examples/watch_line_info.cpp
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for requests on particular lines. */
+
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iomanip>
+#include <iostream>
+
+namespace {
+
+/* Example configuration - customize to suit your situation. */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offsets line_offsets = { 5, 3, 7 };
+
+const char *event_type(const ::gpiod::info_event &event)
+{
+	switch (event.type()) {
+	case ::gpiod::info_event::event_type::LINE_REQUESTED:
+		return "Requested";
+	case ::gpiod::info_event::event_type::LINE_RELEASED:
+		return "Released";
+	case ::gpiod::info_event::event_type::LINE_CONFIG_CHANGED:
+		return "Reconfig";
+	default:
+		return "Unknown";
+	}
+}
+
+} /* namespace */
+
+int main(void)
+{
+	::gpiod::chip chip(chip_path);
+	for (auto offset :line_offsets) {
+		chip.watch_line_info(offset);
+	}
+
+	for (;;) {
+		/* Blocks until at least one event is available */
+		auto event = chip.read_info_event();
+		::std::cout << "line: " << event.get_line_info().offset() << " "
+			    << ::std::setw(9) << ::std::left
+			    << event_type(event) << " "
+			    << event.timestamp_ns() / 1000000000 << "."
+			    << event.timestamp_ns() % 1000000000 << ::std::endl;
+	}
+}
diff --git a/bindings/cxx/examples/watch_line_rising.cpp b/bindings/cxx/examples/watch_line_rising.cpp
new file mode 100644
index 0000000..d773063
--- /dev/null
+++ b/bindings/cxx/examples/watch_line_rising.cpp
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for rising edges on a single line. */
+
+#include <cstdlib>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <iomanip>
+#include <iostream>
+
+namespace {
+
+/* Example configuration - customize to suit your situation. */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offset line_offset = 5;
+
+const char *edge_event_type_str(const ::gpiod::edge_event &event)
+{
+	switch (event.type()) {
+	case ::gpiod::edge_event::event_type::RISING_EDGE:
+		return "Rising";
+	case ::gpiod::edge_event::event_type::FALLING_EDGE:
+		return "Falling";
+	default:
+		return "Unknown";
+	}
+}
+
+} /* namespace */
+
+int main(void)
+{
+	auto request =
+		::gpiod::chip(chip_path)
+			.prepare_request()
+			.set_consumer("watch-line-value")
+			.add_line_settings(
+				line_offset,
+				::gpiod::line_settings()
+					.set_direction(
+						::gpiod::line::direction::INPUT)
+					.set_edge_detection(
+						::gpiod::line::edge::RISING)
+)
+			.do_request();
+
+	/*
+	 * A larger buffer is an optimisation for reading bursts of events from
+	 * the kernel, but that is not necessary in this case, so 1 is fine.
+	 */
+	::gpiod::edge_event_buffer buffer(1);
+
+	for (;;) {
+		/* Blocks until at least one event is available. */
+		request.read_edge_events(buffer);
+
+		for (const auto &event : buffer)
+			::std::cout << "line: " << event.line_offset()
+				    << "  type: " << ::std::setw(7) << ::std::left << edge_event_type_str(event)
+				    << "  event #" << event.line_seqno()
+				    << ::std::endl;
+	}
+}
diff --git a/bindings/cxx/examples/watch_multiple_line_values.cpp b/bindings/cxx/examples/watch_multiple_line_values.cpp
new file mode 100644
index 0000000..42b7213
--- /dev/null
+++ b/bindings/cxx/examples/watch_multiple_line_values.cpp
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for edges on multiple lines. */
+
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iomanip>
+#include <iostream>
+
+namespace {
+
+/* Example configuration - customize to suit your situation */
+const ::std::filesystem::path chip_path("/dev/gpiochip0");
+const ::gpiod::line::offsets line_offsets = { 5, 3, 7 };
+
+const char *edge_event_type_str(const ::gpiod::edge_event &event)
+{
+	switch (event.type()) {
+	case ::gpiod::edge_event::event_type::RISING_EDGE:
+		return "Rising";
+	case ::gpiod::edge_event::event_type::FALLING_EDGE:
+		return "Falling";
+	default:
+		return "Unknown";
+	}
+}
+
+} /* namespace */
+
+int main(void)
+{
+	auto request =
+		::gpiod::chip(chip_path)
+			.prepare_request()
+			.set_consumer("watch-multiple-line-values")
+			.add_line_settings(
+				line_offsets,
+				::gpiod::line_settings()
+					.set_direction(
+						::gpiod::line::direction::INPUT)
+					.set_edge_detection(
+						::gpiod::line::edge::BOTH))
+			.do_request();
+
+	::gpiod::edge_event_buffer buffer;
+
+	for (;;) {
+		/* Blocks until at leat one event available */
+		request.read_edge_events(buffer);
+
+		for (const auto &event : buffer)
+			::std::cout << "offset: " << event.line_offset()
+				    << "  type: " << ::std::setw(7)
+				    << ::std::left << edge_event_type_str(event)
+				    << "  event #" << event.global_seqno()
+				    << "  line event #" << event.line_seqno()
+				    << ::std::endl;
+	}
+}
-- 
2.41.0

