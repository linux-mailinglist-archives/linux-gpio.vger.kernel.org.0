Return-Path: <linux-gpio+bounces-16502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59030A42338
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46E117A1DD9
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774C12561A3;
	Mon, 24 Feb 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="X5sk5TFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43125C6E9
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407533; cv=none; b=oQqIeQFsLvUoGryqLTCz/4U/lDMNF7UIHZ23vu58/5sp7kL+V72l7LcFWLXhvvjxs1A/By944mnjVr/XLG4aeAr8TOJEoEEtjn0iGIA9ZLhzgQH0ieowmEuBRN8ZAjMQoYp4nlTCwSA2HrfNrWcinQCdC+YZnBJTd3UytMn6ae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407533; c=relaxed/simple;
	bh=5z75klJulPBK3euVFo5jCw9QXY35/qZ4NCunDCR/9Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAyPjtj7VoHvY6bLdssUxCO74MaLjUZ/43vRE2DB+Sk00t45CPCAyj+aJHl2RRrgNeqEesqXEtHsSRLQ1hf/4ztnoRFY3BEEM4t4s08Da/LPkjzFzoM8DX1SGsYUfRzf+MM9o3LudP1bcL/eiOZYG4e9aoiKsFOXxHh6kUvthLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=X5sk5TFm; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8F813F84B
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407528;
	bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=X5sk5TFmTopWRUURxS3AisP1L4ZqBngZoeRafiP9zjRzKwMtLaRZvZN3WxkRkVuNV
	 UpGE+LQ8DUuPA4nBPSno+/+ucCujOjI3US2Xs1l1F/buxiNPpTkvxrocEzAozPexbo
	 4xvr/RlNcPGIsEeIoIS8gYf+eEyMb2SFTgO37gARWjR0tg9IIXnD/mm7eeK/GvzAp6
	 vfQTrnEzQQatpHCAT5zmsQQ2P5U8JkXWs8btEp/rNseH1fUFNUMkYl9qHXcslCQCr9
	 jLGFHI8MygER0aQ3G8BEck26GKlBmyY06zGnvW6fScwZflsom0LVyrIljvt+tWmOkw
	 +36A/b1dqrGsQ==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220ec5c16e9so92169975ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407527; x=1741012327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
        b=sdOIOi89WPvauxpZYlZXqZxjQf8IEyZH+Om8Q6G6Fg4GXDBGohMlkt1GkgqtLEEwH9
         bpL/DLgndSGuNRsub9Q2gk7kGYmggDxWSlq5Hq7VfT+O/7MK1JG4ShHPN7q0o9sGSsue
         IDd9wKSWveCeyImjo6iURbCUn5cwry0rvP2xJRr3TmhG/IO4lSGPKeRBOW7R1sapgiuG
         P6HpzlkT/eag2ATsoZAz4htQau/Jlox/fJNeV7YO0NVNwmSUv0Ot9HmXIpPHj3Dudncv
         6lQJ1JIg00W9w0fgRymE380TXTUv09FwLr3nocBvya1zFSprQWcWIDQLR2tlPnjl+/A5
         STNQ==
X-Gm-Message-State: AOJu0YxApfwEOFbpZrkL5UzdXCCNCKgCuGtSZFC5We4oUyLK86uHZTaw
	n2vDmROSh0V5GZWrxYlYSgfVN32KdHuRpLf84dUvG8hxhRyWxT1SATLTtYP3moLVZHAy1lTwNvj
	QHho4yKGHXBz4jSx4fVkBNiRw0JcEl50vDMuREAYqBfNKQNg+Vnv/xFcDiuiTCYu7AVNAbwjgVT
	RvqR/ZWoo=
X-Gm-Gg: ASbGnct4v8rPaTN2iEKrQM4pnjum4gepaaPTSnzeSB8PSTtwTAPDM6Fs6KX43DEDoBY
	y2tSSPmj4dhS9eXl8bd+ajuJ1Xv9ZtpAXisqA+qLELwB6JTFNhO+7piLURm1w8dSoNce9LJ8sxy
	iypFoBgATyoWTnxLFxsPfJKKlRM7INaBo4CuS6dUTcNJmI1HzSs8LY30G+XdKm9Vhn6uDB/fxB8
	prG/aSgSJl14qZnZE/RwFFwguj/TrwjoJFw2eBC5nY+4Jepo2gY2VBLGHZR62RYu9967CvFEWm1
	g5FU2Nm9V7b3P9lX
X-Received: by 2002:a17:902:ce8c:b0:21f:522b:690f with SMTP id d9443c01a7336-221a11b9bfdmr221006905ad.46.1740407526723;
        Mon, 24 Feb 2025 06:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSZQwlljMmmYRCC7Y9lX6+uL/BcL5sVp/WVmnDYsqhnw8DVA1aShXde+2Ht/xNGnXwOQ2afA==
X-Received: by 2002:a17:902:ce8c:b0:21f:522b:690f with SMTP id d9443c01a7336-221a11b9bfdmr221006465ad.46.1740407526306;
        Mon, 24 Feb 2025 06:32:06 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm177613895ad.109.2025.02.24.06.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:32:06 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Mon, 24 Feb 2025 23:31:34 +0900
Message-ID: <20250224143134.3024598-10-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250224143134.3024598-1-koichiro.den@canonical.com>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
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


