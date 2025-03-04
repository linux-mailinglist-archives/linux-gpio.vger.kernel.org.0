Return-Path: <linux-gpio+bounces-17026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E6A4DC7D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5381887F37
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5641FF1DA;
	Tue,  4 Mar 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwOzBTH5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4A1FCF4F;
	Tue,  4 Mar 2025 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741087471; cv=none; b=WhAN2yX8TYaGUnjW+WZt/ySPZGFZ2TxkZeNc+6ywjRJxRCA6b7zBmg8dU63HgTaaGStmZogvAv6Ta1yiHsbp9uQ0CE3k5sb6BFW8tq8a0RrNiWCaQkMDtog34TZlSx6qVVo1rsLQteezlg6qzl0Qlkp++8NrmaSbo+oaLhbXmEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741087471; c=relaxed/simple;
	bh=42rK8t/KKP61LP1oYsXfVmkmqOTRvmkofIJKQ6JVWS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O91k4D9khoPFfR1n3gXl1SLHDBlRl/yXPllOEBsrjb8yMC0gVxc97sMoIOy6f3fKZrUkzkNs6WYz3tVojYo/f0sDg+nEgxQMCjdw8e5kt3mL4EXfTwLe+SUfE8OXWd4DtFB+G6uoUiFqKdCUBVCGH8PF+KhsdZ1bEcI2MKTyrw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwOzBTH5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741087469; x=1772623469;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=42rK8t/KKP61LP1oYsXfVmkmqOTRvmkofIJKQ6JVWS4=;
  b=GwOzBTH5nrpLe3v6E5ufK7H/d2mM8epsHeewyvdyrii+egCD5RxbdUP/
   MITvlWtsxEbaYvCq6gSzlS1ditEnJKN8+B7zVyyLHZTwziRVn+nP8sCrS
   hDBgpsLOZtjTppWDyeM9e5WpIKN6E4iPoMom0vhNenFvuRKu+MNNS1CXg
   CAIGUOLPien9zD+xcBc5b1bj3o5wHxrAVVMABQLtGBjRSFY0GfbbWGGn9
   uoDo39Wn2KBpuuuC7i/fy48jH8lKdmluoknxxtNAm8MsmOlugqwUZcweW
   e2HIP5II5OVHVuDOgfPkynOaFFdN/fl0fTptUnCz8+OdS0gDVmXvNiIzw
   A==;
X-CSE-ConnectionGUID: XXaZi3gJR5eSD7ZSsy1b9w==
X-CSE-MsgGUID: PHsQgmKxTFSaNEI3nkSLjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45649722"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="45649722"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:24:29 -0800
X-CSE-ConnectionGUID: FDYcWnlzRiSjvvdEyx0ioA==
X-CSE-MsgGUID: e3Novv9uS26pr/PR9VIRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118071833"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 03:24:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C4C531A5; Tue, 04 Mar 2025 13:24:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH net-next v3 0/3] ieee802154: ca8210: Sparse fix and GPIOd conversion
Date: Tue,  4 Mar 2025 13:22:31 +0200
Message-ID: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
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

In v3:
- inverted polarity of the reset line in accordance with datasheet (Linus)
- added quirk for the out-of-tree admittedly wrong DTS implementations
- collected tags (Linus)

In v2:
- split and extended cleanup pieces into patch 2 (Miquel)
- updated kernel doc for changed members (Miquel)
- unfolded PTR_ERR_OR_ZERO() to the preferred pattern (Miquel)
- collected tags (Miquel)

Andy Shevchenko (3):
  ieee802154: ca8210: Use proper setter and getters for bitwise types
  ieee802154: ca8210: Get platform data via dev_get_platdata()
  ieee802154: ca8210: Switch to using gpiod API

 .../bindings/net/ieee802154/ca8210.txt        |  2 +-
 drivers/gpio/gpiolib-of.c                     |  9 +++
 drivers/net/ieee802154/ca8210.c               | 78 ++++++++-----------
 3 files changed, 41 insertions(+), 48 deletions(-)

-- 
2.47.2


