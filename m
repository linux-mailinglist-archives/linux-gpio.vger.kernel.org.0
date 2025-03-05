Return-Path: <linux-gpio+bounces-17107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C584EA4FCF5
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F91B169298
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C1822D4FF;
	Wed,  5 Mar 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPilVwMw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9638221F25;
	Wed,  5 Mar 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172227; cv=none; b=e7kHlLEW2aGQE5lAD66IOwVYMq9Mb9TWci5hlVdZLSuXa8a6nUzJXDD3aQeS9H5g4o9BOEkJZMqm5vpvKRkPdhLwo8mUB9h4nrWUXfAqbpUlhWvTJ3QLZqCZI+Pwvtsh4LTLBhI1U1uzaG8u2qxGMVGCOmL07YIMvUH8MqAKLcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172227; c=relaxed/simple;
	bh=BjIOGsCQRES/ExqNCYJJO+XG6bSvGhNddzBXGqV6COw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1SmHEECo6PnZgdRbQEg8i+iEv4WvhTcqJsgxMFYzbRK/76y+Gy5uZwJoppMN1nrW5lfvwfpOZmkMnN2hZN3NQUHxWEsP8T3dMnpn2KHUaDqZTDYF8Bpw5alJtd4ktvYIPZ/WjMUoWTuklasGDGi6AqboNGQ831u5zwZOlfGH5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPilVwMw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741172226; x=1772708226;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BjIOGsCQRES/ExqNCYJJO+XG6bSvGhNddzBXGqV6COw=;
  b=YPilVwMwrtxFyBnzRpKJumvJ/p6SnaZ2cukrZm3FRYBNO38EmOZNM2ZT
   e8ni7yItXNFvs4RqeIjsx4JG9WGRb+YNitHX7j8mEs/it5Zc9tFFaU0nL
   1bHdwA2MV3hMzXnUcWyKoJteG6sXNiekz1FP1H7myX7i2xd25PT53yTau
   C1Ky+bK5V6zlCzWJS8dypK8SXccZ3wXZ7SR9O/3w4rq8gfcQC66OPu0Fj
   FMiNwnx5lA0da0XfId7ICYv3ZVobCMS6mNhBI3rYQOjBYWwtDTEB44+qu
   QgwADTIA6hPeBJTQBcEuGwHA1HJ9q5He/AJGWwrQwOG8hy9FIdaHb45Sr
   Q==;
X-CSE-ConnectionGUID: 8r1dx8A9RG+YKoNpSjKMWQ==
X-CSE-MsgGUID: H9rGOT7KRw+pjabX9V8QIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45783918"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="45783918"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:57:04 -0800
X-CSE-ConnectionGUID: TgDlQLKUS0qbOj309VqQ9g==
X-CSE-MsgGUID: z2IATWY8TNGmnBaneidGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123245747"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2025 02:56:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7334521F; Wed, 05 Mar 2025 12:56:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
	Stefan Schmidt <stefan@datenfreihafen.org>
Subject: [PATCH net-next v4 0/4] ieee802154: ca8210: Sparse fix and GPIOd conversion
Date: Wed,  5 Mar 2025 12:55:33 +0200
Message-ID: <20250305105656.2133487-1-andriy.shevchenko@linux.intel.com>
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

In v4:
- split DT patch (Krzysztof)
- collected tags (Miquel)

In v3:
- inverted polarity of the reset line in accordance with datasheet (Linus)
- added quirk for the out-of-tree admittedly wrong DTS implementations
- collected tags (Linus)

In v2:
- split and extended cleanup pieces into patch 2 (Miquel)
- updated kernel doc for changed members (Miquel)
- unfolded PTR_ERR_OR_ZERO() to the preferred pattern (Miquel)
- collected tags (Miquel)

Andy Shevchenko (4):
  ieee802154: ca8210: Use proper setters and getters for bitwise types
  ieee802154: ca8210: Get platform data via dev_get_platdata()
  ieee802154: ca8210: Switch to using gpiod API
  dt-bindings: ieee802154: ca8210: Update polarity of the reset pin

 .../bindings/net/ieee802154/ca8210.txt        |  2 +-
 drivers/gpio/gpiolib-of.c                     |  9 +++
 drivers/net/ieee802154/ca8210.c               | 78 ++++++++-----------
 3 files changed, 41 insertions(+), 48 deletions(-)

-- 
2.47.2


