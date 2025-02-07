Return-Path: <linux-gpio+bounces-15549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6400A2C6B9
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A12B188D492
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BC4238D58;
	Fri,  7 Feb 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaWfEBEm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1E1EB1AF;
	Fri,  7 Feb 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941515; cv=none; b=EdBn1ZsPXFFOHR3XH5EZ/lR7cZmmoo4HKIc3Onp8C9eoR3gcEjj+kYmemyvrcvFhaGMgOI7OHxKikGygc7grX0DCgZ0iMUnWlAoWy0fAn4nl6tpetdn2wh2eLbdRdcrK5ZxYjwSR4FDvWvHL2543fcxWLpaVuRe9MTHhflnlYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941515; c=relaxed/simple;
	bh=f7rwUyFqeub0/bgqM5b8Pvux56R2zUVm22X1jxk7Tjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofXlD4tQmRqBbpi/U4z62M0J01a9a91wHu9Q5StDqb+78ihyzISQ4tm/AfBus3NKCIZsckV1ANwCChCNgxu9T+AGdHw6K5/Z76b563EDuemDGczlaEV0025egTof2i7vyaasRDW4ijJ968Dqh2x9RfQxWZ8y6QWRVpfFJR4knVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaWfEBEm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941514; x=1770477514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f7rwUyFqeub0/bgqM5b8Pvux56R2zUVm22X1jxk7Tjw=;
  b=LaWfEBEmrKV/maSLy4SRqL46RzerdBQR/ic8LuVIXC6iN+vOZj+oO49h
   DPd0Vlt6RpBXOVB0pZKEbaMczvghgxGrULIMqCupRY0kC/jE8/ueR/H1A
   yO2dy/19uqzsqpT2aDOM40NTMJkeh3qPyUl/VeZovrG1Di38OjhjBKoNb
   WHXGfaz54zPtuWg6EnodtbFOo8tfXsq02bNMgXJsXUwPmuTy7ZnVY7VjZ
   HdKLidS/Wsdd9MX7xOKbgxMWB2icYvRumuBZNTLNIKwcY0A8NBchgL9fc
   gGrIEgxxhLQMTjzE4/8ArIsNP/evlykxOJRFyOEBeRiXvDtTURliamduL
   A==;
X-CSE-ConnectionGUID: Y4Snn9VDSkK+BtQGYJJbEg==
X-CSE-MsgGUID: qnM65soKTcy7skMaTQ2PTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38815605"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38815605"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:30 -0800
X-CSE-ConnectionGUID: yoFRE1uUQeKTySDEnR+kWg==
X-CSE-MsgGUID: bD3bu14FQki0CT3ISzjWXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116599310"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 07:18:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 714C4125; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 0/7] gpio: 74x164: Refactor and clean up the driver
Date: Fri,  7 Feb 2025 17:17:07 +0200
Message-ID: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
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

Changelog v2:
- remove ->remove() leftover (Bart)
- collected tags (Geert, Gustavo)

Andy Shevchenko (7):
  gpio: 74x164: Remove unneeded dependency to OF_GPIO
  gpio: 74x164: Simplify code with cleanup helpers
  gpio: 74x164: Annotate buffer with __counted_by()
  gpio: 74x164: Make use of the macros from bits.h
  gpio: 74x164: Fully convert to use managed resources
  gpio: 74x164: Switch to use dev_err_probe()
  gpio: 74x164: Utilise temporary variable for struct device

 drivers/gpio/Kconfig       |  1 -
 drivers/gpio/gpio-74x164.c | 70 +++++++++++++++++++-------------------
 2 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


