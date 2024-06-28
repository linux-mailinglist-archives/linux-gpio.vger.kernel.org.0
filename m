Return-Path: <linux-gpio+bounces-7794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16791C1C0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25DB91C22A76
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A111C0DF3;
	Fri, 28 Jun 2024 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lu2hoPMV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165881BF31A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586437; cv=none; b=hY5mc444lghd4B/ZzgupZhCoiMTZ/szshxYRMubalL1SKRbJlR60qju5tCAv3B7dq8dvh3WEfjTWxwJhmYIrQHmJENGv4tGvATnc3Ff1ZKgQK6rQDSJdPKWIwrHV8kvu4a2zjZ74QuUIZgPtQZG725dp7MU4yy70QTp7K95OmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586437; c=relaxed/simple;
	bh=RfnFsRFxKoRbW6HwXAxSlUxfZmidHUhysONb+hRaFuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5QqrbgRz4LfCL+DA6SHjK2BdUIp0cTiS+YTu5Kz+Yhsh2L1bBRgjM5tFnvgXAeABAOKj9hAmJ5dDGl+SGKEVhlDl+DcnPHJZCV7l89CkbInbMOYnomg4TSETaxk4lRXU7XVKquHuWyxGhlrJFPjlhOX62rM8Pxln/wnflcijzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lu2hoPMV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so9567581fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586434; x=1720191234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neKXPs3bOvwzNiGHUhG9IGSZVWPySB8qQPyLZxnqDjI=;
        b=lu2hoPMVtlSVwqrPJ/41CRfScwj0o1krYMJs6ZmoiRdkK+aYANnAl1s6B6VEa/d0eq
         PSfRE8ZU7vlvXqhOSlbuLQJ7iRj91uPvQ6pwOAloUhuPTQgIFffTrAE68tdEBly47+Qi
         SSVNSoIJQHdqbaw2bQNEo41Aqak+4lmd/VK27v7cGo5ezgdZzL5QtXWnuNFVRhx+WDeB
         PPCuC+I23N44qQfsq9SDWyh4Chn03Wv1qL1FrpHr8Cv+zEkVyiHzisXkYx339ErK4/2F
         sVaGsBV7Omy7aIcricN8SoTftYHki80U3e5umw7WaFV4wAZFrO0MNjr7dl/dbTTJHQ2e
         bThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586434; x=1720191234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neKXPs3bOvwzNiGHUhG9IGSZVWPySB8qQPyLZxnqDjI=;
        b=irzBs9SrZDgOp2v37I5rzzTYwnDq8ETuyz5z+vSCeMCc+om9CmK+LICLvx8/Y+GDGc
         YZY75HF1rqK6a/dT7WPsRHJFDwwgByHnl1XE9hrPGhBd+o0R4gK35BtmcoZ05wPMYTEy
         qrA5KU+eL44oiY+6JiLvC9JW+UCWVaHDuymHAbZeAbSlxffTQf2nkPMqvvc590W2zky1
         oPz9by3k2fIpC9LJaUezWUTfANDfDA6uYpT2h4lsHlrniQeC3Wy52hnNih1AuLOPqHjM
         /wszcT61nIGFBbpHgKj2hf+2PTB8CpMkp4SE6YC8NvFJoufaF7aCXCrlJXfLcm0xiy0+
         c+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+NDUnrqlAEkQ6FoZ+F0O6KU4o5enbCQyYi4FN8/GzCa1AwKJDfjLHXFBI7WBpbMZH+Tzr85zo/EsmBO7dORQhOPdsVc8Qu5u/Q==
X-Gm-Message-State: AOJu0YzctBNFQjwLWNWtfC6SO8a3WsznWRSSKAEdZeqZOdXD5AiV0zkn
	pj8Q4sh/2KUYIsq/8cSLwPjdln/oTOMugxWWnyGUtcI1f9DQRTSVvOEvRIQADo0=
X-Google-Smtp-Source: AGHT+IErbUp+sI4UPopSvUYt/nHcM99SN3N2M1h3HdMEc0H4n4K+jCWPeri18oj1CbCrIQM0BFmk6g==
X-Received: by 2002:a05:651c:907:b0:2ee:4af7:d78e with SMTP id 38308e7fff4ca-2ee4af7db43mr49141911fa.34.1719586434195;
        Fri, 28 Jun 2024 07:53:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:26 +0200
Subject: [PATCH libgpiod v2 10/18] dbus: add the API definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-10-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5yUBfY0f4gsPXgzWMpPx3gPFPrahylwgGGY
 V/HSZ/PPBGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcgAKCRARpy6gFHHX
 csOlD/wPHDlkP0/alXufobQ1rElOZYW5Db7Q3UrvJTdNbJBoPqjVe82ZAt2C59wTEMbwHjJuo8K
 uBITUq4AuMTdZHSt1BDg3yk3yB8unKnktc5NlhEO1chQ/YJKMPOS/jNaJYdHaTIHfIGRgN/1xn/
 vedHOj3r/AIBOQvOVV7Q92fC6UbqS0blvAqVEMX+P9d/9xijW/Wuyh9W09zyYuyaUONu5aGtZ5y
 Rs7OFT6l+b577Q3cG1LClCb2C5XoF77cFrY84kxixtUQX1oT0TBwxjVfGeDJ4XP0iZyYtm8HEIZ
 NiCn6mi+e5bB8o4oiEDuSbeX9rexj7WVoKs38GQ/Wk5BOuxRHTn+xWkUSY8j4U15SENRc7kjXOK
 c5LaPJQZ4u7sxXZHZiugY1OGcdpE1w4AM0sOp1Ela+egcbKryLSl+9q1LT10HzX4BMsejqoWu37
 VRFjnTncIn7NLRSpId6i3eahCPMmYGmHvhUyPnWb4gb9Jwjh2wmb2wtmBn+r+angWRYsszr7hE8
 lqavic4X2LCPxwMFA31utKWCv48upmpSrxfkt8SIwULx6TGiamugq81YKImJRUBIlahGwBs/jd0
 C1LqXvBfn91fnvWe+xCeBePK8F8n//kXUli6FfgbLyRxnIyW70JoOoM8ro6Aw/SzAJmHQOvlC+x
 OH/zUbw+DVCHmwA==
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


