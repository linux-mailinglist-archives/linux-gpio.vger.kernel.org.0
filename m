Return-Path: <linux-gpio+bounces-8816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A3957113
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 18:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130801C23054
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 16:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9404318991B;
	Mon, 19 Aug 2024 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVHzWm+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A0189909
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086375; cv=none; b=p6Rw7R/nbdLCt4R7seOSyHQTjk8rSMFNJfUVCDSNYAzYdeyilrAcxCOB6RMM+8p3S005twpY7UXPtkVleErWZBrC4x0nAlCLEoIo/l1NqxMx4GpKFF+71JSHNiEAGeakoNNqaoQbeZ9tx4OHFlRWkw3hZhOmPPG8F6MVO9W9sGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086375; c=relaxed/simple;
	bh=4wYDH1u7rI7foUd8ddC2jHC2VfD945Yix3xLtlXZQbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWr8x/31dWAKGSBEBr9LVyS7lnJEfE7nXcvnQLWPjhlXu2Qyjk1TUs1+HiXdm0UMBxx2enOn4OV43NAA1fkd72v1Zl2wFfMWv57w+KaUjmSiD+QwO3dus1fPwPrvNlCs9Pxman6WLsQ/xPCp4h4ZRyiqBUWqPMq1ZapkEj1VCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVHzWm+7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724086373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvDTGRlH2pE5xUmthqP2K8NKj/VvlYnHCpyCpsJBmcw=;
	b=UVHzWm+7YtPSs7KzoxaUNyiZUCNrM49UBRlJTLNE+YBviYpRg0wSmc5Na2Hm7VBzW2QrIX
	0YWpXSW8/utNhY4gmkrnwR9N2U1QAXPuGXfEHggtGg1czBQTGHo84xwllV4gZTru74+nkC
	+L4wwyLKDkbdfex8kgzAk3fIVJVmDnM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-pBqJOjBQPneeeGWp4Mnpsg-1; Mon, 19 Aug 2024 12:52:52 -0400
X-MC-Unique: pBqJOjBQPneeeGWp4Mnpsg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44ff65342daso4070171cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 09:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086371; x=1724691171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvDTGRlH2pE5xUmthqP2K8NKj/VvlYnHCpyCpsJBmcw=;
        b=cSbXTH2G2vVI+MkDni8tiXt1HGDmKINdEDBbd/m8VPv8p2lOM4LcWsJK8xmV8pr6nu
         V4g+j81ObQH+NRzTK7hLDqRVRmGaDQSrmuX9hDAN15unMdDogUr/ALD1VDrEw3eT+k+u
         5h65hlvQk/lFMbWbTaGMOdoWnPjr+Db3An9fkLwTr5+OJJy/Cl+1KWmhPPC5NgH5opv1
         d6ZNUAtkobPH+EiFhY00jfYrHo3QYN/GxfgoBrHGSU1kwu5Ox7sg8Er8FKrCdZPIgv1l
         5SfX7MWNWeAtNbggqpb2fG4f4P9UBe8P7FSz6/0AwoxwIG4JrJPp+dBg3DpICRH8HdzX
         vbGA==
X-Forwarded-Encrypted: i=1; AJvYcCVRZkRdbeRmrLiiZa6A2KF6bdHxuLsxgNapIUA3f+G6mg22esEHvvMn0Zvyhsrl97Vv2QZzGC14r0/wB3U2jrAP64aLiuwJa6ZvyA==
X-Gm-Message-State: AOJu0YxX8gTXKmI2BG7b7DADKduNxsP45an1w11iMwY8pqNyFqiQGid2
	Q8ZwaPZ5A+HDxx9OEC+I9pbetNZo4AcMGSTD+J+YtzBq32+RKB7BkGl7Slsd9s3URDZtdxOymSv
	slVA+YH7SBGgV3HhiQXjO1VexNH4JwVIpdZxwplrSfYWvtQBN4uucMDcfbYw=
X-Received: by 2002:a05:620a:2916:b0:7a1:ec82:5fb8 with SMTP id af79cd13be357-7a50693aa1amr850722985a.3.1724086371322;
        Mon, 19 Aug 2024 09:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZa/FD9N9XMYe6vZgYz+o23a4NN1SRn7d1y7DUQ2BvFX9aygcJIaTQ2PovPIikQclvdS1AXw==
X-Received: by 2002:a05:620a:2916:b0:7a1:ec82:5fb8 with SMTP id af79cd13be357-7a50693aa1amr850720485a.3.1724086370809;
        Mon, 19 Aug 2024 09:52:50 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:52:50 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: onathan Corbet <corbet@lwn.net>,
	Jens Axboe <axboe@kernel.dk>,
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
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 4/9] block: mtip32xx: Replace deprecated PCI functions
Date: Mon, 19 Aug 2024 18:51:44 +0200
Message-ID: <20240819165148.58201-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819165148.58201-2-pstanner@redhat.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
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
driver's call to pcim_iounmap_regions() is not necessary, because it's
invoked in the remove() function. Cleanup can, hence, be performed by
PCI devres automatically.

Replace pcim_iomap_regions() and pcim_iomap_table().

Remove the call to pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index c6ef0546ffc9..c7da6090954e 100644
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
@@ -3726,9 +3728,9 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 	}
 
 	/* Map BAR5 to memory. */
-	rv = pcim_iomap_regions(pdev, 1 << MTIP_ABAR, MTIP_DRV_NAME);
+	rv = pcim_request_region(pdev, 1, MTIP_DRV_NAME);
 	if (rv < 0) {
-		dev_err(&pdev->dev, "Unable to map regions\n");
+		dev_err(&pdev->dev, "Unable to request regions\n");
 		goto iomap_err;
 	}
 
@@ -3849,7 +3851,7 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		drop_cpu(dd->work[2].cpu_binding);
 	}
 setmask_err:
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
+	pcim_release_region(pdev, MTIP_ABAR);
 
 iomap_err:
 	kfree(dd);
@@ -3925,7 +3927,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
 
 	pci_disable_msi(pdev);
 
-	pcim_iounmap_regions(pdev, 1 << MTIP_ABAR);
 	pci_set_drvdata(pdev, NULL);
 
 	put_disk(dd->disk);
-- 
2.46.0


