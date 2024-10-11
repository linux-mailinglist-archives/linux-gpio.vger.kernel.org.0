Return-Path: <linux-gpio+bounces-11207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37599AA71
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79EA61C211AD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 17:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959671CF7C1;
	Fri, 11 Oct 2024 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EsO/1Ae/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D01CC162;
	Fri, 11 Oct 2024 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728668071; cv=none; b=LOMYbBjua2oeBJH9Zb0CacM4IYLkPq7Gdi02bEWPpTrxkWt+GU1EhNsSlZ8f96GDVKkE6ah10F87L8NeXPrfgKsy95Mu3n3MGMylDft75dLycuLL2QV/x+egs66exuwfD/Df5SHsB19zbasVjlO7HJ8I2o9gNM+zZ/oZ4/NF+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728668071; c=relaxed/simple;
	bh=RD4ZzEKlLEOrBh+X6FZoe88FhDQaqwaAKOjexwStVes=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YABwxusVNfvZJoZEeQorsU6mcy86o248i4CsJb0MA/xYddvf8u5kXh2UpRuA3qDsCU6TUnFtlyFNuqhnf8ECMQDmcj5gAwWopnkZ/oeJuRqpjZPRaFw+CaJmvKvj+lgbWBnpObS21v3W/YO8tXsMM3UMLwtrcWLEB9gA4N95rYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EsO/1Ae/; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BHYEN5119920;
	Fri, 11 Oct 2024 12:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728668054;
	bh=fQclw3tWB9Tra3qgUeR2LSHPwufmUQ2xfW5+5A6dE6c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EsO/1Ae/t0rZuHZkV9WNB6spDOoFFJ3T7oMYM/cjJdNc+LqlnsgFQ46JNNLWNITtS
	 +wVU8FPCRk0c4LCTunSqzaoet0bEGyW8ZpsST8EFriw3PvEiGMVr6ZGrFPpGqjScan
	 L7VDKrp0z6aK455F2ZAc9yy8pF7h1BDqp02VkszI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BHYEvt014740
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 12:34:14 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 12:34:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 12:34:14 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BHY47E025973;
	Fri, 11 Oct 2024 12:34:14 -0500
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
Subject: [PATCH RESEND 2/2] serial: 8250: omap: Move pm_runtime_get_sync
Date: Fri, 11 Oct 2024 12:33:56 -0500
Message-ID: <20241011173356.870883-3-jm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011173356.870883-1-jm@ti.com>
References: <20241011173356.870883-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Currently in omap_8250_shutdown, the dma->rx_running
flag is set to zero in omap_8250_rx_dma_flush. Next
pm_runtime_get_sync is called, which is a runtime
resume call stack which can re-set the flag. When the
call omap_8250_shutdown returns, the flag is expected
to be UN-SET, but this is not the case. This is causing
issues the next time UART is re-opened and omap_8250_rx_dma
is called. Fix by moving pm_runtime_get_sync before the
omap_8250_rx_dma_flush.

Signed-off-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 88b58f44e4e9..0dd68bdbfbcf 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -776,12 +776,12 @@ static void omap_8250_shutdown(struct uart_port *port)
 	struct uart_8250_port *up = up_to_u8250p(port);
 	struct omap8250_priv *priv = port->private_data;
 
+	pm_runtime_get_sync(port->dev);
+
 	flush_work(&priv->qos_work);
 	if (up->dma)
 		omap_8250_rx_dma_flush(up);
 
-	pm_runtime_get_sync(port->dev);
-
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
 		serial_out(up, UART_OMAP_EFR2, 0x0);
-- 
2.47.0


