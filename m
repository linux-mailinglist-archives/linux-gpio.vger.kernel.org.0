Return-Path: <linux-gpio+bounces-12307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C309B67E9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 16:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D368280D71
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 15:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBC32C6A3;
	Wed, 30 Oct 2024 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD3C+rMq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430DB672;
	Wed, 30 Oct 2024 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302328; cv=none; b=HrqV8Krz+1Hiw+lwI4ChCNgmGKwiSZxSpth+i+mXv9AHHZhQmvQzvc4Mf2A9ksDj/2OVi6yhV80y2N1BvaEFCwPDTTSAu5M/CdDewzDX6WJ1SigZu/yEhbKYesCI+1iMRZm36JGHt4tD2MnC59oxx/4rsnQ61aDP0Noad6PZv+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302328; c=relaxed/simple;
	bh=zJvRPu9fFGtLZRBdaGm7hZegMGGEc1fQc5lfAtVMMc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fltuOjUqrnvRgXkKZSzMNo9AvJQFjxoFJgDM7RLSvHZibcvgMKVFXUYXFwzkrHAtzgSUFX5PQLGYcMdZQY6EM91GmmgrkGJutK2rtCOl6seVmGDWAgflyrnEo5n4H467oMOiaklKEIzN6uM6/1PmCah3PmvuTaL+7TAJhLTKzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD3C+rMq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730302326; x=1761838326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zJvRPu9fFGtLZRBdaGm7hZegMGGEc1fQc5lfAtVMMc0=;
  b=KD3C+rMqhZobH9pbbmftCtnJHZ2RUlVujm58k49F4z5bbu7mPoh9I7pQ
   ujNtE04PqkCmcN99khpdyd+r6kN8YSzIEr8ozgJBPIidOmTpTfZEhFdl0
   ssVsuXJSkLBb5u0EFppDVWS3ASaS3xcnCyQ1tdq/BS8ZtP+a2LMzYSwh1
   JZqQpAN9ZRLqDlvdFNiK/hiOztJSztD0FyGFqMg4Wn02D1GE573gov6Qg
   Q5pK1tJxUbu0bT9FMlAEm0ChQ0vkHpO6NqG8nCsIXT9D5FJ/drrg9BNVl
   jMYcqMmEgk3Q2cSgFpuoLEYkrzV5gQxdub9ebfsQB8Zj5SDnPbHgvuzEX
   w==;
X-CSE-ConnectionGUID: PrO8D/BvQYOIMz8klpMBhA==
X-CSE-MsgGUID: sABLWb5hTcy2kT+cC9hI9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33699873"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33699873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:32:06 -0700
X-CSE-ConnectionGUID: n7BUvdvEQUGTXD98HGgHGA==
X-CSE-MsgGUID: SU9w4aRASBWIO7ftLcY9tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82514083"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2024 08:32:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 671991FD; Wed, 30 Oct 2024 17:32:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 0/2] gpio: Check for error from devm_mutex_init()
Date: Wed, 30 Oct 2024 17:30:25 +0200
Message-ID: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ignoring error checking from devm calls is a bad practice in general.
While not critical today, it may become a problem tomorrow.
Fix this for devm_mutex_init().

Andy Shevchenko (2):
  gpio: mpsse: Check for error code from devm_mutex_init() call
  gpio: sloppy-logic-analyzer: Check for error code from
    devm_mutex_init() call

 drivers/gpio/gpio-mpsse.c                 | 9 +++++++--
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


