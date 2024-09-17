Return-Path: <linux-gpio+bounces-10218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F097B06A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0185283A1D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8901A176AC2;
	Tue, 17 Sep 2024 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkgBungB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B5016FF25
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577711; cv=none; b=PK2jdZGcj1kYL7tEbFqWyC0e9n4iItxIGG3szboXsUkszH7OmStEMJsNkGEVvDOL6ZH0tc/kl+Aw7WH9qtq9WhEiUcqz12Hk3hKEg4iSkVt9Yk4TGqU6iMlDHM0RO9eukLtEypOzZnyyhT6ZYrTJwRmC7rmZBi5pWOrHaxAlFZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577711; c=relaxed/simple;
	bh=BIs0HrEmxJMJgdMTzkHfWx2UmOHkRS0eaHFTQcHEoEs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Afr/eOYLpLtblGIvPT2D5JAEnD0yX1hGQ7gvI1ZRiNsnnyppVo0Dxu3YyjTSrkiwR0OAeHaoM9GZpfTAIt2ZX6w5rsUXZRlUNpxp+63O0dpjpbhWfWbmzNGYCy31dXHJwRKeHlPtqAvor6ZAJMzbzJt69oS0EAR/G+F+DVLRsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkgBungB; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20543fdb7acso31004975ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726577709; x=1727182509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4D5fNrnAp8q/B6mDWWVTG8M73lBuWFQKBW9B9xeq0k=;
        b=hkgBungBUb1qsXW0so0yLO7pkrf+kH0MRlvjDRuXhR3NZMEgM+gsEqxbTCH2WXRfE0
         q3Zvk8EjOp1nozJKFTGSR3cpDUxOluYRSvqYWbjqeTuyYixMDriExWLTN9U0yHRj94pP
         UqHABF1I8iByi0IGHf2cK/nAzpNXTV7W14rriYMvflKyJNBsScMFrFdphkQ3RlyX+0GW
         qeGpdfZxf13ktQ1EaNSunRHDB5AcVQXITw3c4X/pIaqSmeOccw9eGO55ctynjyDMW2ge
         v1ZSBA79lJDaL2IREj66tZXJGKngArBP75T/D+ZeXCGTis/3n06PbgE3poKFJjNLPQjB
         jAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726577709; x=1727182509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4D5fNrnAp8q/B6mDWWVTG8M73lBuWFQKBW9B9xeq0k=;
        b=kMv3XtDG5kagEtboOBQSD/5sYB/gd2o6Yz0/49dOXg5cbXU8BJeH/gK0g+fuU4fsQ7
         3tFFeoltSRMICY9oA344B2zpKf1I3gkPcwtctnUjwAulRZymfcTK+viMZDBFX1twtMwZ
         emilX9GH4Wa5kcHF85NtqjTQiBTzm+O/aRDXE03f6kHcR4KCWVR0Kj2KQb6k/3w8UHTR
         nQhFA5E+OLABfnSp9wdXwdLH2Jg1OTAri0azxNiNZnUMv6D6ckpXR/vYiPlYpkrR0PHE
         gfHvp6fmp6X9wps2hCXpoI4Jm/VbPtXbCHYPFZD+/+0f57GKFP+PJ+e+s9SMpnYpFmyt
         dPAQ==
X-Gm-Message-State: AOJu0YxMTDST8sc7O1dxt74RdNsZ+BtOs5aV9jj6+wQS6DRthdXXljn0
	MgXmwRBisWjOimyuUjPr1+s6hO5jTnT59H7Oe9X3a5ETh079pFG+cI1w//c2
X-Google-Smtp-Source: AGHT+IGaQeWcVI7xfjHWUPaSXYuwj5cK01E7KrpBnRglymYxLc2zQpsvGQDVU7Ddq/PFXawgBqII1g==
X-Received: by 2002:a17:903:2292:b0:206:d6ac:854f with SMTP id d9443c01a7336-20781b42a24mr226332805ad.3.1726577708977;
        Tue, 17 Sep 2024 05:55:08 -0700 (PDT)
Received: from rigel.home.arpa ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079473c85fsm49567325ad.285.2024.09.17.05.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 05:55:08 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: examples: Add graceful exit to async_watch_line_value
Date: Tue, 17 Sep 2024 20:54:55 +0800
Message-Id: <20240917125455.324551-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of the example is demonstrate using a request with poll().
It provides a hint as to how the poll can be combined with other fds but,
as Python comes with batteries included, the Python version of the example
can be readily extended to actually demonstrate this, as well as how it
can be used in multi-threaded environments.

Extend the example to use an eventfd to allow the poll() to be run in
a background thread and be gracefully terminated by the main thread.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../python/examples/async_watch_line_value.py | 51 ++++++++++++++-----
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/bindings/python/examples/async_watch_line_value.py b/bindings/python/examples/async_watch_line_value.py
index 1d6a184..055d54f 100755
--- a/bindings/python/examples/async_watch_line_value.py
+++ b/bindings/python/examples/async_watch_line_value.py
@@ -19,7 +19,7 @@ def edge_type_str(event):
     return "Unknown"
 
 
-def async_watch_line_value(chip_path, line_offset):
+def async_watch_line_value(chip_path, line_offset, done_fd):
     # Assume a button connecting the pin to ground,
     # so pull it up and provide some debounce.
     with gpiod.request_lines(
@@ -35,20 +35,45 @@ def async_watch_line_value(chip_path, line_offset):
     ) as request:
         poll = select.poll()
         poll.register(request.fd, select.POLLIN)
+        # Other fds could be registered with the poll and be handled
+        # separately using the return value (fd, event) from poll():
+        poll.register(done_fd, select.POLLIN)
         while True:
-            # Other fds could be registered with the poll and be handled
-            # separately using the return value (fd, event) from poll()
-            poll.poll()
-            for event in request.read_edge_events():
-                print(
-                    "offset: {}  type: {:<7}  event #{}".format(
-                        event.line_offset, edge_type_str(event), event.line_seqno
+            for fd, _event in poll.poll():
+                if fd == done_fd:
+                    # perform any cleanup before exiting...
+                    return
+                # handle any edge events
+                for event in request.read_edge_events():
+                    print(
+                        "offset: {}  type: {:<7}  event #{}".format(
+                            event.line_offset, edge_type_str(
+                                event), event.line_seqno
+                        )
                     )
-                )
 
 
 if __name__ == "__main__":
-    try:
-        async_watch_line_value("/dev/gpiochip0", 5)
-    except OSError as ex:
-        print(ex, "\nCustomise the example configuration to suit your situation")
+    import os
+    import threading
+
+    # run the async executor (select.poll) in a thread to demonstrate a graceful exit.
+    done_fd = os.eventfd(0)
+
+    def bg_thread():
+        try:
+            async_watch_line_value("/dev/gpiochip0", 5, done_fd)
+        except OSError as ex:
+            print(ex, "\nCustomise the example configuration to suit your situation")
+        print("background thread exiting...")
+
+    t = threading.Thread(target=bg_thread)
+    t.start()
+
+    # Wait for two minutes, unless bg_thread exits earlier, then graceful exit.
+    t.join(timeout=120)
+    if t.is_alive():
+        os.eventfd_write(done_fd, 1)
+        t.join()
+    os.close(done_fd)
+    print("main thread exiting...")
-- 
2.39.5


