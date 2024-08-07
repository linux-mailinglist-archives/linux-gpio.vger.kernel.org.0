Return-Path: <linux-gpio+bounces-8635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA0F94A3D5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D7841C2157D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C1E1D1742;
	Wed,  7 Aug 2024 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RVPMB36I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725091CB30E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021884; cv=none; b=pPahbKkZdRiY56pM20K6VhI9vn1H6TzlYuVthqiLZpaS5Bow4ci/Uo91l0YXXqpbJuMDvCAfaixYyLiJ843d5F87NONW6RyUWw5gmRr+ev3wg/YTpL4r5wD4RLiIwXPKWieJ20J3VGQYE7oUQY7vbesTF4ZReR9l79+3RpAeHWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021884; c=relaxed/simple;
	bh=gJSj7Y4BSXPPUUhXh90zjI+fkKXpwMQo1lpaZhjGAS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQPmuWbyMOUWUKiWdbM6xIH8l3mZA8XQQuHGD1AS2rATQ5E5h6kPvcOs3iCBes9Flbg0ELxLKktawjUDbB89t5vqLjo92l2m9kjeqFVaAXiIc7ziM5KeHir8fq0D4IMEC52imRRmO4Jq5/WECgDs1xS6/rJkB+Ou+ai8Xq8Ae3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RVPMB36I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42819654737so10607185e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021881; x=1723626681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkk0loRf4tUPf/AWLqTlqk0ORZVfkds+9375JLaGi5M=;
        b=RVPMB36IUxpNXoBcTsU+MwYJdTzDNpcDkiy9R6LtomXnqn12m15Q0GFm4VMCRyoSzl
         Z8MTxxH8dHjgFjtqTyy8Pk/rRgcD0PIG7CmGehfeojcrOraQvPSKGY5rWm+MoF3KHRj/
         EPKuTImtAPiQ8IFqvxxmxt2mfX8EY1XoLCJIdnnwWp7mP2F5DkOonI2lD3xEZcpp/+O6
         EVcEnxkBPBBXpuoXy/6ty/kSK5DinsWh0LPXPOboDtkkNHmw4ms9rhAarV06KyFLqI+Y
         zKC1nzN2R57EMwbXTtRIe3YXvCkRi9BsqJdDe37A1bJjaEcx29XoTQENpVxu8rl0XxeR
         zTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021881; x=1723626681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkk0loRf4tUPf/AWLqTlqk0ORZVfkds+9375JLaGi5M=;
        b=UV/6ZnBY5txdeFxQwAd/0q7/GpxJV6l1oDHG4rNXQnIKfD5c8ybHuHCJSJ4DoGS7Il
         fmheTCzJKxXjpM7BTJhVJs9lS8KHf+FEcrqPGezpGGmlwm+ZRI3UxeuyLt1RGVN9OFLm
         NMd5vg6uwOXYITdoVGED0doT3wEYrkLGXpwwLAWukHqQkIfQLUZlgLq72l6On542K7G4
         hUJ+NT+FKVnzbexydXuxH0Hz+5BqX02MemV6/qtK8Qw0EdYf+oAzIDM56JuCMGjikZFW
         a1CTplfWf8EgVg9P5ctR2j6Ze7oojUs7OQmBRD0i/+C6eCDLODfzzEosq4RBE6fI5IQ7
         vmqg==
X-Gm-Message-State: AOJu0YyYwM3GMf7vx1phTBVGbOwnLB1RH6UPy7m/6xGRm/BxceCOG3Y2
	AoojaaIX/kh1HfGzBNrF3DNYyqBLmSWko8mxvD//z11jAJ4jij1tpSopNvy6DzM=
X-Google-Smtp-Source: AGHT+IHErtdkhBtzlRdx11NM/Q7ltNHoDep33W1YJBDktGlT8bGI/QashNo1ooSTxBPupkgB+T+Wmg==
X-Received: by 2002:a05:600c:578e:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-428f7668cfdmr55736445e9.35.1723021880650;
        Wed, 07 Aug 2024 02:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:41 +0200
Subject: [PATCH libgpiod v4 10/18] dbus: add the API definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-10-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10789;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NnP37xYr5zXDjZ3ZMCY3duYCzJkpDuifZLfirlvH5a8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoRGD7zTQMziiIBIRg4jAHhouUYuJRdV57Qb
 SA1RfxubhSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EQAKCRARpy6gFHHX
 clUPEAC0ynW8Go2XB+Qr/RNXlKIPBUZtaoM2VfEg2iPG0Urm0tewBbuNTqTnMD5tCLtBokjOifQ
 l/iZDG1+2ROAhkb+B0Xv/MHIdZTxsPzHRZ4p8D/7j2NEMq0fL8S4ovrlL3q1YlVgVFDvN2MNmkY
 S8PgY2mTKX5xARL6F0PguLVeGg55LfWEk2KGqyik0+LoU7Jr2d0++n47xxXXtJLXg6WXpSzh/dp
 /2wPakcdCtOQdBRSlUBeqs4gdTvTvQnSXeJsAe4ftya4HanVMBuccNqQsVGZXubGu1vKTyglmpr
 /gN1FQ6jHp57h9OIE1vkvs8JQa2Po9TH/2pQ7nkJUV/M1Z+Y0lEGmCsttkYAUheyIGHQcxM+llO
 CG0wR4J0smQ/FOmU4Yq+9xfrqYA6/QqYJ4V6lx9XyOCVzYt/3loSjoo9UCOdg38bf8iBb8m+aL+
 GfIwsHmkcUtBGeO0Xyz4m/dCkCaosfYFsF7HauqYu5pjEdS4e42d8z1CNYSzCT5n26uMCfWgdNH
 sIfLypw6Zx1bVQ4Vjm+L1TWTabfWRQd1muztCZYaz7t9i0zMTC7aqeHw14lotNeALq/4FkhV1Lb
 /PXRVLAIka27A/ppFoyQS4i6wO/EaKEkF78sm/xusRa3uSe9QLXfSu8AwTRocBmX7rwC8zutDKk
 KgCKvUzk0vo5Reg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the XML file defining all the interfaces for the io.gpiod1 service.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/io.gpiod1.xml | 324 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)

diff --git a/dbus/lib/io.gpiod1.xml b/dbus/lib/io.gpiod1.xml
new file mode 100644
index 0000000..ace7d72
--- /dev/null
+++ b/dbus/lib/io.gpiod1.xml
@@ -0,0 +1,324 @@
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
+    <property name='Path' type='ay' access='read'/>
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
+        "debounce-period" => Debounce period in microseconds represented as a
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
+      Debounce period in microseconds. 0 if the line is not debounced. Can
+      only be non-zero with edge-detection enabled.
+    -->
+    <property name='DebouncePeriodUs' type='t' access='read'/>
+
+    <!--
+      EventClock:
+
+      System clock used to timestamp edge events on this line. Returns:
+      "monotonic", "realtime", "hte" or "unknown". New types may be added in
+      the future. Clients should interpret other types they don't recognize as
+      "unknown".
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
+                   in nanoseconds and the global & line-local sequence numbers.
+
+      If the line is managed by the gpio-manager and is requested with edge
+      detection enabled then this signal will be emitted for every edge event
+      registered on this line.
+
+      D-Bus EdgeEvent signals are designed for low-to-medium frequency
+      interrupts. If you performance better than the order of tens of HZ, you
+      should probably access the line directly using the kernel uAPI.
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
+      Release the requested lines. After this method returns, the request
+      object on which it was called will be destroyed.
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


