Return-Path: <linux-gpio+bounces-9233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05667961768
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F021C23509
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8CB1D415F;
	Tue, 27 Aug 2024 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ca8dF3tz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896EE1D365E
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784991; cv=none; b=DreNRP6q6qS33kVkki2U53ze0O+Pn/KP6hMuo1nsiz3l/XIlxcLewomVjTwdQ86i1o73Bp1n9c54aTZ9ShFjETmzQTKqIiUGjOZAEAbRxR9k1Mp5ueI9dvTYbKGptvjKiSCi/7pXDIDDFfpBzeEACnbgwpQ7ax5uEP3djPaT+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784991; c=relaxed/simple;
	bh=fTrgv2t55oAUxzibv4M/cg1vJVaL3hV6ZXIaCSwKC84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+uYUbUoyfxc7uzMd6ImL5rnRSBWDbmhi9JO5jqq1Vamw8wUtIfNJQU66T/7o+boUfdgP9Eu7AyrnrRh57sSLDKGBdCi95OKI8daY048mdNawsF0lciP3NHTvNwKQRY/0ec2SpmJpLvKPNVdL/RojuKPTBS5KVN1EKVsah10KWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ca8dF3tz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724784988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqjxyDwTPmZ6BYMSZzIwABwfoKN2gGr5LIW5fe/qQ18=;
	b=ca8dF3tzUWxqmsKWRq0bRpbHPr5aS/1J3Uo+J+7PF1s6lFHIeU64i8llq1+U4xLXyGU1mV
	/WGJNazubBJ2ZmMjlbA8ahmqdQ5muMZIQ0ain3VaBx2h61dn3eOdlQNxcNCYHg761+Cc9H
	r2OJt5HXIE5INVEZYrlUDmo8TEh62i0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-cHFmdTIZOHu9RcmcGmxFgw-1; Tue, 27 Aug 2024 14:56:26 -0400
X-MC-Unique: cHFmdTIZOHu9RcmcGmxFgw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8677df5ba1so543527466b.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 11:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784985; x=1725389785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqjxyDwTPmZ6BYMSZzIwABwfoKN2gGr5LIW5fe/qQ18=;
        b=WeVsdnVGDl5ZyjT6ywFm2oTqXePOgfXmZvON3WZv4iH8B6gbnl7b3ZX8Lj8Upzr8He
         HBt4UgWCSlAv7vbQN30Oc3zvslcCxXLomM2EKcqXDLYDv8faotXlPlZp0MsuWYNX6iJY
         VsvzeRrqW4A50RVPL6y6+iHQBlFl3ywWqQfxHbaaFZ809CRj1kVi0imuggLYhP5y9Omy
         iP8eHDyRpp5VFYLH78Mf6USOJXr4fULKd7c+5ammntXdMgJiDCcCLMvUQPve5Lt4rEe5
         K+cY5g6l8aahF/ft6zV4NTznNjZPsYmjLEXa5RFahcIn3cUSrrpZzDyDK97j788/clVj
         0Wvg==
X-Forwarded-Encrypted: i=1; AJvYcCXhvnaxetUC3pnLZHk2B6ClxZEj4Soej46vMityIGBXvtGTti90ttjW/9RNw4eAN9en11f8oygn3BL7@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBWwLFij3n4oXS2TG6nShiTV8rCnZItVLpKf2BfwMMqEhxq6m
	PX7XH4jS2FzPpMMdgEiP1cpbzBAqOzC0K13mkYk4zkYcrgB/IbJDY1t2EX89TlcH54Vq+s4wSYG
	JTs7V2Sd5GF4DBfuE2wWVangva1vxXjF8VoqCxrrOSLPC/Cuqa8qfKpfcwbQ=
X-Received: by 2002:a17:907:7da2:b0:a86:a976:68b8 with SMTP id a640c23a62f3a-a86e3d4d658mr271845166b.65.1724784985499;
        Tue, 27 Aug 2024 11:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDVUpmOrCHBb5EyYmwKTK2LAwSrZ+h4YrVzu5NhP0Bxj6DB/rtzoi35gU4kno9vPxrThGKfw==
X-Received: by 2002:a17:907:7da2:b0:a86:a976:68b8 with SMTP id a640c23a62f3a-a86e3d4d658mr271842866b.65.1724784984946;
        Tue, 27 Aug 2024 11:56:24 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549c4e9sm141473066b.47.2024.08.27.11.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:56:24 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: ens Axboe <axboe@kernel.dk>,
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
	Keith Busch <kbusch@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH v4 3/7] block: mtip32xx: Replace deprecated PCI functions
Date: Tue, 27 Aug 2024 20:56:08 +0200
Message-ID: <20240827185616.45094-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827185616.45094-1-pstanner@redhat.com>
References: <20240827185616.45094-1-pstanner@redhat.com>
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
---
 drivers/block/mtip32xx/mtip32xx.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index c6ef0546ffc9..bd40a06e4c0f 100644
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
 
 	/* Map BAR5 to memory. */
-	rv = pcim_iomap_regions(pdev, 1 << MTIP_ABAR, MTIP_DRV_NAME);
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


