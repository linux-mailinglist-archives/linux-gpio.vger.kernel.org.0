Return-Path: <linux-gpio+bounces-15087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55BA21FB1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 15:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76BAA1640C9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 14:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD9E1DC994;
	Wed, 29 Jan 2025 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFccGT2e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967E1D9346;
	Wed, 29 Jan 2025 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162322; cv=none; b=PsAtVj6M1lrWbqkZCSJ26p34FZcwS/yYWEZWaw2SzpYPKQxUnUZ6gCsDvGKPQjzQ04q9/xd4WQp8pKUtCXsmqK5mBElmtUEhMGkWWe+64tN3HemGX/fBkv/cGpJMTe48kj9R3MOnJ6Desu0WZJhlJ8x+won/X5ElICqaZ4pF6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162322; c=relaxed/simple;
	bh=9p6DvyFXa2vMQrMf5lfC30HHQkehXtdgN4AAr1zF6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rpVmEtvXdUHL1McXI4rVW4au7T224k/ZV2LMY192ZvOR50Lp9vWHVZDAYNAILJPwCSqKerQZUN3mZ3Ng4N0l7YdnZX1joA+znFGymOjyXTrr6KB6rqz56VJWE7BnMT94Ckl/+++KWzdZQkh8z69Jz0wWQn1+bTOTjov3rwWHEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFccGT2e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738162322; x=1769698322;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9p6DvyFXa2vMQrMf5lfC30HHQkehXtdgN4AAr1zF6GQ=;
  b=ZFccGT2ePYnRciK+ntBnNNUQU8CU7K7E02hFYoX0/uI3q6zcqLvq38aL
   9ic3j6VBV5EoaorSU9Kx6krAMhOGL9Z81hrFFPKGibcmZyDs0YurZQ2vr
   7UpdANOEQ0kpBfhidTebovJN/+NX+27tPJbZspSrT7jU+M0IM41pOldud
   DzNp+VU5d6DNpat3ptvabr660JIvTp0jzdiUPUCAcR4zBeXon09Wh/Yyr
   RCeY8i4fNz87I8TBp7wXrTrd/qeC0gbg1MbADZ/j+JyYK7P3kaNq2D+KR
   ViTYn0Smf0XhBKbg+jjLK0pBxv6dqN/TrNRF8QA+W1lvTOL4jl+9Xyzdl
   g==;
X-CSE-ConnectionGUID: P3ngi6DsSVSB4WQD4abWog==
X-CSE-MsgGUID: yppDCo3uQEy58LIqK4jtkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49660529"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="49660529"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 06:52:01 -0800
X-CSE-ConnectionGUID: 8s9aw6OBRriPu5pbr1gK9Q==
X-CSE-MsgGUID: CUOec/ZJTwi7Hv88SdX03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="109032392"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 06:51:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 37FD3303; Wed, 29 Jan 2025 16:51:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/2] pinctrl: intel: Unify the way of handling chained IRQ
Date: Wed, 29 Jan 2025 16:49:38 +0200
Message-ID: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the drivers are using the dedicated helpers (chained_irq_enter(),
chained_irq_exit() helpers) and some relies on the specific implementations
of the parent IRQ chip and its configuration. Update the latter ones to
use dedicated helpers that cover all possible scenarios.

Andy Shevchenko (2):
  pinctrl: baytrail: Use dedicated helpers for chained IRQ handlers
  pinctrl: lynxpoint: Use dedicated helpers for chained IRQ handlers

 drivers/pinctrl/intel/pinctrl-baytrail.c  | 5 ++++-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


