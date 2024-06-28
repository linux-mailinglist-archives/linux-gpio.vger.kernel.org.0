Return-Path: <linux-gpio+bounces-7819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6391C638
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E90B1C20FA9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD21458AD0;
	Fri, 28 Jun 2024 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TY6yCaFG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0F57888
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601153; cv=none; b=IPnWjUBvgt1FLaUVUmCzaVdQak8gtOe9iWfIbWj42JGr2a+R6phiMFXrt2+b6BiTFt9QTFayV6p+pa6xzjNVja6LklOmvCxJz7aB7IGl+12dm3RLorRQgMVDKKn1DOcmsHbCOdrQf4Xqj8IvtE0GMVgeIoZgw8tJ+EeTAbjtYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601153; c=relaxed/simple;
	bh=RfnFsRFxKoRbW6HwXAxSlUxfZmidHUhysONb+hRaFuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djqzyV54EKt4kYnoc1nHGM/tsH/HDXgyg0ExeLP07C7pMMfq3AFXowpeBdILo8ZwwTFJHaf4Ny44/PlR2WXutRGttHZydcmCnxSND8clL3SP9QltV2D4XxxyoQ/5mf8O5/njA2efcpAVTAvWWcI2lJrHy5JFOcWQwF5swdeZ/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TY6yCaFG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-424aa70fbc4so6613785e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601150; x=1720205950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neKXPs3bOvwzNiGHUhG9IGSZVWPySB8qQPyLZxnqDjI=;
        b=TY6yCaFGgAg+c69YgV6VoDzEif9oIeqhu6lHxnvyi+NTeNMFy7eN+xSKv2q8759KRY
         n8O9Zu3GHpb2rIMOt2eXxpjunQpkzeSkGvD02te0PZYXWLePv+fi2LUoN+iPP9f329I5
         kuGAP0A53ePWTq1X/aoB/zBVtDBAZuYGzWoWaoJsz7r7JjtA8lcSHUuUTT0uxDrvV2cE
         9w+TZtVzRNP5QMnGv62OFvzhjugcFT8AlccnFrgOwgnJrPUSVblMQEMoLY6a/LqBs14N
         ncAOrfLxOcL2WSAU5DPUCubxIe4y9A31+75E/yUjKPj1Uon3d992UbgPD6RtyMCXZ3IS
         XtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601150; x=1720205950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neKXPs3bOvwzNiGHUhG9IGSZVWPySB8qQPyLZxnqDjI=;
        b=eVphi4w1YSa13dEQj6d+BVhUEwuUOf3G7W8ZBbenVt1JyqUIdG6S28aIcpuMk9G+9P
         eWov3F8lf7RCP4FYH62mmSCCUEUAW/4mstGh1ix1ukRkzbKmd2WO0uQ+mNdszaDZncw/
         X6Esz80We8h0U9NCNm3dOI7VHwsVqavaq08UlJ/vqyFesDfgoghfV1+9Udt3QmOZAyy9
         Z0zYWy3xsgQMPf1La+UOLtLIiHnVeNGCPBWM11jNXXGJzyaI48tOsxpMCGvsMXHyDLvU
         h5og0PxeYhedbavTiwx5CAEZsr6aaS3lAqyn+dhvp2riKCHAOnnTJERdzebb68V0iLzO
         oGsw==
X-Forwarded-Encrypted: i=1; AJvYcCXo7p69EG9z7FU7TNCaf4ueS+2BZ10cIHCq1MJr22b0BSfofNrMfN1ak8+LL028MuUMPWpiGoKI6NwxeSxgYGZyrmO+z7h+7PSWhg==
X-Gm-Message-State: AOJu0Ywpv+XEdRkHGnlJByKri7U28uOMUZNXYoB7g4+KtZ3oxwatmowY
	DDXJ5rP3OjTCrSbybsWxv8efjT3cb3+DCpUU5ZJB6TVollD/EPfmeaUQ36lZTv4=
X-Google-Smtp-Source: AGHT+IHYPO9BOtCo5WnKdU2i7pHJqrQRjhwPw9m+fi9/ZQG3V06uUpxJB+UVoW3gBW9gS+1GegP8/w==
X-Received: by 2002:adf:f003:0:b0:360:9bf5:1eab with SMTP id ffacd0b85a97d-366e94cbbf9mr12080438f8f.36.1719601150361;
        Fri, 28 Jun 2024 11:59:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:29 +0200
Subject: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-10-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10373;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9YSC6tCMsudc40rcjXLYANsSvgN0Thlim+M3w+pdRjw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfsbLi7J+ufkJUaqs0E0SpO6wOu+NHBcTBnv
 dzrYI9TGMqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7AAKCRARpy6gFHHX
 cojmD/99g+XbQwxBJSTN0/W4lgRpTi1y4bcTbNtQOzl3DP4azY+gz8dOTOrg4wVDbVR8Wfpvt7j
 bch+M1g29Ni3W166I/OSlpEnd+KQiajv0WhU1dyqCD5LMV2iBTkzBxEPZH4qbyuNRrZVYiikOBF
 TptQJujlt+AiKPKlJlOk7N+2sVjNxDTfB9W4QHx6Tkv0YfAxCpd3y+PXybM+pKwFm8GGXFeCur3
 0l5kVRkQmd6IKANKd9X7BwigdWLCj/b67stuikJfiYAFgVsxh9gpoZ8vXqPticZWct2oDJJ4lFC
 7q/ZNEDGjEj6UlR4PY+F+UC9Xs8EDps1PX7JUQfKY+ccsJJamhINTFCmQSf84SAz9T2HEgrtnHd
 3Q/t5FiNLd9n8k7vICffG+RcTUTFrxAHK2kFBmD7GkJIMl34lAHpmqI9bFnaYEPkq/PNV1fSOxi
 GgliSldFqkLUrc4n53BJY7kQf5P+DoC2kofhsvw4ISYj1jRlylviIIhzg5/0XBGcfBc3sQQxqVT
 6Gte+EgkXshhncN0AF9YXur2Gy+TjOEg4gg2TSizZtIptlAsb9JbjYDxRDk0ee+Y/ggwAee9ykB
 td3Vw9hpXriwup3Vckaka0wLVY9RKMb/kIKf4OGG0c0dDUGdc+BSt7qwjTkSG4QgFrHuhzJSidj
 MIR2n3TPLv0560A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the XML file defining all the interfaces for the io.gpiod1 service.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/io.gpiod1.xml | 318 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 318 insertions(+)

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
2.43.0


