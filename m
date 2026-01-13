Return-Path: <linux-gpio+bounces-30472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC805D17DF7
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAE7F300A99B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A202838A9B2;
	Tue, 13 Jan 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha00EsEk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E2A38A286;
	Tue, 13 Jan 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298967; cv=none; b=Yx75qDGaWJN/OlMyI7GeEjy11EmSfwrC3nJhHQ24BsT4tdg1hun45fCe6wxwRsQWLd/68iPdH2fMbYUV48rnFs/4pJcpkYfJB5NSyT5f2ZJa9Qt7aFhX3mzRSOVNJapKEM5b4R6ZxznPvHBPKRkyzNkZn7kk/oi9b8J9yZAJqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298967; c=relaxed/simple;
	bh=vBNPm4fho2wEH4aK4kotDf5QAGX4flgx2Z+30tIR3Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oceHc3b5xO1nlSH8WcVtem7pSM4dg9jYgudeSIWj5u9o6uCk6p9t7e1B4Igl7GCpeHusj/Ia58bTWeBd3Ed1CPv2aR7ifUzJVolJp50jQCmsZihIzIYhnPnQvbNq6KQDYGeK+ttt/Yz+nzpKwMSN9FTPrY3fZKyHU14eTtKTlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha00EsEk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298966; x=1799834966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vBNPm4fho2wEH4aK4kotDf5QAGX4flgx2Z+30tIR3Bk=;
  b=ha00EsEkdHEZVMBhTIxpUE9sIoEr02n1BFImFamCULDOAS7jjzbR83Ux
   RW/HWDytponZavOVTmTkAtiOHKMKEEn+z5Rit05q31YoYvGR11sdm6HvC
   RVmm5GfxnKpaskgSWuvToVjd4GqEfO5HLjh6rM8EoiffaNMpJANvml1WW
   iB5Pkme8rvSZMjt3rx2irLs+FwZ/qk/AmqPkOcAwXCSR4Vw1fTj1xibgT
   1brrhRcBgwe8niLy7eDVhGup1gbdjMOtXvxRr7BwRxIvD8U//ltisB6uY
   V6vxIfN3lJL0qoAXqIDNFtz9KHtKcX819DMNo2NLC9P4Q2z5fijEU5PHD
   w==;
X-CSE-ConnectionGUID: ex9EcwVJSviJ+mTpURF1Ag==
X-CSE-MsgGUID: MQ3K9zuwR/qahqkss11rMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69637705"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69637705"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:09:19 -0800
X-CSE-ConnectionGUID: eDeekh2LTte84NUHfJNenw==
X-CSE-MsgGUID: FF1QhUciSoC8Kf4a+phaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203555917"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 02:09:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2E3B898; Tue, 13 Jan 2026 11:09:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v1 0/3] gpio: pca9570: Ad-hoc cleanups
Date: Tue, 13 Jan 2026 11:08:03 +0100
Message-ID: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com>
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

Andy Shevchenko (3):
  gpio: pca9570: Use devm_mutex_init() for mutex initialization
  gpio: pca9570: Don't use "proxy" headers
  gpio: pca9570: use lock guards

 drivers/gpio/gpio-pca9570.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.50.1


