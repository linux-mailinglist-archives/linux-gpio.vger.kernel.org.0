Return-Path: <linux-gpio+bounces-15091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641FA22101
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 16:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE080164F45
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE1D1DED6F;
	Wed, 29 Jan 2025 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ht0+o813"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E931C1DE8AB
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166169; cv=none; b=FBcEEBJ/WuJSnQfQtR1ckhxdnlTLLV0bNPNAm/ERBipWrYSt1BiiI+/RpXREVnaWuUymEG7nM28nd4PJjI0iO2vPh7lhp3+KPpLy6x8sqn1YDU17Bu52fcASJXIDB611coEPb3USX/fZSEANgNFsAa9vU6ekulbcyRy4gPBX610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166169; c=relaxed/simple;
	bh=JgsbT/iITDHrPwbLtAepZLcicNYXO1cKBa+nTq8RAs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMnhPUbHrlM94d63gszX/xzIqfaFEmrBjxBSo1citMlyjiXOr4Q1CXcCCYjaIEPZWNHzRX5Kmq3sWorbZijJZFwW28LcrHbWtvlN41w+JNUBL7ERywMNa4XwwTk+miSFNSoMJYt/3dsdw2otrnt82Kqv4lb7uNDUT7dmraHdw5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ht0+o813; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 857A53F175
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738166166;
	bh=LAv/ebokFHKYkiIjsLayeeaNB6exbRKSL1D3ireWnTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Ht0+o813p3VwDufgm44lyT6VORPYCKf3/iR1kIWS1yGnJu78g5keiGPKU4KOCfVWd
	 yVM2VnJOhchuh1TxCgvUsSP0YX8miC5QkHrE6eD+ztPJ4/aici9EpwRwk4dzVDU+Xe
	 PydTD4T+xyKylqkhiMpg3KVsDhfd+LYxNmNcIeBJSM9JEJkWowM5n8Q1v++YIzxdp+
	 FeN0dooHJrmZp000mhcb3HNeBlrZ3W+m7iLI+hHpvKM7vmdb7m4GACvTv9iqrxpk8j
	 GJul4xdGzq8nubadtDYTQdrI39wzP8ElmgSmZjMxLHVavOavXlU85nEsHr4bTnuZl7
	 4tEFVJPWAwd1A==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so13849224a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2025 07:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166165; x=1738770965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAv/ebokFHKYkiIjsLayeeaNB6exbRKSL1D3ireWnTc=;
        b=k5jY+cgVsK8lnv9tZI8IsbGs0WXgDmgMcADxqgeIbvHSnyvGZoYTcGG6qg/rk01EGM
         0rJ5+91vtLamrPsp2EFFPyeO9gpk9yqrYfcTR5EODcH2UsRkEIL0bZ2EiO+rBOE5kqr8
         P60OdnKSRCoKWY1gRtQkcp2/tkolmDMy2nXWO/yMMkLsRR49X5v5/06A4sL5tL0T7I5E
         FN4Lil6DoSoSXoRteBp2myew4XqF5SZYfYZUGyRxpMK1B2PDHAi32I5YZDE4ONdEuMcR
         8i9pRlMRg52Kse0wccq57zxM/bVhz/nXfqGNwdvmdOfUnwveEWQiccQsS0JO6LukqLpG
         lfsg==
X-Gm-Message-State: AOJu0YzoFoA8qJgigWMGpC8aPPmQqlSc/t4VwkcXQzm2Ie14Q1NEFSLM
	ehG/m0h9wSUY1N18DkyFfrOQQgyRqYwcvjEjd0a872UTzll7RsiZmt+XrEbSCBaDDRHw/WuZiqC
	Y/O2gRGOe+n2IZpjGe+Ix/W1bBLNHlVZ6duM1dftQ4tpW7R1Z1M4xEbDXVcTkWYAMrWrhl6jhbF
	hfy6VlLlQ=
X-Gm-Gg: ASbGncuxeUPxdXQd/NOV4b4Gtn4PvVJU3Q1FxgPMkV4IAA2oZ346sdRBUfP3kExsVS6
	rL64oNYer8jVpYk5HKmW2uuVcBHNEuXCZhkmxyK3C6RuKMyvPgP9ZqEaa3+wn872nLNabAPuKGf
	HZWJOPb0otUJbjhjnwCkOzzI4jxaxH15/9XTFuj0VHPXu0XJkweHyGfjadgdXWXPl39m9ZVYAZw
	FjCBYawqNJzGIE88Bu1RKuOrBfsVLQC/KfGnsiiTvnAKt7in/zneRSn+A6/HLXpq+tLVvcNdW47
	+UgotcdX3Le/n2RvoKSOlJU=
X-Received: by 2002:a05:6a20:7345:b0:1e1:c03c:b420 with SMTP id adf61e73a8af0-1ed7a6b820dmr6530649637.31.1738166164712;
        Wed, 29 Jan 2025 07:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsGbo3W8SlmzBnN5syShd527EpxYUjNOwu5RzjXkAS9t/vhb7pHZnFzhygBAw/LN3di47JNA==
X-Received: by 2002:a05:6a20:7345:b0:1e1:c03c:b420 with SMTP id adf61e73a8af0-1ed7a6b820dmr6530601637.31.1738166164355;
        Wed, 29 Jan 2025 07:56:04 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:daf2:7ab4:ebc3:f450])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c4fasm11674432b3a.132.2025.01.29.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:56:04 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] Documentation: gpio: document configfs interface for gpio-aggregator
Date: Thu, 30 Jan 2025 00:55:25 +0900
Message-ID: <20250129155525.663780-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250129155525.663780-1-koichiro.den@canonical.com>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
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
 .../admin-guide/gpio/gpio-aggregator.rst      | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
index 5cd1e7221756..219ef2bb70ab 100644
--- a/Documentation/admin-guide/gpio/gpio-aggregator.rst
+++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
@@ -69,6 +69,92 @@ write-only attribute files in sysfs.
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
+    name to ``<example-name>`` (e.g., ``agg0``).
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/live``
+
+    The ``'live'`` attribute allows to trigger the actual creation of the device
+    once it's fully configured. The accepted values are: ``'1'`` to enable the
+    virtual device and ``'0'`` to disable and tear it down.
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
+**Attribute:** ``/config/gpio-aggregator/<example-name>/num_lines``
+
+    The ``num_lines`` attribute sets the number of lines to aggregate. It
+    must be set to a value greater than 0 before proceeding with line
+    configuration. For a value of Y+1 (where Y>=0), you must create exactly
+    ``line0``, ``line1``, ..., ``lineY`` subdirectories and configure all
+    lines before activating the device by setting ``live`` to 1.
+
+**Group:** ``/config/gpio-aggregator/<example-name>/<lineY>/``
+
+    This directory represents a GPIO line to include in the aggregator.
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/key``
+
+**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/offset``
+
+    If ``offset`` is >= 0:
+        * ``key`` specifies the name of the chip this GPIO belongs to
+        * ``offset`` specifies the line offset within that chip.
+    If ``offset`` is <0:
+        * ``key`` needs to specify the GPIO line name.
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
+Sample configuration commands
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: sh
+
+    # Create a directory for an aggregator device
+    $ mkdir /sys/kernel/config/gpio-aggregator/agg0
+
+    # Set how many lines to aggregate beforehand
+    $ echo 2         > /sys/kernel/config/gpio-aggregator/agg0/num_lines
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


