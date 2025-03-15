Return-Path: <linux-gpio+bounces-17646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518FA63022
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 17:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417F4176AE9
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 16:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92AD204596;
	Sat, 15 Mar 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oM4FXyIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5FDD26D
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056904; cv=none; b=T7BS0RQIapeADuH1kOefc8kaFMs7Qwbo/zDLUY95AJOa5L0efLo2laFVCxAG22CWjr48cscVRSR45udGTWEptRPbLwf/BKKi88dPZgcKcWKttWzTYPYE4fNvlg6mG4GN9TWKGvwLRORAA5DlRh5yaqPWxeJ2DyOKuWgdESDHAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056904; c=relaxed/simple;
	bh=Z++6unUzD7r2i7Ald3FvHt8fiDQX2+T3QIsDOBUYxWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eG1ciGI7EcLdjqeB6nzT/NFOhHdZk0I1u1quE8Wc4MnujVvXDpwxJOshslRRzp5vUCltImX9UBS4lXW7icXu3nBhYrySOR3YwtBtuqgc2z3ndrUcQ22q0N106nVgdGnEfDEnASwnypp502lyj39610GU29kH3FvEuVcgK01ZPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=oM4FXyIf; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8D0DE3F2B1
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742056894;
	bh=a7gC6InKkSZunt4RwI6mh+p9wkYGFvKYJwvCSiCnLdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=oM4FXyIfLsQjZ0esSxn5JlANaGWqXV7GGV6LM93AB+49f2gbzUAxJZ67sWfoJFOrT
	 wmdP5zfo+PcSEdMtEfrw6ftKBL7pg2De2MqlW+A2RwZKh+X/FsA94s3OnTP4Hf5d4w
	 8tK1GyRFM3eGTEES4uCxhwcAETmvWSy0ayLDV0xa11jPxFN6XE6mMnETARl6fIA9Jr
	 VwXv8JF5Dh3jUQmcZOcKJhJ2re7swZBSgUbvg/naw4kcgmN9GsfzOm0kyztjwt24al
	 XBN04otH9YxTrMtXdRRsd+yLZvs8LGa4/eJIjng6z5/0nYg919A3++7ypAK4aSs1uL
	 lw194/QlUu5bg==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223a2770b75so58381275ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 09:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742056893; x=1742661693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7gC6InKkSZunt4RwI6mh+p9wkYGFvKYJwvCSiCnLdw=;
        b=u9xYVOgg6qoWeAng7fjL56HFYTylS4a7wbfijRnyeXzf3JpZMenqSNIF7VUlONm7Km
         dGh+/z9c6+TFtEhrCzI/wWA9UeQzDYzG6TGfrk8/LrAFSe/FuQzKUYh2DFpCLXBrYQqm
         RDlDYWoxJvZ0K1e9Htn3ryfLIWaSirSrgPYVBuKPJh+Lf4JKOVKI2fTowrb8P/RjXzyF
         FXBIltf+hHSmRdjxjvp6Bv+mnHOOsEhnpzfPB2/g0ohno9TNQLzFrk4azjSOTo8guoNt
         FcsN9TibYCm6XOBb+/9GYH3Bc368LQgA+qdzVuevKtxfFL2GcsYVPh0ZFukz7M0PWna4
         hR5g==
X-Gm-Message-State: AOJu0YwipiDp4sqDzFlkrk5KCuQud1q3Z/IOVsRUKoyn0LvWZ0SI2CWz
	Bnqns2FRNWYjXgCilWJNDdIEVt3LMNeMozBg7OyFkkdr3kiQ93ptNGdNkUOskPe/haN0Z73CT5J
	OgYDi28Lv7pOVhLJ/DVYcNJp+8+j1BX86sKRyWP+Pg1osZPxE0pk71+zHkFY7R7F8TsRq7SW+H2
	04hEkyqwY=
X-Gm-Gg: ASbGncuIndErOJCu2LNGxmA2sQM9BN5T+alLswH6SHlfxJC7mmfM9FrEzeoFtKs8DJN
	29dQ1CvwTc1OZJhF4hnCTyVXLTvWFcVJzSoLKtzesTuTOBsPF05zrg94bKxZW5LtcE50Z5GtFQ8
	cBOy6gKTGCicijQvhCo3kAQVCr9pZWuYcEnMeH8K+47OY5GSb7pqMG3kBMYWCaibX4l0V5S2dgP
	MLdHgzvToP53zf9+zEVu+mlAV6aaaI+oFFspQ3pJILJibZxlzxZvrAQwQ9gk5LwMpVDDI2J+KhR
	2fnyHRYUsimWr/if
X-Received: by 2002:a05:6a00:3981:b0:736:3fa8:cf7b with SMTP id d2e1a72fcca58-73722380967mr6778389b3a.13.1742056892756;
        Sat, 15 Mar 2025 09:41:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuymFzG/Jpdc8Uehgh10jJ41sXtPIFgAmKjlQiY40nHN6Rd1NKGJR14VYZh8fQmO8mdBd6PQ==
X-Received: by 2002:a05:6a00:3981:b0:736:3fa8:cf7b with SMTP id d2e1a72fcca58-73722380967mr6778371b3a.13.1742056892356;
        Sat, 15 Mar 2025 09:41:32 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:83e6:3590:3498:db44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371155e3a9sm4637104b3a.71.2025.03.15.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 09:41:32 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Sun, 16 Mar 2025 01:41:14 +0900
Message-ID: <20250315164123.1855142-1-koichiro.den@canonical.com>
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

This v6 patch series includes 9 patches:

  Patch#1: Fix an issue that was spotted during v3 preparation.
           (Not present in gpio/for-next, so retained in v6.)
  Patch#2: Reorder functions to prepare for configfs introduction.
  Patch#3: Add aggr_alloc() to reduce code duplication.
  Patch#4: Introduce basic configfs interface. Address Issue#1 to #5.
  Patch#5: Prepare for Patch#6.
  Patch#6: Expose devices created with sysfs to configfs.
  Patch#7: Suppress deferred probe for purely configfs-based aggregators.
  Patch#8: Documentation for the new configfs interface.
  Patch#9: Selftest for gpio-aggregator.

N.B. This submission is targeting at gpio/for-next and is based on:
     commit 21c853ad9309 ("gpio: adnp: use new line value setter callbacks")

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

v5: https://lore.kernel.org/all/20250224143134.3024598-1-koichiro.den@canonical.com/
v4: https://lore.kernel.org/all/20250217143531.541185-1-koichiro.den@canonical.com/
v3: https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonical.com/
v2: https://lore.kernel.org/all/20250203031213.399914-1-koichiro.den@canonical.com/
RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u


Koichiro Den (9):
  gpio: aggregator: protect driver attr handlers against module unload
  gpio: aggregator: reorder functions to prepare for configfs
    introduction
  gpio: aggregator: add aggr_alloc()/aggr_free()
  gpio: aggregator: introduce basic configfs interface
  gpio: aggregator: rename 'name' to 'key' in aggr_parse()
  gpio: aggregator: expose aggregator created via legacy sysfs to
    configfs
  gpio: aggregator: cancel deferred probe for devices created via
    configfs
  Documentation: gpio: document configfs interface for gpio-aggregator
  selftests: gpio: add test cases for gpio-aggregator

 .../admin-guide/gpio/gpio-aggregator.rst      |  107 ++
 drivers/gpio/Kconfig                          |    2 +
 drivers/gpio/gpio-aggregator.c                | 1155 ++++++++++++++---
 tools/testing/selftests/gpio/Makefile         |    2 +-
 tools/testing/selftests/gpio/config           |    1 +
 .../testing/selftests/gpio/gpio-aggregator.sh |  723 +++++++++++
 6 files changed, 1800 insertions(+), 190 deletions(-)
 create mode 100755 tools/testing/selftests/gpio/gpio-aggregator.sh

-- 
2.45.2


