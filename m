Return-Path: <linux-gpio+bounces-7346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166B9037D7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A531C231F2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14196176ACE;
	Tue, 11 Jun 2024 09:31:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630311BF2A
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098295; cv=none; b=m5u4XlusvtCauJqqmnNQs/bCCdQQxYPXJqCTmvdTPZT2zugE7MbGoCrY1Yjra2RCoTLR1LZbRqGHqynwg2DUaRihTDLsRAfD1wZozKcfjb97KZCjFAKiNYYMQJ1AYhmYclK8d/O1XUMMSBKjR9HlXrRMnCP5AkLLvf58P4xzSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098295; c=relaxed/simple;
	bh=gPE9ecK322dZPly/Tq/DdkWYuVy7hgxwgVaWhEWbTxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HpViXoeNHjXofpDGvIuYEiMWfO/o7za/4/J5kHAX53HDu018hDzCRlobNQpPPYQiLPZMwUzpytS9AbNWJOTKFTkHtmJUWyhUdDNVH7VzCcbwVEXBH829hmOijXikgnf0T2k+SfGZHtWcmO3SmOwRTyOwgMhwTE2QrZSkHrAwW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 61bcbe87-27d5-11ef-80ea-005056bdfda7;
	Tue, 11 Jun 2024 12:31:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v1 0/4] pinctrl: nuvoton: A few cleanups
Date: Tue, 11 Jun 2024 12:30:21 +0300
Message-ID: <20240611093127.90210-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Nuvoton drivers to use pin control provided data types
and more of device property APIs.

Not tested.

Andy Shevchenko (4):
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: nuvoton: Make use of struct pinfunction and
    PINCTRL_PINFUNCTION()
  pinctrl: nuvoton: Convert to use struct group_desc
  pinctrl: nuvoton: Reduce use of OF-specific APIs

 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 116 ++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |   1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  43 ++------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  29 ++----
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  11 +-
 5 files changed, 71 insertions(+), 129 deletions(-)

-- 
2.45.2


