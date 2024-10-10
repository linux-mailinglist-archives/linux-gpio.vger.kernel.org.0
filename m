Return-Path: <linux-gpio+bounces-11153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3280999197
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BE028366E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67181F9A90;
	Thu, 10 Oct 2024 18:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KrwFmaU3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE61CCEF0;
	Thu, 10 Oct 2024 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586099; cv=none; b=WRFketTX9B5QqfQljbul5MoKJq9ATCoIRG/afX8ELIXQUpPI5xMJxnO/JxNqJpQtt0dCQbvQpJ5Yx+WSJrXhsLecKshYgFQNgF7uQxV0knVHUsXtlMpy5flSSsZpkbisPHH8Ax8tBf5fy2dMybi0eu3EnpPukLyc+lXZa7K0SYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586099; c=relaxed/simple;
	bh=PQJkDvEyk3UIfsKwpvyY3mLyiKWfKdTOLxySV12GXAA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rxx+sR5MvToAwLKGRR0o2tYVH2N3AZC0PIXyGej5x5Wf3Vi7r8hM3Cq0tsrwJSUsF33Z1lOq3XkdMyILeybd76ne9GvMTvQH0vWlxfLD1d3KjER1WmNSvNHMuE9RXXw+sbh7RWxtpYtH+5Vlc0dajSJPE8B5EFvoep/x+rQRGTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KrwFmaU3; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm6HT127830;
	Thu, 10 Oct 2024 13:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728586086;
	bh=1oTPBF+SUaJaGZnyWmHn1NEj1otLNrz6Cnmjj8FEe5s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KrwFmaU33OAvMoM65SdPjTIQr2STEQGegSm2qJ7bWElyUgYtMvnC511P9urEWgarX
	 N3aHkrc98mR6WvYkbpMApcuchpKusx0X4QXh6BQg5c2mWLehzsxXdattcuOvRDPj4V
	 uXQ/MGDbCc2P+SxMsWKRV9JIf1O8qb1kHqnaKwPA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49AIm6oB034468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2024 13:48:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 13:48:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 13:48:06 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49AIm3VA011182;
	Thu, 10 Oct 2024 13:48:06 -0500
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
	<jm@ti.com>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 2/2] serial: 8250: omap: Move pm_runtime_get_sync
Date: Thu, 10 Oct 2024 13:48:02 -0500
Message-ID: <20241010184802.203441-3-jm@ti.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241010184802.203441-1-jm@ti.com>
References: <20241010184802.203441-1-jm@ti.com>
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

Fixes: 0e31c8d173ab ("tty: serial: 8250_omap: add custom DMA-RX callback")
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
2.46.2


