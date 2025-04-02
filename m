Return-Path: <linux-gpio+bounces-18169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A08A78E2E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 14:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31C01171357
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 12:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CD423906A;
	Wed,  2 Apr 2025 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHdgpY77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB70236421;
	Wed,  2 Apr 2025 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596465; cv=none; b=VQSTtqhQJvlgJm8QR9VvXvziBzUh5u7DUh5p7s/AIL9fGgixpUTYyijvuZuqxK8xdeS7y9Bpm8jhjbKo2gwyUBMbPGRq3/hmouL8ZPeSlagRT57ot+tQFobTyvdnm52TNvMdrVOq7wz6uGcuYpC9V831fsusYwQj1wzcK0/lUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596465; c=relaxed/simple;
	bh=Qxt7G6T54M3ddgF/lqcjZIg6judYFK9ycBKleEsRYjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osopsNtnPIbETRikb7C3XESH3xRTSK33H1OsLkgk6g7M9ft/bU7VJNwOMk/5Ffr8MVlFkDIL/IKyQ716Frer6MkDFf6qiaYDlyZ5I0pH+jz84br4UzhHlNjAitXR6kw4AiFPPNzHIrYlmGe4THmOqlT9BwoWE13nkfa7QMtsFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHdgpY77; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743596463; x=1775132463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qxt7G6T54M3ddgF/lqcjZIg6judYFK9ycBKleEsRYjo=;
  b=JHdgpY77NhxWFrH1PI+RYL0gvoDNUKvZZ6IAUdg1yoAWipUR6aYWX7lH
   lVT9auG2QHDIb04kLwpn1Qzgua/UARdw5KTv+BNNOlaiI7c76TxcodKmh
   JIx8Vkc0SpUVAiCuSndAX+m7mfZbzNJ40qNBPZ2LVnGLxUevA28UZuaaP
   sJIyH59Mz7J9MJ9diyX4eLBcMulnCxL7kPR34Dru3pHUJzaurKtTRnWlD
   cXsf3lOUfo1oGIRFJZe7jd2Y4wNqSpsvB2sfvFX2mTW372Fosz+9Q4AZQ
   PVjryrmp1sQTVlmlMGK/45VVjbXu6r23Iwvky8hS38RQOmNrVjU9DlkJu
   A==;
X-CSE-ConnectionGUID: yJm05IeNR16avJ4ecUtSnQ==
X-CSE-MsgGUID: JU4+1Nu4ToS+s2ld3INuaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62357541"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="62357541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:21:02 -0700
X-CSE-ConnectionGUID: FmNPDNT1QoG5r255nLgwqg==
X-CSE-MsgGUID: YeUqfV5LRgq6TNk5zpYXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127584274"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 05:21:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 73DBE26D; Wed, 02 Apr 2025 15:20:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 0/2] gpiolib: of: Fix and amendment of OF quirks
Date: Wed,  2 Apr 2025 15:19:59 +0300
Message-ID: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just a couple of minor updates to the GPIO OF quirks.

Andy Shevchenko (2):
  gpiolib: of: Fix the choice for Ingenic NAND quirk
  gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment

 drivers/gpio/gpiolib-of.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.47.2


