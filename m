Return-Path: <linux-gpio+bounces-6590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C216A8CD21B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 14:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3F471C2145A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A521474BC;
	Thu, 23 May 2024 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0IGWTjp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C21145B10;
	Thu, 23 May 2024 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466553; cv=none; b=NtaScC9hO+14zMdlU3IqEgqwFPEQkCbpM4cEjO/sqhxWp/SHDvl4S3q7VhtkLwPZQ7dxyHtVOqfGXkatI5R0qrqdoiAhM2T1cga/CGuayrjOcs4UtCD+mBftdO+V7vJ+gg0EXZsXjiL1ej3aVb3BBqgLrDQP5tAStUbkou6BGAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466553; c=relaxed/simple;
	bh=29D6e9zk76nRGlWV2oADVtUQ2W3fwAZBCBMp56HP6tg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SmISQh9PSfU9lKo3orsND/3+1O2WlgnIYO6mRsOmMNYBg5FLL6EBl/Fl10GkekHzDz6mhcbKAFjCOs6qeWcsIDDnNDIhStDxrWtl2oppSEFrzMhOJ/q9ngld16FiDRW52f85Zopq5FSa9b2+SXoS62zTZxxCoiqPexY2YFh3xJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0IGWTjp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f05b669b6cso19357905ad.3;
        Thu, 23 May 2024 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716466552; x=1717071352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLwt22lhJsQw3sGiV03zatgAvEk5fPbO6M1yKwgtsyk=;
        b=H0IGWTjpn5w1qSnWrAlHjv+L6A8ddFgvYZUW50hggM//OZa+7epON0qaeH7/UjVAj7
         A4SmNGsnkAAW0P3KL0aX4NQSm4XpCiYwKh/iKwFY8Zsuh4JJLCJaThpLPpHi8m8APK8k
         bYTakb8tHYF0Vt/+gxUNd4voUWRVxm85AQ20WjEgkwoJ/XFg6B2E/Pv3UMvkesXneu5M
         UZqg+1rCEJXnZ4zmxOHRDyqM0REEu8J9FqKcRnitgU+QDqWpReYmxo/91qRrv4bGXuyH
         nToxpCFI7MBLDqDBm2o6oivdN047arMEOw7iAto63vzQVoAAXQDF1a6hkD73GJK9AGj+
         AAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716466552; x=1717071352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLwt22lhJsQw3sGiV03zatgAvEk5fPbO6M1yKwgtsyk=;
        b=gHlZgU5043vqrBwZSjZI6UNVdkh0RMrLDKTfg8DhYxG7FIPrAu1Gzy8fihnMv6C40C
         1HPMnWWjCyEgtZe7A2OKU+66a5xCfUaFMn2B0mhC8NrpOvw0Ez94p3QOkTAd+aM+m+e5
         X0H0uKB5Yhm3djIRKlgKkhfFip3Bm75NTGvyH+ZXLh2bXEYsoUkG8ewx1pMDPLnlaD0q
         L6inYuh3+CaQU8zaUoX1IcRnIU2JXE0xoKOvkLcqjaau/2IPwluTgnCEN237fA0kJJRc
         nw4O6jYL7gqUzNfOZYIv1lvEFzTvvSlPYLvnyQSe+7gvRdS5xybew310sZyeOBI/wUfG
         ky2A==
X-Forwarded-Encrypted: i=1; AJvYcCXwOClGIoVmGN1DP+55+QzhLlYBXqtskOkVhsce+EyoE6Ei/DZ+fJJoeVoIKNw+gMwcC2+tlPfb0HXjRGkDCEDWNjzFJW1VK6ce9FqD
X-Gm-Message-State: AOJu0YwrwgaYG/2utLwPwDadLTBMqgkQNNeGlAchTHLeB1p+4rKruFxf
	nL/bXm3wyfE3HUBiyNKFbcTgmgCZ25JEejYon/vyCMSFw9DHXJ2a2ZwiGAxP
X-Google-Smtp-Source: AGHT+IGEYRNh8SgRY3AD+cvRZ5tNN0DR69/0ymXE5Y3oH9QUeZQXH9p4xkINPUxgc2fKxo3hhefsOw==
X-Received: by 2002:a17:903:228f:b0:1eb:6477:f2e3 with SMTP id d9443c01a7336-1f31c9d03b9mr52172375ad.49.1716466551822;
        Thu, 23 May 2024 05:15:51 -0700 (PDT)
Received: from VM-147-239-centos.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f33569120esm16554975ad.284.2024.05.23.05.14.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2024 05:15:51 -0700 (PDT)
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
Subject: [PATCH 1/2] misc: microchip: pci1xxxx: fix double free in the error handling of gp_aux_bus_probe()
Date: Thu, 23 May 2024 20:14:33 +0800
Message-Id: <20240523121434.21855-3-hyperlyzcs@gmail.com>
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

When auxiliary_device_add() returns error and then calls
auxiliary_device_uninit(), callback function
gp_auxiliary_device_release() calls ida_free() and
kfree(aux_device_wrapper) to free memory. We should't
call them again in the error handling path.

Fix this by skipping the redundant cleanup functions.

Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
Signed-off-by: Yongzhi Liu <hyperlyzcs@gmail.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
index 32af2b14ff34..de75d89ef53e 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
@@ -111,6 +111,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 err_aux_dev_add_1:
 	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
+	goto err_aux_dev_add_0;
 
 err_aux_dev_init_1:
 	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[1]->aux_dev.id);
@@ -120,6 +121,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 err_aux_dev_add_0:
 	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[0]->aux_dev);
+	goto err_ret;
 
 err_aux_dev_init_0:
 	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[0]->aux_dev.id);
@@ -127,6 +129,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 err_ida_alloc_0:
 	kfree(aux_bus->aux_device_wrapper[0]);
 
+err_ret:
 	return retval;
 }
 
-- 
2.36.1


