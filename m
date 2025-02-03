Return-Path: <linux-gpio+bounces-15189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEEA2518E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 04:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F1B3A3464
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 03:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CDBEEC0;
	Mon,  3 Feb 2025 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="vcn/FW+I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27863224
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552353; cv=none; b=VLBsCE/Vtv4tIL98imfAsRjPoyJil/hBRf3u4NoI2G6BQyciUMSzoRGu/MsEpYW1EDnYnaW+KOSBTgby+aFNA2LUL0gaa4nl++/AWWtPwPpoh67fgyPZMMmhiQR7QIovAh7Cx/bgccJSpcejtSdTIaac0HzVvhFGSfXZroFQ4UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552353; c=relaxed/simple;
	bh=9qEe9GBuiReSyhyjLuww21ymXgybsQsC20Fu9NIuEPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NlsfiiTwI6aSIBo2n9YNTSo4z89rvNgcofhJckWAQBFebFq2rOxUd1DbYkAc7iOIK1n8Vr5C6lzATCgFwLruK0soH2bOOBSqLLocU+apEXFrnlANQaehlWWw18bL4VkxGDWna1Q4SSvcsXSZDf+BGYvt0siitcqvMlIz+VhQ+hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=vcn/FW+I; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1B64C3F84C
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 03:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552350;
	bh=9dRaT42vDk2aDgfJrdAlWkHrMcmu16MBdNXartJvulQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=vcn/FW+IfgAEPLiM7AutcbBvVj7vtA4vfTbGqcZhLRJvVQWD5oM6/soZxgfsI86zU
	 PbqPKdT0QI1YrhtXHn7lLM/x4G8Zno7xwg0YAiNYDlddqv9Dw5noTxhTeXK7JFCRHG
	 piz36Ml5LQxDzJBF8Ur+coJctFk8zaPdZz1QrfUvdgNnIzOQShSXP0f6ckoqfE9oOX
	 fM6I9/CN1yoJ5ZSFkN10na45VFPANNcgEhn2u7AtCKCGul1A4/4ta+soURDUaENPmk
	 d86uxncK+VYeMVCrIytm3k7AusCMZzDm0DI6ICwjWCoACT2LGvtdxuDtvs5fDM9jCs
	 y9Sf1XnS+6sYw==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166464e236so124932775ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 19:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552348; x=1739157148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dRaT42vDk2aDgfJrdAlWkHrMcmu16MBdNXartJvulQ=;
        b=pL0g21jstYmQa+GcmAp90ZnmQCPo/cA2nmwL8xsNQ6SoEp189rVPprcAq1q+uRWUu5
         1fH6O/RU2gk7xSxauAz03FRBo9B3ThMW5avA3beAKiAecppGA8B/vtDy7ricuec1GtAY
         kzbB0BlPtM2mLTy+7kBBrlT798QvEPaS5nF+0luEbqsdPpNgAS15YpLMcCHJug6H/Mn4
         a3SOn1NQIIFwjPZ/SsHBpFlF+ot16aoOBsIylzrqmH8gpOVG+95+kpTYgJWmenNIwQyY
         YBWjpK2/2PeCL0bSBG7Qjxv6L8ZDjZOFH+7H8SPJx6Eg21rI5FKMip6YBj2iggBlu8Bz
         VQaA==
X-Gm-Message-State: AOJu0YwnLfZudVJMO+F4R7Ya9hMMo0OChJSqPicLwQLHB6wLsXtOEoC1
	xTt2QtsBa2GElj1Ri60LGdKPhNZdHVr3/ko+Voigz4s/7u+IRl7yVBULCq1WhtjcF9Lf0L1yd1k
	TRl976YnsPl5umHC57KmxWYwZh1IGpSiP80iYnkLNzzHoc74jYTiAeNy+1cqInyEdq8IguhT+1C
	gccu7vj50=
X-Gm-Gg: ASbGncv05X3RHOYPR0xD5m/s6f004dajK1L1xPExjnclwTS5KTTQksi9LKprnxEr6Jk
	HHwhwps3jsm8KkewJ4z+GXbVtCzlSfB/GqNnV9XNhglF3mrqd97NFMXp2gAeJPrDOYLs76MUHop
	WQtOjsABKv34o/QVzlBAOat9U719QQ0/dqgpxoPIaJjrQ1FPla1/8ddKIhbNq8sx5U8g72WQsgD
	Q0d/Xo9i7C5p0Fi+mcPA78LHMotga9gc3jM4RL6x4fBZoL/yqZWTpvg9lFsGLCv9fe3K7DGymNm
	cOcV
X-Received: by 2002:a17:902:c40f:b0:216:281f:820d with SMTP id d9443c01a7336-21eddbf3371mr197858325ad.11.1738552348448;
        Sun, 02 Feb 2025 19:12:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbqq3RY0ybUzsaAUXBG7s71Ef7RwBo37hUW1Z4jJuX4NQap/3W/X0DvIDLQn2If8JISW9oVA==
X-Received: by 2002:a17:902:c40f:b0:216:281f:820d with SMTP id d9443c01a7336-21eddbf3371mr197857985ad.11.1738552348008;
        Sun, 02 Feb 2025 19:12:28 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:27 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] Introduce configfs-based interface for gpio-aggregator
Date: Mon,  3 Feb 2025 12:12:03 +0900
Message-ID: <20250203031213.399914-1-koichiro.den@canonical.com>
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

  #1. No way to determine when GPIO aggregator creation is complete.
  #2. No way to retrieve errors when creating a GPIO aggregator.
  #3. No way to trace a GPIO line of an aggregator back to its
      corresponding physical device.
  #4. The 'new_device' echo does not indicate which virtual gpiochip<N>
      was created.
  #5. No way to assign names to GPIO lines exported through an aggregator.

Although Issue#1 to #3 could technically be resolved easily without
configfs, using configfs offers a streamlined, modern, and extensible
approach, especially since gpio-sim and gpio-virtuser already utilize
configfs.

This v2 patch series includes 10 patches:

  Patch#1:   Preparation for Patch#2.
  Patch#2:   Introduce minimal configfs interface.
             Addresses Issue#1 to Issue#3.
  Patch#3:   Addresses Issue#4.
  Patch#4:   Preparation for Patch#5.
  Patch#5:   Addresses Issue#5.
  Patch#6-7: Prepare for Patch#8.
  Patch#8:   Expose devices create with sysfs to configfs.
  Patch#9:   Suppress deferred probe for purely configfs-based aggregators.
  Patch#10:  Documentation.

Changes for v2:
  - Addressed feedback from Bartosz:
    * Expose devices created with sysfs to configfs.
    * Drop 'num_lines' attribute.
    * Fix bugs and crashes.
    * Organize internal symbol prefixes more cleanly.
  - Split diffs for improved reviewability.
  - Update kernel doc to reflect the changes.

RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u

Koichiro Den (10):
  gpio: aggregator: reorder functions to prepare for configfs
    introduction
  gpio: aggregator: introduce basic configfs interface
  gpio: aggregator: add read-only 'dev_name' configfs attribute
  gpio: aggregator: add read-write 'name' attribute
  gpio: aggregator: expose custom line names to forwarder gpio_chip
  gpio: aggregator: rename 'name' to 'key' in aggr_parse()
  gpio: aggregator: clean up gpio_aggregator_free()
  gpio: aggregator: expoose aggregator created via legacy sysfs to
    configfs
  gpio: aggregator: cancel deferred probe for devices created via
    configfs
  Documentation: gpio: document configfs interface for gpio-aggregator

 .../admin-guide/gpio/gpio-aggregator.rst      |   93 ++
 drivers/gpio/gpio-aggregator.c                | 1194 ++++++++++++++---
 2 files changed, 1103 insertions(+), 184 deletions(-)

-- 
2.45.2


