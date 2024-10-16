Return-Path: <linux-gpio+bounces-11425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEC9A0602
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385531C23475
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961702071F3;
	Wed, 16 Oct 2024 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LK6PM3M4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481820696E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072170; cv=none; b=dzj5xdApl7hxZTqFIchu0nuEyncY7n7CHrXJvY5FA49veBunJIWuBxIi8bOKi0PphQH8CjRACBpOvjKZ8qTxCb6f8Ai5vQc568JShKpkLSdqQUlQ+MjOaEbzVUQc48zvWUd7hwX4VkasT5xll3HLVAC9leSgFHWAXswTcjaPqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072170; c=relaxed/simple;
	bh=73TDRRq/zYwVvdvTcMvRKEXzW3B5e+Rcch7EgZqO0Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRHf9ZIW8NusgYmeUdl8UnMoJN/Kl9cDBmWVxm9nHaLDFRy3/f1b9XMWV9KeRmCWqSIExFvN9SYN2KN/fX1owEn8Og/RBzWHqFr2FHxSe+RlGtahP7sTgNYq91CHl+EcMp6616CIfJUgZ1bApXAtFYMNeAFzh9ImdUSIqkh/djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LK6PM3M4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729072166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99YHQrhHcKN4EzxQy/kG1c7OXMv2lQ3JH0aSkE1MYKM=;
	b=LK6PM3M4MwBe6G45KCCcqddK5j2gTJrRIj81Ap9pDZBTvFhUxr8kQAq1+TcO/xYFc2tgd9
	m3XJ+sovx4HqHtIPNEnPyJld49ZUCNn/0uPCWY9BF/WSzL4U8PV90ZkbKdtNq9T31apYKI
	Cg4/WcifTEJMQmc4DHFHn6o6Hv3BNKs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-1BlyF_iaM6G5GdIvtPqr-g-1; Wed, 16 Oct 2024 05:49:24 -0400
X-MC-Unique: 1BlyF_iaM6G5GdIvtPqr-g-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43052e05c8fso42997315e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072163; x=1729676963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99YHQrhHcKN4EzxQy/kG1c7OXMv2lQ3JH0aSkE1MYKM=;
        b=qtEbVjY3C1Nqlmap3MwbsYaHQCdL4ctklKBe96OHHo/feCDkbrJF5Gc1odepJ8Cwv6
         oK1UtiQjy88DFjxRUZnKoH3EVKI939H12dq3bmq88otSym3m/KqW1rB7QLCni7+a4NEv
         Y2aQ4bUmBZee8EadbWT2GddUH4/Og0y97YzZiKQaH4topMgP5ZaGhBysWC/yIhGlKc1Y
         8N+RYU0sSZrc2OU5E9lQulVkTJBw7pbuujRNnav/QnKuoWBqG/Ts2v/ZFu2jVWeiIzOQ
         VZz2hJpXmesq1qfO9LlDuIiB6wTRcBU/eG1yAX4swn0Vbn7YRzhrpdhGw8kC8TmXTcsg
         2+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8a7ikN4YnliWNVfv+i7wQuO/TsHPVOdSD4i7DAa9SvuzZAbueLXd3gaBK4HCruWGwwwCl4xW+qDPx@vger.kernel.org
X-Gm-Message-State: AOJu0YzLEXzpHVLb2y6aHlGOyBw0nDN6ehlAa2C/j1V9NbYLNjtmAn68
	n1KIBP5/h+FoCly5EkqYetejHevg8PcCaEKh9UL176ryZaqcq/WPjQvi55Cr6DeEqwACB/0vjlw
	R2neEGBNf8wX/5UyGX0m8L0EHfL7dn698J4iXZVXURxcrLMJMWBhRxcg0io4=
X-Received: by 2002:a05:600c:1c04:b0:42c:aeaa:6aff with SMTP id 5b1f17b1804b1-4311ded42e9mr155157845e9.10.1729072162893;
        Wed, 16 Oct 2024 02:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8GDQhvsGyXA0X961v7Lmwi/hfrpQA8HclfLV7tXU7H8VLe8dIqSWkJPDQe2YmlweB9M9Vbw==
X-Received: by 2002:a05:600c:1c04:b0:42c:aeaa:6aff with SMTP id 5b1f17b1804b1-4311ded42e9mr155157405e9.10.1729072162522;
        Wed, 16 Oct 2024 02:49:22 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4314b32e487sm28190235e9.25.2024.10.16.02.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:49:21 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Li Zetao <lizetao1@huawei.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v8 3/6] fpga/dfl-pci.c: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 11:49:06 +0200
Message-ID: <20241016094911.24818-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016094911.24818-2-pstanner@redhat.com>
References: <20241016094911.24818-2-pstanner@redhat.com>
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

Port dfl-pci.c to the successor, pcim_iomap_region().

Consistently, replace pcim_iounmap_regions() with pcim_iounmap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Xu Yilun <yilun.xu@intel.com>
---
 drivers/fpga/dfl-pci.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index 80cac3a5f976..602807d6afcc 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -39,14 +39,6 @@ struct cci_drvdata {
 	struct dfl_fpga_cdev *cdev;	/* container device */
 };
 
-static void __iomem *cci_pci_ioremap_bar0(struct pci_dev *pcidev)
-{
-	if (pcim_iomap_regions(pcidev, BIT(0), DRV_NAME))
-		return NULL;
-
-	return pcim_iomap_table(pcidev)[0];
-}
-
 static int cci_pci_alloc_irq(struct pci_dev *pcidev)
 {
 	int ret, nvec = pci_msix_vec_count(pcidev);
@@ -235,9 +227,9 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
 	u64 v;
 
 	/* start to find Device Feature List from Bar 0 */
-	base = cci_pci_ioremap_bar0(pcidev);
-	if (!base)
-		return -ENOMEM;
+	base = pcim_iomap_region(pcidev, 0, DRV_NAME);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	/*
 	 * PF device has FME and Ports/AFUs, and VF device only has one
@@ -296,7 +288,7 @@ static int find_dfls_by_default(struct pci_dev *pcidev,
 	}
 
 	/* release I/O mappings for next step enumeration */
-	pcim_iounmap_regions(pcidev, BIT(0));
+	pcim_iounmap_region(pcidev, 0);
 
 	return ret;
 }
-- 
2.47.0


