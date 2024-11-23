Return-Path: <linux-gpio+bounces-13209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652949D6B5C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 21:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A190281B94
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 20:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE801A08A6;
	Sat, 23 Nov 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3WdZ3T8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E77183CC9;
	Sat, 23 Nov 2024 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392370; cv=none; b=FvALF4nflgJgprHkUJQ2Ymc/oesc7OlbbR7zzLmBzliiAXYOkV4mV5OnlTgexhH0vpyRWB+14kkpf60dhph0arGcFKNCxEG7+Zvt1vnCvmqG9NAXwstX8dhsNVUBAX8F8y6vLSrDSbOiy9ya6tQIgncPzc+wUR8ZONVTlkYmg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392370; c=relaxed/simple;
	bh=3EIXoatjneQZ2uqGx9N3SU/Mn6t64EkwXr6y2DKjDv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mR7FTGJeyJTU4AyktquVPxZJmYT77gQzs3HBa6DAvSRdAGRPbW7JldV1yO2rWiGV3I3QFlFOWUszoi7ovWQtqUKbQQSlQSbhOvW/cSuRcIR52dQAgKzZGRzXth0J9MaKSwqzeL9dvuDwiCQGG7SXecAB32VAsvEpg888cgjXY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3WdZ3T8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732392370; x=1763928370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3EIXoatjneQZ2uqGx9N3SU/Mn6t64EkwXr6y2DKjDv4=;
  b=d3WdZ3T82aQnm1IdFL+vD61j5cI2YqaykV5SqH13kDqpf9kYH0IY29gg
   J/DhlKms3zPWG9u5dnPAW3yAD+SFIlZXjIlPk+5b+heNCKKcXEoClgD+s
   yFOD+4byeQfInubLtdOXrlbpkfQtqo32RL3kLK3fKFE0gy3lhJL2zV1wp
   roKhKR3sLastRa3Wluitef2ncFdwvGuhXfAlumug0XD7nx7+IbPlNipe1
   flrwDszgADN8wJ5XWlQstUztOEPEJpgLLonB0nnI9dxyErYNeHtl9yi6V
   dqnSle11rdTZCV2nBExexy9gZhCAneBElMamhPPVd/oPThGLu0feWtV7Z
   w==;
X-CSE-ConnectionGUID: pB+r6qeNTqqJpQpMjc2n6g==
X-CSE-MsgGUID: g8sUBcUpSAqrCw47ZiDoLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32678548"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="32678548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 12:06:07 -0800
X-CSE-ConnectionGUID: j1wCi1s3QPCJMqEasbxWgQ==
X-CSE-MsgGUID: zUYzynniTPOxLP4muEDOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="121737994"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2024 12:06:04 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 0E4191CAD9;
	Sun, 24 Nov 2024 01:36:03 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 06A141600111; Sun, 24 Nov 2024 01:36:03 +0530 (IST)
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
Subject: [PATCH v1 4/5] input: sparse-keymap: use devm_kmemdup_array()
Date: Sun, 24 Nov 2024 01:35:26 +0530
Message-Id: <20241123200527.7830-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241123200527.7830-1-raag.jadav@intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
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


