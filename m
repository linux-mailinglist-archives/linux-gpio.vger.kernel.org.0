Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44A46794A0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 10:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbjAXJ63 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 04:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233669AbjAXJ61 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 04:58:27 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625E63E0BA
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:58:17 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so13296682wrv.7
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjnBqqOoSTotHXe1Dktv7o9dBcW1wxY6CgsU7qv86yQ=;
        b=uoDQ4yJ6L2nKZpIq2DCW7rvgbVGNA24hb/2ZCQga5rgRHRnqzr4vMgLuCzal2dShJx
         LMkflM1wRT4rEEHPDegGP6sNEIIeS9AQNFDNyouycrifDgDJubBT4Zei2F0svYwftTRC
         5sxfhohhCCj6NdNLK7FOOrwBys5Nt2GP/rUYWciCkXJ3uNn9LhlDCn0cUDNmTTvMjouK
         YuYtN8Wh8jnxt7Qeho3Ji2zxeVfysL5iHsh+xtP29in6ebqGzXB46kiUT2TfeVD6L4eH
         2NfW68E53GUwFoW4t//3NqHBj2geMqhu4P/48CTBJKs5yLeY8PBAusZljKw4QtOGleOF
         hDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjnBqqOoSTotHXe1Dktv7o9dBcW1wxY6CgsU7qv86yQ=;
        b=dPPKCR9n2ja/UhQfX4ECsy1pE6jrzlPwkjsM+tDLGHAQgpOVc0q7gW28mwKMe9Gb2k
         5xeq2eM34N6x06MnxJnLdiXAd9iJ+Ez473JbDvzUlMh7+ZJiCA7jYoyOBj8YNveWLgNa
         mgbF7pMGGyhF6yXPRKipSsj5BfyBS3gaq4Cxu2oDaaTDTImSVq/i3mjp41HTXO184LRv
         cN9wNimtwzyU2Am11IZLSX6brlsvsKwyNtSyVtsprVrcfYD5CVaCjwUXLOiDsXCDxnnx
         CAWr/h6/b8LwLGEwuNyCPnRZwjXCtPsSqO5WNvNSQZ/wRmSC47ifghirVr9jXjhP2YmZ
         iRaQ==
X-Gm-Message-State: AFqh2kpREcw4P4LfS9sqTH4U2p86lzhWLnWXEjmpM/pDyeHKoxE+Kjw2
        /uF6Yd0vonyElmlY/6Pr1Uimvw==
X-Google-Smtp-Source: AMrXdXvA2elRTx3zyHLiHPRKj55z0xv7gW7aKUpHoowYwbbUT9nlB9x7QXMG4UnGdAqvrywyApPBtQ==
X-Received: by 2002:a5d:4e01:0:b0:2bd:e531:8e58 with SMTP id p1-20020a5d4e01000000b002bde5318e58mr23568572wrt.24.1674554295528;
        Tue, 24 Jan 2023 01:58:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9c80:c796:921b:31df])
        by smtp.gmail.com with ESMTPSA id y15-20020adfdf0f000000b00236883f2f5csm1477762wrl.94.2023.01.24.01.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:58:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v4] treewide: unify gpiod_line_config/request_get_offsets() functions
Date:   Tue, 24 Jan 2023 10:58:11 +0100
Message-Id: <20230124095811.112830-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have two functions in the C API that allow users to retrieve a list
of offsets from objects: gpiod_line_request_get_offsets() and
gpiod_line_config_get_offsets(). Even though they serve pretty much the
same purpose, they have different signatures and one of them also
requires the user to free the memory allocated within the libgpiod
library with a non-libgpiod free() function.

Unify them: make them take the array in which to store offsets and the
size of this array. Make them return the number of offsets actually
stored in the array and make them impossible to fail. Change their names
to be more descriptive and in the case of line_config: add a new function
that allows users to get the number of configured offsets.

Update the entire tree to use the new interfaces.

For rust bindings: also unify the line config interface to return a map
of line settings like C++ bindings do instead of having a function to
get settings by offset. A map returned from a single call is easier to
iterate over with a for loop than using an integer and calling the
previous line_settings() method.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v2 -> v3:
- use a custom type for the offset -> Settings mapping (defined as an
  IntMap<line::Settings>)
- add missing '// SAFETY' comments
- apply cargo fmt

v3 -> v4:
- apply missing cargo fmt hints (by using rustfmt)

 bindings/cxx/line-config.cpp                | 18 ++---
 bindings/cxx/line-request.cpp               |  6 +-
 bindings/python/gpiod/ext/request.c         |  8 +--
 bindings/rust/libgpiod/src/lib.rs           |  3 +
 bindings/rust/libgpiod/src/line_config.rs   | 67 +++++++-----------
 bindings/rust/libgpiod/src/line_request.rs  | 11 ++-
 bindings/rust/libgpiod/tests/line_config.rs | 24 ++-----
 configure.ac                                |  1 +
 include/gpiod.h                             | 62 +++++++++++------
 lib/line-config.c                           | 39 +++++------
 lib/line-request.c                          | 23 ++++---
 tests/tests-line-config.c                   | 76 +++++++++++++++------
 tests/tests-line-request.c                  | 49 +++++++++++--
 13 files changed, 232 insertions(+), 155 deletions(-)

diff --git a/bindings/cxx/line-config.cpp b/bindings/cxx/line-config.cpp
index f7f1bfa..3ec99f0 100644
--- a/bindings/cxx/line-config.cpp
+++ b/bindings/cxx/line-config.cpp
@@ -102,31 +102,27 @@ GPIOD_CXX_API line_config& line_config::add_line_settings(const line::offsets& o
 
 GPIOD_CXX_API ::std::map<line::offset, line_settings> line_config::get_line_settings() const
 {
+	::std::size_t num_offsets = ::gpiod_line_config_get_num_configured_offsets(
+								this->_m_priv->config.get());
 	::std::map<line::offset, line_settings> settings_map;
-	::std::size_t num_offsets;
-	unsigned int *offsets_ptr;
-	int ret;
-
-	ret = ::gpiod_line_config_get_offsets(this->_m_priv->config.get(),
-					      &num_offsets, &offsets_ptr);
-	if (ret)
-		throw_from_errno("unable to retrieve line offsets");
+	::std::vector<unsigned int> offsets(num_offsets);
 
 	if (num_offsets == 0)
 		return settings_map;
 
-	::std::unique_ptr<unsigned int, malloc_deleter> offsets(offsets_ptr);
+	::gpiod_line_config_get_configured_offsets(this->_m_priv->config.get(),
+					offsets.data(), num_offsets);
 
 	for (size_t i = 0; i < num_offsets; i++) {
 		line_settings settings;
 
 		settings._m_priv->settings.reset(::gpiod_line_config_get_line_settings(
 							this->_m_priv->config.get(),
-							offsets.get()[i]));
+							offsets[i]));
 		if (!settings._m_priv->settings)
 			throw_from_errno("unable to retrieve line settings");
 
-		settings_map[offsets.get()[i]] = ::std::move(settings);
+		settings_map[offsets[i]] = ::std::move(settings);
 	}
 
 	return settings_map;
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index b52ceaf..b0723c3 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -18,7 +18,7 @@ void line_request::impl::throw_if_released() const
 void line_request::impl::set_request_ptr(line_request_ptr& ptr)
 {
 	this->request = ::std::move(ptr);
-	this->offset_buf.resize(::gpiod_line_request_get_num_lines(this->request.get()));
+	this->offset_buf.resize(::gpiod_line_request_get_num_requested_lines(this->request.get()));
 }
 
 void line_request::impl::fill_offset_buf(const line::offsets& offsets)
@@ -67,7 +67,7 @@ GPIOD_CXX_API ::std::size_t line_request::num_lines() const
 {
 	this->_m_priv->throw_if_released();
 
-	return ::gpiod_line_request_get_num_lines(this->_m_priv->request.get());
+	return ::gpiod_line_request_get_num_requested_lines(this->_m_priv->request.get());
 }
 
 GPIOD_CXX_API line::offsets line_request::offsets() const
@@ -78,7 +78,7 @@ GPIOD_CXX_API line::offsets line_request::offsets() const
 	::std::vector<unsigned int> buf(num_lines);
 	line::offsets offsets(num_lines);
 
-	::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
+	::gpiod_line_request_get_requested_offsets(this->_m_priv->request.get(), buf.data(), buf.size());
 
 	for (unsigned int i = 0; i < num_lines; i++)
 		offsets[i] = buf[i];
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index d3e1448..a32ff8f 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -41,7 +41,7 @@ static PyObject *
 request_num_lines(request_object *self, void *Py_UNUSED(ignored))
 {
 	return PyLong_FromUnsignedLong(
-			gpiod_line_request_get_num_lines(self->request));
+			gpiod_line_request_get_num_requested_lines(self->request));
 }
 
 static PyObject *request_offsets(request_object *self, void *Py_UNUSED(ignored))
@@ -51,13 +51,13 @@ static PyObject *request_offsets(request_object *self, void *Py_UNUSED(ignored))
 	size_t num_lines, i;
 	int ret;
 
-	num_lines = gpiod_line_request_get_num_lines(self->request);
+	num_lines = gpiod_line_request_get_num_requested_lines(self->request);
 
 	offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
 	if (!offsets)
 		return PyErr_NoMemory();
 
-	gpiod_line_request_get_offsets(self->request, offsets);
+	gpiod_line_request_get_requested_offsets(self->request, offsets, num_lines);
 
 	lines = PyList_New(num_lines);
 	if (!lines) {
@@ -365,7 +365,7 @@ PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request,
 	unsigned int *offsets;
 	size_t num_lines;
 
-	num_lines = gpiod_line_request_get_num_lines(request);
+	num_lines = gpiod_line_request_get_num_requested_lines(request);
 
 	req_obj = PyObject_New(request_object, &request_type);
 	if (!req_obj)
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 4abfcf2..9c8fe0c 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -178,6 +178,9 @@ pub mod line {
     /// Maps offset to Value.
     pub type ValueMap = IntMap<Value>;
 
+    /// Maps offsets to Settings
+    pub type SettingsMap = IntMap<Settings>;
+
     impl Value {
         pub fn new(val: gpiod::gpiod_line_value) -> Result<Self> {
             Ok(match val {
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 19dc187..63b809f 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -2,12 +2,11 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use std::os::raw::{c_ulong, c_void};
-use std::slice;
+use std::os::raw::c_ulong;
 
 use super::{
     gpiod,
-    line::{Offset, Settings},
+    line::{Offset, Settings, SettingsMap},
     Error, OperationType, Result,
 };
 
@@ -77,51 +76,37 @@ impl Config {
         }
     }
 
-    /// Get line settings for offset.
-    pub fn line_settings(&self, offset: Offset) -> Result<Settings> {
-        // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
-        let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, offset) };
-
-        if settings.is_null() {
-            return Err(Error::OperationFailed(
-                OperationType::LineConfigGetSettings,
-                errno::errno(),
-            ));
-        }
-
-        Ok(Settings::new_with_settings(settings))
-    }
+    /// Get a mapping of offsets to line settings stored by this object.
+    pub fn line_settings(&self) -> Result<SettingsMap> {
+        let mut map = SettingsMap::new();
+        // SAFETY: gpiod_line_config is guaranteed to be valid here
+        let num_lines = unsafe { gpiod::gpiod_line_config_get_num_configured_offsets(self.config) };
+        let mut offsets = vec![0; num_lines as usize];
 
-    /// Get configured offsets.
-    pub fn offsets(&self) -> Result<Vec<Offset>> {
-        let mut num: u64 = 0;
-        let mut ptr: *mut Offset = std::ptr::null_mut();
-
-        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
-        // as it is not explicitly freed with `free()`.
-        let ret = unsafe {
-            gpiod::gpiod_line_config_get_offsets(
+        // SAFETY: gpiod_line_config is guaranteed to be valid here.
+        let num_stored = unsafe {
+            gpiod::gpiod_line_config_get_configured_offsets(
                 self.config,
-                &mut num as *mut _ as *mut _,
-                &mut ptr,
+                offsets.as_mut_ptr(),
+                num_lines,
             )
         };
 
-        if ret == -1 {
-            return Err(Error::OperationFailed(
-                OperationType::LineConfigGetOffsets,
-                errno::errno(),
-            ));
+        for offset in &offsets[0..num_stored as usize] {
+            // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
+            let settings =
+                unsafe { gpiod::gpiod_line_config_get_line_settings(self.config, *offset) };
+            if settings.is_null() {
+                return Err(Error::OperationFailed(
+                    OperationType::LineConfigGetSettings,
+                    errno::errno(),
+                ));
+            }
+
+            map.insert(*offset as u64, Settings::new_with_settings(settings));
         }
 
-        // SAFETY: The `ptr` array returned by libgpiod is guaranteed to live as long
-        // as it is not explicitly freed with `free()`.
-        let offsets = unsafe { slice::from_raw_parts(ptr as *const Offset, num as usize).to_vec() };
-
-        // SAFETY: The `ptr` array is guaranteed to be valid here.
-        unsafe { libc::free(ptr as *mut c_void) };
-
-        Ok(offsets)
+        Ok(map)
     }
 }
 
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index d9e041c..29aa574 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -28,7 +28,7 @@ impl Request {
     /// Get the number of lines in the request.
     pub fn num_lines(&self) -> usize {
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_request_get_num_lines(self.request) as usize }
+        unsafe { gpiod::gpiod_line_request_get_num_requested_lines(self.request) as usize }
     }
 
     /// Get the offsets of lines in the request.
@@ -36,7 +36,14 @@ impl Request {
         let mut offsets = vec![0; self.num_lines() as usize];
 
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_request_get_offsets(self.request, offsets.as_mut_ptr()) };
+        let num_offsets = unsafe {
+            gpiod::gpiod_line_request_get_requested_offsets(
+                self.request,
+                offsets.as_mut_ptr(),
+                self.num_lines() as u64,
+            )
+        };
+        offsets.shrink_to(num_offsets as usize);
         offsets
     }
 
diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
index bebf106..0375842 100644
--- a/bindings/rust/libgpiod/tests/line_config.rs
+++ b/bindings/rust/libgpiod/tests/line_config.rs
@@ -37,8 +37,10 @@ mod line_config {
         lconfig.add_line_settings(&[0, 1, 2], lsettings1).unwrap();
         lconfig.add_line_settings(&[4, 5], lsettings2).unwrap();
 
+        let settings_map = lconfig.line_settings().unwrap();
+
         // Retrieve settings
-        let lsettings = lconfig.line_settings(1).unwrap();
+        let lsettings = settings_map.get(1).unwrap();
         assert_eq!(
             lsettings.prop(SettingKind::Direction).unwrap(),
             SettingVal::Direction(Direction::Input)
@@ -56,7 +58,7 @@ mod line_config {
             SettingVal::Drive(Drive::PushPull)
         );
 
-        let lsettings = lconfig.line_settings(5).unwrap();
+        let lsettings = settings_map.get(5).unwrap();
         assert_eq!(
             lsettings.prop(SettingKind::Direction).unwrap(),
             SettingVal::Direction(Direction::Output)
@@ -74,22 +76,4 @@ mod line_config {
             SettingVal::OutputValue(Value::Active)
         );
     }
-
-    #[test]
-    fn offsets() {
-        let mut lsettings1 = line::Settings::new().unwrap();
-        lsettings1.set_direction(Direction::Input).unwrap();
-
-        let mut lsettings2 = line::Settings::new().unwrap();
-        lsettings2.set_event_clock(EventClock::Realtime).unwrap();
-
-        // Add settings for multiple lines
-        let lconfig = line::Config::new().unwrap();
-        lconfig.add_line_settings(&[0, 1, 2], lsettings1).unwrap();
-        lconfig.add_line_settings(&[4, 5], lsettings2).unwrap();
-
-        // Verify offsets
-        let offsets = lconfig.offsets().unwrap();
-        assert_eq!(offsets, [0, 1, 2, 4, 5]);
-    }
 }
diff --git a/configure.ac b/configure.ac
index 4a91723..c5fb7c7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -88,6 +88,7 @@ AC_CHECK_HEADERS([dirent.h], [], [HEADER_NOT_FOUND_LIB([dirent.h])])
 AC_CHECK_HEADERS([poll.h], [], [HEADER_NOT_FOUND_LIB([poll.h])])
 AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])])
 AC_CHECK_HEADERS([sys/ioctl.h], [], [HEADER_NOT_FOUND_LIB([sys/ioctl.h])])
+AC_CHECK_HEADERS([sys/param.h], [], [HEADER_NOT_FOUND_LIB([sys/param.h])])
 AC_CHECK_HEADERS([sys/stat.h], [], [HEADER_NOT_FOUND_LIB([sys/stat.h])])
 AC_CHECK_HEADERS([sys/types.h], [], [HEADER_NOT_FOUND_LIB([sys/types.h])])
 AC_CHECK_HEADERS([linux/const.h], [], [HEADER_NOT_FOUND_LIB([linux/const.h])])
diff --git a/include/gpiod.h b/include/gpiod.h
index ff3618d..fea2076 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -785,19 +785,29 @@ struct gpiod_line_settings *
 gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
 				    unsigned int offset);
 
+/**
+ * @brief Get the number of configured line offsets.
+ * @param config Line config object.
+ * @return Number of offsets for which line settings have been added.
+ */
+size_t
+gpiod_line_config_get_num_configured_offsets(struct gpiod_line_config *config);
+
 /**
  * @brief Get configured offsets.
  * @param config Line config object.
- * @param num_offsets Pointer to a variable in which the number of line offsets
- *                    will be stored.
- * @param offsets Pointer to a pointer which will be set to point to an array
- *                containing the configured offsets. The array will be allocated
- *                using malloc() and must be freed using free().
- * @return 0 on success, -1 on failure.
+ * @param offsets Array to store offsets.
+ * @param max_offsets Number of offsets that can be stored in the offsets array.
+ * @return Number of offsets stored in the offsets array.
+ *
+ * If max_offsets is lower than the number of lines actually requested (this
+ * value can be retrieved using ::gpiod_line_config_get_num_configured_offsets),
+ * then only up to max_lines offsets will be stored in offsets.
  */
-int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
-				  size_t *num_offsets,
-				  unsigned int **offsets);
+size_t
+gpiod_line_config_get_configured_offsets(struct gpiod_line_config *config,
+					 unsigned int *offsets,
+					 size_t max_offsets);
 
 /**
  * @}
@@ -885,16 +895,24 @@ void gpiod_line_request_release(struct gpiod_line_request *request);
  * @param request Line request object.
  * @return Number of requested lines.
  */
-size_t gpiod_line_request_get_num_lines(struct gpiod_line_request *request);
+size_t
+gpiod_line_request_get_num_requested_lines(struct gpiod_line_request *request);
 
 /**
  * @brief Get the offsets of the lines in the request.
  * @param request Line request object.
- * @param offsets Array to store offsets. Must be sized to hold the number of
- *		  lines returned by ::gpiod_line_request_get_num_lines.
+ * @param offsets Array to store offsets.
+ * @param max_offsets Number of offsets that can be stored in the offsets array.
+ * @return Number of offsets stored in the offsets array.
+ *
+ * If max_offsets is lower than the number of lines actually requested (this
+ * value can be retrieved using ::gpiod_line_request_get_num_requested_lines),
+ * then only up to max_lines offsets will be stored in offsets.
  */
-void gpiod_line_request_get_offsets(struct gpiod_line_request *request,
-				    unsigned int *offsets);
+size_t
+gpiod_line_request_get_requested_offsets(struct gpiod_line_request *request,
+					 unsigned int *offsets,
+					 size_t max_offsets);
 
 /**
  * @brief Get the value of a single requested line.
@@ -926,11 +944,11 @@ int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
  * @brief Get the values of all requested lines.
  * @param request GPIO line request.
  * @param values Array in which the values will be stored. Must be sized to
- *		 hold the number of lines returned by
- *		 ::gpiod_line_request_get_num_lines.
+ *		 hold the number of lines filled by
+ *		 ::gpiod_line_request_get_num_requested_lines.
  *		 Each value is associated with the line identified by the
- *		 corresponding entry in the offset array returned by
- *		 ::gpiod_line_request_get_offsets.
+ *		 corresponding entry in the offset array filled by
+ *		 ::gpiod_line_request_get_requested_offsets.
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values(struct gpiod_line_request *request,
@@ -967,11 +985,11 @@ int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
  * @brief Set the values of all lines associated with a request.
  * @param request GPIO line request.
  * @param values Array containing the values to set. Must be sized to
- *		 contain the number of lines returned by
- *		 ::gpiod_line_request_get_num_lines.
+ *		 contain the number of lines filled by
+ *		 ::gpiod_line_request_get_num_requested_lines.
  *		 Each value is associated with the line identified by the
- *		 corresponding entry in the offset array returned by
- *		 ::gpiod_line_request_get_offsets.
+ *		 corresponding entry in the offset array filled by
+ *		 ::gpiod_line_request_get_requested_offsets.
  */
 int gpiod_line_request_set_values(struct gpiod_line_request *request,
 				  const enum gpiod_line_value *values);
diff --git a/lib/line-config.c b/lib/line-config.c
index bc10059..877e7ef 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -6,6 +6,7 @@
 #include <gpiod.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/param.h>
 
 #include "internal.h"
 
@@ -152,36 +153,32 @@ gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
 	return NULL;
 }
 
-GPIOD_API int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
-					    size_t *num_offsets,
-					    unsigned int **offsets)
+GPIOD_API size_t
+gpiod_line_config_get_num_configured_offsets(struct gpiod_line_config *config)
 {
-	unsigned int *offs;
-	size_t i;
-
 	assert(config);
 
-	if (!num_offsets || !offsets) {
-		errno = EINVAL;
-		return -1;
-	}
+	return config->num_configs;
+}
 
-	*num_offsets = config->num_configs;
-	*offsets = NULL;
+GPIOD_API size_t
+gpiod_line_config_get_configured_offsets(struct gpiod_line_config *config,
+					 unsigned int *offsets,
+					 size_t max_offsets)
+{
+	size_t num_offsets, i;
 
-	if (!config->num_configs)
-		return 0;
+	assert(config);
 
-	offs = calloc(config->num_configs, sizeof(unsigned int));
-	if (!offs)
-		return -1;
+	if (!offsets || !max_offsets || !config->num_configs)
+		return 0;
 
-	for (i = 0; i < config->num_configs; i++)
-		offs[i] = config->line_configs[i].offset;
+	num_offsets = MIN(config->num_configs, max_offsets);
 
-	*offsets = offs;
+	for (i = 0; i < num_offsets; i++)
+		offsets[i] = config->line_configs[i].offset;
 
-	return 0;
+	return num_offsets;
 }
 
 static void set_offsets(struct gpiod_line_config *config,
diff --git a/lib/line-request.c b/lib/line-request.c
index c9ad337..e536355 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -7,6 +7,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/param.h>
 #include <unistd.h>
 
 #include "internal.h"
@@ -45,24 +46,30 @@ GPIOD_API void gpiod_line_request_release(struct gpiod_line_request *request)
 }
 
 GPIOD_API size_t
-gpiod_line_request_get_num_lines(struct gpiod_line_request *request)
+gpiod_line_request_get_num_requested_lines(struct gpiod_line_request *request)
 {
 	assert(request);
 
 	return request->num_lines;
 }
 
-GPIOD_API void
-gpiod_line_request_get_offsets(struct gpiod_line_request *request,
-			       unsigned int *offsets)
+GPIOD_API size_t
+gpiod_line_request_get_requested_offsets(struct gpiod_line_request *request,
+					 unsigned int *offsets,
+					 size_t max_offsets)
 {
+	size_t num_offsets;
+
 	assert(request);
 
-	if (!offsets)
-		return;
+	if (!offsets || !max_offsets)
+		return 0;
+
+	num_offsets = MIN(request->num_lines, max_offsets);
+
+	memcpy(offsets, request->offsets, sizeof(*offsets) * num_offsets);
 
-	memcpy(offsets, request->offsets,
-	       sizeof(*offsets) * request->num_lines);
+	return num_offsets;
 }
 
 GPIOD_API enum gpiod_line_value
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 2305810..a1a587d 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -185,10 +185,8 @@ GPIOD_TEST_CASE(get_offsets)
 {
 	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) config = NULL;
-	g_autofree guint *config_offs = NULL;
-	guint offsets[8];
+	guint offsets[8], offsets_in[4];
 	size_t num_offsets;
-	gint ret;
 
 	settings = gpiod_test_create_line_settings_or_fail();
 	config = gpiod_test_create_line_config_or_fail();
@@ -206,39 +204,79 @@ GPIOD_TEST_CASE(get_offsets)
 	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 2,
 							 settings);
 
-	ret = gpiod_line_config_get_offsets(config, &num_offsets, &config_offs);
-	g_assert_cmpint(ret, ==, 0);
+	num_offsets = gpiod_line_config_get_configured_offsets(config,
+							       offsets_in, 4);
 	g_assert_cmpuint(num_offsets, ==, 4);
-	g_assert_cmpuint(config_offs[0], ==, 2);
-	g_assert_cmpuint(config_offs[1], ==, 4);
-	g_assert_cmpuint(config_offs[2], ==, 6);
-	g_assert_cmpuint(config_offs[3], ==, 7);
+	g_assert_cmpuint(offsets_in[0], ==, 2);
+	g_assert_cmpuint(offsets_in[1], ==, 4);
+	g_assert_cmpuint(offsets_in[2], ==, 6);
+	g_assert_cmpuint(offsets_in[3], ==, 7);
 }
 
 GPIOD_TEST_CASE(get_0_offsets)
 {
 	g_autoptr(struct_gpiod_line_config) config = NULL;
-	g_autofree guint *offsets = NULL;
 	size_t num_offsets;
-	gint ret;
+	guint offsets[3];
 
 	config = gpiod_test_create_line_config_or_fail();
 
-	ret = gpiod_line_config_get_offsets(config, &num_offsets, &offsets);
-	g_assert_cmpint(ret, ==, 0);
+	num_offsets = gpiod_line_config_get_configured_offsets(config,
+							       offsets, 0);
 	g_assert_cmpuint(num_offsets, ==, 0);
-	g_assert_null(offsets);
 }
 
 GPIOD_TEST_CASE(get_null_offsets)
 {
 	g_autoptr(struct_gpiod_line_config) config = NULL;
-	g_autofree guint *offsets = NULL;
-	gint ret;
+	size_t num_offsets;
 
 	config = gpiod_test_create_line_config_or_fail();
 
-	ret = gpiod_line_config_get_offsets(config, NULL, &offsets);
-	g_assert_cmpint(ret, ==, -1);
-	gpiod_test_expect_errno(EINVAL);
+	num_offsets = gpiod_line_config_get_configured_offsets(config,
+							       NULL, 10);
+	g_assert_cmpuint(num_offsets, ==, 0);
+}
+
+GPIOD_TEST_CASE(get_less_offsets_than_configured)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	size_t num_retrieved;
+	guint retrieved[3];
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 NULL);
+
+	num_retrieved = gpiod_line_config_get_configured_offsets(config,
+								 retrieved, 3);
+	g_assert_cmpuint(num_retrieved, ==, 3);
+	g_assert_cmpuint(retrieved[0], ==, 0);
+	g_assert_cmpuint(retrieved[1], ==, 1);
+	g_assert_cmpuint(retrieved[2], ==, 2);
+}
+
+GPIOD_TEST_CASE(get_more_offsets_than_configured)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	size_t num_retrieved;
+	guint retrieved[8];
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 NULL);
+
+	num_retrieved = gpiod_line_config_get_configured_offsets(config,
+								 retrieved, 8);
+	g_assert_cmpuint(num_retrieved, ==, 4);
+	g_assert_cmpuint(retrieved[0], ==, 0);
+	g_assert_cmpuint(retrieved[1], ==, 1);
+	g_assert_cmpuint(retrieved[2], ==, 2);
+	g_assert_cmpuint(retrieved[3], ==, 3);
 }
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 2c2af01..49e9791 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -45,9 +45,10 @@ GPIOD_TEST_CASE(request_fails_with_duplicate_offsets)
 
 	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
 	g_assert_nonnull(request);
-	num_requested_offsets = gpiod_line_request_get_num_lines(request);
+	num_requested_offsets =
+			gpiod_line_request_get_num_requested_lines(request);
 	g_assert_cmpuint(num_requested_offsets, ==, 3);
-	gpiod_line_request_get_offsets(request, requested_offsets);
+	gpiod_line_request_get_requested_offsets(request, requested_offsets, 4);
 	g_assert_cmpuint(requested_offsets[0], ==, 0);
 	g_assert_cmpuint(requested_offsets[1], ==, 2);
 	g_assert_cmpuint(requested_offsets[2], ==, 3);
@@ -401,9 +402,10 @@ GPIOD_TEST_CASE(num_lines_and_offsets)
 
 	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
-	g_assert_cmpuint(gpiod_line_request_get_num_lines(request), ==, 8);
+	g_assert_cmpuint(gpiod_line_request_get_num_requested_lines(request),
+			 ==, 8);
 	gpiod_test_return_if_failed();
-	gpiod_line_request_get_offsets(request, read_back);
+	gpiod_line_request_get_requested_offsets(request, read_back, 8);
 	for (i = 0; i < 8; i++)
 		g_assert_cmpuint(read_back[i], ==, offsets[i]);
 }
@@ -578,3 +580,42 @@ GPIOD_TEST_CASE(request_with_bias_set_to_pull_up)
 	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
 			GPIOD_LINE_VALUE_ACTIVE);
 }
+
+GPIOD_TEST_CASE(get_requested_offsets_less_and_more)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	size_t num_retrieved;
+	guint retrieved[6];
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 4,
+							 NULL);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+
+	num_retrieved = gpiod_line_request_get_requested_offsets(request,
+								 retrieved, 3);
+
+	g_assert_cmpuint(num_retrieved, ==, 3);
+	g_assert_cmpuint(retrieved[0], ==, 0);
+	g_assert_cmpuint(retrieved[1], ==, 1);
+	g_assert_cmpuint(retrieved[2], ==, 2);
+
+	memset(retrieved, 0, sizeof(retrieved));
+
+	num_retrieved = gpiod_line_request_get_requested_offsets(request,
+								 retrieved, 6);
+
+	g_assert_cmpuint(num_retrieved, ==, 4);
+	g_assert_cmpuint(retrieved[0], ==, 0);
+	g_assert_cmpuint(retrieved[1], ==, 1);
+	g_assert_cmpuint(retrieved[2], ==, 2);
+	g_assert_cmpuint(retrieved[3], ==, 3);
+}
-- 
2.37.2

