Return-Path: <linux-gpio+bounces-15749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B41A30C4F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5271663D6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A13C221D8F;
	Tue, 11 Feb 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C2cGhanZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98C220697
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278791; cv=none; b=rFbgeXKwqbSmMjFIO2E1bGlQZb2pge4okqtYnhGFXfb20ejEBlgGXmtRswCF7OdT1rTvu/d/g+Z3YW0aHfrtA7KY2xBtaN8IjRHEYMzBRcqTkpWjm7/ah1+prcfICjVFMloU6nFaNM9CIfPPEFREHgTON/SHoSBTdLCVSvqVXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278791; c=relaxed/simple;
	bh=NOWwpmJBYV5ghwlu+/wbIJh/GmNExKZiNFQCVv+Sxo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpnsypT4i7n5XXZh5c9WUhvnSWtKz5Qa+RBdrv9cuf7nZ0Pqvu7uJV/l9cduuGMI/iY0FOhQQjrucvKu562uqIk2tMnEV5yAUUX8N8D9UvbyBlTpBJiFTqJIpQdQxbkTqTVnL2lKPry+uZrWh3jTjp6cAhWN4uV+pGgqLMfxjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C2cGhanZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43934d6b155so18055875e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278788; x=1739883588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InkFhCCRI2CAF2CvZhuAFHXRNWz5kwo2d8XJvFQW824=;
        b=C2cGhanZ3qP3tYQ7+rgoaXEvaxCntFwcdahOp72jSb3pNZ7V/lRmkfdcGBDXdymPuc
         n9jg77AYA+QtstzMdPXxLpUEpU8nXIwKlAE6NXUvl8+PdPde+RWr65TFRGepYQVqLa1e
         88OjK+JVb71D+VomxaYncRXaGXPzNyumZfI3jTDUyUnnnswdmS6g3Kl6LDVK5HP5ndrb
         P4gVT+RU1PQOe+j8FSIAcR9fjeohZgM5n8/OTeIilCVyVhNrsffTu5BwEWi9aCPaYQdy
         kPE9GRtXo6Pmyc7R6zq8pvU4ZvABYmH+dKVZaxEuvu1wlcnD6VfQvwnmfISfLJynS71B
         plmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278788; x=1739883588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InkFhCCRI2CAF2CvZhuAFHXRNWz5kwo2d8XJvFQW824=;
        b=DXIEPxL0Sl2GVNGNQaYRbaFlcikBOCvZhDJZRXK7BEPM/0c7kR1T3z/9Gcv1aWg4wK
         aM2I51AGG9IK4zXACATCDunvD9QzjC7arpWss7F4g4+U0u8L8puZ8HT7SoNcxD8DdUav
         Bpc/YJwL8t7pXtf78fp7v5itsqfL+bDCmvNiG21W+xzZEC/rrkY5Ry59Zip+T8FmmxSA
         4KgADkxxtkq5AMa71WsyzOx+s6OIqhY42nqUadMAQ6cppT760KE1IDk0glJdXB+/6O85
         SP0mUagnJZkWtq0dlgXHMF8MOio/Edenx6HdH4PF3oPUFjd2wO4jFXtLuDvxEXOSEoes
         Ds3w==
X-Forwarded-Encrypted: i=1; AJvYcCXFr+KxVdtO2WYCdgQ9khEhE39wITQF+3atvX4e0OuJxs0N/y0XT07CElYSrZh/nVq2RosHLT2tBCfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YypSPmPfjMj1ZONtHtbxidBpWURnBZIQeAjeBHbb//u7VXHHsm7
	C+KX3iCjtsPhlfLumMlFh7YkN2W/I2EhayRfDZ7UeCKpAcXCxUmty4Gs0CDIa+I=
X-Gm-Gg: ASbGncucLEqHx0PGd9P8Ufz5jSbQKo+r2BSUH/t3rOk0YDrm1MMxAAwX/Ei67Be752l
	hLWC+NXDRS4KXutaVm6CYn/5sryGanKQcRHWrUbtd7UznyFh90T4Chjnmnu+6HtOGIHFX0VNoaS
	hNWc9VeMESBAlgPW8RHYs09Qr39+IJ8KcyOAkhcmkgzqw1ye/FT3U2nEpVUAgPUNzpIA3rt+UK1
	sErvIIWf9IEqLG4EMv8Emmvrcimx56yk72RgrT1Gzpzx9X5uz3BBAn5d/Q/d7OpVRylkEuKTRdR
	oAzrb9E=
X-Google-Smtp-Source: AGHT+IGAfLPxb403g1DltYd1G/OhspieSmHLtCQMNLMJXwLnZmPs+Q8SM5s4PrtfHX6wbbCamh9rKA==
X-Received: by 2002:a05:600c:4586:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-4394cee55camr27847735e9.14.1739278788191;
        Tue, 11 Feb 2025 04:59:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:31 +0100
Subject: [PATCH libgpiod v4 10/17] dbus: improve comments in API xml
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-10-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7033;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cUeMTm4AJlpUcPLKsb+j9wyt+CiiE0p1BclrHiEIvA8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m2YV8P9B19QjeNWNpv9ZDJAUnOYImBalfSp
 APn5UystWqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtgAKCRARpy6gFHHX
 cuciD/0XIbABHtt97xk0v/AGmjCPGm/T44S32KN62FLIGTOwLjATojXG2US6BQxH+GrfG+xd+bh
 Tikh69RT4uQvPCeG0+jGFPsVhhf0n9Ck+6bLHKoeaVV/Vx6LUtLIpk+JedxCJEos7eHf8XSA3ee
 HL1C29ZvAxGFQl29+08VdJsAtKZVlyixtAEXkWvkovWiV6A2ZaoNOHuTWVxH5zVJ+hkHpsf+BmX
 1VOBY2m7BswM1gUs9zJcQgV59Xd7G+zOWSVvtSX8dv9/WNYZpf+K0bUSEPJcnoHUA1Z3MUhK2KI
 mKASAcnYFfphu09E4NJnbdAXO4jG7wGm8u9PFIEEe/1x89EXLKXlrT3RgQIhjoML0wm6ucQMmDa
 RG8cyuJgnGpdCkFEGe/eYet/0qCBdIXiCgXrVo7BvEaE9IioOtp1WJ0PssWI3QWIuEMZBO8yPtR
 qC3JZuHLRsQc1rkTwrZ3SpCKUSyNQ/G5lnIWhuZy4EKZ0gAdpPwnZtMizupKsr8gwa4mH2o1FpI
 ibpn+LwR5mpZ4N4tBhDHvIZlwdGKr3g7zc2v7cWVsoblBJz9Puq9QhLVz2ohCGN1M7xdNNGEgSW
 kYdMAtyawlfCBWQJ3SfdFaloPVVxD/Q4fA9dh9NsJMSNc/pxYmSjbR+db9OJCh0xcpXH5NlrHSR
 39QksCu8c/xbcUw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The current comments don't follow any particular formatting so the
resulting .rst generated with gdbus-codegen is all mangled up. Use
proper .rst formatting to make docs better.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/io.gpiod1.xml | 98 ++++++++++++++++++++++++++------------------------
 1 file changed, 52 insertions(+), 46 deletions(-)

diff --git a/dbus/lib/io.gpiod1.xml b/dbus/lib/io.gpiod1.xml
index ace7d72..411ea6e 100644
--- a/dbus/lib/io.gpiod1.xml
+++ b/dbus/lib/io.gpiod1.xml
@@ -1,5 +1,5 @@
 <!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
-<!-- SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
+<!-- SPDX-FileCopyrightText: 2022-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
 
 <!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
  "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
@@ -54,58 +54,60 @@
       contains the list of default output values which are only used in output
       mode.
 
-      Available line config options:
+      **Available line config options:**
 
-        "direction" => String representing the line direction. Accepts the
-                       following values: "input", "output".
-        "edge" => String representing the edge detection setting. Accepts the
-                  following values: "falling", "rising", "both".
-        "active-low" => Boolean representing the active-low setting.
-        "drive" => String representing the drive settings. Accepts the
-                   following values: "push-pull", "open-drain", "open-source".
-        "bias" => String representing the internal bias settings. Accepts the
-                  following values: "disabled", "pull-up", "pull-down", "as-is".
-        "debounce-period" => Debounce period in microseconds represented as a
-                             signed, 64-bit integer.
-        "event-clock" => String representing the clock used to timestamp edge
-                         events. Accepts the following values: "monotonic",
-                         "realtime", "hte".
+      - **"direction"**: String representing the line direction.
+        Accepts the following values: "input", "output".
+      - **"edge"**: String representing the edge detection setting.
+        Accepts the following values: "falling", "rising", "both".
+      - **"active-low"**: Boolean representing the active-low setting.
+      - **"drive"**: String representing the drive settings.
+        Accepts the following values: "push-pull", "open-drain", "open-source".
+      - **"bias"**: String representing the internal bias settings.
+        Accepts the following values: "disabled", "pull-up", "pull-down", "as-is".
+      - **"debounce-period"**: Debounce period in microseconds, represented as a
+        signed 64-bit integer.
+      - **"event-clock"**: String representing the clock used to timestamp edge
+        events.
+        Accepts the following values: "monotonic", "realtime", "hte".
 
       Output values are applied to the lines in the order they appear in the
       settings mappings.
 
-      Example variant that allows to request lines at offsets 1, 5 and 11 in
-      output, push-pull and active-low modes and specifies the output values
-      as active (as visualized with g_variant_print()):
+      **Example variant** that allows requesting lines at offsets 1, 5, and 11
+      in output, push-pull, and active-low modes, and specifies the output
+      values as active (as visualized with `g_variant_print()`):
 
-        // Line config tuple
-        (
-          // Array of line settings mappings
-          [
-            // Single mapping tuple
-            (
-              // Offsets to map
-              [1, 5, 11],
-              // Line settings dict
-              {
-                'direction': <'output'>,
-                'drive': <'push-pull'>,
-                'active-low': <true>
-              }
-            )
-          ],
-          // Output values
-          [1, 1, 1]
-        )
+      .. code-block:: none
+
+          // Line config tuple
+          (
+            // Array of line settings mappings
+            [
+              // Single mapping tuple
+              (
+                // Offsets to map
+                [1, 5, 11],
+                // Line settings dict
+                {
+                  'direction': <'output'>,
+                  'drive': <'push-pull'>,
+                  'active-low': <true>
+                }
+              )
+            ],
+            // Output values
+            [1, 1, 1]
+          )
 
       Request configuration is a hashmap mapping names of the available config
       options to their values wrapped in a variant.
 
-      Available request config options:
+      **Available request config options:**
 
-        "consumer" => Consumer name as a string
-        "event-buffer-size" => Requested size of the in-kernel edge event
-                               buffer as an unsigned 32-bit integer.
+      - **"consumer"**: Consumer name as a string.
+      - **"event-buffer-size"**: Requested size of the in-kernel edge event buffer,
+        as an unsigned 32-bit integer.
 
       The object path to the new request is returned on success. The user
       should wait for it to appear before trying to use the requested lines in
@@ -239,8 +241,7 @@
 
     <!--
       EdgeEvent:
-      @event_data: Contains the edge (1 for rising, 0 for falling), timestamp
-                   in nanoseconds and the global & line-local sequence numbers.
+      @event_data: Edge, timestamp and the global & line-local sequence numbers.
 
       If the line is managed by the gpio-manager and is requested with edge
       detection enabled then this signal will be emitted for every edge event
@@ -249,6 +250,9 @@
       D-Bus EdgeEvent signals are designed for low-to-medium frequency
       interrupts. If you performance better than the order of tens of HZ, you
       should probably access the line directly using the kernel uAPI.
+
+      The edge contains 1 for rising and 0 for falling. The timestamp is
+      expressed in nanoseconds.
     -->
     <signal name='EdgeEvent'>
       <arg name='event_data' type='(ittt)'/>
@@ -287,11 +291,13 @@
 
     <!--
       ReconfigureLines:
-      @line_config: Line configuration. Refer to the RequestLines method of
-                    the io.gpiod1.Chip interface for details.
+      @line_config: Line configuration.
 
       Change the configuration of lines held by this request object without
       releasing them.
+
+      Refer to the RequestLines method of the io.gpiod1.Chip interface for
+      details on line configuration.
     -->
     <method name='ReconfigureLines'>
       <arg name='line_config' direction='in' type='(a(aua{sv})ai)'/>

-- 
2.45.2


