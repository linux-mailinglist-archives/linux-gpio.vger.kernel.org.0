Return-Path: <linux-gpio+bounces-16953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F11A4C464
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC553AAC32
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 15:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07862144DA;
	Mon,  3 Mar 2025 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OR6VtSZn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21249214201;
	Mon,  3 Mar 2025 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014606; cv=none; b=bwo3zroGM5m0mbluj2TYIrT5kSWPQ3wt3ASSQSHzJvQybNa9ywIB8zZ1IuSf1iWRbpv/EUHGAQsgK45dX6Uubkp1nnv7zvaDa5ndggHfqottc9kj9qpzuX+RALn3qYDEVRLGUVycBW0OrnGo2/xkwYla+JBAIOEz04QqfR/36Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014606; c=relaxed/simple;
	bh=YcGUKagKGbtwNKLU0xV9Ao0yx82+59o5WiA+tFSfjOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqfNXe0FrmkqZkMVpjuqBOKA78v0s6vu8MPg9DZ6ez25PwPgHBjzpKC+IMwwCm5b2oY6BWCIwajzy7WklUCszZRiJqLtwx3X4pfhUFDpRRUmDlfUyniwybxq8o1POtp0a4K6nJUlKqznnOdqs5ZmcyKMsV7p4cZGZ9cC1+r32yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OR6VtSZn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741014605; x=1772550605;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YcGUKagKGbtwNKLU0xV9Ao0yx82+59o5WiA+tFSfjOc=;
  b=OR6VtSZnEBINRpuNhbNwftbLr5bNjTE6EM+v8EGu1NkNYMjUGrd9Qg2A
   1vA0WDtVpnVobwmk/1EDgPF3OzaBWtkEnNWbN3MHwMo6nsbMpZAnkUIbF
   r0XnhWrNCqbzwmWQH9+Mh5Dn1vUH2C/F3a77KPfKoqSH8jnLQZVXjIdMK
   T2UpMgzrCmVd7BFjEyNgnRDK/Y+kKyPa8BLCzQOIXM4QIMmK4PDXAnqZc
   1dvpl9icUulwr/PVtMKKdtkyXYe8EArOZEYnwVeWNkRxYPowUAmCR+7MC
   NNFvtVhargyn1SdiL4Vj/0lTwhNCEsNE1EqQBlwUlT4G7cHyve20QnwTA
   g==;
X-CSE-ConnectionGUID: 0ryKn/LBTgCB+/J//grrpQ==
X-CSE-MsgGUID: Tdlh0taoQB+qXmIUaXmRdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52099500"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52099500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 07:09:01 -0800
X-CSE-ConnectionGUID: Zql8hNh0QV+HxwD6L7F8Rg==
X-CSE-MsgGUID: G8h/nVpxSd2GXngWvwwojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118739575"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 07:08:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 71D94125; Mon, 03 Mar 2025 17:08:56 +0200 (EET)
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
Subject: [PATCH net-next v1 0/2] ieee802154: ca8210: Sparse fix and GPIOd conversion
Date: Mon,  3 Mar 2025 17:07:38 +0200
Message-ID: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main part is the patch 2 that converts the driver to GPIO descriptor APIs,
the first one is just an ad-hoc fix WRT sparse complains on the bitwise
types misuse.

Andy Shevchenko (2):
  ieee802154: ca8210: Use proper setter and getters for bitwise types
  ieee802154: ca8210: Switch to using gpiod API

 drivers/net/ieee802154/ca8210.c | 72 ++++++++++++---------------------
 1 file changed, 26 insertions(+), 46 deletions(-)

-- 
2.47.2


