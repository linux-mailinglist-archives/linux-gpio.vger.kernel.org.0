Return-Path: <linux-gpio+bounces-6591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0088CD21E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 14:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1F591F22D0C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 12:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E0114A4DE;
	Thu, 23 May 2024 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwG3MoOV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E143414A4CE;
	Thu, 23 May 2024 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466556; cv=none; b=unN03gfVaVFGvC8H6HoTU/rAuyblBuvRST9U271XnPAL2NA51b4YYrn9CgyGTx1DelPRZMEZMAM8Mv8ixxZg1x/kK//APasulJwH8Gr5cYOZC/M0UghLVrSXeQfuk94TDPoNscEUqiWuE61rxkec0XNIO/9e4XI+xxL9yyqPuj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466556; c=relaxed/simple;
	bh=TKn0FSoT3Rx/S2S+cTUHtNcnZKAPGnKkSGr+Xn/oj/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pDYyLzi0xFoGSArUeGnTgDrmRV+oJ9d2nTdLnnKRUVvMDfyCvio0yideqWQZ2XNpJjSIn/7STiQJOuVhnuTFR/zsmvGWVXJjYvVQ3zVdEFYUpJbZaLpt/DJB1+HC3pEVAoeJM4srxozKMA43fuNuETtahnveAZAIRQi5CmiF7oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwG3MoOV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso19042305ad.0;
        Thu, 23 May 2024 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716466554; x=1717071354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMvQyOB2T/uz4JGU0pgfaeDcfZ0LIY2QkiDvyZlwmMs=;
        b=FwG3MoOVludOEDgj4PKuiMhDEpQ2PcR6mVa4jcSevdMkRDBFZ7lWkc2uaJxk83iNdZ
         azz7cYWol+k0xRWbA/2wpzrBsphhFDR6Bd0afvld8BrwSMa0SCXbOIP0mkN9gcuQiuqA
         bYmlN086CBI+AkkexDe1zTAbtOIWxnUkhmgikNoFlFAiho5ZMwJ0GZlq1HiURpoBAKVQ
         nYyBqfWFjmGuecRwEWMg9fBBSl4bh3MpuSqrhE4+3aSNtvlSzyxVItft9pD/GxGHAle9
         gPJghaYx0HuN0pnRXrIE349wCyNu+P4/CTJOLk6lqAR2u+5c6Ojir+CCVbYrMhaQk4fD
         /c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716466554; x=1717071354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMvQyOB2T/uz4JGU0pgfaeDcfZ0LIY2QkiDvyZlwmMs=;
        b=kub2ITsJqLItzoP2W3NWtfhY0+s6ann8pziTNuC16W9o/k2NZKi5CDVpA9Soe5VkWw
         WMeaSTzjBY7uuFXGH6onejaAor4u4wOASBqrLHNfroXvRrE/IARNTOWocElbuuIbvmoz
         QJtqZgAYppot224goqRg9IIQO8NNPsBwdrypo1hSiB0rdjEexwTlxHKNkrzhTb1NvqkW
         HzkWC/tV0vZ9+GDvLnloeUc9aC9X8mwsK3gSZNfsUXdTCJ6CS86hweVB869NwymHjBOs
         AzKpMs4cR3ZCkGPdSpc1/ZCYfwFIASwuOhX0ktRMdlFDNo8Ty7Pn99y6sKrTtd7Hw3xJ
         XWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHi4sm6uqBGPA3fX5jL/pOzarfKq4cEYtuwsoM4oO3KjkLYVkmeW2rBlk0TZzBoYUwv3HObUiDpXB8h7+yGC6H1LgTJgo0ubHOJ4sK
X-Gm-Message-State: AOJu0Yyvl6G8lYr7YUhIb9oC9Ai4YU3qLZtN9okcI0SXmOjpYAwntxZB
	H+ChWXnlKTZMtYg0IiuojFVsowe/IMLs4402+OVbX7cgDelqKr1T
X-Google-Smtp-Source: AGHT+IFxNyglWAbMdzWxY/8E/7htqdU6oaEj+uxEH0cGy7TzBtHkTmNzOTOoNpuKqAF0C8h3TuB/Tw==
X-Received: by 2002:a17:903:1247:b0:1f2:faf3:7267 with SMTP id d9443c01a7336-1f31c9ed3fcmr48343675ad.42.1716466554167;
        Thu, 23 May 2024 05:15:54 -0700 (PDT)
Received: from VM-147-239-centos.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f33569120esm16554975ad.284.2024.05.23.05.15.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2024 05:15:53 -0700 (PDT)
From: Yongzhi Liu <hyperlyzcs@gmail.com>
To: kumaravel.thiagarajan@microchip.com,
	vaibhaavram.tl@microchip.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jitxie@tencent.com,
	huntazhang@tencent.com,
	Yongzhi Liu <hyperlyzcs@gmail.com>
Subject: [PATCH 2/2] misc: microchip: pci1xxxx: Fix a memory leak in the error handling of gp_aux_bus_probe()
Date: Thu, 23 May 2024 20:14:34 +0800
Message-Id: <20240523121434.21855-4-hyperlyzcs@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240523121434.21855-1-hyperlyzcs@gmail.com>
References: <20240523121434.21855-1-hyperlyzcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a memory leak (forget to free allocated buffers) in a
memory allocation failure path.

Fix it to jump to the correct error handling code.

Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
Signed-off-by: Yongzhi Liu <hyperlyzcs@gmail.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
index de75d89ef53e..34c9be437432 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
@@ -69,8 +69,10 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	aux_bus->aux_device_wrapper[1] = kzalloc(sizeof(*aux_bus->aux_device_wrapper[1]),
 						 GFP_KERNEL);
-	if (!aux_bus->aux_device_wrapper[1])
-		return -ENOMEM;
+	if (!aux_bus->aux_device_wrapper[1]) {
+		retval =  -ENOMEM;
+		goto err_aux_dev_add_0;
+	}
 
 	retval = ida_alloc(&gp_client_ida, GFP_KERNEL);
 	if (retval < 0)
-- 
2.36.1


