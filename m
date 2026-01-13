Return-Path: <linux-gpio+bounces-30483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A909D18699
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D31307933D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C156336CDFC;
	Tue, 13 Jan 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe2Kkl/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A283816E0;
	Tue, 13 Jan 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302723; cv=none; b=rI3XQIcPLOzvKqlTeZf2GnSwZiv0KTO9lTWg6XeSuPCdmQm8/qP0OvkPIAvuEXQzuw9hK5x5uSST8j4dGgKSpSq7KB8Ttk2UTuGFxt/OgdbFa9ekiKxzGVVYJTZIXEkOtWKi72GMdu+dO7o+BBmeSU4EaPfA7A2PWG3jaoo+u38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302723; c=relaxed/simple;
	bh=esecILdediTjV6LVLUeaL/Wx8ptBFHfkEDgHjG7bkCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECJkOygQlcupb70Preiar2NhVo2BpphDw43m4gQ4iYhS2qIeO8bFME1hPVahxj8WJabxT0g1UcD3DaTbS0RwZkjmpV0CoFSv2TlA2QJXokDOZYhgaw//cHzWeKN5IADhYKga9C6Gauh7lab8rwYBqMHD4ceQEHaVfv90CJmUJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe2Kkl/s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768302722; x=1799838722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=esecILdediTjV6LVLUeaL/Wx8ptBFHfkEDgHjG7bkCI=;
  b=Qe2Kkl/srz37tntmv8eeMVgCKXc/C/67WVEtpt7zNuCBPnUomtA9Ln7g
   RUk/vxsQxVu59leHU22LJyDjEIqF3GoRms9bcNmKf9bGPkMO6LXy58KmS
   pYmCGXT8FZ3GTwpKFi7BWD4t0geBmay3P7tx9cnj9MyXxwOR48/tE3LRf
   uqwYkLNkBkBL9K1uY/WGHfucYqPFZDrtLRwkNjKwpvCvL4eNCJQGhFi5/
   XLz6g0jVXRbq7m/cdIOlM5t5knHg1/uI9MGX33seqla0W3pZQv/bp8WQk
   hpcM8fpol4qmxTYN5MSEAljr9OCcfhjnkPZ1s3px33B1rurjkrWVI8lG+
   A==;
X-CSE-ConnectionGUID: pYjO3eTsS6mv17JZMiubBg==
X-CSE-MsgGUID: 3m0y56E9T26rjMKQP5bK1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72166543"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72166543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:12:00 -0800
X-CSE-ConnectionGUID: G1orZSZmTuGCVtiEw6x1ow==
X-CSE-MsgGUID: hGn7CqouQquWiQHWXUUQ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209414888"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Jan 2026 03:11:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 379AF98; Tue, 13 Jan 2026 12:11:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v2 0/3] gpio: pca9570: Ad-hoc cleanups
Date: Tue, 13 Jan 2026 12:10:51 +0100
Message-ID: <20260113111156.188051-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Looking at this driver for something else I took the opportunity
to clean it up. Hence this mini-series.

Changelog v2:
- rephrased commit message in patch 1 (Bart)
- collected tags (Linus)

v1: 20260113100913.136777-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (3):
  gpio: pca9570: Use devm_mutex_init() for mutex initialization
  gpio: pca9570: Don't use "proxy" headers
  gpio: pca9570: use lock guards

 drivers/gpio/gpio-pca9570.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.50.1


