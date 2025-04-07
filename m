Return-Path: <linux-gpio+bounces-18252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40048A7D2E6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 06:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15F487A3E0E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 04:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB53221F1A;
	Mon,  7 Apr 2025 04:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jJAZPLTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36E14831F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000254; cv=none; b=KZWxlnuFUuzWf4qQ17JEyqFLk7YW/94hzIAnJ1OdnbSwPonJOmO/T+wSfOvweYyTpTA9a4sn2AQImXLPTWpBeZheH1n63LjxbMRD3QxKQDnuqLmLxhYYri2xMXQ7GCLmcwyMRZKqADrvqPST8/skUgd8pw+MwqjQqD0G1IkDrdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000254; c=relaxed/simple;
	bh=a2E+lRmEyGyPn4y/Lp5gh03cfv/gYiKAfaRg/gmeGSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dE6624udAkQuVjbLnoekwVZK1yYKCXMpw+JTm/G1Jvu0ZG2cFJWfHckU3Jj/bQE9I8gC3/8vGias1SpmVKcHlDd7xcFjo8uxDX0vuXo1SKtzapyki9Pkc6vTIzdycq5W7wumGj/CAaBHIPPfmKm5z+uZKFY6ODrD8iUoxmsXzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jJAZPLTQ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 28FB93F472
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 04:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000248;
	bh=ay0fSmPyuoS6lCZMzMt+gGBhLI4LljyUGT5pFmp0QYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=jJAZPLTQP0iXFUtP7Q8qBoPSsyt9dcF3r9MGJG6xY1ZnD0orQG1oP/1vyzAVXZAC+
	 Js+Tan22N7xOMvfbg8MTB5iiwzinNd72+W8YvsKu92LZFR8wDQZHo4YTAzBUJqv3y3
	 PXLII3tDHWu/CLRAH10h2S/GF5IKdiXV7AW5FiUC6Nqe104x81rZNoJnwLvX+5juCC
	 zOGX4G1wZ93AiNjvmelFKGG0ij+Ln7zZeI1pkPzJXrcwu+XRE+K0YOxAa/BnQ5hTpK
	 +8FmSZHb5scAB9powneJJp97gta7jUaKPl0om46XuA8nfCDXUi1nuZpuaeO+t+TNrN
	 iArWprRpqX4QA==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22651aca434so37645785ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000246; x=1744605046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ay0fSmPyuoS6lCZMzMt+gGBhLI4LljyUGT5pFmp0QYY=;
        b=ha6DGeh2vIwxQZwzJzCUJxp7ixfo3TzfGgL4oK2L0z9c5nafsI+Yy2B2FwQPNx5sle
         d7t4l5MXcFaxbSa7LZ3fwWjqPqI7UMk+EAhn9xFXAyBZ3pk9iTlq/MrOFS/zB/Xlu2Fv
         4bloJxdMImBUx85hYcyhp4XwfSznW9pw/SvcXDob5zx1yUXoLYfj/ch9i4aSbjKj3De3
         Xd9jkkCI66CQUGBtqVlZRmzFTcenXPIouGDRnc6YlKf4d0a2uP4cJlP2dxbjn4mtPsCH
         uoie1X9OvEkSmLiVoVyWtYvtAWktrwnOcO9N2k4N1V+PemwnA11cv95NFT4d0hOrw7AY
         iGYw==
X-Gm-Message-State: AOJu0YxuUQLzfzLp4xrcfBiSVWLtYy0dZ200tU48eIZDVX5dOElCJ3e0
	rKH3MfTDpC+wv1dOpGIe0S38lwruKbitYOvPKsyP9pUhfRGrWtQIaOOWExs03tLESyQGkc81NMF
	oQft8ZNHEKQJ35XcqRhaG/S5BG4Bm1GVJN02ifs9H53nwbhU9kuwlQWE/Ag/TGCvwRj4DRy9FH3
	HprvDN5gA=
X-Gm-Gg: ASbGncvy8rhhs/eEzL0slM9FVcLEKDbNvZrmcrIRydu9WzL47bdzcSQwbVN8YW4xXuK
	rmF02f7CJ4e67prEkGEw69yPpJVBBeqCWZOCcHRxr2zizTcpLeANlMkxegQUkhIPhRDu0OAt17/
	0sCmS1wEJ5GEXzDb0p/ms3FjTRTmOr3ZQHCSs2LiIldcVQ3KZRVDXbBelRjnUopBBFTZEr9HLpw
	0pUX22+xUelz2NyX8kxRJ7fvT7Bpi9C3wadg5qM6lBrim72nni6CO1TAEnf8LiJ17YcfGkJMtUo
	o9umS1596xRps1bnNnJ5gt9arfq/FWzOMQ==
X-Received: by 2002:a17:903:13ce:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22a8a85a251mr151838715ad.9.1744000246396;
        Sun, 06 Apr 2025 21:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgBQ7gtDoXVn+RQVH+knkkbMRV7Nv7+Vu+MZdEbv2OXMQX1Tph5qzz736R80geSduyzcfUXA==
X-Received: by 2002:a17:903:13ce:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22a8a85a251mr151838565ad.9.1744000246043;
        Sun, 06 Apr 2025 21:30:46 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:45 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Mon,  7 Apr 2025 13:30:10 +0900
Message-ID: <20250407043019.4105613-1-koichiro.den@canonical.com>
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

This v7 patch series includes 9 patches:

  Patch#1: Reorder functions to prepare for configfs introduction.
  Patch#2: Unify function naming.
  Patch#3: Add gpio_aggregator_alloc() to reduce code duplication.
  Patch#4: Introduce basic configfs interface. Address Issue#1 to #5.
  Patch#5: Prepare for Patch#6.
  Patch#6: Expose devices created with sysfs to configfs.
  Patch#7: Suppress deferred probe for purely configfs-based aggregators.
  Patch#8: Documentation for the new configfs interface.
  Patch#9: Selftest for gpio-aggregator.

N.B. This submission is based on commit 0af2f6be1b42 ("Linux 6.15-rc1").


v6->v7 changes:
  - Addressed feedback from Bartosz:
    * Unified function naming using gpio_aggregator_ prefix (except for GPIO
      forwarder implementations).
    * Replaced remaining raw mutex_lock/mutex_unlock with scoped_guard.
    * Ensured variables with __free() attribute are defined and assigned
      in a single statement.
  - Eliminated needless style inconsistencies across the new configfs attr
    .show() implementations by replacing scoped_guard with guard where
    possible, with no functional change.

v5->v6 changes:
  - Addressed feedback from Bartosz:
    * Resolved issues spotted with lockdep and kasan.
    * Added kselftest for gpio-aggregator.
  - Fixed a memory leak in aggr_free_line() (missing kfree(line->name)).
  - Fixed a bug I mistakenly added in aggr_parse() (misplaced scnprintf()).
  - Eliminated a potential lock inversion deadlock by removing
    gpio_aggregator_lock acquisition in gpio_aggregator_remove_all(), which
    became unnecessary after the upstream commit 12f65d120350 ("gpio:
    aggregator: protect driver attr handlers against module unload").

v4->v5 changes:
  - Rebased off of the latest gpio/for-next, that includes the patch series:
    "Add synchronous fake device creation utility for GPIO drivers"
    (https://lore.kernel.org/all/20250221133501.2203897-1-koichiro.den@canonical.com/)

v3->v4 changes:
  - Split off the introduction of gpio-pseudo.[ch] and conversions.
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

v6: https://lore.kernel.org/all/20250315164123.1855142-1-koichiro.den@canonical.com/
v5: https://lore.kernel.org/all/20250224143134.3024598-1-koichiro.den@canonical.com/
v4: https://lore.kernel.org/all/20250217143531.541185-1-koichiro.den@canonical.com/
v3: https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonical.com/
v2: https://lore.kernel.org/all/20250203031213.399914-1-koichiro.den@canonical.com/
RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u


Koichiro Den (9):
  gpio: aggregator: reorder functions to prepare for configfs
    introduction
  gpio: aggregator: unify function naming
  gpio: aggregator: add gpio_aggregator_{alloc,free}()
  gpio: aggregator: introduce basic configfs interface
  gpio: aggregator: rename 'name' to 'key' in gpio_aggregator_parse()
  gpio: aggregator: expose aggregator created via legacy sysfs to
    configfs
  gpio: aggregator: cancel deferred probe for devices created via
    configfs
  Documentation: gpio: document configfs interface for gpio-aggregator
  selftests: gpio: add test cases for gpio-aggregator

 .../admin-guide/gpio/gpio-aggregator.rst      |  107 ++
 drivers/gpio/Kconfig                          |    2 +
 drivers/gpio/gpio-aggregator.c                | 1181 ++++++++++++++---
 tools/testing/selftests/gpio/Makefile         |    2 +-
 tools/testing/selftests/gpio/config           |    1 +
 .../testing/selftests/gpio/gpio-aggregator.sh |  723 ++++++++++
 6 files changed, 1811 insertions(+), 205 deletions(-)
 create mode 100755 tools/testing/selftests/gpio/gpio-aggregator.sh

-- 
2.45.2


