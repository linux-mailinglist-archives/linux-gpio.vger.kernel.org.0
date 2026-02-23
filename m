Return-Path: <linux-gpio+bounces-32062-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDLAJhqZnGmKJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32062-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:14:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD7217B5DE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF33530F9936
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420B633BBA3;
	Mon, 23 Feb 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VifzeqoF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB033B955;
	Mon, 23 Feb 2026 18:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870145; cv=none; b=NvrhV2h0xx+kGChQNS24gVPC1EFCdvA7SOaRoKyO+0wwOuv6D3hYEP3YjuMKuNq8A5n2WHaFiassW78GIwaS0GMNTGeRV8nak2c50WLa4ue4I3c7By0r8nNJCM4j6cTdlKhsne63VxKN2G4OVP488rTB3tzk7CvYa7S1Q89cptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870145; c=relaxed/simple;
	bh=NjEkuQeRNEe9/XFUfAKHJHpzCenTaA4ThY2KU/aWb5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0jem/BB7orM3YZu3XI/xiVpQhb2vSwIOQuJd+7RsnQ+eymnn2pJ/af9Bwyv7X+ePO81msb1USOqK22hOYTrqctMgRMAvuN3cZmVvAN6Js1itEv/agy9SfiLbRtniNtAhZPHhUiUtU29AQVsw5kodDcnmReUyBdKodeQFFRE/VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VifzeqoF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870144; x=1803406144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NjEkuQeRNEe9/XFUfAKHJHpzCenTaA4ThY2KU/aWb5Q=;
  b=VifzeqoFY4pT6ioVaw9D4MdfTpQr8XFVwfsizvD7qbH4RPSHPDWB8dSd
   kJfzGbRMV6XC0jAeajmgVTLLdLDFt2lLVo7ZrDCB9MqBRgxfAKHWnBN3g
   yZVSp0vsog11peXsijRjTuBeY25aM05WtuZDCBWVYCST6QC1xgdrj5rTq
   i6KcZLP7pH1/rTqElxC7Ioh6IyRNH0JdOAaC4Y4//9lS9ucZbEC7aHA0c
   DKEq+mkJwduv43+pqEQ4nh/pjEMlIY8zyo6nKg62N1Uf5pl612jJ5zEzD
   mDHXvSaZK8R0Z0b8d2Yphrf0gZhZRswUJdA6aFVN5E6A9Sai27mksxk7D
   g==;
X-CSE-ConnectionGUID: yWQo5RidSXWaxRck48BTwQ==
X-CSE-MsgGUID: ZnsoXfDDSdC+6+bNgK3bOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72082653"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72082653"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:03 -0800
X-CSE-ConnectionGUID: nX58BouuRqOmskmcz64fCg==
X-CSE-MsgGUID: ymW+8RisSAeyFcb5qcNsfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="238599650"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2026 10:09:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2A8D29B; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 2/8] pinctrl: cy8c95x0: Use devm_mutex_init() for mutex initialization
Date: Mon, 23 Feb 2026 19:06:52 +0100
Message-ID: <20260223180859.2845261-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
References: <20260223180859.2845261-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32062-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 1CD7217B5DE
X-Rspamd-Action: no action

Use devm_mutex_init() since it brings some benefits when
CONFIG_DEBUG_MUTEXES is enabled.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 5c055d344ac9..0647c7f94162 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1312,7 +1312,9 @@ static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
 	DECLARE_BITMAP(pending_irqs, MAX_LINE);
 	int ret;
 
-	mutex_init(&chip->irq_lock);
+	ret = devm_mutex_init(chip->dev, &chip->irq_lock);
+	if (ret)
+		return ret;
 
 	bitmap_zero(pending_irqs, MAX_LINE);
 
@@ -1474,7 +1476,9 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	bitmap_fill(chip->map, MAX_LINE);
 	bitmap_clear(chip->map, 20, 4);
 
-	mutex_init(&chip->i2c_lock);
+	ret = devm_mutex_init(dev, &chip->i2c_lock);
+	if (ret)
+		return ret;
 
 	if (dmi_first_match(cy8c95x0_dmi_acpi_irq_info)) {
 		ret = cy8c95x0_acpi_get_irq(&client->dev);
-- 
2.50.1


