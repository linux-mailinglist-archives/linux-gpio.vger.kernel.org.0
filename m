Return-Path: <linux-gpio+bounces-9385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD89647F9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EC4E1F2307F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B3B1B012B;
	Thu, 29 Aug 2024 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EO7nAydQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE61B1505
	for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2024 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724941139; cv=none; b=LtJSRZIx1c36V1kP5R7+RZuKWI6tgl7vv2hi5lWT4Qha0KopFwfhdiOhmft9nVNnKF1icwN3aDIiTlyOlXZ8vqzCP6odx/2x2FZVlajPgrGdQ5vDTApKfx/P76iCcnKKODXicWG/SFCY+bjAYroJm3J7sGMAkVspx4RWRo+p/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724941139; c=relaxed/simple;
	bh=s4GctkYHbXn3tfM8TOsiQdy7M4dRLmQpFi1urTUZZ7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkL+ylOP2llNtv/noL3G81lx6m2B156REy81p+HpywtSz5Br+rW1EqjFOL3gXknlj4EC33Rm4uyEdCx4UACkfCBEQg8YSy8FoDtWifD7U4stHd4Uao2IrKkRfOOc19oUKoWGiQZqR3alFfvAisZM81UHhKMDu6NNDZgFLETiJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EO7nAydQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724941135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtYR/gGTmDbAPYmIYRccbXqwblJKOZwAhQg2Y6pwqmg=;
	b=EO7nAydQGuS8+PH1FdrZVaVS746AZzLW4GgZHIz/ra8IgksF7ismJaK/JSY4y2Z76HnaCn
	hookJW9Kkun1/J10pcsOVJSYtYjPVO3ij8CLqVoa+cmQPbG+9h2ehXaBe8yp4BMnZMKRo1
	TMz4pzH2tYjO9/nPwlK8J4nN7yLjx8I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-QVN2FGJEMnaeQFscQ9FzNQ-1; Thu, 29 Aug 2024 10:18:54 -0400
X-MC-Unique: QVN2FGJEMnaeQFscQ9FzNQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42b929d654bso7133295e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2024 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724941133; x=1725545933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtYR/gGTmDbAPYmIYRccbXqwblJKOZwAhQg2Y6pwqmg=;
        b=TJ9TTvSIomxp8UNvJTtpC6XqVgsJkXWSJ6aF1DDWpQzSdx7VgrGqEi7J/nrZ0LhKjD
         20GgkmeLACwyzh+HoSDih8gMilI+LqY9iehGhok9KgDtGu+LYwAGQ2n1qa42qSnO//vZ
         fSj9AisNzJM8adTqDaDd7uMAp0+AarIb0c9mZLzzN4pWEpzAlwqU0JrcX/cnrBN4p9yF
         NHOOIjNa8mu5lhwGw0bvJZ9ygP4aeQu3MJQYJGe4DWg/InKbF2CRqSfyJJBHd66lMOtL
         buoKB/3WGkx6ke9irMbidQgSOmd4FXynaS8sew3V7T+On6i0zJ4UDpT2+RM4/jRbnv0l
         LaLg==
X-Forwarded-Encrypted: i=1; AJvYcCWy0q5LewiX/FyRRIZNTHnzQ4S8tEe2zkH07eAr4DIrchNZbhO/XP45tLV4YNcrvOu1Yhht2BZYxoDJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FBZ8nQQe4qKJcxikunN2b3KoPi2oUdQ5fc6xDg2nEsThSltd
	HDyZzGWsMyfHbs/xxJ0y/fUVMLp7XnwrSLEpxxr9Lzf1hLnuz3gpyMSZaYUSHqcnWJA9N3M3BDW
	vMgdF0rnyWaWq55LpQtnXUh8Xhe2eiqjIaUDk6nABxFEkrAsC0iVYagL1oHw=
X-Received: by 2002:a7b:c449:0:b0:42b:aecb:d280 with SMTP id 5b1f17b1804b1-42bb27a1021mr25083855e9.27.1724941133424;
        Thu, 29 Aug 2024 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM4L32QAy6bG5zGi4CSR/e0PXgXREM2OUI07zkgBOIcbPjvtDeXtGrw5+r/WVKmA9y9IZ/KA==
X-Received: by 2002:a7b:c449:0:b0:42b:aecb:d280 with SMTP id 5b1f17b1804b1-42bb27a1021mr25083605e9.27.1724941132945;
        Thu, 29 Aug 2024 07:18:52 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abebdsm52670425e9.27.2024.08.29.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 07:18:52 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Philipp Stanner <pstanner@redhat.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH v5 3/7] block: mtip32xx: Replace deprecated PCI functions
Date: Thu, 29 Aug 2024 16:16:22 +0200
Message-ID: <20240829141844.39064-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829141844.39064-1-pstanner@redhat.com>
References: <20240829141844.39064-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

In mtip32xx, these functions can easily be replaced by their respective
successors, pcim_request_region() and pcim_iomap(). Moreover, the
driver's calls to pcim_iounmap_regions() in probe()'s error path and in
remove() are not necessary. Cleanup can be performed by PCI devres
automatically.

Replace pcim_iomap_regions() and pcim_iomap_table().

Remove the calls to pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
---
 drivers/block/mtip32xx/mtip32xx.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index c6ef0546ffc9..e4331b065a5e 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2716,7 +2716,9 @@ static int mtip_hw_init(struct driver_data *dd)
 	int rv;
 	unsigned long timeout, timetaken;
 
-	dd->mmio = pcim_iomap_table(dd->pdev)[MTIP_ABAR];
+	dd->mmio = pcim_iomap(dd->pdev, MTIP_ABAR, 0);
+	if (!dd->mmio)
+		return -ENOMEM;
 
 	mtip_detect_product(dd);
 	if (dd->product_type == MTIP_PRODUCT_UNKNOWN) {
@@ -3722,14 +3724,14 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 	rv = pcim_enable_device(pdev);
 	if (rv < 0) {
 		dev_err(&pdev->dev, "Unable to enable device\n");
-		goto iomap_err;
+		goto setmask_err;
 	}
 
-	/* Map BAR5 to memory. */
-	rv = pcim_iomap_regions(pdev, 1 << MTIP_ABAR, MTIP_DRV_NAME);
+	/* Request BAR5. */
+	rv = pcim_request_region(pdev, MTIP_ABAR, MTIP_DRV_NAME);
 	if (rv < 0) {
-		dev_err(&pdev->dev, "Unable to map regions\n");
-		goto iomap_err;
+		dev_err(&pdev->dev, "Unable to request regions\n");
+		goto setmask_err;
 	}
 
 	rv = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
@@ -3849,9 +3851,6 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		drop_cpu(dd->work[2].cpu_binding);
 	}
 setmask_err:
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
-
-iomap_err:
 	kfree(dd);
 	pci_set_drvdata(pdev, NULL);
 	return rv;
@@ -3925,7 +3924,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_msi(pdev);
 
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
 	pci_set_drvdata(pdev, NULL);
 
 	put_disk(dd->disk);
-- 
2.46.0


