Return-Path: <linux-gpio+bounces-8272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC535934AED
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFFC81C20D4A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A53824A1;
	Thu, 18 Jul 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1lq7Q1N/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63428249F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294940; cv=none; b=ti8nhITMgvfL5zPlw1TbPPP1/XdEIGsxKtuZuNI8lOL6m6nY89ioK7Q6SGaN/igItOd0p7i+AL+41Vft31gXZ0Lt22lbakuF/cKRXRNWyuO97WQaPNd2MPI0oW0kmIWSZozlKIjRn9q9qbtZpeeHcEbb0ZqoT09rJ90UGaO4Znk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294940; c=relaxed/simple;
	bh=gJSj7Y4BSXPPUUhXh90zjI+fkKXpwMQo1lpaZhjGAS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulTs5udr8GpAbZZKLnpo/6IdgPdEW1HWAOEs9iaMTWIWO20KyolEYhZVd68DQhaYZtv9BxBgVDUfU+s7BVb6ICoJfgtriRZmUfyd1JjFww6bhQyYLtT9rN/rdy89rigWgD0rZiktyeMwaUgI0y2nOP7ul2DxCuulskUc99fEj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1lq7Q1N/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-368584f9e36so217838f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294937; x=1721899737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkk0loRf4tUPf/AWLqTlqk0ORZVfkds+9375JLaGi5M=;
        b=1lq7Q1N/q8veJTk0igA0WrNIyXvLdUj3xLC1Nrwnhl4E3PdYqAlxh1+tVkhDcigkaR
         vrvmgAXcY3cJuVaCgxj8idLn6qak+FgU1KkTcd7WoLf9fa7HcnKuo6t5pdxyI8Sri5hn
         ITYt3Chf5Y5kKCwIUxi/Mhus4D80e76iJx3tMe3YPCtytB+MJcf6PoUB2igs7WxAjkwS
         kyb2lVjucTCixt33Z/7ZEdNjRNCHKjecKSpSgr3p2/7oSi0k4W327TYYK4UwAv65MaVY
         jnN+l5IcjF9G6Bg90Dr4Sj5v7MAXQzc2ysV5kAy47gM6DvwZW6xpC9+fMyhRNn4nQ1dz
         s1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294937; x=1721899737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkk0loRf4tUPf/AWLqTlqk0ORZVfkds+9375JLaGi5M=;
        b=lhl3cS99Nt7SPQfh9gI/1/9ujPkmjpKYCi9TtFq4wRvZ4wa6svGoCZczX9m64r8NQc
         ZKzmZ6LaGfGqr5ZfwvYEik7couSjYAQ4Q0eKXTf/hWsjJw8dnm39k7Nw8pQIbFfBauc8
         qkHorDGjvQbbrGhnJhwXmCh6M+VSH3M1S93ACWyZypOUnr5K6DcZKUQeager2ryVGZi5
         aPES21CLMVajk6v5b5M3u355ccIZKGZX2j2k+VSnqiae9Ks2K5YXmaxWdIhmICM8vgsJ
         zM39s7t89gkvpFGJ9j1TIlFEq/i1XvY0CBl8tM9+e1OeNyR5qMsRNOFAR3yZD7UDQYI3
         Ynjg==
X-Gm-Message-State: AOJu0YzablxcUxIc16S0LzXeqQuaOMRe0vdszKHPiGNCFE4J6obXn+z6
	cPIn89CRe3/ZFtwDJVpI7ULjNNH+JkgZ5kL0KMymf9047PLyKps4FGLRISsycLc=
X-Google-Smtp-Source: AGHT+IFt2C6VQHOpeWHdxp1DhKUdJZCbtw7gDVvy3h3+MaL3cPfR8HJqZ82evMaKYf6Np+xOfBH/MA==
X-Received: by 2002:adf:b647:0:b0:366:ed80:d040 with SMTP id ffacd0b85a97d-36831789e61mr2878405f8f.67.1721294937296;
        Thu, 18 Jul 2024 02:28:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:04 +0200
Subject: [PATCH libgpiod v3 10/18] dbus: add the API definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-10-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10789;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NnP37xYr5zXDjZ3ZMCY3duYCzJkpDuifZLfirlvH5a8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOBAdQPXZaJK3EX28y7ZsGT82Q8Bjw3FFTvHF
 9d2n7QMjdSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgQAAKCRARpy6gFHHX
 cjo+EACZXcvIcMXKro5xbxlTxBXnAQrcCpl4eO8BqRpmW32R/jRugT159SjoPL/Tx/uX3RmWBXZ
 ZfK0cEuPdJdWEEMzQHzKMOSuNKyEgEYMiVz6hL6v3ER+YIEpnoz9UgkTCVoxNSx8c6qVvLT3rTz
 ByDubIwmqd+x349RTsYQaMjr1Oq14Z/Queyp5JGoZ3x+DmK7mKP/s1MRFzQ5NhO7pWpgoaEbgWC
 pp4jQU96hZk5zlR19GdehS6mZ3FewEU3SLI+yB4TIgXxOtRwTr1YRcpYZlDx8MET/iZai7oQrnD
 aoE6LjEQR5VEe8OVMvvZA5aa2oDsouxG6oOYanvINzcPwJ1uIzEjaE5sY1sa1808bhsH56ZPVH5
 0qUtyxA0pA5etnDIy4SOh2OaBcTdIBBr+0U7Wy3PMbA2sNXyQsqn1lGDGc8uDnyJ29GPGCW1cq7
 /D8kBRCyCsLZLlesSiWQdaXWiwfSdw0aGzs3ENVEJme2bUOgKlSLleVDO2WVBCWhE2H3yKexsCK
 GFrnfh5ETY5KsTHwMQ43jgoPNtYubqoXCpTHMVLfUmLkvM19MHTiPpxGhDR7/oJYyIO0DzglnU/
 tKGeffwKpL794ThJD2N+cmXAObauK9nYvw/mNsQXiByRBafK+uEyfUlJCggGIOEmPPCp6zTahIN
 9oFcaXZtQyrOgcA==
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


