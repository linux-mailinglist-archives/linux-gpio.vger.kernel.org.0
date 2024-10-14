Return-Path: <linux-gpio+bounces-11265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C21EA99C21B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1DD1C23EA6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1401A155359;
	Mon, 14 Oct 2024 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckGtDr2t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647015383C
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892424; cv=none; b=ayZcWT7Ji6HI4LA+Qbk8YMXf0cngscHi6dXWiBnhczbkuRsUk1g+3Fwf3tfj+o3JHzJMLXTTAJzYD9+bTsPfHrp2fqFSD8eFBaaL5lYlD8qcNN3UKtFD1DJffBykSmM4gmD41MDqtDcLnYREBh/0elxm9gpOqEUxvtivVKb0T0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892424; c=relaxed/simple;
	bh=MtLuBgpfK91JYPjxSh1y78rHTuZ0TUA7P/TTgNSltBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itmBRoBE+MESf0N7rAId75Y+IZHouBsguwzzOUCiLhvSvYC0T0msM95M7mKcN3uRrLvpqqL+Jt6GGlXDz5flpm/f1YcLUG9JQmOnizxDLeZNtZW1jtnrg+nPSFR8eTG4pSBHcVvLB74pZIJUbwuSCQCvHXnCAduXcOMvvqTgMgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckGtDr2t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728892422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQWRbKLTC4XrThcJn35sX444PmLxXwEeXK7ltjcDvQs=;
	b=ckGtDr2tj2c/bdT8aZMO8Ej5Yp448CINPsuXQtXg9RhgsXq+tco1yYrUOynmF0PJuV9pmh
	H3V7tDZqrrEYpYXTvfQ7flo2wjf4g4NUpAh/PQ7uDFrtIyN5b8VSmkb2f5awSXqJm6bnzi
	Ym4N56JHCZUIdcuwVo6LRrOjdzpfLBA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-i0OdgXu9MoS109vii0c4Ug-1; Mon, 14 Oct 2024 03:53:40 -0400
X-MC-Unique: i0OdgXu9MoS109vii0c4Ug-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a0d8baa2cso56059166b.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 00:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892419; x=1729497219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQWRbKLTC4XrThcJn35sX444PmLxXwEeXK7ltjcDvQs=;
        b=LRwnbsZNjgZb5Evp3cjMmASs5tKtvVt1vxldXnTgLOBYvDLnOb1xjAv24DWA0TvlMx
         tsowlB5oh6qN1nmKdTZh+KI/CcDgMMckdO37GYJ1vcuXxYSP20WQyCThARqGCktqFP6T
         wsC757sfiGhtChSfnU7YK5NSV+ZqPtStnhy/L4sFfsbTfg89l28vF7TZd74/VMh6u1Wp
         lSdXimeoNjQL7NxZzAr7onGjbAFpJ3k47h9C48pEUhle37mvWFswKYrgTWAZptzxXVLP
         ZaBs8tUX4KYdHtDW6v1HalpyaCJ+d173e+ZPLEMMtamcaGgpOwzwc1b97zlyK9Cr1y0e
         vz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTy1GZ43FuBzL49QFztATfNy6UDgeIGiTQfTKypdv/EPdK7Y5s18lFAhfeZPdEif4bdT8mjkHDT0Pt@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsEAK9yC/tjTHGq3ShtzvIAey9rGI2M/CNu8kcuig31rPoyrb
	w1wmSEvUuBpBnx0QLDukjPJeESuZPlQr0W5YL9h0xt76pA1Fi6CLvXL3JzfQPCiaeHA3srZLgOL
	TDl5ew1/eK8ho2E3f6J75agq6h9ZQicf6PzOVzRMw3WuTS+0MJI58PK1nChc=
X-Received: by 2002:a17:907:ea9:b0:a99:f5d8:726 with SMTP id a640c23a62f3a-a99f5d80ac6mr482026966b.23.1728892419428;
        Mon, 14 Oct 2024 00:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvo9dhhDKP1a2Qpqa18CL2nkvdiAgPC9PHZxg9N8VcO3KGLNh5KOfMatm+wb44wJX1LuKwdg==
X-Received: by 2002:a17:907:ea9:b0:a99:f5d8:726 with SMTP id a640c23a62f3a-a99f5d80ac6mr482024366b.23.1728892418998;
        Mon, 14 Oct 2024 00:53:38 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82d3798001d5778cfc1aeb0b3.dip.versatel-1u1.de. [2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f86fa986sm243291666b.92.2024.10.14.00.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:53:38 -0700 (PDT)
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
	Richard Cochran <richardcochran@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Keith Busch <kbusch@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	Li Zetao <lizetao1@huawei.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 3/5] block: mtip32xx: Replace deprecated PCI functions
Date: Mon, 14 Oct 2024 09:53:24 +0200
Message-ID: <20241014075329.10400-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014075329.10400-1-pstanner@redhat.com>
References: <20241014075329.10400-1-pstanner@redhat.com>
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
index 223faa9d5ffd..a10a87609310 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2701,7 +2701,9 @@ static int mtip_hw_init(struct driver_data *dd)
 	int rv;
 	unsigned long timeout, timetaken;
 
-	dd->mmio = pcim_iomap_table(dd->pdev)[MTIP_ABAR];
+	dd->mmio = pcim_iomap(dd->pdev, MTIP_ABAR, 0);
+	if (!dd->mmio)
+		return -ENOMEM;
 
 	mtip_detect_product(dd);
 	if (dd->product_type == MTIP_PRODUCT_UNKNOWN) {
@@ -3707,14 +3709,14 @@ static int mtip_pci_probe(struct pci_dev *pdev,
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
@@ -3834,9 +3836,6 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		drop_cpu(dd->work[2].cpu_binding);
 	}
 setmask_err:
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
-
-iomap_err:
 	kfree(dd);
 	pci_set_drvdata(pdev, NULL);
 	return rv;
@@ -3910,7 +3909,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_msi(pdev);
 
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
 	pci_set_drvdata(pdev, NULL);
 
 	put_disk(dd->disk);
-- 
2.46.2


