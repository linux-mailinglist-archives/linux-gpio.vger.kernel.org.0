Return-Path: <linux-gpio+bounces-32068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Oi2G5uZnGmKJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:16:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140017B658
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 19:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02118308F812
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A425733F8DD;
	Mon, 23 Feb 2026 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJr+9SYo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAE33D4FD;
	Mon, 23 Feb 2026 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870148; cv=none; b=RNYLh5hbWgaXzJDKEjd5fi0cH3aEUXctYtWAeWO3nOI5y7+Zwfwsw7vAypvcsWQasu6xJqCGu4Z7tjfkx1JEza8O42/ojxZEMYgKevmkhk17qrjK/hW9+y/xESR2An/cx5g4jzcpHeLub9ybCrtPnzP2A/TiV5TeqsSzExNmTOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870148; c=relaxed/simple;
	bh=vvJbnLQjcZA2fKepc4nSEbKGWOO1FgzcHMFdKrvP0x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaQDyAIWZkwfDDBokGFGp3mLjTDiKqcEomtA486/V+zrwGga/OmSIm0bHGt0jAByaCJmtFLUcYCZ5dgPYqWomNRnsDSnBOUCywGMqF5iwmxSG5CpIpQBHbYDlqfuOj5nR5cQ5jzZYIv+mySmM98lbOSn8MC5kFNLYO+iNhitlbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJr+9SYo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771870147; x=1803406147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vvJbnLQjcZA2fKepc4nSEbKGWOO1FgzcHMFdKrvP0x8=;
  b=hJr+9SYoRbzisAWMmap1USDjdlgBn8n6/7RIMXrWaOm5Z4pkBlvOiW1K
   v3pbB04pG2jCO61YATR3wYMIZQTmQKzB/xfjEOqtXopU1As9xMo+Mj9F+
   AmTMCmlleUKyWAye4T5GoWMz2p2CnBXIl4XzgrZO1229+aAWQWi1Ap7qd
   XvmtgrXYhfUmUQnjuR3yuWLsImCzwNywWg+MG6r7YVzBpawp+ljKBYoB4
   hMpaqylH3a2KLV1RogCpdX+vStWJa1HH3nr+SW9gtKG0u40yrzod22HVA
   OKoasfVF3NNdViCCvwjzWzNwcFbCVklBYdTi3YPLEwf+GpLXQJGP2Woqy
   g==;
X-CSE-ConnectionGUID: AUs/bhdETj2RjKW4WsvZ8Q==
X-CSE-MsgGUID: +X1vbG89QU+dXwt6ppjTVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76737703"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76737703"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 10:09:05 -0800
X-CSE-ConnectionGUID: LyG3nj19QH2Pn/ushWXcew==
X-CSE-MsgGUID: 2c2C0LgQRbyHJhz8tEBlow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253369515"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 23 Feb 2026 10:09:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 377ADA1; Mon, 23 Feb 2026 19:09:01 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v1 5/8] pinctrl: cy8c95x0: Move driver data to the local variable in ->probe()
Date: Mon, 23 Feb 2026 19:06:55 +0100
Message-ID: <20260223180859.2845261-6-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32068-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 9140017B658
X-Rspamd-Action: no action

For all these years of driver existence the driver_data has been used
only as a raw material for other fields in the struct cy8c95x0_pinctrl.
Move it from the structure to be just a local variable in ->probe().
Later, if ever need arises, we may reconsider that.

While at it, drop an unneeded validation and replace uintptr_t with plain
unsigned long which is more readable and works in the same way.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 94a599486638..4f804a9358b7 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -144,7 +144,6 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
  * @map:            Mask used to compensate for Gport2 width
  * @nport:          Number of Gports in this chip
  * @gpio_chip:      gpiolib chip
- * @driver_data:    private driver data
  * @dev:            struct device
  * @pctldev:        pin controller device
  * @pinctrl_desc:   pin controller description
@@ -165,7 +164,6 @@ struct cy8c95x0_pinctrl {
 	DECLARE_BITMAP(map, MAX_LINE);
 	unsigned int nport;
 	struct gpio_chip gpio_chip;
-	unsigned long driver_data;
 	struct device *dev;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pinctrl_desc;
@@ -1397,6 +1395,7 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	struct cy8c95x0_pinctrl *chip;
 	struct regmap_config regmap_conf;
 	struct regmap_range_cfg regmap_range_conf;
+	unsigned long driver_data;
 	int ret;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -1406,11 +1405,9 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	chip->dev = dev;
 
 	/* Set the device type */
-	chip->driver_data = (uintptr_t)i2c_get_match_data(client);
-	if (!chip->driver_data)
-		return -ENODEV;
+	driver_data = (unsigned long)i2c_get_match_data(client);
 
-	chip->tpin = chip->driver_data & CY8C95X0_GPIO_MASK;
+	chip->tpin = driver_data & CY8C95X0_GPIO_MASK;
 	chip->nport = DIV_ROUND_UP(CY8C95X0_PIN_TO_OFFSET(chip->tpin), BANK_SZ);
 
 	memcpy(&regmap_range_conf, &cy8c95x0_ranges[0], sizeof(regmap_range_conf));
-- 
2.50.1


