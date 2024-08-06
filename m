Return-Path: <linux-gpio+bounces-8594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F89489FB
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 09:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A269B23CD3
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 07:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9383216B386;
	Tue,  6 Aug 2024 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g39Jom7j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A58161327
	for <linux-gpio@vger.kernel.org>; Tue,  6 Aug 2024 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722928837; cv=none; b=ZT9ocFAAR2GaMEylasHYEdrhaducGvizk9pSnafHXQkSswpW5Rar/JrI0OPgpr2Rg3Rp4v9BoSX3Cd/M+sDb0/PDNPrJAXwpptmpACQ7uiGzsaD87LsXHrIYman0NWsDv+jLeeGG9mQEPr8LIfR81HsYVrZJmGgpGhzfqpFe0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722928837; c=relaxed/simple;
	bh=HzPuSPXgrQAXfezg1qdK7pZhQp3H5Mo962gH7tEH1yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHjVfYBmZr1WedhmhImMIi16hQZlruKY0VeJi/8npTpt8f0as4dcYdIR2Dsuem02X5tYTe3Pwipe6kA0msLqWK+jmH8K/7qNT+9Xmt2dnz7ZAYPzLI4MSsKCbkpIlZzPeOdHJM2VPS6Z8ShSwrp7gTu6Zre+USJf8eCTanopU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g39Jom7j; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722928837; x=1754464837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzPuSPXgrQAXfezg1qdK7pZhQp3H5Mo962gH7tEH1yY=;
  b=g39Jom7jak76COEJsNf6vrqFYqnjQiXCeOvbtc7PJy57YVazPOA95+jZ
   BpyY2mrI7my5ngDK8zJGIi3HPweQ2pk+BJqThanmtVz5JBpkZIm70Aq70
   kCRYsffrN2Tbu9HixbRTWdmRtyUUZxTa0TLYhp+oyqtkBvFs9KOOeqaY2
   2PeQCcwdtgCNHpOzc4x7qtmjTU7LeToq87f3pbXENxM3ruv2hmripLXxs
   EK72TTM9gJUbuNDzSyKvo2gSW8GOL/qk0LX0dO859X0WemVkK3GxeMEgU
   Whbzr7VO0hZKYqgHO+u1gOH+mbKslLxvYcRSv/FugXnAAF+7zKvxjOfwY
   w==;
X-CSE-ConnectionGUID: /hTbMZsBTdmwQmhnQft38w==
X-CSE-MsgGUID: GZFTSjJ9S66T8Y8L4uEatQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20778329"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="20778329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 00:20:36 -0700
X-CSE-ConnectionGUID: j9ZtSt+pTXOwkxpw5y5s8g==
X-CSE-MsgGUID: Iwr83vlATemUzVCnSdtj9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="61040350"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2024 00:20:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 07EB913F; Tue, 06 Aug 2024 10:20:32 +0300 (EEST)
Date: Tue, 6 Aug 2024 10:20:32 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for v6.11-1
Message-ID: <20240806072032.GZ1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linux pin control maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.11-1

for you to fetch changes up to a366e46da10d7bfa1a52c3bd31f342a3d0e8e7fe:

  pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID (2024-07-31 13:38:13 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.11-1

This includes a new ACPI ID that is added to the Intel Meteor Lake
driver to support recent Intel Arrow Lake hardware.

----------------------------------------------------------------
Mika Westerberg (1):
      pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID

 drivers/pinctrl/intel/pinctrl-meteorlake.c | 1 +
 1 file changed, 1 insertion(+)

