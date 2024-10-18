Return-Path: <linux-gpio+bounces-11636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08F9A4033
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5972C1C23AED
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C689A202F68;
	Fri, 18 Oct 2024 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgbnAPCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895901EE03A;
	Fri, 18 Oct 2024 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258897; cv=none; b=F3AZz7XiegpIL8mhYdx4IxPCJTHPPtpZDUTTzDHKdbD4qrCWlkSnBgzmnBwsY8sl8WeBVXz5026Ge7mXB793KvpSye665+9CKBSKjwwNB6YEny+49DBw7K5ZnB6kQ/j0/WGEu2j0e2IGrUehbZrGQ7TaJ6Ex4mnOwB85mJ47OQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258897; c=relaxed/simple;
	bh=XL6JXpH81IEzH/i5tE96tylM6dkEjIQ8ZZrJ1NwfqNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=akEQXXYI/o6Vp6kiTq7bBhDZ17Yz5HnWhNQSIf3fEn6Z966ybdQLFyygr+Dabrvc8Hiapv1VCvgV8rvddwERigG5MF2qfCSsVcGVLe7rUivh62OrAyKBCUyCEpf60bYkoT3hGeasj515tmyk22PfYhxg504Gc3XDOKEyqVvTyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgbnAPCH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729258895; x=1760794895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XL6JXpH81IEzH/i5tE96tylM6dkEjIQ8ZZrJ1NwfqNQ=;
  b=LgbnAPCH6TvCW7io4kNDDOSulFRra91Ej53DJ3XNKQkylEpCvSIZuPlm
   HoN3iyhAlbA/YTFcUk66F5PlWPCusn+X3mQQ5Jwmnd8ezKdjo6K5ZqouS
   sic0tTehSw5+8dZqwSy+b28oPCPWxzLhXPgpYeSioIukjVvszC0tdT4ln
   qM8U4nlIpMwD4KWK/ekS+B7HeUMqH77A9V/iPqEGMcfTB2yJ2tQTy9OxQ
   nOXw3qqMZsudEI56y2QnUMFtwYSYWVdrPdg68OKGjqSELprqu1qPiYxHm
   pWhUcT8+RkDDxv+H0WfmGhrLi4NCDdI9IL9ipdFKLwuCG+itatfoTRc9D
   w==;
X-CSE-ConnectionGUID: dAYnSXh2RJ6SeSIDOw7mOA==
X-CSE-MsgGUID: NS9wXdksRFKBnYacN5KqXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28251451"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28251451"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 06:41:33 -0700
X-CSE-ConnectionGUID: iuTQBoJdTlqUyZsnk27j3A==
X-CSE-MsgGUID: sCXYBhCtR4i8Wgv3Qq8PIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83935281"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 06:41:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 024B03F0; Fri, 18 Oct 2024 16:41:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 0/4] gpio: xgene-sb: Improve ACPI and property related code
Date: Fri, 18 Oct 2024 16:32:31 +0300
Message-ID: <20241018134129.2058068-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve ACPI and property related code in the driver.

Andy Shevchenko (4):
  gpio: xgene-sb: Remove unneeded definitions for properties
  gpio: xgene-sb: don't use "proxy" headers
  gpio: xgene-sb: Drop ACPI_PTR() and CONFIG_ACPI guards
  gpio: xgene-sb: Tidy up ACPI and OF ID tables

 drivers/gpio/gpio-xgene-sb.c | 37 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


