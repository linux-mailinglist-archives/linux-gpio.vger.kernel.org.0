Return-Path: <linux-gpio+bounces-11151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B3999190
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507FF282EE7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98F31E492C;
	Thu, 10 Oct 2024 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fv8laoxR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C323F1E47BC;
	Thu, 10 Oct 2024 18:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586090; cv=none; b=qlxsZ4s9tVROZ4XXVOBasa8nm7blQtdvimFQR6NsS4SPxOZv50WIi+T+y4EILE4IpRan0Ln1lJJfAxUqWn6wqDmuSrHJM3yOFFnxmqicfoNhgQ8PDygXjvLpUgWJlSje5IC757tguUzTdPTJKghIKiLHdHKe2fjCU65TK29w/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586090; c=relaxed/simple;
	bh=XU6KmgHcjyIjMVl12Cm+lG0klvIKpJ9dcOyD6tP6tDg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HG1m002vbLLijBAUQRKUa8hmXz0zGR7u2WP8hjm3+DGZ1Q6/13LXdQJpvonp9wUCQmxe7pUVkjUHJ35UneFihNdQrrF3kkZpuRv4aPRo1RT/wSPdpcULdX2RaKR5Mp4AosFGTh6cznHvTw9CaWInJE8/X4Qs+8L8WU2iPqN8XWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fv8laoxR; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm46k043199;
	Thu, 10 Oct 2024 13:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728586084;
	bh=gYHYJ2w8rIJc49DpxauOJHYCyVEiJQE9ESWAyGTiKrY=;
	h=From:To:CC:Subject:Date;
	b=fv8laoxRBMI64u4YShE0k3lMZdCNkl2+bEgKjkl+T9uq5nsHxRO1uouQtMmIJrDSO
	 6FxWYqn1DonzyepcduNwEUf8ALRwtJPmwPuaK5UR3af7VVpXPW/R8Vkq8AypY6pnRD
	 0ltAxyVpeGKOGfvwyzjfMzs3SQKVe248VWjYlp2s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm4kO090341;
	Thu, 10 Oct 2024 13:48:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 13:48:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 13:48:04 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm3V8011182;
	Thu, 10 Oct 2024 13:48:03 -0500
From: Judith Mendez <jm@ti.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        Judith Mendez
	<jm@ti.com>
Subject: [PATCH 0/2] Misc omap GPIO/UART fixes
Date: Thu, 10 Oct 2024 13:48:00 -0500
Message-ID: <20241010184802.203441-1-jm@ti.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series carries some miscellaneous
omap driver fixes for GPIO and UART drivers.

For GPIO, add gpio_enable and gpio_disable calls
to gpio-omap which fixes an issue where if there
is an irq storm, serial console is unresponsive.

For UART, move pm_runtime_get_sync since the
current order of omap_8250_rx_dma_flush and
pm_runtime_get_sync calls are set in a way that
when omap_8250_shutdown returns, dma->rx_running
is set and this causes issues next time the UART
is re-opened.

Judith Mendez (2):
  gpio: omap: Add omap_gpio_disable/enable_irq calls
  serial: 8250: omap: Move pm_runtime_get_sync

 drivers/gpio/gpio-omap.c            | 29 +++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_omap.c |  4 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)


base-commit: f45840d172a06d07a1a408b38bdb0be9ab3fd8cb
-- 
2.46.2


