Return-Path: <linux-gpio+bounces-15250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD6A2592E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED70518844D1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC0C204689;
	Mon,  3 Feb 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaZGVZOm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F542040BC;
	Mon,  3 Feb 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585130; cv=none; b=t18JRoRoa4bBtcJnoabr1KahmdZM4EKG280p/6GikfIonXpSN8bHrTnaVPNtUZxsBIWZ1BHgWoO46qadvZ0jb1v/By+cE1TaitMXoC14zWEItry1EMxdiBBVX5ZVsc0A20tZZSPI9i4RK5QsgSh6gswKZQVxcYT2veWvlFgiNXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585130; c=relaxed/simple;
	bh=NBVcdgylnwnM3bgnQaOwIXSjV8MjodT55hSyuPWhiMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJq22DWtll9tKwTG9XEE4YysyM2QXioXeXgqqKw9wvItFjcvTUuX02FWVVgiv3Bg1ldWErJTJ2/UWYSiciN3Uf108sbxMNmdRUhmyNUeNkIBIDFhVRZcuS8NXFTYOHcDyNEMTP0w30AqPCAcH3n4EdLsza1NOwJouFzfhzKzvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaZGVZOm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585128; x=1770121128;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NBVcdgylnwnM3bgnQaOwIXSjV8MjodT55hSyuPWhiMg=;
  b=VaZGVZOmEb7zUjRphV1Lr9nvl6AtuEEqb4D8KQk1dCQDTJJnQc2Q1YaU
   ygOzpP9uw31fziKgd8wIb8msE1/G/GIaaBz/2JZ2aLJZ2mKJulevmaX9O
   k9HbwANj65BnXzKIb9ysLc8KETm68afSxR9oaEDFp4GLhTVpwlFOtggjT
   YHkBXMolNA/tl+lvy9E7m3mjLw6fMsTzzqncLJGjry9qo4cAQtNJIkv/n
   u3QbtA/gRLpYNSjUf4ToU9jqhI1NUL/Btx/fu9tlE4LCjh9MJAvey7uDK
   /u7Z/cjaGSoNVarYX/lnYS3WC5ov7Sa35FJqFxLNpO4Cix+1kv9NlYLCI
   A==;
X-CSE-ConnectionGUID: Pwc/jv5/RHKqDuN9IUrqbw==
X-CSE-MsgGUID: fnMtkgvKQZe9YU7VBtvUbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42731503"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42731503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:48 -0800
X-CSE-ConnectionGUID: wVmJOYIUQ3CJDWDsAtN8cg==
X-CSE-MsgGUID: nsGwx/DLRmeoZt7OdsWEbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141138405"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 04:18:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2FD1823F; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/7] gpio: 74x164: Refactor and clean up the driver
Date: Mon,  3 Feb 2025 14:17:16 +0200
Message-ID: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Seems like I have had a cleanup series for 74x164, but forgot to send it
last year, here it is.

Andy Shevchenko (7):
  gpio: 74x164: Remove unneeded dependency to OF_GPIO
  gpio: 74x164: Simplify code with cleanup helpers
  gpio: 74x164: Annotate buffer with __counted_by()
  gpio: 74x164: Make use of the macros from bits.h
  gpio: 74x164: Fully convert to use managed resources
  gpio: 74x164: Switch to use dev_err_probe()
  gpio: 74x164: Utilise temporary variable for struct device

 drivers/gpio/Kconfig       |  1 -
 drivers/gpio/gpio-74x164.c | 63 +++++++++++++++++++++-----------------
 2 files changed, 35 insertions(+), 29 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


