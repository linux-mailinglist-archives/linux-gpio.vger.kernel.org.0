Return-Path: <linux-gpio+bounces-35063-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJeXJquf22keEQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35063-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 15:35:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E91063E4064
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 15:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15037301A704
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 13:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABF737C927;
	Sun, 12 Apr 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF/2lcur"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1F37C90E
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000849; cv=none; b=Rs43kcx87szp3uV0KKp0N5x3tALZYV3Mb3pcN5qvYOuZOSoyjLp+zrJK/nQ332eOp8NJPB4/hhIRRCqrh9hpXj35TpHd50MP/Mmsfu+LQPIlDW1LtLZoMqjgyjjZxdfi2PO9Gt24XGWIJr4msG1wW2f3vtvPNpsVDAOgY5n2inQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000849; c=relaxed/simple;
	bh=xbRuVz0HFLpaBJ4CfsXpXS0+01wpREeXceTWJkuRtHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnhsjdizjSAuBSevupscCRfvTFZrNs3/Yf2wI+RBiKs9Jq77KPau1SfJ9iPg6zAQi7M8ZjvXjuZhx9f6BudAARxzuEnw6uH34ZsLbU5UQyMu5dk+aCWW2djpgEwbaNnzXeKqsObkBfORwJFDbsRoZ2sNL7ifvySc7/ewt4la9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF/2lcur; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad21f437eeso19996635ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000848; x=1776605648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMBdYVQUfN8Fv6N90jj5d+G39EYg75+iy6wVTIf08KY=;
        b=lF/2lcurA2UY54pcoIwEJxmp74JWzZAWmAmYJMlabcAGYvrsV+o41ea24aNL+Q1T2q
         0O1YASTqTIEFRyRcv92QjpS4BcbB0zuuk+CbV6ZjRsJP40hGVm60Uczt1u3ithuikKSR
         n3Dr9HkClbcjyCb8ic9cnHKK6FG2ShTqwCIgi2dFaf5Z8BdrfOB1lf9Ena9IhvjdD1M4
         RtRGp8nxTRst8UfYOulkE50tB2vgaIG81ctBB+eUCUOrWDCF6S3cBO/+lcGN1gFNR/6/
         buuP/iOZIgAwOGmmcK4h9tlXE5TQSeejZy0AE51zT5dP0jR8pSu5GMiw9nndYKQTOBOx
         IiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000848; x=1776605648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMBdYVQUfN8Fv6N90jj5d+G39EYg75+iy6wVTIf08KY=;
        b=FMnCUD/fpvLK/qUDrGcyXXcphl5BOsAuf+SD+q0q6IE65m15dglzM9EiSsbEiX7g2/
         raEDviDHI0GHPQn6RR44FL/GKSV7+LUiUCXD82+wUNKkRVuzXF24cxij+jLkO7EpC2vl
         MCiF0r18QfIQbd+4FEKBkAk+6avFiHUrVlv0dLOwf3fjSLyRxWcw1A6z2QHjubdCuBTe
         +MF5qiHeA9etcrD4kXHpT8UDHDmc5pSl+e2NAGTtxj5QrcxbdHHdrW2IPFJFpu5PqqDg
         0aaq4onJyvfGlEGEklqcWSP60Ny18QnVDu19EEHpeoqKZJN7g8jiVmz1wQPvtGOmxRZC
         UkWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xOmo6gRkrhB7f0sL4NAOph7oMP884ggkhkcVhpMiQv0wGE8g2J6IApQqLeg60ACCrwEGZ9vtFaSZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gL+JHiBpYZfzvIjEvVO6b0Dry5avqXH06BmzlNp6d6A+fzMQ
	7SNiipQH//GT4F4WdM362sX7OetGW8naZuxUYyWOFTp0VmQGERtFJx2s
X-Gm-Gg: AeBDieuEvNB37Ky/OrHNnR9b4kchcKDDGGe/5MtNBgrBiMTJhcB1Vv89ZNfK22Ut8IV
	GUemVmjsVNtuZubQXmE+SG4KbH9UQmwdbQw9WuW7cySJkh00XVnPu4kZL6u4qf3P0VDNckr+pIR
	0FO8PTpkLZ1qHPcG4jMkUyFO++q9RYUAOefK3dlOxFqX0csptitIaWc0GYdYbhJjDwe3gX5+qzU
	aUPUJeIjmez8w9ZILhKjEQAoVThcHUB8jgcWIF4jlDRkLYrL3wE7EtvkIliXSVmoOtigCJ7GtKB
	Vk30KG2tR21TrehmmbqDJdLUbtXfORqAtkYsXdKqfRgqwu2/LdZqWsRRnv0+WlG+Ou166ddtPav
	PwGPye+C325y5wFvdwADXaWmd2b7wj6IGDnZuluHHE2FklI5yXXfldPgQHxDsPEtmvX2I2aWFaN
	8S4I5GUadq8imIG2g=
X-Received: by 2002:a17:903:22c6:b0:2b0:4fb3:c771 with SMTP id d9443c01a7336-2b2c722effamr137776865ad.6.1776000847708;
        Sun, 12 Apr 2026 06:34:07 -0700 (PDT)
Received: from lgs.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f27048sm82475495ad.62.2026.04.12.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 06:34:07 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] misc: microchip: pci1xxxx: fix IRQ vector leak in gp_aux_bus_probe()
Date: Sun, 12 Apr 2026 21:33:55 +0800
Message-ID: <20260412133356.2536585-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35063-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E91063E4064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gp_aux_bus_probe() allocates IRQ vectors with pci_alloc_irq_vectors()
before initializing and adding the second auxiliary device.

When pci_irq_vector(), auxiliary_device_init() or auxiliary_device_add()
for the second auxiliary device fails, the function unwinds the auxiliary
devices and ida allocations, but leaves the allocated IRQ vectors behind.

Add a dedicated error path to call pci_free_irq_vectors() after IRQ
vectors have been allocated successfully.

Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
index 34c9be437432..5e1f99a35100 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
@@ -93,14 +93,14 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	retval = pci_irq_vector(pdev, 0);
 	if (retval < 0)
-		goto err_aux_dev_init_1;
+		goto err_irq_vectors;
 
 	pdev->irq = retval;
 	aux_bus->aux_device_wrapper[1]->gp_aux_data.irq_num = pdev->irq;
 
 	retval = auxiliary_device_init(&aux_bus->aux_device_wrapper[1]->aux_dev);
 	if (retval < 0)
-		goto err_aux_dev_init_1;
+		goto err_irq_vectors;
 
 	retval = auxiliary_device_add(&aux_bus->aux_device_wrapper[1]->aux_dev);
 	if (retval)
@@ -113,6 +113,9 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 err_aux_dev_add_1:
 	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
+
+err_irq_vectors:
+	pci_free_irq_vectors(pdev);
 	goto err_aux_dev_add_0;
 
 err_aux_dev_init_1:
-- 
2.43.0


