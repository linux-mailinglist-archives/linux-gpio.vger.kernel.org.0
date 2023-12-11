Return-Path: <linux-gpio+bounces-1230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC180CFD8
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B543B2151D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 15:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B164BA9A;
	Mon, 11 Dec 2023 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8x6DXn9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7372BD;
	Mon, 11 Dec 2023 07:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702309367; x=1733845367;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4AuaSAqga/dVILmnPhrkc9jm8ft7ImJB/u3/MqEmVeU=;
  b=O8x6DXn9HCfeAhlNOPQF8SFDoockVpU1TTJ1T+up+02HVXi8kOT9a8OR
   i2vwqf4FCDRdfJn/mu87jNE8yi+35U9006CVRYHjrrvePZzzi/2eHn8uO
   boqg++xbsaYIh+6ZrN+m7w0Y5wYhQRy2w/TAIkr5063/K9TdiC92NDe0m
   E1UfbSCUGbxOaLFGOkkzf1GYvddmt8SPBAL3h7b0vLc7rZ4wTZgVtk2X0
   ZdlS6C49haGClTKKd+D28xT0U/jPynvvwCjlqySwU0EVICg4RG3arCiA6
   e0CEy/ZrCmBkWnYsaR8oVJdp7xVl+RdSRdAmjoyMk7EMe3gBubT+1zZDL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1535070"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1535070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 07:42:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104506746"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1104506746"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 11 Dec 2023 07:42:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2C1D039B; Mon, 11 Dec 2023 17:42:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: nuvoton: Constify wpcm450_groups
Date: Mon, 11 Dec 2023 17:42:39 +0200
Message-ID: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no modifications are assumed for wpcm450_groups. Constify it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4589900244c7..cdad4ef11a2f 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -474,7 +474,7 @@ enum {
 #undef WPCM450_GRP
 };
 
-static struct pingroup wpcm450_groups[] = {
+static const struct pingroup wpcm450_groups[] = {
 #define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	WPCM450_GRPS
 #undef WPCM450_GRP
-- 
2.43.0.rc1.1.gbec44491f096


