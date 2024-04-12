Return-Path: <linux-gpio+bounces-5422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31C8A2E37
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B06FC1C22732
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320FC56B64;
	Fri, 12 Apr 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="btk2Iw8f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46D56472
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924909; cv=none; b=IBU9YxWNQUUQ+ER3PV0FLeZyVHXnmvBaXNrMD7IsTTqmQIwu67UTU64pfdEwdS57g8gcncxcAO+NMVqfmZSqiVxrkT65dqTDpOov/OxQaupfVaQhk3GRg4YGeLbi8l7VmbMWpx1Lhh94TOYrFpA8/CKRgJKnYcHo+6IUEqFQmbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924909; c=relaxed/simple;
	bh=2EF57qsUVr7iuAGIm0ZbQcudD9gMBEmTKboHoPzvW/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z4lgLAZWqKDWMhnbhE0TylU3Hf3RvpR5hPJYG6MIINcNeqykVOq0g3ZoPgKhRu8/APGIujzDnOtgbdZXp++o5kNnme20Kwg3I+8/dmOhIehsNjQanKpt6STV+jI4ddQ9W/o2pa62Ab1U6tcnhs5POYP/Lx0w6petHSzeI2SSCN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=btk2Iw8f; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-417f5268b12so7944625e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924905; x=1713529705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZAq7w9uibpfOAfPqHJgmG+sOHZoERvw7gqF3PyB9Wk=;
        b=btk2Iw8f04ZGAV4+vUJwENwcmUBiDwfj98jdO03t1K1NOfcnXm+r0C+ZPaW8ycRuWA
         H6ML5zmWsPJBNcRC2bIdxUWsFPCnTiSvou8UBo15fp2iOEJEbfWeO1saWQpcyZ2IuWtv
         crZscvaYytuGc9CEK/1pEsjgKvIDrVgWaXJIZ2CgV+csr2SKtw2kMgfCS+BWTPbluCVR
         VVJMlmomfWRVypdmHNbHbjSiCTotQ1NeY5EvaOKMI8/xg79XPSPjh9EYITLSrB16x5Ah
         9BMRUNq5A1p92AEWNpS4M5KZLFgnhd9cdd7H24c3bwB/bnKfjQSLlfbNbpOd1H1Z+7xN
         Hk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924905; x=1713529705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZAq7w9uibpfOAfPqHJgmG+sOHZoERvw7gqF3PyB9Wk=;
        b=ENARdD4ltCPMdK76tkglKhkd6OEV+ryVKpuDdPVWsw+dum+Ej+rwkNaC0NXUHYMZMf
         NzYCVvLpYalQYq4yXuvLkSZeB5qtMd5InF4qniRTDuQ1uLZU0O1UMuqfRFmnuGJeHNeV
         /VypuIPEoN6WAdyxXghPJ5AtXCc5pks7abvXlJxrL4Lg3hlQDVOOxjghTZxSgu5Z9c5m
         xec2dlLtbp7MM8TAqPXqRQzMTAuXKP11TnNtfQfkjgHYQVvS63Bm+bRNO37YrzdbD359
         pCBIDyqGjzKJgYGmNk/Pfg2CxDRHmckBBLeira5e+i9tu9w78/92TcwoMHRAQxqr8LP9
         UWnQ==
X-Gm-Message-State: AOJu0YyChhSGUuKAHZRnmKsSM0zPad8k7S/9r6KiojRb1PFKqGyGqm3H
	sjRmTfl1gpekRMcK6wG4nwpF9VW9LMr1w0o8TtLak+YD/pbCk92Wc3mqRe0KGMQ=
X-Google-Smtp-Source: AGHT+IGzJiRRR1aX3kAjbXqgrT0peenpg0R9sG9kM6G7G2hQHFubprHz1ls4C0TQVP3zIK4gO+M9fQ==
X-Received: by 2002:a1c:4c03:0:b0:416:6dcd:3276 with SMTP id z3-20020a1c4c03000000b004166dcd3276mr2504103wmf.19.1712924905514;
        Fri, 12 Apr 2024 05:28:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 10/18] dbus: add the API definitions
Date: Fri, 12 Apr 2024 14:27:56 +0200
Message-Id: <20240412122804.109323-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the XML file defining all the interfaces for the io.gpiod1 service.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/io.gpiod1.xml | 318 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 dbus/lib/io.gpiod1.xml

diff --git a/dbus/lib/io.gpiod1.xml b/dbus/lib/io.gpiod1.xml
new file mode 100644
index 0000000..ca95302
--- /dev/null
+++ b/dbus/lib/io.gpiod1.xml
@@ -0,0 +1,318 @@
+<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
+<!-- SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
+
+<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
+
+<node>
+
+  <!--
+    io.gpiod1.Chip:
+    @short_description: Represents a single GPIO chip in the system.
+  -->
+  <interface name='io.gpiod1.Chip'>
+
+    <!--
+      Name:
+
+      Name of the chip as represented in the kernel.
+    -->
+    <property name='Name' type='s' access='read'/>
+
+    <!--
+      Label:
+
+      Label of the chip as represented in the kernel.
+    -->
+    <property name='Label' type='s' access='read'/>
+
+    <!--
+      NumLines:
+
+      Number of GPIO lines exposed by this chip.
+    -->
+    <property name='NumLines' type='u' access='read'/>
+
+    <!--
+      Path:
+
+      Filesystem path used to open this chip.
+    -->
+    <property name='Path' type='s' access='read'/>
+
+    <!--
+      RequestLines:
+      @line_config: Line configuration. See below for details.
+      @request_config: Request configuration. See below for details.
+      @request_path: Object path pointing to the newly added request.
+
+      Requests a set of lines and makes it possible for the users of this API
+      to manipulate them depending on the line configuration.
+
+      Line configuration is a tuple of two arrays. The first one contains
+      mappings of arrays of line offsets to sets of line settings. The second
+      contains the list of default output values which are only used in output
+      mode.
+
+      Available line config options:
+
+        "direction" => String representing the line direction. Accepts the
+                       following values: "input", "output".
+        "edge" => String representing the edge detection setting. Accepts the
+                  following values: "falling", "rising", "both".
+        "active-low" => Boolean representing the active-low setting.
+        "drive" => String representing the drive settings. Accepts the
+                   following values: "push-pull", "open-drain", "open-source".
+        "bias" => String representing the internal bias settings. Accepts the
+                  following values: "disabled", "pull-up", "pull-down", "as-is".
+        "debounce-period" => Debounce period in milliseconds represented as a
+                             signed, 64-bit integer.
+        "event-clock" => String representing the clock used to timestamp edge
+                         events. Accepts the following values: "monotonic",
+                         "realtime", "hte".
+
+      Output values are applied to the lines in the order they appear in the
+      settings mappings.
+
+      Example variant that allows to request lines at offsets 1, 5 and 11 in
+      output, push-pull and active-low modes and specifies the output values
+      as active (as visualized with g_variant_print()):
+
+        // Line config tuple
+        (
+          // Array of line settings mappings
+          [
+            // Single mapping tuple
+            (
+              // Offsets to map
+              [1, 5, 11],
+              // Line settings dict
+              {
+                'direction': <'output'>,
+                'drive': <'push-pull'>,
+                'active-low': <true>
+              }
+            )
+          ],
+          // Output values
+          [1, 1, 1]
+        )
+
+      Request configuration is a hashmap mapping names of the available config
+      options to their values wrapped in a variant.
+
+      Available request config options:
+
+        "consumer" => Consumer name as a string
+        "event-buffer-size" => Requested size of the in-kernel edge event
+                               buffer as an unsigned 32-bit integer.
+
+      The object path to the new request is returned on success. The user
+      should wait for it to appear before trying to use the requested lines in
+      any way.
+    -->
+    <method name='RequestLines'>
+      <arg name='line_config' direction='in' type='(a(aua{sv})ai)'/>
+      <arg name='request_config' direction='in' type='a{sv}'/>
+      <arg name='request_path' direction='out' type='o'/>
+    </method>
+
+  </interface>
+
+  <!--
+    io.gpiod1.Line:
+    @short_description: Represents a single GPIO line on a chip.
+  -->
+  <interface name='io.gpiod1.Line'>
+
+    <!--
+      Offset:
+
+      Uniquely identifies the line on the chip.
+    -->
+    <property name='Offset' type='u' access='read'/>
+
+    <!--
+      Name:
+
+      Name of the GPIO line as represented in the kernel.
+    -->
+    <property name='Name' type='s' access='read'/>
+
+    <!--
+      Used:
+
+      True if line is busy.
+
+      Line can be used by gpio-manager, another user-space process, a kernel
+      driver or is hogged. The exact reason a line is busy cannot be determined
+      from user-space unless it's known to be managed by gpio-manager (see:
+      the Managed property of this interface).
+    -->
+    <property name='Used' type='b' access='read'/>
+
+    <!--
+      Consumer:
+
+      Name of the consumer of the line.
+    -->
+    <property name='Consumer' type='s' access='read'/>
+
+    <!--
+      Direction:
+
+      Direction of the line. Returns "input" or "output".
+    -->
+    <property name='Direction' type='s' access='read'/>
+
+    <!--
+      EdgeDetection:
+
+      Edge detection settings of the line. Returns: "none", "falling",
+      "rising" or "both".
+    -->
+    <property name='EdgeDetection' type='s' access='read'/>
+
+    <!--
+      Bias:
+
+      Bias setting of the line. Returns: "unknown", "disabled, "pull-up" or
+      "pull-down".
+    -->
+    <property name='Bias' type='s' access='read'/>
+
+    <!--
+      Drive:
+
+      Drive setting of the line. Returns "push-pull", "open-source" or
+      "open-drain".
+    -->
+    <property name='Drive' type='s' access='read'/>
+
+    <!--
+      ActiveLow:
+
+      True if the line is active-low. False for active-high.
+    -->
+    <property name='ActiveLow' type='b' access='read'/>
+
+    <!--
+      Debounced:
+
+      True if line is being debounced on interrupts. Can only be true with
+      edge-detection enabled.
+    -->
+    <property name='Debounced' type='b' access='read'/>
+
+    <!--
+      DebouncePeriodUs:
+
+      Debounce period in milliseconds. 0 if the line is not debounced. Can
+      only be non-zero with edge-detection enabled.
+    -->
+    <property name='DebouncePeriodUs' type='t' access='read'/>
+
+    <!--
+      EventClock:
+
+      System clock used to timestamp edge events on this line. Returns:
+      "monotonic", "realtime" or "hte".
+    -->
+    <property name='EventClock' type='s' access='read'/>
+
+    <!--
+      Managed:
+
+      True if the line is managed by gpio-manager.
+    -->
+    <property name='Managed' type='b' access='read'/>
+
+    <!--
+      RequestPath:
+
+      If this line is managed by gpio-manager then this property will contain
+      the DBus object path pointing to the managing request object.
+    -->
+    <property name='RequestPath' type='o' access='read'/>
+
+    <!--
+      EdgeEvent:
+      @event_data: Contains the edge (1 for rising, 0 for falling), timestamp
+                   in milliseconds and the global & line-local sequence numbers.
+
+      If the line is managed by the gpio-manager and is requested with edge
+      detection enabled then this signal will be emitted for every edge event
+      registered on this line.
+    -->
+    <signal name='EdgeEvent'>
+      <arg name='event_data' type='(ittt)'/>
+    </signal>
+
+  </interface>
+
+  <!--
+    io.gpiod1.Request:
+    @short_description: Represents a set of requested GPIO lines.
+  -->
+  <interface name='io.gpiod1.Request'>
+
+    <!--
+      ChipPath:
+
+      DBus object path pointing to the chip exposing the lines held by this
+      request.
+    -->
+    <property name='ChipPath' type='o' access='read'/>
+
+    <!--
+      LinePaths:
+
+      Array of DBus object paths pointing to the lines held by this request.
+    -->
+    <property name='LinePaths' type='ao' access='read'/>
+
+    <!--
+      Release:
+
+      Release the requested lines. After this method returns successfully, the
+      request object on which it was called will be destroyed.
+    -->
+    <method name='Release'/>
+
+    <!--
+      ReconfigureLines:
+      @line_config: Line configuration. Refer to the RequestLines method of
+                    the io.gpiod1.Chip interface for details.
+
+      Change the configuration of lines held by this request object without
+      releasing them.
+    -->
+    <method name='ReconfigureLines'>
+      <arg name='line_config' direction='in' type='(a(aua{sv})ai)'/>
+    </method>
+
+    <!--
+      GetValues:
+      @offsets: Array of line offsets within the request to read values for.
+      @values: Array of values in the order lines were specified in @offsets.
+
+      Read the values for a set of lines held by the request.
+    -->
+    <method name='GetValues'>
+      <arg name='offsets' direction='in' type='au'/>
+      <arg name='values' direction='out' type='ai'/>
+    </method>
+
+    <!--
+      SetValues:
+      @values: Array of mappings from line offsets to desired output values.
+
+      Set the values for a set of lines held by the request.
+    -->
+    <method name='SetValues'>
+      <arg name='values' direction='in' type='a{ui}'/>
+    </method>
+
+  </interface>
+
+</node>
-- 
2.40.1


