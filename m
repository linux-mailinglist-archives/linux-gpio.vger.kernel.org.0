Return-Path: <linux-gpio+bounces-16889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A01CBA4B738
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 05:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F9E3ACB87
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 04:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BB91E2823;
	Mon,  3 Mar 2025 04:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyGHb0cq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCD1DF965;
	Mon,  3 Mar 2025 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740977275; cv=none; b=j4ChosW9PLgEA+7TpMEuRY9QyUDW8cg1pGBc8Gp/7kr6O6FjNv+ht24fLNvDnMfqH/O1oYmrv+acAzUKM93BS2rApcG+OTCCHunnkUNEUUoF2oH4dxlRD/6Cx/vEMrM2HxKyM3OEf3i/1EEpB7S4Cjp8mDCFyYLs0Ig92A7E64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740977275; c=relaxed/simple;
	bh=GQjFOSjwtcq2rQBKngc2Gphmz7RBHeegkQmYgOQYA/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYfo2fsbntl2IrI6hi5B7+xeyazJUystuDVKL0yneN2PoE1vj7CqpqPRtgLeeEl2i9hkwMS5AACQZkmGvoAIUl7lpk834OkDxsvpuUA8rSKm0+oYjHMgxKbLYMqoeou8xycq6dW0wIi4i80Qcnc23q2DxuXms+YkBav7KlWpXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyGHb0cq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740977273; x=1772513273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GQjFOSjwtcq2rQBKngc2Gphmz7RBHeegkQmYgOQYA/o=;
  b=NyGHb0cqOR51XO6atknnaWj3gI0bPQCbtxnVNm5NT4NIKTro19Hq7BPe
   gqVGvd6Ce3uymueVzg2avOq5vlX93BM7Vu8HShZB0XU1g9Ke+sJ5Z2m29
   zVwXZZRFTthsEkXyLWx6iQgRen0EoQtNUfQ9LbJUZT5VfdAZc5HsNxJxp
   2vPWT/2TZ4lkhp7RwehWDyFQ2uN1C3lbvnxXU0yU8S6gElzxmRybvXisG
   alk7G4fGmi6CGBSw2tzw0g6jq6Wp//0fCsn2tRm43y/wLvLHxk36LpGYg
   2bdcf5fuOL2jt3z3qE01Bl6q83+qwzFrs2PBoj8+roeRmcBVVfx8pFzKa
   g==;
X-CSE-ConnectionGUID: wLwI4XH1QvCZ6sqaVZVM4g==
X-CSE-MsgGUID: 4gNHWHTjRDq1FZgB3NVB8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59382063"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59382063"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:47:53 -0800
X-CSE-ConnectionGUID: LV0DQmYNS2Ojkd5xSbeRfg==
X-CSE-MsgGUID: lF+6nGHiRvKdDB8CtzN1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123123942"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 20:47:51 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/5] gpio: elkhartlake: depend on MFD_INTEL_EHL_PSE_GPIO
Date: Mon,  3 Mar 2025 10:17:42 +0530
Message-Id: <20250303044745.268964-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303044745.268964-1-raag.jadav@intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have Intel MFD driver for PSE GPIO, depend on it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98b4d1633b25..b2efd2533630 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1372,7 +1372,7 @@ config HTC_EGPIO
 
 config GPIO_ELKHARTLAKE
 	tristate "Intel Elkhart Lake PSE GPIO support"
-	depends on X86 || COMPILE_TEST
+	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
 	select GPIO_TANGIER
 	help
 	  Select this option to enable GPIO support for Intel Elkhart Lake
-- 
2.34.1


