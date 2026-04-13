Return-Path: <linux-gpio+bounces-35117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMq7ABgC3Wk3YwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:47:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 585343ED81F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EB753009FBB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E873DF000;
	Mon, 13 Apr 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juwYBLn0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFF399018
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091228; cv=none; b=lHzTZ8pbOSwVWmsVXFX2+SRkCp6SCjpI+IzrLw6b89/3tDCbce2aKHbf5uYEkF/0WTrqO58JHm7LZMwLUZKwOQG+MDjwoviwRyHXSKv4+nnAembReUieEL2BXw69H+RV4pj+V+mufVTqKAnfdAasiMaknnf4Y/nDUP9dS2yIhEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091228; c=relaxed/simple;
	bh=Jw0XkZ7XWVBzbCd5mSi84uhH+sbZPXMd+k/pKIf64fY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nW9smg+EoyizR1tbN9hHz6/BduHkUE346tXupQoOMu6cM3wBdV+TjMAI6sPhMkXZhqFF732eE5NeAZVcox5/OPiCOUuHiM6vSN4PkPKUMc5QWXnfnhTWGSr9wjRM79PHQgEVeYfAL8d+V8lV046QhwxQVhfZjYvsrimIfbF3lrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juwYBLn0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso3943046a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776091227; x=1776696027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8HqkCsPnBTjXRg2oQ6IzHB28nfSYPnxw8XmrlaonnE=;
        b=juwYBLn0Z5aUwHRa+2FkKoBLOlJBqWnUDKG8YfoObvoJQTKb9defbYcu8XNnnuByAH
         6/r6UgLLetjpaT+XsH1F5T6GR6gj8iNbBI85fD3nYVqRNCYZcTT/yosp98LvCRP7hcPG
         1xpfRye+hcqwbrsPjSH7D+s85eB9Jaz952E0LCPTTSkoCatrOtjwqsQp2qOY4Q32y2eL
         gdx2uhALPFfcxtkGChjmV+FMSxRy5SxEz1IrsxtsqzHiSnqSfz9Dkk6QDnKumtwEjmTU
         Th2LshJmzAgMNq02WwjdgPVuo8yTkVrFbi4X/xtIn9OMmRZ0VlFia4jUeg/jP9A+UXSe
         Z2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091227; x=1776696027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8HqkCsPnBTjXRg2oQ6IzHB28nfSYPnxw8XmrlaonnE=;
        b=k9z/32MBiSjjZkbeAtPxSuwz3FV1bQo11T4Nrcu//vk8GPeFn+t44A0f4qp9LUa3Qo
         JXnf9qmt3FhHkuIxJWZuuVCxRD6545u6PZxG0Bt0CG8GZPmLG/cce+DIW1nVN/nB6Hqo
         v7eN4ZCUmbuLeksj4yWkEGXGBoeXO/l4aASdClrq6LE11exAfyHlqVpBAd4Jal/Gp2Md
         N470MOLKqUXfeNVPJK3PKG67Fg8+cldJ1qRmEroTHwH+MNe7qUlwIMaUqYDu/P60+bt2
         UcdMzpjow4cHvWsXLBcA1tbpFXtl5+lmWuwrRWbYw0CJ+PnFTIHFLhjVLNYRuY7wdskq
         jHMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FGLb/A6K52E80w+RNCYUDOp/r92G/J+ivzTIrTZNMee0/jxEgXl7I55+V7k2d1i5UjvBeLj/0XpLm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfi5D0fwMWRlfT7mfupV4bOwD2/6vx17R4B/hhpKD5tlqspr67
	sm42Ny5Tnd0gpsDhUxdcZqBh4LN03D/6WRm4IIHtrPf7LrXM9APSMc0zs6JR/vNlQyk=
X-Gm-Gg: AeBDieuAKKHIsuB15ljaOgvNUORDuVb29M2UIb0I6IZKzTboj2C/4ohGv+WVo2Ycixl
	L8YC/VwDyiVknt7GXpBZ4J5hCV4qqc/dzTtY8RZnO9HIOOvVVjNqQryWlNxJ+ru5ENgr4W+8XCO
	uiufD9tWQEsHRYEaJ+/8WpWkUQjTBrgddjR1HZqYEZc47WCYVlfjIKUijA7u7f67yZIFoRsMUct
	WxWQrOt7O2gJcsAOGbcjBIL9uQxlQzfqtV3OXzc941166WYEuJ333fskJzEJlQv5jP/f9XliB2M
	esa7O1FWff69vxm5HP3wRxDnLyjF56SJSTNaiRdkIfHfQrgji9EpFm4EKzB/gxef4EeEnXg4e/L
	X1j0x+M3Z3kTMeyWArAUXIf/WmWNQVmXblatmnSmA1KLyGJ6IieY/+kJFEO+YcIhW3zHGSJNf7Y
	OX4WDlPNvgauEeB4NwEDL29gSz3/h0RlY=
X-Received: by 2002:a17:90a:e7cc:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-35e4277fe50mr14632268a91.12.1776091226802;
        Mon, 13 Apr 2026 07:40:26 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:6c67:74e8:5200:1f39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e412233ddsm12701563a91.5.2026.04.13.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:40:25 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] misc: microchip: pci1xxxx: fix IRQ vector leak in gp_aux_bus_probe()
Date: Mon, 13 Apr 2026 22:40:12 +0800
Message-ID: <20260413144012.3009310-1-lgs201920130244@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35117-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 585343ED81F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gp_aux_bus_probe() allocates IRQ vectors with pci_alloc_irq_vectors()
before initializing and adding the second auxiliary device.

When pci_irq_vector(), auxiliary_device_init() or auxiliary_device_add()
for the second auxiliary device fails, the function unwinds the auxiliary
devices and ida allocations, but leaves the allocated IRQ vectors behind.

The issue was identified by a static analysis tool I developed and
confirmed by manual review. Add a dedicated error path to call
pci_free_irq_vectors() after IRQ vectors have been allocated
successfully.

Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - note that the issue was identified by my static analysis tool
  - and confirmed by manual review

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


