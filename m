Return-Path: <linux-gpio+bounces-3031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A585184B6E8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7BFC1C23909
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE41C13174E;
	Tue,  6 Feb 2024 13:51:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58B913174D;
	Tue,  6 Feb 2024 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707227487; cv=none; b=er/8c+lbuaPGIIpZFFS/CGSvsrgIeb/D4VhWkLKz6zfmXX5pRnTHJW8pUiwh12fYLiwd4KXORuB6KGWXZlDPDZ5Fji5RdXIbNOOj6nKGj1/79xAKKe9St9KIwsloT1EBN4Crh8Zg/pcpNBtkEn0lIRyvG6/6l8wck4cBzTGw/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707227487; c=relaxed/simple;
	bh=4hFXo6GghKhwF4jp9hW+4rR/T0iXvv9b2LAtlSkLt2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgXkrBgxFg83BXFHc9C/o4ggQr7j8NkUANBOyeccTwFMrqrI5qt5PDoBI4x6VsDa/yKIYmaPCUcyd/12J+rc30gel0Ut40c2s2Lax8f0gejLKqk1Kpk7D79vBsIieXP6VaBFZk1Qf+7HWHF+4KaDnlxJXKb2juAlzINOHEZXiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,247,1701097200"; 
   d="scan'208";a="193057608"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Feb 2024 22:51:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.237])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 16EF6420FAA2;
	Tue,  6 Feb 2024 22:51:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] RZ/G2L pinctrl trivial changes
Date: Tue,  6 Feb 2024 13:51:12 +0000
Message-Id: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch in this series for configuring GPIO interrupt as input
mode. Also if the bootloader sets gpio interrupt pin as function,
override it as gpio.

The second and third patch is satisfy the prerequisite for IA55 tint
registers(ie, pin will be always in gpioint mode)

Currently on irq_disable(), we are disabling gpio interrupt enable(ISEL).
That means the pin is just gpio input and not gpio input interrupt any
more. So, move configuring ISEL in rzg2l_gpio_child_to_parent_hwirq()/
rzg2l_gpio_irq_domain_free() so that pin will be gpioint always even
during irq_disable().

v1->v2:
 * Added as series by adding patch#2 and #3.
 * Replaced u32->u64 for pin_data
 * Added rzg2l_gpio_free() for error path for bitmap_find_free_region().
 * rzg2l_gpio_free() called during rzg2l_gpio_irq_domain_free().

Biju Das (3):
  pinctrl: renesas: rzg2l: Configure interrupt input mode
  pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
  pinctrl: renesas: rzg2l: Avoid configuring ISEL in
    gpio_irq_{en,dis}able

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 77 ++++++++++++++++---------
 1 file changed, 50 insertions(+), 27 deletions(-)

-- 
2.25.1


