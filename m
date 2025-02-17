Return-Path: <linux-gpio+bounces-16146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A87A3869A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F06347A36B8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D5D22259C;
	Mon, 17 Feb 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YVSZz1ju"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B222069C
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802963; cv=none; b=qFyfXjGIx4Ih0dFNBzh29idGEx+xwH1Ia9DxjpplS8T1+zhAf7FEtLuiKa5btdrwMAjVX7pf4dByEPjFhRcxDa1NXNnAAnsvH0wwQZFznzel/pz7iXfRtkfO6A4Qfev4PmB4o5znEITZZ61KHasJlgEZitZWxbl4qU9m59R2ikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802963; c=relaxed/simple;
	bh=BM2CSxb7N5pqm6p42nJmt/YYjT9Qumv4OkJPFTX5QIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSXpSyRv6BzopKMiSYfQFPYCbue6MmYIj0Z/EocQJpxrylZ0qY49xCQRz7TYUGpVX7GjmoHxG0XASDzposNibCEzGJfhCy7Bu0zVudfQ9W9UYiXTZ+3t5lOStxK8FH4YzVZVbOn9XWAHF/7NIhu1juZNF4G/9cHykcznsoTSctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=YVSZz1ju; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 248F93F31E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802960;
	bh=dMBLgDkz0A5YbnEhUGrVChjAwgvWPge21MGfIezidWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=YVSZz1juaOmM3b/DWn0bd0qa8hkDBDp6bFL40rgwOcOVg7ghf6BjhM6kkr72gv7CS
	 ukuD2wSMbaKT5QEJweU3hVnzRZVmFsOCQZMPnC42jqNUq9yC5SPrg7zaFDOTJSRcGp
	 Tt6VItNdKSEcIC0+tsjN2Rsz0GnpKWpMhgzyfpzeBMtoKa/WqU9gYUQxUuocC4Y3cU
	 epPkfRBBCUvlmxaIEG2JiQhmdtB4k68oC1D9V/rXSpVEoSjSmNjIzgBu2D8R19H6yo
	 /Qddz/PZaq3QkVf8yruL864YAp51PrxzFKur/e+DjqV7WhVu4bGqQKZQtInPRJnW6y
	 sZ1jRRo78ngEg==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc1a4c150bso8807889a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802958; x=1740407758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMBLgDkz0A5YbnEhUGrVChjAwgvWPge21MGfIezidWg=;
        b=Kk+jySQrtFvhDSNijt8PFoUailQ7icvn36SMsim+ZHbmLWXYcmjwNdtME4bOdrGZGD
         9eyY4yAtX6aoZocLOxVygpcq/fJMiVb+EnnJureIozMB4Exbr2hX5ypYIVLClHp89WNa
         Hu3r8CWJLqbYSb3EqBeRlYhf2HTmaY5a0H4k+8aQILB1rQhqTXwlE+67QPGQ+KhSV1ke
         ZsqcxPxv98ahDxtJ0xQW5yDU/6ov3BhP8PZs0b0Q0T5GWa+QFdbt0JOzOCQti+/CBjxY
         HhLlccWFMjB7wWkugCbaGEiv0KWwdJdbxZAHFH+Nkz7qryD9K52xWYVixabooTBEkTSy
         Td0Q==
X-Gm-Message-State: AOJu0YzvUpVHVe7Wf6j2bhL5f12f1U8D/PeTA1rzYaDPXtmtj3lua88s
	pIVfn/IqJUtvz4csCSj+rTzGyGFeRAU57B0iDTxYD99yxHjaM5yyLbF6opZQuuhx52s8z5kMR0m
	V3Mj17FJQsVJOQEWFm4n0EtOavEMIly5M3XWcSOhJkZQCuill/qHIu9xncKN5G8GRSk6eY6E2mU
	/dBPaVpAg=
X-Gm-Gg: ASbGnctbTlmRBcLg8oq5F99Xo30CEZEexVbdG/bgArU2SsdJFrduV0J4kNSm5E/+JlU
	0gJkmBCIO0NI4a5xLcCrnCgh03NkymcC/uKfB6eelsLpZroeEs4vnlx+m7NwbpG2zku5IrQn7dH
	rf4fM0Tzk0s2707iCWEwa796OG0LqbZsaLYJ+Ox4bgQYCgvX9QcQMJ+xOQ2u3GV05GmwMYqbOdQ
	8ILErM+dGnSDIRc2hAZEkXqQifWBsMxnRggYaL2pNCL0XNKUkNqcDcX/1o6UansqOoSU22Scux7
	ntISEhT8qx+/SgoFMzLtt3Y=
X-Received: by 2002:a17:90b:1b46:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-2fc40f2348fmr13617190a91.21.1739802957940;
        Mon, 17 Feb 2025 06:35:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFftwwq+71n4gUy7mQf/w0JWNAP8EgVRNmSYeagqnLqCAIOKagB39UyHmiXqX21wm0Ic9SYJA==
X-Received: by 2002:a17:90b:1b46:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-2fc40f2348fmr13617159a91.21.1739802957529;
        Mon, 17 Feb 2025 06:35:57 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm10057757a91.6.2025.02.17.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:35:57 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] Introduce configfs-based interface for gpio-aggregator
Date: Mon, 17 Feb 2025 23:35:22 +0900
Message-ID: <20250217143531.541185-1-koichiro.den@canonical.com>
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

This v4 patch series includes 9 patches:

  Patch#1: Fix an issue that was spotted during v3 preparation.
  Patch#2: Reorder functions to prepare for configfs introduction.
  Patch#3: Add aggr_alloc() to reduce code duplication.
  Patch#4: Introduce basic configfs interface. Address Issue#1 to #4.
  Patch#5: Address Issue#5.
  Patch#6: Prepare for Patch#7.
  Patch#7: Expose devices created with sysfs to configfs.
  Patch#8: Suppress deferred probe for purely configfs-based aggregators.
  Patch#9: Documentation for the new configfs interface.

N.B. This v4 is based on the latest gpio/for-next commit as of writing this:
     * f04867a5d0d3 ("gpio: loongson-64bit: Remove unneeded ngpio assignment")
     and depends on another patch series on top of that:
     * [PATCH 0/3] Introduce gpio-pseudo, common utilities for pseudo GPIO devices
       (https://lore.kernel.org/all/20250217142758.540601-1-koichiro.den@canonical.com/)


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

v3: https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonical.com/
v2: https://lore.kernel.org/all/20250203031213.399914-1-koichiro.den@canonical.com/
RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u


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


