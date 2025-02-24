Return-Path: <linux-gpio+bounces-16505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C5A42468
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A42C442126
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51022561A8;
	Mon, 24 Feb 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="P69xm+BW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0D814A627
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408007; cv=none; b=X2jmcUosL0fykhALThHu1KkSbEph5vYJSU9xOy4mydQtDcq0AJh0YoYf+pA/TJbWiVhRey/wJIpV2JZSgQy9jq3+Rwy5tfa3Z5EfweGDcf8qdztwjdjzcsXoQUApn1jNqmDBNzPRhJrIiIdXsPe+u3KJMZCaRqQ29XBO0EsxESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408007; c=relaxed/simple;
	bh=SOSL3cjrU4Di9nHdS+5hFRMLC3AgleNJZgTR4tFldis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPrmiJx1SyOVJd3tD0mH00f82NNDj0Hnbnlh6sv3x6+8fKHAxgc79nyaNIsnaCb/mrfNnL9uDt+Dro5VtGRzKx4fO8B+rGy6wZZMrYoDflT8uIsnREkDA5BtcooEiIAT/4aDNMZensC7ZAM0bLpnk/LGbbdWaAABLNPTEaqp5kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=P69xm+BW; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 848303F516
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740407504;
	bh=Gdktb9rvLMrV8vkfbfALqYuq8Rz062yInzBz4NP9LFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=P69xm+BW9DAFUJ5QNQDITNeDFUCotJvUPNViJoC5JoyhOz/K2lomSJpQYjifyYF41
	 4dJBuUiPcZzScRdWhXXDIJev/visrH51/YobwlgKEsgH/OeBPNCBTd1DbIv8n4DTvo
	 DxOliaX2UFidc9VV70tBpTLIEwKnIVy16fmAN2o9hbSnp9CLfdylIm8vTW6GaeIiYd
	 csYxtP1/BDKczICtw43gm2ZW+ymraWMkbgQC7jvAKa5r1v0H9hzhJiFv6FjxQiFhtH
	 zyHhC/bkRF1BzgCRXpSI6sdsbC5T79roeSLekDE5z3NZNZjRxfyTt/0D3BYBznURYY
	 yV2uQYvW5LxtQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220e7d654acso101687075ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407502; x=1741012302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gdktb9rvLMrV8vkfbfALqYuq8Rz062yInzBz4NP9LFM=;
        b=ReXas8dT50EXGhfTiTQTr/Plwnm4pYttTCQ3g4tIhxA8f4btI7iDcBOulZ5v4HP/iq
         B9eDhsbshMMm88AsoKMov//46TFmam9afwsgtHDlJDWCaNBD4x0ab9oBXFEoMf+/OmK4
         4SkSQIcqyyqbN9cQjl7GK0Dklc70vxEVhXLVI2w/Jm8kTiDRp4pGG5QoI7ZiJLkNwZyQ
         LEQNQPj+rzxCoOe1SK4+/DG2ybKSY1AQGwYKiKN66pVDCe7L7dLQ/qVv70dpcVGeirPd
         iqRqsaoV2P6AjuWWCtZ9TJMgMqDRMmUrDRoOAM2MMN2VJENU8yGFGFJzs7R8bPkJI975
         l8bg==
X-Gm-Message-State: AOJu0Yx8Liq29SxRjGILo7IY6RkXC3mUN8JPKvS1/fXe4q09nkTaJWRR
	QINbJ6++3FA0HukCsctOdJRyeszP74TJQeG3HUqXo9XLqYJS5pUydnXRMyv5zqIZKVFsjToCNZZ
	hgJ7yqK1yg9tnUdoN7N3LuXkzVjMSxoxEORAgsHaorrcrPvUXlgNrrkV+mnNDHTrtiHlG9yY/Se
	nLV/04SG0=
X-Gm-Gg: ASbGnctTb9kXVoEUwsWF9VMAFKJ9pCF9okk8NrgeiJPLi5iCy5Dd1OaIHtOBhFlivtN
	vxRUh5ka/JOvVqwI+ZEPE8qZbZDYfgE6Sy/E5CK3suCuzff+xxN3y/BOUyaIoGh7rTuLviPrxry
	Hfcb6Wldl6RhjSjBap4kMlTQ62q+XPZvYnlDBzHOE5YkOgIZvWndVZfJ1GZSkEbt6RcIpKEvtoJ
	ZlEO/MiASGUsE4DymBiEI+RbZm0Itgq5VzWaYyeoIFusONMtlgaiQekbeylWjfJuYvXgVl6xnU+
	6h32ATNTDJMg4Ik8
X-Received: by 2002:a17:902:fc8f:b0:221:1497:7b08 with SMTP id d9443c01a7336-2218c76416fmr327054675ad.23.1740407502021;
        Mon, 24 Feb 2025 06:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX5NBcvP+aGDyMheh7t1VDGIWf77DCiUBonG3siDm8cm0GCgYLnTefUoSv3Lr75mz+F3yZFQ==
X-Received: by 2002:a17:902:fc8f:b0:221:1497:7b08 with SMTP id d9443c01a7336-2218c76416fmr327054215ad.23.1740407501643;
        Mon, 24 Feb 2025 06:31:41 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:de7b:58db:ab85:24ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d067sm177613895ad.109.2025.02.24.06.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:31:41 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Mon, 24 Feb 2025 23:31:25 +0900
Message-ID: <20250224143134.3024598-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a configfs-based interface to gpio-aggregator
to address limitations in the existing 'new_device' interface.

The existing 'new_device' interface has several limitations:

  Issue#1. No way to determine when GPIO aggregator creation is complete.
  Issue#2. No way to retrieve errors when creating a GPIO aggregator.
  Issue#3. No way to trace a GPIO line of an aggregator back to its
           corresponding physical device.
  Issue#4. The 'new_device' echo does not indicate which virtual
           gpiochip<N> was created.
  Issue#5. No way to assign names to GPIO lines exported through an
           aggregator.

Although Issue#1 to #3 could technically be resolved easily without
configfs, using configfs offers a streamlined, modern, and extensible
approach, especially since gpio-sim and gpio-virtuser already utilize
configfs.

This v5 patch series includes 9 patches:

  Patch#1: Fix an issue that was spotted during v3 preparation.
  Patch#2: Reorder functions to prepare for configfs introduction.
  Patch#3: Add aggr_alloc() to reduce code duplication.
  Patch#4: Introduce basic configfs interface. Address Issue#1 to #4.
  Patch#5: Address Issue#5.
  Patch#6: Prepare for Patch#7.
  Patch#7: Expose devices created with sysfs to configfs.
  Patch#8: Suppress deferred probe for purely configfs-based aggregators.
  Patch#9: Documentation for the new configfs interface.

N.B. This v5 is based on the latest gpio/for-next commit as of writing this:
     * 45af02f06f69 ("gpio: virtuser: convert to use dev-sync-probe utilities")


v4->v5 changes:
  - Rebased off of the latest gpio/for-next, that includes the patch series:
    "Add synchronous fake device creation utility for GPIO drivers"
    (https://lore.kernel.org/all/20250221133501.2203897-1-koichiro.den@canonical.com/)

v3->v4 changes:
  - Splitted off the introduction of gpio-pseudo.[ch] and conversions.
  - Reordered commits to place a fix commit first.
  - Squashed the trivial update for gpio-aggregator's conversion to gpio-pseudo
    into the primary commit "gpio: aggregator: introduce basic configfs interface"
    as it is only meaningful when combined.

v2->v3 changes:
  - Addressed feedback from Bartosz:
    * Factored out the common mechanism for synchronizing platform device
      probe by adding gpio-pseudo.[ch].
    * Renamed "_auto." prefix to "_sysfs." for auto-generated
      configfs entries corresponding to sysfs-created devices.
    * Squashed v2 Patch#3 into its predecessor.
  - Addressed feedback from Geert:
    * Factored out duplicate code in struct gpio_aggregator initialization
      by adding gpio_alloc()/gpio_free() functions. Note that v2 Patch#7
      was dropped for other reasons as mentioned below, so aggr_free() in
      v3 is unrelated to the same-named function in v2.
    * Removed redundant parsing of gpio-line-names and unnecessary
      chip->names assignments; squashed v2 Patch#4 + v2 Patch#5 into v3
      Patch#9.
    * Updated to use sysfs_emit().
    * Updated Kconfig (select CONFIGFS_FS).
    * Fixed typos, coding style issues, missing const qualifiers, and other
      minor issues.
  - Resolved an issue that was spotted during v3 preparation. See Patch#2.
  - Reordered resource initialization order in gpio_aggregator_init() to
    both eliminate a potential race condition (as noted in the source code
    comment) and simplify the code. See Patch#8. This enabled:
    * Removal of v2 Patch#7.
    * Merging of aggr_unregister_lines() and aggr_free_lines() into a
      unified function.
  - Disabled 'delete_device' functionality for devices created via configfs
    for simplicity. It was mistakenly allowed in v2 and proved buggy. See
    Patch #8.

RFC->v2 changes:
  - Addressed feedback from Bartosz:
    * Expose devices created with sysfs to configfs.
    * Drop 'num_lines' attribute.
    * Fix bugs and crashes.
    * Organize internal symbol prefixes more cleanly.
  - Split diffs for improved reviewability.
  - Update kernel doc to reflect the changes.

v4: https://lore.kernel.org/all/20250217143531.541185-1-koichiro.den@canonical.com/
v3: https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonical.com/
v2: https://lore.kernel.org/all/20250203031213.399914-1-koichiro.den@canonical.com/
RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u


*** BLURB HERE ***

Koichiro Den (9):
  gpio: aggregator: protect driver attr handlers against module unload
  gpio: aggregator: reorder functions to prepare for configfs
    introduction
  gpio: aggregator: add aggr_alloc()/aggr_free()
  gpio: aggregator: introduce basic configfs interface
  gpio: aggregator: add 'name' attribute for custom GPIO line names
  gpio: aggregator: rename 'name' to 'key' in aggr_parse()
  gpio: aggregator: expose aggregator created via legacy sysfs to
    configfs
  gpio: aggregator: cancel deferred probe for devices created via
    configfs
  Documentation: gpio: document configfs interface for gpio-aggregator

 .../admin-guide/gpio/gpio-aggregator.rst      |  107 ++
 drivers/gpio/Kconfig                          |    2 +
 drivers/gpio/gpio-aggregator.c                | 1129 ++++++++++++++---
 3 files changed, 1050 insertions(+), 188 deletions(-)

-- 
2.45.2


