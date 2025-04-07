Return-Path: <linux-gpio+bounces-18260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4BA7D2F7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64869188B099
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F84224236;
	Mon,  7 Apr 2025 04:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jWjvI6Rb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA1223719
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000270; cv=none; b=cpSV81CZZVLM5ou0aLPs1mu+uHUZ17H2/P+FlzZmX3B4DULWdS7fcbiXvPPQHI0Zj0pmw+GEq7BE7tGGRzxDkJnofNv+BLbevXeNt3stkSZMejENl2+FKDvfa+BaHTOnF8HRKkZ9iw6YktBM6X6fxG0QW09YA10BgV0Q9hSWV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000270; c=relaxed/simple;
	bh=5z75klJulPBK3euVFo5jCw9QXY35/qZ4NCunDCR/9Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1GO5sjCah22frmR8rZtWPGlszo3h8P098pDX9GLaYiijgCtktUdBGHFHJXq27DI53WG9WfopegdQV3xdydGOtB0yXpvy0lbkY0kO1Zq8bzw5BAGeqiz1GWh5yz9RzE4EblzN2N80JvCOocOeDnsaKwxEifB+UTgZYop0sa2Tws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jWjvI6Rb; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A6EFC3F342
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000265;
	bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=jWjvI6RbueLLP7tt7e9kkBC5C/DIf6NbM47Ra31ueuYluJIzQCI5MZurPZ/ZLEbsg
	 YrFh0sXkj2fztmjUUDLuye9xjo3ULMvkKIE9TOB1fxVIOmEVC0jksPTz7sKJ2qu82J
	 ZII1undzNIAhD51yByOcdptH09vTvn6Kni0FGqVG5hFjHLKmhHje4qsbfaBWzPy4hz
	 2/0KtwE0x/4UQJ+11kWbnQFV6t2sZ322oXOmIZOjNoLvb367qIseTulDHSBGAheeeH
	 C6Y52RsbpDqrxH4IoA/srBtUh30cx4P7qwFTipOTOeI+VPTkFvtQkRz/SmCxPqWvjy
	 TxSa/12mIrNFA==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22403329f9eso32410605ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000264; x=1744605064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
        b=PENFS+rNYJuhJ9BOomcMQgcRb8gZzGDiwMcP1fa0Key0GRw/tlXJhQ82Sylho4Q73X
         8UVeamQ420ENoe5pJ1XxbJz0s+Cgw8o+zMLs3yAFJLUB9Ae5nj7pwXVTdTByGHiCNQvf
         tHbH4LCp6M7kaXxO5Q9SRQa1ei8yoSM6k4A9fvDRpbsl+UuwcBnBV0+ioD6rC4iGG3Yl
         OLbmmyKD4gae6yv+PsE09q4TKgwtrQ+LBlTWgKzgjBm/YNwe2YttSbTDZrNwBfI0IZxH
         6sLPbD2QLTELm+tOUKJeIn+7Jvx5R7H5vzyKuibNN2VTM62aK9AxCsyGZCIQVhfzTxDs
         KCIw==
X-Gm-Message-State: AOJu0YxkIb09IBZC+DohE15JHL5h1GxM76JZKdQdVYkxdzEgfVg45ZWJ
	HFiOGOV0H2rAJ/lztdKnuDY6M9dP8XzP3z7j0o6VdilvXP2US8Fa3wri8uGjmfxBbgH59Grg5Ui
	oyg04xif0rdOk0et44+2rhxIWe5JjYjqcipm+HccZP2RZ8dMu8ITO4sJSDPNq1YEdTFc6+EKCFS
	XkxuitphI=
X-Gm-Gg: ASbGncvMoewzvA3dyYwyX21A7HHLPxuP4pya3kOrWIJHJAaucLrH3Dohl2wqwa8tmmD
	8mFSepHROe9p5+B+u2AlsfZASS4H8cmz21S6ynHDvwlNF7CjFP2sfbF4aOs/py4+OSHclllMF9l
	Uz1xm7kA0gdncA/vYHLx943PsHWrGZsR/ciY09QM5al2aWAVfkVmv8WoF6GhaPVdJ656se6PjJp
	CxSEcq8/mfS7EeuKWR/kjzcAbTZBi+M3saOH4EAZU25IJqWIJbnFuezPauBMPCIHysosSvdUqnI
	jOweVFvqNgsVs4xQorfvMRrEUyPyirbazg==
X-Received: by 2002:a17:902:ce02:b0:224:160d:3f54 with SMTP id d9443c01a7336-22a8a87949cmr149795585ad.31.1744000264125;
        Sun, 06 Apr 2025 21:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy98Am/whrbbqIZNo+BR5j4Z0JXTKszZD/vODdfyxs6+TUEIaW5R6ZQESYqR01WAMU2ROHLg==
X-Received: by 2002:a17:902:ce02:b0:224:160d:3f54 with SMTP id d9443c01a7336-22a8a87949cmr149795415ad.31.1744000263751;
        Sun, 06 Apr 2025 21:31:03 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:31:03 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/9] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Mon,  7 Apr 2025 13:30:18 +0900
Message-ID: <20250407043019.4105613-9-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
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


