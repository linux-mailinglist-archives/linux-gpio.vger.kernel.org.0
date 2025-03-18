Return-Path: <linux-gpio+bounces-17733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B8A671F9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 12:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D69A5423041
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2405420A5EF;
	Tue, 18 Mar 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtnZgYdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61F209F3B;
	Tue, 18 Mar 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295588; cv=none; b=m5ThWNZL8Nej/b4UZWYNZ4WhUIWqS9mZ6wPA0BejUmT74NYy+lnoS4xLJJenjhN5wBJPZrFI5HdmPCdskFduxbLm0D/fmoqwxkb1fxslOYbYJqn6WKar3L58RaoSpRZUmzCFEkYesd5TFOg9drHY7SvSZfajjeBcUTObu60jkCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295588; c=relaxed/simple;
	bh=vKEf+YzroZXTf7Dw8vrxNUxrVBmoYhWw+uCDzGv6Ue4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AxmMrNAN7oJAR2RiS1Xtpp7bzgwmhfa6QQnTJObQHjuF4MyBFAHugh575ZsD6SqoY12KO+ygf2TG2frfxsJPwW1Pup98vNC5F8xqH0IVr1gos71Nu/FOPxmJIvtawccdN0vHLYzrPVwIGiCTcjnS+UDh863BWmZ7otiQ2EM9D9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtnZgYdu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295587; x=1773831587;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vKEf+YzroZXTf7Dw8vrxNUxrVBmoYhWw+uCDzGv6Ue4=;
  b=ZtnZgYdusGlRkPYXDg+diHoO2QmIuWgqwx/VKTMI/jeitnDT9eYid5zL
   aB2vUCrRRraz3ww6oKW3CU1IEG0zURRI9T3cTcPYHtpYXQEgHDaq0lRhy
   Id6qF6EcHk4SZr+emoNP19QprT6GA6voi2aw+BRjoHJ56vj5mWClVZWCP
   BxiS1TRzjNrcTpXPTQG5Vy+ZbEO2Qnp3kExjN8DuanUvPfHat9x7OqPuI
   +BeHBM215Q386CZJPKETmmWFtMi8qkctilFsfU3DmbrnpsKoZQ4Kg+41h
   ARmlO27FbWBuSlHlTUX9oOMSSXI1us2+H/wqgx458kmwudKSGvTWFOv41
   g==;
X-CSE-ConnectionGUID: JvdpLLX7QBaXRvotbx05tA==
X-CSE-MsgGUID: 67rD+PdiQFeVqR7KK2z5cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781775"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: +VWz2+diTwy2Q3onKOYL2Q==
X-CSE-MsgGUID: EImJDoyzTJi0wDl6BPq+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215698"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C03B517B; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
Date: Tue, 18 Mar 2025 12:57:13 +0200
Message-ID: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert Nuvoton drivers to use pin control provided data types
and more of device property APIs.

While doing that, fix one non-critical issue that sparse complains about.

Compile tested only.

In v2:
- fixed compilation errors and warnings (LKP)
- collected tags (Jonathan)

Andy Shevchenko (5):
  pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: nuvoton: Make use of struct pinfunction and
    PINCTRL_PINFUNCTION()
  pinctrl: nuvoton: Convert to use struct group_desc
  pinctrl: nuvoton: Reduce use of OF-specific APIs

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 120 ++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |   1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  44 ++------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  35 ++-----
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  11 +-
 5 files changed, 77 insertions(+), 134 deletions(-)

-- 
2.47.2


