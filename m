Return-Path: <linux-gpio+bounces-11206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E226C99AA6D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F32C28D3FF
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 17:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DAE1C8FAE;
	Fri, 11 Oct 2024 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LQsb1Fcf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D701C68AC;
	Fri, 11 Oct 2024 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728668063; cv=none; b=RZrx23jv9qaBSPJkhHnhpoOgdn0wy/v0SRm1rc2fIXCEiHZDVTIhZOeqCXw0EuHyABl/Ro69F3o2YKllrInJ1firgH9XLWd4VNyXWIBeikrCj1cgjE3M2Yt7ae+IMzCfCgh2MXo2Epb7fn8oBIs9i33E7dV1Sw4FiPZqwQfPRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728668063; c=relaxed/simple;
	bh=HzrVIZl8RqgVZlKFjmQ6wI+xqTFoDz8yAlOYT/QWKl8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PQi8hxtq2EfAyD3YpyEq60oeub+LKRW5DABBNnrAoYDn9A1oGmvV7GikWx8r949KJIl1c5S3zVkiQL9RTdi1+uGsMoCrGqehr0Qog0ullaMEKJ3lpUODg1JDuw7wnHEun8iomiDoqym9TsQ2SQVYDj7j4RKkVDpyApcA/EF1qRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LQsb1Fcf; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BHY5uX030160;
	Fri, 11 Oct 2024 12:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728668045;
	bh=MH212cpsBrz27V6CekiJ3grsULY4GcITqBn4H8Ov+5M=;
	h=From:To:CC:Subject:Date;
	b=LQsb1FcfhirJWxnLymMhAVtB22myzuw9Al8IpDqNL5DqTCg0lNQytNaLTe3deNfRW
	 4AY6Lyndw559EmSwEUKBAoRxkii3ksw3qhpE6x4K6uTayRdc/pRj8nclxOAzquRq8B
	 DAqWlsqKfC4+M2gny6JYLrPzOg+j7TsejQpYqulA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BHY5PT067551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 12:34:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 12:34:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 12:34:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BHY47C025973;
	Fri, 11 Oct 2024 12:34:04 -0500
From: Judith Mendez <jm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman
	<khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        <linux-serial@vger.kernel.org>, Judith Mendez <jm@ti.com>
Subject: [PATCH RESEND 0/2] Misc OMAP GPIO/UART fixes
Date: Fri, 11 Oct 2024 12:33:54 -0500
Message-ID: <20241011173356.870883-1-jm@ti.com>
X-Mailer: git-send-email 2.47.0
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
OMAP driver fixes for GPIO and UART drivers.

For GPIO, add gpio_enable and gpio_disable calls
to gpio-omap which fixes an issue where if there
is an irq storm, serial console is unresponsive.

For UART, move pm_runtime_get_sync since the
current order of omap_8250_rx_dma_flush and
pm_runtime_get_sync calls are set in a way that
when omap_8250_shutdown returns, dma->rx_running
is set and this causes issues next time the UART
is re-opened.

Changes since v1:
- Fix CC list
- Drop Fixes tag

Judith Mendez (2):
  gpio: omap: Add omap_gpio_disable/enable_irq calls
  serial: 8250: omap: Move pm_runtime_get_sync

 drivers/gpio/gpio-omap.c            | 29 +++++++++++++++++++++++++++++
 drivers/tty/serial/8250/8250_omap.c |  4 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)


base-commit: f45840d172a06d07a1a408b38bdb0be9ab3fd8cb
-- 
2.47.0


