Return-Path: <linux-gpio+bounces-15350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D788AA27AC2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 20:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966B33A3C4F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 19:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F573219E93;
	Tue,  4 Feb 2025 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLlmgzx5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF23219A9D;
	Tue,  4 Feb 2025 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695752; cv=none; b=s8319BZTAzL4SSHaCFHAl5ppHlWCkJqpSTg/d/qyKh3um2SqS35hmt3BUtQkJnTDX0N2dO1f4K7uS1NP+Uz+3IwAZjYHpy9bbh+aqUYMckFadAZyM+pEIkGFm1l1LekG8XIUoWET7G+aE/JtS/J2nWI73sHLTT3LC7nxMffSAJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695752; c=relaxed/simple;
	bh=PIUhX8VO7CVtWRpn/eEYy31OEeX931JlqTLJkQNGe1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bb1OiPwtDpGCMndC+MG9PJFjnoTeOrcUohcLs8r3jdqaVOoGbn4MnDP2r++RUMaYx/RnYL63fY6RXOWpW5ci3kIa2lYxgEycP/EKl9Lwv6i/PRwRfr+kx2+ku8JSoiZQAPNrzu/WVwouFDilaifqP8ANCkFXBb5KPRLQSySvtx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLlmgzx5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695750; x=1770231750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PIUhX8VO7CVtWRpn/eEYy31OEeX931JlqTLJkQNGe1s=;
  b=bLlmgzx5xaYKdwDvQ98hjNrktpUjJyFbbL8nsbtEO9IZlaSmnc1vAVKX
   QsVlv9z1uXL9SzDjtxxxAU6UJw+5F5WI55sHm5HyI/T0i79Z/z6gEcScH
   YbTzwsiUPF/IloEYkolI9kV0G1Y3JU76s4lY7Ruamld1xn5Pluc4MeOsi
   KUFJIKeD2kxjXu3M2sV4oJtHdasPsR7iDlMaakA87ntsRPRpkxCGa9iPP
   jqUPDmel57x0LFutx8m72iABtSsK87jrX1TegAxEi2Rjc87M3BKEsBR0b
   dxrvQ6xhrmEVFcglhQXKurPfjpo2DqfqrfMr1wTHBWzx32tGy7Vcrp8Be
   w==;
X-CSE-ConnectionGUID: ov0Go4l3SvePTVV1ZoKXLw==
X-CSE-MsgGUID: lq8nSOX2Rqyi+t+LnydSVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39501846"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39501846"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:02:25 -0800
X-CSE-ConnectionGUID: KYHkNRC2TAWmTutTJ+2Njw==
X-CSE-MsgGUID: HKlAmOEuQUqHsDs6KkJcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141542481"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 11:02:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 82086299; Tue, 04 Feb 2025 21:02:20 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] gpio: xilinx: Replace custom bitmap APIs
Date: Tue,  4 Feb 2025 21:00:46 +0200
Message-ID: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relatively recently bitmap APIs gain a few new calls which may help
to convert the GPIO Xilinx driver to use them and become shorter and
nicer. This mini-series does exactly that.

Andy Shevchenko (2):
  gpio: xilinx: Use better bitmap APIs where appropriate
  gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()

 drivers/gpio/gpio-xilinx.c | 96 ++++++++++++++------------------------
 1 file changed, 34 insertions(+), 62 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


