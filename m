Return-Path: <linux-gpio+bounces-27992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CBC2DF7D
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 21:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D25A1895E32
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 20:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6B82BE7B2;
	Mon,  3 Nov 2025 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVpA8aHW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917F246774;
	Mon,  3 Nov 2025 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200164; cv=none; b=shTeIcfpMgPoNuXqKlPW4v/ffRbObNnQn5Fwd8w+j53Gq+OtnmmRge2uWSjaurrINtVuswXNgcVBXL95BsJA+sbLCITZsEyiTjNYGR3kQlCluAPY+Pa3pK6DM2sR5ydzXU2XSGu4YA6uZ3AiMKGkYrx3YGS60wP8PvVXdVxCyj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200164; c=relaxed/simple;
	bh=RtNiLh31/7T4mqkBBv7sIlOlde5AE+pT1aXG8JNCUnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uxvs7BKmcsSz+jAK/Kd8YzaElGEn7yE5GKrf4l2S7qlrOKPhttGi2hwfzi0Ag9El4Qss5ogkYHUDdJXK4LoEdv5WkRY87rYsD2rEaFh5a86ohDRAQLFXCVQZB4XQdW/Mm6BuGITt2pQ6sfZH3Mj+6JdUEh++6er37WYNkwJ1jWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVpA8aHW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762200163; x=1793736163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtNiLh31/7T4mqkBBv7sIlOlde5AE+pT1aXG8JNCUnc=;
  b=CVpA8aHWZ4lj0WY/VIRFFOabSH/FLXLfXL/v26xY2yPi5l4r141Z5hOB
   fIcStACJ2nfYwKkkrq/UrktroB0Lle7QMKwLruuJTX3NfDnFqwdB4B1HS
   op9EivzlJDpAuzdMCf5IoLgISSuIEktL8bAxJ3P2m18nkbZqvoVeTUjRP
   AMnLlYDWwjwXhkBZFpT97tVgFp0KIm557wEDJK21h9Aeeq49kQjRWAIh5
   65VhQK4ayoWVqVQBYCf0pjXtu5eL0F1wdTw3UV41jPn/pMbDcwTLsuCzr
   1Dip25CFNHjCyapZTPkfXJTHRSul8kN/7XUdlilhMMQDw2M+tNycr86vd
   w==;
X-CSE-ConnectionGUID: qU6SiAh0Sear/Fty7JfDNA==
X-CSE-MsgGUID: APs/YKjaQdSG1A5r9EiOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75735744"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="75735744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:02:40 -0800
X-CSE-ConnectionGUID: H+Z3k5xXT3e9vUkUypF46g==
X-CSE-MsgGUID: hix19cgGQ6mdYEh6rEzEtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="192052120"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2025 12:02:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 810A099; Mon, 03 Nov 2025 21:02:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 4/4] pinctrl: tangier: Unify messages with help of dev_err_probe()
Date: Mon,  3 Nov 2025 20:58:31 +0100
Message-ID: <20251103200235.712436-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
References: <20251103200235.712436-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify error messages that might appear during probe phase by
switching to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tangier.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tangier.c b/drivers/pinctrl/intel/pinctrl-tangier.c
index ac61e632b487..5f0b7334a489 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.c
+++ b/drivers/pinctrl/intel/pinctrl-tangier.c
@@ -562,8 +562,7 @@ static int tng_pinctrl_probe(struct platform_device *pdev,
 
 	tp->pctldev = devm_pinctrl_register(dev, &tp->pctldesc, tp);
 	if (IS_ERR(tp->pctldev))
-		return dev_err_probe(dev, PTR_ERR(tp->pctldev),
-				     "failed to register pinctrl driver\n");
+		return dev_err_probe(dev, PTR_ERR(tp->pctldev), "failed to register pinctrl\n");
 
 	return 0;
 }
-- 
2.50.1


