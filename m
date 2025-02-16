Return-Path: <linux-gpio+bounces-16085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94986A37466
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 14:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B126F3AFFE4
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54F7195B1A;
	Sun, 16 Feb 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="FBqhXcA7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014161A0B08
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710748; cv=none; b=gjhAIuWzGHBumfZ48DfXFMO/occdJhTNhK6BL74CPCHJbjs0mgzzneNtOrVfxcsji+hEZBDN7rpMo9ovIkdV5i/LHcYoE1OqeG+wgpP7DoyPX/GYvskmKxEQKc7COYvP+gFK3ujuDRKjCPojJOyzFv8Ce7VMsFU+DkznS4pI0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710748; c=relaxed/simple;
	bh=5z75klJulPBK3euVFo5jCw9QXY35/qZ4NCunDCR/9Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glufKjqwjLq/0S1AXjh8hC73KmxNR3qXRKwBBVf78J0ns/EwF1iIbwz+XlR9eX/XlpWt/a19wSDSnv9sEWt1v7M+9cRMebtR7w3OJbGTC6HudsDnpPoRUY3JL/OvQTZBaD6Wk1UDEWVU67G8tIqUXi/tfs1GgounfEIOh2hqOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=FBqhXcA7; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A7DD63F302
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739710745;
	bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=FBqhXcA7ki76jeo2zoKrLcuptSNJKEfvrWc9cxO4tKBfRPUbbRxEik3WwPKHZJ0Gt
	 PGT/CKgQvyYfDrarAhGrhu2T1IllCveSfCd7YjJhZ32hzB5MzUxSR2a1hQU/LFIVSg
	 gcrqQZP/lDiKvYHcJY4Khzv/P78PKkACozRTJG48i5+A4o/vTvFjH8dSarWJ3W4xE4
	 Ddg3vcfqUVOWelAzpodcFEnJ6j0XcBMAJ3iBcoUW2tSqeJe7Augl+k1rOKG07VOf2n
	 RAHC37F+pwGWFCI/mCg7R9OgowjJzm+AQXDeHV5t3NGJGwenATm2fHL5mg0/pG4VIv
	 mdNKlNGcicssw==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220c86b3ef3so78700065ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 04:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739710743; x=1740315543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbN0B6Oenuw6+py3+N6wdefqtqSm9CuUWAW6b8DJ97M=;
        b=H5D3DbdSTo5EgNT/v7jMVKlVjgO8ulcIRXS84brAq5dqvPh6nBGhbsN40CXIhT5loX
         m+G3uhOX4Ctm5iM6x1VaXz2jwowOXeGZ99JaTEMAxdcQ9KjytBqU5jqFlCfKnD5YMyFF
         oRZQqiK7znfhQnLH5JPCyUFy0rjbPPwbNkds2phC58ZavhkQnu63A9WFtTg+WiRq0pli
         b20TT7NUIMdGgeFJHredgdCVGCfFfaXk/MjguwqxIvdA/EKrFtO3HxI9qYmGMWtVJriS
         gVy2CiOxruOBlJzupDDb+e7ZyeVrqrJSERPVbkR84EZKUt/PEWRAtqJq5d94O1T5y6Hr
         b0ig==
X-Gm-Message-State: AOJu0Ywl24v+hqxQPh8aJtxedNCkg6B7lWdlusdKh3qacFSLVQbxykfq
	NLsTWiEcoBcYIQJ/gxd+O/3MvKXPc1S7B9GDVk9Vjqs8SoHgHBAgA+5m0fCv+ZfIC6/CdBcTics
	YFMjIGlkOh8RjTPPXl1MyMV07XtUvN5fiLQRUc8muyDU9lrN9FEoZEcGCuRSkGAfisszZlsXFN+
	A1rtMx2W8=
X-Gm-Gg: ASbGncvlI9REmaYw+rzg0as6YX1nKOPMsewH4dE/tYfZPCyReduWUTE3hS5vSywNMlO
	9HIonuVukcnnb3MAuCOXi2N2+MZbkmsEFGs0lpisi/2+VrvV1kcITSrqV0t1VOQP7+7eiuCmGHE
	KTGeByGuAXXCEJrxbLZjSw6LT3Jbq1IPU18KfskbsgdLD2GpwBMtHj/yR/YZvKUSqpfdCJwxMzt
	JxXlSmlhCkVCK1mXwe/+KyuIW1+Ug3xOfFm1EUKbC3CR9doD0pic8wjeCeYygFr1qHyzjUqKOTr
	UXqWBQ==
X-Received: by 2002:aa7:9912:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-7325875ee4fmr11310404b3a.4.1739710743634;
        Sun, 16 Feb 2025 04:59:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo/tLeo1FafwhPWL09gZg/Vg+JGHNlMxvFuz7WLwpyGUOorkDmHNR4ArvfJ6p5/jd7rf5PvA==
X-Received: by 2002:aa7:9912:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-7325875ee4fmr11310374b3a.4.1739710743132;
        Sun, 16 Feb 2025 04:59:03 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:eaa9:d394:f21d:ee9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73256fb09e1sm4316545b3a.65.2025.02.16.04.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:59:02 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/13] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Sun, 16 Feb 2025 21:58:16 +0900
Message-ID: <20250216125816.14430-14-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250216125816.14430-1-koichiro.den@canonical.com>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
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


