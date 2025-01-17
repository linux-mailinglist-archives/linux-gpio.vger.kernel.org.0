Return-Path: <linux-gpio+bounces-14893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157BA151AB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F09AE188D0FE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDBB14F9D6;
	Fri, 17 Jan 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilapTTo3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50C413C67C;
	Fri, 17 Jan 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123794; cv=none; b=CItMWL5j3gFRai9o4/pdYoGPDP7B/k/c/yn+qx0sQhqkoxMAW4a0hkEzjbQn+oac6h+ytBwb2X+Tr4CG3rg6/zzOC4J5OL1x8zQ4sG9yTuphplUdcYCMal82wgU/4rm7HUF5+yR59zKYtbtqcWGuy+J91VctiX0mG3xPgYm82lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123794; c=relaxed/simple;
	bh=U194qO0oDxlacr0GHJ18nz17MA3yydb1arfxnhd39aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5yk27STIbdgJmYRcm2wrilCkwdxRVT+QeahUaB5eG9s+L3qbdV7LX7/PtSl4CHv8TtVrTZuJnSi05Asumu2t8sxc62V25q88Cq6pfqpZ/xL75Ww12XtaoVvdbwyp7tyQO0ZdaYP+mI1VBGi8qTCamoAyw2TpSQ0LEFZmt1jFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilapTTo3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123793; x=1768659793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U194qO0oDxlacr0GHJ18nz17MA3yydb1arfxnhd39aY=;
  b=ilapTTo3NXJsZGHn89KWS3vdOpFuG76rUX6SJcNoa2loYkgAedl8kItk
   dwHgUEaDBFWLpELTyxs22mK6R4qzu6hylWFvftpX7fCjwcM5Zrx11lVPh
   dxN1krN+Kvgu8tLJbPf0uSv0fOex2Zs9xYinhmybVgNUPk6/EgBWb/MJJ
   YclvNU8KKYQ3MrhlLi12Q+gGGSNxebyl/wobK/uwFMuY/FQ60/IhHSuRz
   Tsow5VcCeGvHEwbbO2VZLPpZpVDY/GWF9QMPd9AbviOAF0BXEhaod6ktQ
   pD1P1moRimMj/eWvHTDPPk7oWWfTZmpru06K6YEI1aUhyG9b2GaTRVjWy
   w==;
X-CSE-ConnectionGUID: 2NIxqlkfQt+mXo9+UdqFfQ==
X-CSE-MsgGUID: P6j9O//GQ2a8PExOhW2CzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41323650"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41323650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:10 -0800
X-CSE-ConnectionGUID: PsupTb20Q1OWZ2Azo0smhg==
X-CSE-MsgGUID: to4nBcNqTZ+ZLgBRqG3ztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143100379"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 06:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2D24E2C8; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 01/16] pinctrl: cy8c95x0: Respect IRQ trigger settings from firmware
Date: Fri, 17 Jan 2025 16:21:45 +0200
Message-ID: <20250117142304.596106-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Som of the platforms may connect the INT pin via inversion logic
effectively make the triggering to be active-low.
Remove explicit trigger flag to respect the settings from firmware.

Without this change even idling chip produces spurious interrupts
and kernel disables the line in the result:

  irq 33: nobody cared (try booting with the "irqpoll" option)
  CPU: 0 UID: 0 PID: 125 Comm: irq/33-i2c-INT3 Not tainted 6.12.0-00236-g8b874ed11dae #64
  Hardware name: Intel Corp. QUARK/Galileo, BIOS 0x01000900 01/01/2014
  ...
  handlers:
  [<86e86bea>] irq_default_primary_handler threaded [<d153e44a>] cy8c95x0_irq_handler [pinctrl_cy8c95x0]
  Disabling IRQ #33

Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0d6c2027d4c1..825bd1e528b5 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1347,7 +1347,7 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 
 	ret = devm_request_threaded_irq(chip->dev, irq,
 					NULL, cy8c95x0_irq_handler,
-					IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_HIGH,
+					IRQF_ONESHOT | IRQF_SHARED,
 					dev_name(chip->dev), chip);
 	if (ret) {
 		dev_err(chip->dev, "failed to request irq %d\n", irq);
-- 
2.43.0.rc1.1336.g36b5255a03ac


