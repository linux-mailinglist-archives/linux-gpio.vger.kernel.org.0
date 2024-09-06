Return-Path: <linux-gpio+bounces-9889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5EF96F330
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96F7B1F23FA0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB50C1CBE8E;
	Fri,  6 Sep 2024 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRyNf0fW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB01CB337;
	Fri,  6 Sep 2024 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622641; cv=none; b=dTGIF0XzWI6aI77lmdkOLdaTec/xInO6aFubakOvdleaOnteXB+y3Hh1rT1l3B6tqCsFcTGlTU5pKb6sYknuC1IFce/6IUsYrJ3MwV2pWqr4ImDEvyOCqOvF9qVSgbLKJpJm9fihFyBf3VTpmt9yCq3o2k2Rr22wwy3ZkeOyxjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622641; c=relaxed/simple;
	bh=GC2rniu5DbilxHwobuGJfaMkWvjHQnyWPA6c+4gCoJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uMztO0oYSvnZ/iWJFY2+kXQa5OpZGz2uokucJxL9vfHsD2DLMMxGyLkcpmHsjk/W73QNItmKhericCFfCFjdwwNnfFrnJpq+MAxX0jljXK5xJj216YHDkcKWBH+1AoEoe1t+V1N74gUzg4uqfobgBeXlcHckm9PqRb7YlQAK/3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRyNf0fW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725622640; x=1757158640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GC2rniu5DbilxHwobuGJfaMkWvjHQnyWPA6c+4gCoJs=;
  b=PRyNf0fW3636TC4yKuy/R0h5770K0d5fTIq7mutyHEu5b8To5vZD2cP7
   EXa3YC+aa5lA2tAlxs8HfeCuML1XllTB1ckI4GIOpQRh0P+VnLcYK6cO0
   20ddvapCFO35Z0R6ZiRPac7dsy+Whh0XZ5IjHSZy0fyRcqBWTc0PuzHRH
   /H1JFSPxoMLyyWlEykXP9xktx4tnNEn/mhSyZuRdABG5Y8fgTVUtqv2u0
   icxVwLV2vSUKURBX8ca4T7xuNLX1ePO2wIimatdx7ZgypkylTaeBi3UY8
   VNJpKUSb8oleSEEOWqze87aSdcNv0mNSusxymrDPy4J2pfKAbbFBGtc00
   g==;
X-CSE-ConnectionGUID: lJ0xIkwUT9mZoQT1RwR3yw==
X-CSE-MsgGUID: cSl6uRkERSaodF3KRSQy5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34952542"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="34952542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:37:17 -0700
X-CSE-ConnectionGUID: R+W6z3PBR/qAz7PK8lpZ2w==
X-CSE-MsgGUID: oSX/Apc7RWS68IkSKzyltQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70729674"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2024 04:37:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 32AF7197; Fri, 06 Sep 2024 14:37:13 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] pinctrl: intel: Replace ifdeffery by pm_sleep_ptr() macro Andy Shevchenko
Date: Fri,  6 Sep 2024 14:36:05 +0300
Message-ID: <20240906113710.467716-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two benefits of this series:
1) no more ugly ifdeffery in the code;
2) the PM callbacks are all being synchronised via using the same macro,
i.e. pm_sleep_ptr() everywhere.

v2:
- made the code readable again (Mika)

Andy Shevchenko (3):
  pinctrl: intel: Replace ifdeffery by pm_sleep_ptr() macro
  pinctrl: baytrail: Replace ifdeffery by pm_sleep_ptr() macro
  pinctrl: cherryview: Replace ifdeffery by pm_sleep_ptr() macro

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 21 ++++++++++++++-------
 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +++++++++++++-------
 drivers/pinctrl/intel/pinctrl-intel.c      |  5 +----
 drivers/pinctrl/intel/pinctrl-intel.h      | 14 ++++++++++++++
 4 files changed, 42 insertions(+), 18 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


