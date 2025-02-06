Return-Path: <linux-gpio+bounces-15453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D339A2A862
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF6C3A8166
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBDD22D4F0;
	Thu,  6 Feb 2025 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M4gTKgW8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D75222DF89
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844547; cv=none; b=WeNsFneqg4HwJCgbNC+LU4ZiZd+ppZ4xcPRsRhJjUvUHOpteiefdmC+MD3zjFVHuSnVRkmo2FgQB+4TTIah4aynZVzOeMOnaAhW3M6G3KArT6BaGt+NLYuyJ7e+k6dj8QrkY6roXKmqBgA8DdE0rSNMWHiWDTjfswu7VDZLIqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844547; c=relaxed/simple;
	bh=NOWwpmJBYV5ghwlu+/wbIJh/GmNExKZiNFQCVv+Sxo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGsyhGJTAu8j2KG08hizbouPXjWm3YCCxPO/AkXG8LgAQUHrlXfdfBxv8rZysfxYP/4dRv2h3iUONblZkEnHcOQ7aD+3Ga2vO41C7qlR94FaV6z/e9neRQbbVlcf/GOxyt3wJOVDjIPPpdJ6OFqX1nQWOmQ9/NjQugLOqakdsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M4gTKgW8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361c705434so5691695e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844544; x=1739449344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InkFhCCRI2CAF2CvZhuAFHXRNWz5kwo2d8XJvFQW824=;
        b=M4gTKgW8IPwIoq7gPDV/WX0p2qABjJto7o0Qm4aJ288o9wIghk8YKlkQFqfQPDn6vh
         Sq1Am9x2b38LUCqD8+/eVbPVdI+tLMdKZKER5jZftuioMCF8fJ9nZdG7yNbmXetOpkX1
         CO40LKe9Cwi7pwAyamncr/w6VbV79BkHkNzS1D2V6Rxv1YWyRb/zQzOFEnQVP3IjHeJv
         c5BpGCX/Z3P94yJ7MRptoSrPaPN7LcTFeYXvL1h42dscuZo/GVU5bFG6uN3w1RIUMTyu
         f/famR1YPt9v62oErd5bqf6wgqvwRK801FAoHVIacJpaaCBLDrHUZANNtMtvXul+W1Rh
         kBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844544; x=1739449344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InkFhCCRI2CAF2CvZhuAFHXRNWz5kwo2d8XJvFQW824=;
        b=TFbLBi93pJqOAtx7wFl7Iy6OXpvpoLgdQvZQ6tYf6/oqwgkU1PoFwbtFl0ZxoM3Rbg
         6AjoY+POzda2VIWyJUc4ibpwPQNojEnkI4J62iQlcydoJeQwKHZyYInvi9H0FvyVkz8N
         u+dARzt58G9zEK7J3SA8Q8xbrUaP8vgzMgsZ1JwyezRRchTMSKJrN8ugMvcxb22pBAqe
         z4eaJyll6xnFuHc95e5GGhl52+Er494dElZot/BeeYguVhTuFVB1PTHMVG1ZTvTR0f5y
         35NlfKGqxfw69a99mqLlbaoze9yzTvCzV5tAl5yXk+8q7TcKiL2Tx4e9lEcWsi66JFTa
         m5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSpygEkyLt421wkrgYb2gxr7ssOkSSRQcD9tThInXTk6oZji3p+UAO8/KLgs7OYcV7Bu0l6r+jGoJj@vger.kernel.org
X-Gm-Message-State: AOJu0YySRWS1lTjxKtlz8TMhZqo+EbegX20l+LH8MjlBpUVQ4Fc/T6Br
	mnZV9IqJV/10Nud2OzfcVOdYel5N1Ymx7FUqI6PTwxb7GHm+tXAwNHPH/6A9qtY=
X-Gm-Gg: ASbGncucXk0Qoy9tnbv5bo3Bv0G+83M2RoY8/X4A3HslTvgs3W8upBtPW4WfbdHY23z
	eE3+H+wthDHfMLNSVnZjgo1K/HVnQPxUjBxdrNvvRvGCtnjnHG//GficClnhdToNuLd8dEDURMA
	0jf/bUejxZpHyqbvH7rLn665dySH3HzudEobJ0jsC+3W/eOt8GmN59EneCEm+p9//Hhy9fQMQDB
	yJOsQELw3EnXZbbAkIQxZgJNpH5vyNqxyQ58Y1f7rRaH6RPouGif0yX/YqMmVb42LaFLWeo0Sht
	iUsqOA==
X-Google-Smtp-Source: AGHT+IHfJVHXcnfMqPnZKHXlcFb2MFK/pjnfr5tt0Za/lefI5nSX7qAKRVp1lWgUuLdapE8PeyzLlQ==
X-Received: by 2002:a05:600c:4253:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-4391466908emr20315405e9.30.1738844543748;
        Thu, 06 Feb 2025 04:22:23 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:06 +0100
Subject: [PATCH libgpiod v3 09/16] dbus: improve comments in API xml
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-9-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlzgGZl3VuPRbMxkTY+qJPRQZUEFOUroKmu+
 eloDGzLUIiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcwAKCRARpy6gFHHX
 ckUBEACHqaPoY5Rk9F8XDVXD9bNdN2EqbP8F2MiorSs25jTXpugwx+dPmxDa1/b4kvfIZpD0DpI
 Uuay/LVMsOlWm+DdGqaqOpr0RrvXA9FXEH7Yg87RNuCeR80IZgHtHCyzb8I8mRyqg9YuYOoC/yY
 ldXhVcyRyr2KIKElAoIbPCJpHPmphK4JlLjVFr7EvCQwjb28MCAf40OdSpkO5+faC9m9HU8j+pt
 OTEwS89pidqHQShyjwZLNa2OmnEAoTsHdSHUjXJyPJybYtxbvzD8RvpchstT84OBuSx/Bnx1z67
 D5nUA70frx/fSOjXVda6UrBmhVXOLczjnaevuEOjw/z9R81x94vZj7iTT1KEyNMbipH9KmtKEKN
 /5Oxgq/L/W4WmJCoE0cilNotbJPXrihn45aQX8RelL50B/1VPmbqaOitRcfCFHG+Ax5jHA67Arv
 DAr071vWD/jpsFADAraY10av5JL27Eemnfr8zW/BvrLIjLpkIctiO/1tJCxLn52YZgMBXKsdWMk
 CGWbLn8nI+ZRd8oiWCfEsVxPNF4tiCYrwFa0g76cAj1JCzU2z9Xr5hYwQcjDlNgPftSjyWSkS1r
 nj6we8Q6ZnnGxzVrRdl+kS1zrSvz+Rr+Te3/jpqCN+6naNbZTmlX8/AR9T0STsgzegmTyE0JckK
 AyBcYT+AolPdJXw==
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


