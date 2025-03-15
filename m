Return-Path: <linux-gpio+bounces-17654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF1A63033
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 17:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2534B176304
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 16:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844382063FC;
	Sat, 15 Mar 2025 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="COTXoZiw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DF32063D3
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056917; cv=none; b=rlqTQ8OGDJDQNSbaY6Ja1tQu5BrzBrC4d7ssG9hL9yxFVbUQSCS1u/684+4P/tjZPRvI+rgROl4gILcnua2i6g2PYMFPW30u0VICz+7boukL3VIw15wKjn73vMtLOwiWQKZVVB/GSr80qxwWji5skEuJPsfFdtyLF3a1RpG1O6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056917; c=relaxed/simple;
	bh=5z75klJulPBK3euVFo5jCw9QXY35/qZ4NCunDCR/9Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkyjVdec/aY3qzq9Pq0WI4X8uAHwtoK2hi0gUZ8iVFviznrI0wecnZmJoYnvCRuVYlz5ME/HfEOxXlJnrInSAJ6m6CdM8YhCBJEzbL7OetypoiLx9WKnYrsFOKzitCJtPv5xAnw94HziJvZo2wUuh/IdTKEiF99BgziQ/iANTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=COTXoZiw; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 173B93F31F
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742056914;
	bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=COTXoZiw0rI0I8hK6jU8eDmoOY+g1UbI5X3aKcR8xq/SOBI/6OQA9e+wwy3DKLqqF
	 5tBGXhBWcungx4XeLDlPNpTTrt7N0HHos+/61XCkgSEzcHd5L2deboNOanodSRk19b
	 6loiQ6I+vkrZUq4eJ5HcFVtnhP8QZcpVUkwpvnXHgJIwxlL5JTwyPagXk1L3YlKVBG
	 stEyoBtP66ODYYaP/ZTr6g4myNj89kDSbFSjZuH3Xwz/dd/oEt9mEfcdyXC9C1mB+I
	 5LIulJbOIzF1IucBCa1GvCWbrbfTaB8rq5Wgt+r9DzbwUvZSq02/c7j/20SaXM+x5K
	 x04//IcBtvb3A==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2235a1f8aadso46886635ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742056912; x=1742661712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
        b=IGzSyA7ZRasnPNpUhaIHB1t7iQ7CtXU3nr2UJU+tIkMZyiW9BPlV+Xvd7ZmO0AAV+h
         V+08w9f+pJ+BFIoxTh4r/TjzqcBS2XV2OM2/2mznFmAhSeeN6BpvwoQFfnfNiYPnJ3Tn
         o/UXX5olc55vn3r8OVqhXdxjduvHurXYOlCH0BrcXfPKIe6XpzqTIP39gNyPEawUUEmA
         NgCDCEnLycwNcZSfdBGduK+POQju1RRTWiW/YZgjmXV2fe31fYephQzBMd/6JWYNsEk4
         ZpF9aFlu3VKvXsM3FZvdHVPlS/oaT5MLjYuSda8oBIAtcC4fengAhpDIR5vNYOLCgP7/
         5vcw==
X-Gm-Message-State: AOJu0Ywcy66wToeZ9zH9Ic1sXoz+rslXBsaFb6qsHnCjdBEb/u1jSwzN
	RrHodHl1rsV9Glm86y90Aj8p67gFIGfU9e37Gw8PaJODE2gIrbU4BGOIoqLRxU5JTnqnEljhKT0
	b7cHrtaLUHFDPh2Vl5PNZvvcnZqzN0OecsBg6y2Gtu8pY3CS8n8rTZlNSQYD2diVgrY5B/tUyZx
	AOiumdZzM=
X-Gm-Gg: ASbGncsn7MAa8zevGm1mK5VCxPVOZI1OPvhBpiAuVzJuWEmXfJ6TZkax4ZYN2skkGj4
	gn7PdUF7zqrHanHkykGSXa12ESjivH4edKlmMyrs2IZeWwa1eWWmXYZLf2XHllJpwDlNcrNWV9I
	ubMMlTK4jvp4VdKHfVYesRT5WtYr7zRl26oljledjvfRwNTg7MT+17pY/hfk7Iz1YLo4BGCvXR1
	qEIaforNtTZasyoMBBpKVfX5ePK8Tp+RDa9/GSYWRCLSHW4ScpYCNmhr7mJUEU8uptVAS/j00tp
	0vvLOtye2WjTjczs
X-Received: by 2002:a05:6a00:464f:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-737223fd0ecmr6839070b3a.22.1742056912027;
        Sat, 15 Mar 2025 09:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZPiPSqUBXWonM+1wni5zrfFyY061fEIcUx8VfreIK0Dp+klWcEbYSYn7e4dG+W0ARwHPvpQ==
X-Received: by 2002:a05:6a00:464f:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-737223fd0ecmr6839052b3a.22.1742056911569;
        Sat, 15 Mar 2025 09:41:51 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:83e6:3590:3498:db44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155e3a9sm4637104b3a.71.2025.03.15.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:41:51 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/9] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Sun, 16 Mar 2025 01:41:22 +0900
Message-ID: <20250315164123.1855142-9-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250315164123.1855142-1-koichiro.den@canonical.com>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the newly added configfs-based interface for GPIO
aggregator.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 .../admin-guide/gpio/gpio-aggregator.rst      | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
index 5cd1e7221756..8374a9df9105 100644
--- a/Documentation/admin-guide/gpio/gpio-aggregator.rst
+++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
@@ -69,6 +69,113 @@ write-only attribute files in sysfs.
 		    $ echo gpio-aggregator.0 > delete_device
 
 
+Aggregating GPIOs using Configfs
+--------------------------------
+
+**Group:** ``/config/gpio-aggregator``
+
+    This is the root directory of the gpio-aggregator configfs tree.
+
+**Group:** ``/config/gpio-aggregator/<example-name>``
+
+    This directory represents a GPIO aggregator device. You can assign any
+    name to ``<example-name>`` (e.g. ``agg0``), except names starting with
+    ``_sysfs`` prefix, which are reserved for auto-generated configfs
+    entries corresponding to devices created via Sysfs.
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/live``
+
+    The ``live`` attribute allows to trigger the actual creation of the device
+    once it's fully configured. Accepted values are:
+
+    * ``1``, ``yes``, ``true`` : enable the virtual device
+    * ``0``, ``no``, ``false`` : disable the virtual device
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/dev_name``
+
+    The read-only ``dev_name`` attribute exposes the name of the device as it
+    will appear in the system on the platform bus (e.g. ``gpio-aggregator.0``).
+    This is useful for identifying a character device for the newly created
+    aggregator. If it's ``gpio-aggregator.0``,
+    ``/sys/devices/platform/gpio-aggregator.0/gpiochipX`` path tells you that the
+    GPIO device id is ``X``.
+
+You must create subdirectories for each virtual line you want to
+instantiate, named exactly as ``line0``, ``line1``, ..., ``lineY``, when
+you want to instantiate ``Y+1`` (Y >= 0) lines.  Configure all lines before
+activating the device by setting ``live`` to 1.
+
+**Group:** ``/config/gpio-aggregator/<example-name>/<lineY>/``
+
+    This directory represents a GPIO line to include in the aggregator.
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/key``
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/offset``
+
+    The default values after creating the ``<lineY>`` directory are:
+
+    * ``key`` : <empty>
+    * ``offset`` : -1
+
+    ``key`` must always be explicitly configured, while ``offset`` depends.
+    Two configuration patterns exist for each ``<lineY>``:
+
+    (a). For lookup by GPIO line name:
+
+         * Set ``key`` to the line name.
+         * Ensure ``offset`` remains -1 (the default).
+
+    (b). For lookup by GPIO chip name and the line offset within the chip:
+
+         * Set ``key`` to the chip name.
+         * Set ``offset`` to the line offset (0 <= ``offset`` < 65535).
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/name``
+
+    The ``name`` attribute sets a custom name for lineY. If left unset, the
+    line will remain unnamed.
+
+Once the configuration is done, the ``'live'`` attribute must be set to 1
+in order to instantiate the aggregator device. It can be set back to 0 to
+destroy the virtual device. The module will synchronously wait for the new
+aggregator device to be successfully probed and if this doesn't happen, writing
+to ``'live'`` will result in an error. This is a different behaviour from the
+case when you create it using sysfs ``new_device`` interface.
+
+.. note::
+
+   For aggregators created via Sysfs, the configfs entries are
+   auto-generated and appear as ``/config/gpio-aggregator/_sysfs.<N>/``. You
+   cannot add or remove line directories with mkdir(2)/rmdir(2). To modify
+   lines, you must use the "delete_device" interface to tear down the
+   existing device and reconfigure it from scratch. However, you can still
+   toggle the aggregator with the ``live`` attribute and adjust the
+   ``key``, ``offset``, and ``name`` attributes for each line when ``live``
+   is set to 0 by hand (i.e. it's not waiting for deferred probe).
+
+Sample configuration commands
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: sh
+
+    # Create a directory for an aggregator device
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0
+
+    # Configure each line
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0/line0
+    $ echo gpiochip0 > /sys/kernel/config/gpio-aggregator/agg0/line0/key
+    $ echo 6         > /sys/kernel/config/gpio-aggregator/agg0/line0/offset
+    $ echo test0     > /sys/kernel/config/gpio-aggregator/agg0/line0/name
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0/line1
+    $ echo gpiochip0 > /sys/kernel/config/gpio-aggregator/agg0/line1/key
+    $ echo 7         > /sys/kernel/config/gpio-aggregator/agg0/line1/offset
+    $ echo test1     > /sys/kernel/config/gpio-aggregator/agg0/line1/name
+
+    # Activate the aggregator device
+    $ echo 1         > /sys/kernel/config/gpio-aggregator/agg0/live
+
+
 Generic GPIO Driver
 -------------------
 
-- 
2.45.2


