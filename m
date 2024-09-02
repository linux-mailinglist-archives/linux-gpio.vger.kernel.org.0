Return-Path: <linux-gpio+bounces-9583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D475D9688D7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 609FF285E9E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BD419C54E;
	Mon,  2 Sep 2024 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yc0lbnCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFB15E81;
	Mon,  2 Sep 2024 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283920; cv=none; b=hs/LzQnC9yAspB683Ianbs7+6vTWv/Q9Ls8BJhLwFuqE/7dYgbJY4ufMcK0mLbBT57XZuIk6ro5Ee3UbSQTtqbhns5SJFD5mcGQw6WmfLLCXGse5RmrdQVpKfZbx/0ZSAUcYYjTDZko69EdX+2uUQMZUaQB8XKSRM3dCqJQ3LBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283920; c=relaxed/simple;
	bh=LxOn5Qgvj4iY2bhqvCqxAbQHIwgeapr368nzzFYJ1fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHenzuZzzC7stbah8vylnQ+58Qq2pwjaKHEXDm99hLiQVbKzMdSXvAsGOcSPzqFIA0BHeAIeAcUGoMn1Br0XlJ5GE8uxEmfUgqxS9uPHYWOmDsScC9fOOOn3Dibb2RLW+2w0VK6UPHogchzkfSU7fXXM4uYFdtgJDbz/jIoOKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yc0lbnCQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725283918; x=1756819918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LxOn5Qgvj4iY2bhqvCqxAbQHIwgeapr368nzzFYJ1fQ=;
  b=Yc0lbnCQkgycQulqhjMpTDUf8L3GQZWU3sE8PV0HnHaiRabKDvHj3IYX
   an3TYVjwx+nyfOZuPbPl/+6gbFiUPX8+PfqvhfhW5Lg5Vk8DqA/99bcJl
   TyVczqL7HJb+WMT2V1sJSmCHqpcA6uJbQ/0h6W1TTkyxFt7Qddf3qP16m
   vuoM0mV8EXr9VAZph/ENEgTJ28XLW2cIRzRW+wnnqtivSBFTsuM8ZPZ2p
   pmypp3L5SByTfrWiBIJsxtuSVu9DOVbDYO/ho8+d866EmP2xOUXFuJEgt
   yr2To9n6F17VLqgScl1xhEH9RvIpHXFzFBSoINxU8tXPUHHFnUcYBcoE8
   A==;
X-CSE-ConnectionGUID: PtewK5QDTjGr1yBV8RbOIA==
X-CSE-MsgGUID: /yWm7CGoSM2coh5rBiEb/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23821224"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23821224"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:31:57 -0700
X-CSE-ConnectionGUID: xhzCTv3iQ0eczgcJ5keH5g==
X-CSE-MsgGUID: CmotSmxuSHWRfBv0v9kyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69244869"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2024 06:31:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B218F233; Mon, 02 Sep 2024 16:31:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 0/5] gpio: stmpe: A few cleanups
Date: Mon,  2 Sep 2024 16:30:39 +0300
Message-ID: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few ad-hoc cleanups inducted by the recent patch that made
an (insignificant) typo in one message.

Andy Shevchenko (5):
  gpio: stmpe: Fix IRQ related error messages
  gpio: stmpe: Remove unused 'dev' member of struct stmpe_gpio
  gpio: stmpe: Utilise temporary variable for struct device
  gpio: stmpe: Make use of device properties
  gpio: stmpe: Sort headers

 drivers/gpio/gpio-stmpe.c | 52 ++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


