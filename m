Return-Path: <linux-gpio+bounces-27990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3DC2DF5C
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 21:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9743934B8D2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 20:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA8B291C33;
	Mon,  3 Nov 2025 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POgsaddy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0A21ABD7;
	Mon,  3 Nov 2025 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200162; cv=none; b=aHC/EylOhKgrZySPNaYnnfBF9N9LYfKz6hG+TANVMmY+KEPT/VtcmXSb57J2H2nu18xIyshGS1y9iTZMZqCK41rEqeD/lR3mhiO+x0RI97yEU7u8ODupCk51FIDuGXc3mb8jqMlLDkpl6yWW4jjY7Tn+A1wTFLLsixGqf9GrmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200162; c=relaxed/simple;
	bh=rW2zpgobPRB1HcadBBqJ1TISCIW54rDyyK+HZiXM1Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fToP++AG0aw3fUr7EW+jqrihOmhjL+zPLMiN/dSaD9vniaEBJe9FubFWHu2Pe3hZeVnUA88/aJ16tmc/T3XaCJHOrgVdcY/RKdCu3FehHjqz1aHsmmpL1RTwzPPYvOZjx3QlrbDthLYkLOLCmc7AvirdrI/hz6VSoCYEfhp/4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POgsaddy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762200161; x=1793736161;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rW2zpgobPRB1HcadBBqJ1TISCIW54rDyyK+HZiXM1Rg=;
  b=POgsaddyD1/pyirvNkN7RlCnLmgj7aoGTY0MXCX4lFKKCPciACiV7aKd
   uoG7eqjtQgLk7U/tUgypjvFE0tNJPRp8/+rzev9yWRs6CMfWWHYdU0mrZ
   34+QBpkHUGbzMwqfFSYGTuEjptXH+D9v1KAOo/K+Fdm+Jg7/XX8fkUlUd
   rwBq7iFDGi/K2yI30MOoUVT9NiFzKuQ93zV6L2oq7LkrFUKfa608bNRgS
   l4VibF5lAsaAcJE5A89tLPggoE1UiHLRZX/B8kIiprQADv2bc728Za/FS
   8dvj6rtdCUAUFe633wBsbwt+P1DMIFSdhUWsZmRHV3dBoeVd8HUWm6S76
   A==;
X-CSE-ConnectionGUID: P9FRaP8NQf+jEEY1Ng27WA==
X-CSE-MsgGUID: DJwfSIuyQAiE0GcVH9Y17Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75735743"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="75735743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:02:40 -0800
X-CSE-ConnectionGUID: W7YmQw8cTYSdsaTKOiw+eA==
X-CSE-MsgGUID: LFvWZ/eqQZ6994x0V+ZRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="192052119"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2025 12:02:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 70B6B95; Mon, 03 Nov 2025 21:02:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/4] pinctrl: intel: Unify error messages
Date: Mon,  3 Nov 2025 20:58:27 +0100
Message-ID: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify error messages with help of dev_err_probe(). This brings
a common pattern with error code printed as well. While at it,
make the text message the same for the same reasons across
the Intel pin control drivers.

Andy Shevchenko (4):
  pinctrl: baytrail: Unify messages with help of dev_err_probe()
  pinctrl: cherryview: Unify messages with help of dev_err_probe()
  pinctrl: intel: Unify messages with help of dev_err_probe()
  pinctrl: tangier: Unify messages with help of dev_err_probe()

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 20 ++++++++----------
 drivers/pinctrl/intel/pinctrl-cherryview.c | 24 ++++++++--------------
 drivers/pinctrl/intel/pinctrl-intel.c      | 24 ++++++++--------------
 drivers/pinctrl/intel/pinctrl-tangier.c    |  3 +--
 4 files changed, 25 insertions(+), 46 deletions(-)

-- 
2.50.1


