Return-Path: <linux-gpio+bounces-13292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C69D9C67
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7391668AF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633F71DE8B0;
	Tue, 26 Nov 2024 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCNGWPyE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D9E1DDA1B;
	Tue, 26 Nov 2024 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641779; cv=none; b=Zl2sVAJVNxUcKXDo37djk6Lr/XG1JOXn9wRF/B5SoWEa7fqDlkAvbc8jnZrFPBPA2+0DPztFN6K9utqRMOv6krzVYKhTXLZ7wqo4HHd+ejOXNT/Gw1WeY4Ua0D+eCRU8y168PIp52SXix0J4WOCjNSbH6Lz0efL9n7+SASu9S6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641779; c=relaxed/simple;
	bh=3EIXoatjneQZ2uqGx9N3SU/Mn6t64EkwXr6y2DKjDv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrXZUlep3QwLXEQ5WJ2EpRzbgscy9ULd+qrWBJSF+60qj/cq8zOP8BNpUHUD5N54+CFrXAIWVitYoenVIkrc+lC17wZ/fjb62aGYJr0Xm/ToudTpNeStmC3tGpqOqFCVfjuwcwdPjtw1Vi+c8rFqhamTmH1W4ZSaHPOrKCGh7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCNGWPyE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641778; x=1764177778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3EIXoatjneQZ2uqGx9N3SU/Mn6t64EkwXr6y2DKjDv4=;
  b=NCNGWPyEZTv8ITQaQPhYxTYKY5hNRKu891DiqXVnsmusbR1SPVBT8m+B
   05n/+f1vNvqZf+L/EafRm8v3VJgyNfT/TW2NTJgxgyiED+8ksdEuNkTcz
   vEbhDC/8RjuxuiNs8FsNp7gT6KqbrpeXzFpwF91lTmy57Z1a9seB3sn4f
   Uoa9VGRB//gsJXBMEzuLbcf3t56kd74TJpzrAuLVj1UnIzWEfoC/+vi/S
   yXtiLEyfFzc/U1nJ9vo0pjekhz/5mRB244iSLYrv0NVNVyWWY9p73l4nE
   7bSgdb5tTVrGwGJ703XRyHweHn07+b+BSgg7ibUQoA5Z4RGj+iZCDeLK5
   Q==;
X-CSE-ConnectionGUID: /FT7ZCVQSseb9YOTCAGFtg==
X-CSE-MsgGUID: pcf5zJSsR5+4cgS1VFqk4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312976"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:56 -0800
X-CSE-ConnectionGUID: 0AGLVF9FTmys5JSAxrF+KQ==
X-CSE-MsgGUID: I7KIcx31R+qnTqmzkYEmvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730579"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:52 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 4AEF11CAE2;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 3A8061600131; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	dmitry.torokhov@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.dev
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 5/6] input: sparse-keymap: use devm_kmemdup_array()
Date: Tue, 26 Nov 2024 22:52:39 +0530
Message-Id: <20241126172240.6044-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() which is more robust.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/input/sparse-keymap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/sparse-keymap.c b/drivers/input/sparse-keymap.c
index 25bf8be6e711..5ec3b9ebcac5 100644
--- a/drivers/input/sparse-keymap.c
+++ b/drivers/input/sparse-keymap.c
@@ -176,8 +176,7 @@ int sparse_keymap_setup(struct input_dev *dev,
 	for (e = keymap; e->type != KE_END; e++)
 		map_size++;
 
-	map = devm_kmemdup(&dev->dev, keymap, map_size * sizeof(*map),
-			   GFP_KERNEL);
+	map = devm_kmemdup_array(&dev->dev, keymap, map_size, sizeof(*map), GFP_KERNEL);
 	if (!map)
 		return -ENOMEM;
 
-- 
2.35.3


