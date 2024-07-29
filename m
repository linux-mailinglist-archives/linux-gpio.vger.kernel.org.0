Return-Path: <linux-gpio+bounces-8411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57493EE5F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A462823BC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D2084FAC;
	Mon, 29 Jul 2024 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYqR4B1W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEBF6F2F8
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722237935; cv=none; b=BIUiDe3KbwtX0NFOfQ8Drj7Z+VGo1IGZ3tuqqKUb3zOaqX8/VE/9Pj/B3NiVK8wr9QnrP4xk+CM0WyKauWsDh1U99pU38UwGppv3lR1bQSU3NtSfeZdw2sJzDcisingIjqL75NsZAX6fSrEst9rnFuYGq2XlH1U95kE2R4Wd2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722237935; c=relaxed/simple;
	bh=XId/JjgOEdRJhVSyODLbFrGbPBjxQC0mlnQEdk7urm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvaSASllSVRKn2lyBgFiYAaABOP7/ZSwyqYAo9Kn7QdaYBe6+Syzg1E4/Ty9M6btn5aFk5R99XGXw7b85S9waRv5i6WFFyYUk5pTo1A9hdoeTombyQud8MLhJg/E2hr7cB4N8ycCpebAUGJGOVXLZdA0I5KAjXizB79lS7G380s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYqR4B1W; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722237934; x=1753773934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XId/JjgOEdRJhVSyODLbFrGbPBjxQC0mlnQEdk7urm8=;
  b=nYqR4B1WKwPC2fLtfXOO8+0ncqOkopJG4FMnSZ652a5Yol2KrCAATpXA
   uOMp+dRXOPBl7BTMO2jmObja39YFkfePsRzDS+f4vs5qsq1HcYedEmvfD
   hX9aWP/gidDUq2rAlceVew/0IsOHSA0DD9A7kGsZfwXWTGkwxVUfPusMX
   61v8vjQtyljSDUOfnmblvlf2rFM3DkhMp6Q17TIWawZxn3NVfNXNKeh6m
   SNWK31scXLX7KicIskd3xA5Iai4MuRLAaCD3biGWxFzCDnJXavSNiGOVZ
   J00WY4tWNg1DcknF9cJs+l5zzy3G0/3cWvz+0W60CuPkCAYZxwxGgeICS
   Q==;
X-CSE-ConnectionGUID: JiAyxRBERPKMHAmX8iJvxQ==
X-CSE-MsgGUID: lRQ+p0WjRpacD0+z0pqftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23725159"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="23725159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:25:33 -0700
X-CSE-ConnectionGUID: 5sxxDk7eQcmuccG7TelPXw==
X-CSE-MsgGUID: f9xqHdyeQhGib+rHRbQPaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="54677654"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2024 00:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F177519E; Mon, 29 Jul 2024 10:25:30 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID
Date: Mon, 29 Jul 2024 10:25:30 +0300
Message-ID: <20240729072530.372153-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Arrow Lake-H/U has the same GPIO hardware than Meteor Lake-P but
the ACPI ID is different. Add this new ACPI ID to the list of supported
devices.

Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index cc44890c6699..885fa3b0d6d9 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -584,6 +584,7 @@ static const struct intel_pinctrl_soc_data mtls_soc_data = {
 };
 
 static const struct acpi_device_id mtl_pinctrl_acpi_match[] = {
+	{ "INTC105E", (kernel_ulong_t)&mtlp_soc_data },
 	{ "INTC1083", (kernel_ulong_t)&mtlp_soc_data },
 	{ "INTC1082", (kernel_ulong_t)&mtls_soc_data },
 	{ }
-- 
2.43.0


