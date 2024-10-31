Return-Path: <linux-gpio+bounces-12360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D605E9B7918
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 11:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 218D1B2478E
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 10:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED9D19AD4F;
	Thu, 31 Oct 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4apDF2g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5119AA41;
	Thu, 31 Oct 2024 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730372000; cv=none; b=Z9fjpnPTaWJCAD4hRXxLRZdhe4Mo9kVmw6QFSc3y0uaAfAjzxVHgyW6rqomNh3uLxm1c/vE1MAhVBnxGQK6J/9RL8WpVDfCIU3xR4N8ehcSkpQ6Q+xr+1559EJfjTMAobTTJ6c+szfiHSkz6Hf2zoUpYv8bGsyd07LkjbAPqlKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730372000; c=relaxed/simple;
	bh=B3VPOjcZCPaE9BVVoLeurOhtk6dcK/IkvH0s8KqwX28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQ/TogXSpzCWZ0XK6hUCr17Ay/ncpPabDoLcPep7Ma8pmN0QDH8hn0f3MhfSm8yYpSan5udBNBSBkCP3UcD+yke+f5EhhActc/cxRdaHQoWgS3njXC7McD6SvnQZAVTLjnIq5J2jaKcxUD+BFEKNlpoEm1QXJ2vfrR13CbNi4v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4apDF2g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730371999; x=1761907999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B3VPOjcZCPaE9BVVoLeurOhtk6dcK/IkvH0s8KqwX28=;
  b=L4apDF2gUELEDdbVu9qd2qRMoop+lHQFljbRlhUjqD4xLeqcA9HCdIE4
   lEAz1L0Ey84FZoxv318zBoscX98FGl639tbvDrbu6XrIW5/Rg1y+8CpzJ
   KfGIlSc/lAl6LHfqn42QutI3gUReskcOUWOjVovUuqnRm1HXMGmvLrcRp
   Wd7tSDOGELHXRhs3V62H6jzp8EA4c0D4UbWNKrcevqrbO3ZrywIpZwD//
   IGpWJfHHGqEXilbU0s55bsfNNHKARXWmRwHpZv4q7viCZOEEI6rIIWBP4
   kPHbzG03PhpuvRqAkC0/+0nfczUeToIB8J2DPNg3kinVKpDHxjZtyxaF2
   Q==;
X-CSE-ConnectionGUID: GJMWxxSDRSOMVmRU6ft6lQ==
X-CSE-MsgGUID: 1b+9tF9/R9qH7L7hl83uaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29871003"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29871003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:53:18 -0700
X-CSE-ConnectionGUID: cSYuM+g6QrO439w0diQYnA==
X-CSE-MsgGUID: Cqq6vTZMT32z0vbtGXAEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113384156"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2024 03:53:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CC3931A0; Thu, 31 Oct 2024 12:53:14 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: [rft, PATCH v2 1/1] gpio: Drop unused inclusions from of_gpio.h
Date: Thu, 31 Oct 2024 12:52:03 +0200
Message-ID: <20241031105314.2463446-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a preliminary step, drop unused inclusions from of_gpio.h,
so people will use the header only when it's really needed and
not as a substitute of any of the dropped ones.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

For testing purposes on what will fail in CIs. People are also
encouraged to test this, if have time / chance / wish.

Nothing special in v2, just to see the currect status of affairs as tons
of the misuse of of_gpio.h has been fixed already.

 include/linux/of_gpio.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index d0f66a5e1b2a..bf6774632b5e 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -10,11 +10,6 @@
 #ifndef __LINUX_OF_GPIO_H
 #define __LINUX_OF_GPIO_H
 
-#include <linux/compiler.h>
-#include <linux/gpio/driver.h>
-#include <linux/gpio.h>		/* FIXME: Shouldn't be here */
-#include <linux/of.h>
-
 struct device_node;
 
 #ifdef CONFIG_OF_GPIO
-- 
2.43.0.rc1.1336.g36b5255a03ac


