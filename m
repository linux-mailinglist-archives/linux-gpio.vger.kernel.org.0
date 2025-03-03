Return-Path: <linux-gpio+bounces-16969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B35FA4C916
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 18:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70683A972F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CDA256C74;
	Mon,  3 Mar 2025 16:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp3sxPgp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8E254878;
	Mon,  3 Mar 2025 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020578; cv=none; b=HbxobgZJlVVtF5AACXaADp73Jk9P+2fsK1JSpAZQetyWSRKv3DUzMN24n/76exx0KVcuOFfDPuJoaax4F7E60cH7xzFc7mE3hz8gDbveubrO+aeVejhwKCajJQRAVLpPaAEdRq1TXPBORozkuWVOytqGfKkW5YU1vKRVTuor2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020578; c=relaxed/simple;
	bh=OLvj9XfHwKBvLw1IUZK40ZzryVhHV53ya337D+KIWcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tb1q8JEjK2y+h/4hFhtDEJBcW++5JmS5AG+uiXArJOiz+/XuFp1pJeWOzuxWEmozA0ohEVlbqGaXJcU8xZdX1FQv2B64vzqO6VRQlUTfgAOQxo9DgKjnTMOPDqewmhGrtlamA+t+y5N6MVFr+uPRZnLC/d6Vbn05nD1e7uTaATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jp3sxPgp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741020577; x=1772556577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OLvj9XfHwKBvLw1IUZK40ZzryVhHV53ya337D+KIWcw=;
  b=Jp3sxPgpSAAzTKxnGrtF5txJTPznxmTPcfB10+JEdbFH/y2XdfTLAp++
   nu6b/y1GhrwzN3T3PCN7BSgOelc8MKg7nYFqRMMbVB+Hc3TBysRY9LkTZ
   WYcmqLLCcX9dppPNxio0VON9MoTAtVUpC+L2HIuo/Pbk8T83OS9hvs4qG
   3YLaRG5u3WFS55eUk/vrNYfsJ2gcaKFMOEBuonuH7Ej2BByPu96NA7abZ
   pJ0I2AWQv6UPmi0U4GUJawdLY53RZfjAHk4e0j/3tE4dp4+b7MVIToDqL
   qcckA+OzUuQ6xiWaBq0TUFb5nISWt6wR9l/EBKpkcNSfSSt19DANbey+e
   A==;
X-CSE-ConnectionGUID: OcyWfkrvQoaRd6tPoLe09w==
X-CSE-MsgGUID: gV9rx38HTleru39VTAxeZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41761419"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="41761419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:49:34 -0800
X-CSE-ConnectionGUID: fRhiKrVCTb2TYWdd12k7zA==
X-CSE-MsgGUID: wzNomfKlSf2pOXQ5SJYukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123212199"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2025 08:49:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7A4D0156; Mon, 03 Mar 2025 18:49:29 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/3] ieee802154: ca8210: Sparse fix and GPIOd conversion
Date: Mon,  3 Mar 2025 18:49:07 +0200
Message-ID: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main part is the patch 3 that converts the driver to GPIO descriptor APIs,
the first one is just an ad-hoc fix WRT sparse complains on the bitwise
types misuse. The second one is a small cleanup that helps patch 3 to be nicer.

In v2:
- split and extended cleanup pieces into patch 2 (Miquel)
- updated kernel doc for changed members (Miquel)
- unfolded PTR_ERR_OR_ZERO() to the preferred pattern (Miquel)
- collected tags (Miquel)

Andy Shevchenko (3):
  ieee802154: ca8210: Use proper setter and getters for bitwise types
  ieee802154: ca8210: Get platform data via dev_get_platdata()
  ieee802154: ca8210: Switch to using gpiod API

 drivers/net/ieee802154/ca8210.c | 78 +++++++++++++--------------------
 1 file changed, 31 insertions(+), 47 deletions(-)

-- 
2.47.2


