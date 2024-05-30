Return-Path: <linux-gpio+bounces-6912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5F8D47C8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D624F1C2299B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D45115B554;
	Thu, 30 May 2024 08:57:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44043152787
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059476; cv=none; b=WLgrmSmn8cBe4qffDwf3114e/4SxRMfsa9iYDTkcWNRwMLU+TcFN4dxVroTwvm9hCG7i8Ke5JV0xujxt/tyluOooDdBRETXNzDE8opiepPt1GiSrhBjJV/tDUeUEv1DbXE19dXo5KFqBLCJMr1XlV8+tc5IfhKq9fk1sI4hhBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059476; c=relaxed/simple;
	bh=rMtuf0zcS3kB8x7D/HT0/cZ54ltIPRIKq3ttpS2CiSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/0ahHh6wgSDZZgSzn5oBiJM8gDTrvINA/vVeq0quJg/z/wrmQesLRgYqaSTWRczboQd2iYPw74za/yUInEaKFUz0y7bTpt9rZUXNVESN3v/wqO0IcVds4vBBE7VOBTYgMyWMUyERATAD1HM3ejlGCA4nY26HKvZhRjWBB3KKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id b11f2cc6-1e62-11ef-8d3e-005056bd6ce9;
	Thu, 30 May 2024 11:57:52 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 00/11] pinctrl: pinmux: Embed and reuse struct
Date: Thu, 30 May 2024 11:55:09 +0300
Message-ID: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As promised to Linus W. there is a series that converts struct function_desc
to use struct pinfunction. With this it both struct group_desc and struct
function_desc will rely on the generic data types (struct pingroup and struct
pinfunction respectively). I haven't compiled everything, some builds might
fail. Anyway, comments, reviews, testing are all appreciated. 

In v3:
- added 'moore' to the mediatek patches summary (AngeloGioacchino)
- added tags (AngeloGioacchino)
- fixed build error in IMX driver (LKP)

In v2:
- fixed compilation problems found so far by LKP

Andy Shevchenko (11):
  pinctrl: berlin: Make use of struct pinfunction
  pinctrl: equilibrium: Make use of struct pinfunction
  pinctrl: ingenic: Provide a helper macro INGENIC_PIN_FUNCTION()
  pinctrl: mediatek: moore: Provide a helper macro
    PINCTRL_PIN_FUNCTION()
  pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
  pinctrl: pinmux: Embed struct pinfunction into struct function_desc
  pinctrl: imx: Convert to use func member
  pinctrl: ingenic: Convert to use func member
  pinctrl: keembay: Convert to use func member
  pinctrl: mediatek: moore: Convert to use func member
  pinctrl: pinmux: Remove unused members from struct function_desc

 drivers/pinctrl/berlin/berlin.c           |  21 +-
 drivers/pinctrl/berlin/berlin.h           |   6 -
 drivers/pinctrl/core.h                    |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c   |  14 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  10 +-
 drivers/pinctrl/mediatek/pinctrl-moore.h  |   6 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c |  32 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c |  42 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c |  20 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c |  34 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c |  24 +-
 drivers/pinctrl/pinctrl-equilibrium.c     |  24 +-
 drivers/pinctrl/pinctrl-equilibrium.h     |  12 -
 drivers/pinctrl/pinctrl-ingenic.c         | 707 +++++++++++-----------
 drivers/pinctrl/pinctrl-keembay.c         |  22 +-
 drivers/pinctrl/pinmux.c                  |  19 +-
 drivers/pinctrl/pinmux.h                  |  19 +-
 17 files changed, 503 insertions(+), 511 deletions(-)

-- 
2.45.1


