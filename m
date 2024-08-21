Return-Path: <linux-gpio+bounces-8915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 502DC9595E9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 09:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F8A1F26BCB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 07:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B831B6559;
	Wed, 21 Aug 2024 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XmraETh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF11B6538
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224792; cv=none; b=TuLnpYJkyIWupguiXcxKwYtNesxSGRom9mBtauWRReWR6HXGMt6qSJCuoE1yysNQkjHbgCov/j1IOjPMckr9Ozv5h1g3CWGN8T+gGQQp8D8r1dA7H1XYuZuadVM3GlmSeyJib8U7CGyiwdvQWpYyDG6G5hVSLVrQKdkL8+pKxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224792; c=relaxed/simple;
	bh=xzKTSbBUCxwnUpKs8six5ekb8eTkm5n7sI9qBsfTSxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPnbDUxu5sbeJdprQPTUsMpcPwSsj0QRDREH5kV2dU8nIKlm2Nk1Ze4hAXD7PRRXR2my4Y3Ki69SbI8lgBocXzKhjmrXK2/T25kHm42ZVTm7Ci33lr+yYUglYZUapg5Yx7vy1YBRL5xs9y1iGEmwrlPnq6qf3xGxOP6rLUFmbe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XmraETh4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724224790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stErXlsn4bG59ZiuP1S49NzWKfcbkIn79Ht3IKYskFI=;
	b=XmraETh4x3xAdX4PDbfhaXxgfcLzttGz90OasGhW3/qcOAF47Cjs2ihXV+Kh6Ijp/bivBA
	tT9cR/3bzmv5ywrD/QxCCFUbgaYvKLF7VLOARvmleKi8gXMkDncJX8JHn4WLlc0uuQBhEe
	36EQjc69ieSIcfTZooCqC7FH4F9tsQA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-m2I3IEVaPSKdy9UOeC46zA-1; Wed, 21 Aug 2024 03:19:48 -0400
X-MC-Unique: m2I3IEVaPSKdy9UOeC46zA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a1d4238d65so709447085a.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 00:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224788; x=1724829588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stErXlsn4bG59ZiuP1S49NzWKfcbkIn79Ht3IKYskFI=;
        b=WgukMKHbqrUpl4dpfJq6NlC/7YugGFlhYcIO7WGVIBsI34T6lRkYYLIMx3UuJEiV/c
         l/tIkllOHQi615msnv5kyNt0f4QZHlxLbucyj6DjdqcSiEW+iVMv3wHHvnGGe4Mkgwl1
         KKBYyvLqoZPhcF40JEUcd3lMsMGJ+f9x5OGDV/Z3IAkJW/52/djfhzPdTR1Ehb49VOrV
         +AWW9EsqeQ5ZmeZOz+V1T3Ngq/oWY7I68NiIHb/6RSbBWfymgxoyCuFRfSz5vrJU2qkk
         T8EAg4gBikAOfVxpYlBKzFhA0xwS4AdwFG7Z1fzrbt3QA2nNiAEV/w9zhdWmz8lQzUXi
         VOsA==
X-Forwarded-Encrypted: i=1; AJvYcCVTlc6vuK82ZL9I5NqDQ7d4NWsDrUiUfZddnpjKypQFytJF82antCvGcxXaEJeYX6xMqgn8nuYACIqJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92AVXRgAOjgbOWIk2SYg7tIJPSPOJ52ISVQqDFGrtiQqshWbY
	bMFXKyzoaBGlj6hAY2NN35l3icra304egbnhdsbR4R3boRhUUQpiCAsT/srERNnsHkla/TDN8Pv
	66nHJql3g3ZD9e1OJHg3PWVE1zAtADYqRk0RSVC6s2bphqgFNfxMrBHAK/O0=
X-Received: by 2002:a05:620a:17a1:b0:7a1:ccfb:faf with SMTP id af79cd13be357-7a674048908mr211359985a.38.1724224788352;
        Wed, 21 Aug 2024 00:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUvUNVPoVPY0IqYI+9FyKN/j3iG1JNGhE8e2W6Pqxb+HWSkXXSyWApzCMJK3GHPcsNkvlKfQ==
X-Received: by 2002:a05:620a:17a1:b0:7a1:ccfb:faf with SMTP id af79cd13be357-7a674048908mr211356885a.38.1724224787793;
        Wed, 21 Aug 2024 00:19:47 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:19:46 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
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
	Philipp Stanner <pstanner@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>
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
Subject: [PATCH v2 9/9] PCI: Remove pcim_iounmap_regions()
Date: Wed, 21 Aug 2024 09:18:42 +0200
Message-ID: <20240821071842.8591-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821071842.8591-2-pstanner@redhat.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All users of pcim_iounmap_regions() have been removed by now.

Remove pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pci/devres.c                          | 21 -------------------
 include/linux/pci.h                           |  1 -
 3 files changed, 23 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index ac9ee7441887..525f08694984 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -397,7 +397,6 @@ PCI
   pcim_iomap_regions_request_all() : do request_region() on all and iomap() on multiple BARs
   pcim_iomap_table()		: array of mapped addresses indexed by BAR
   pcim_iounmap()		: do iounmap() on a single BAR
-  pcim_iounmap_regions()	: do iounmap() and release_region() on multiple BARs
   pcim_pin_device()		: keep PCI device enabled after release
   pcim_set_mwi()		: enable Memory-Write-Invalidate PCI transaction
 
diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 4dbba385e6b4..022c0bb243ad 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -1013,27 +1013,6 @@ int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 }
 EXPORT_SYMBOL(pcim_iomap_regions_request_all);
 
-/**
- * pcim_iounmap_regions - Unmap and release PCI BARs
- * @pdev: PCI device to map IO resources for
- * @mask: Mask of BARs to unmap and release
- *
- * Unmap and release regions specified by @mask.
- */
-void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
-{
-	int i;
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (!mask_contains_bar(mask, i))
-			continue;
-
-		pcim_iounmap_region(pdev, i);
-		pcim_remove_bar_from_legacy_table(pdev, i);
-	}
-}
-EXPORT_SYMBOL(pcim_iounmap_regions);
-
 /**
  * pcim_iomap_range - Create a ranged __iomap mapping within a PCI BAR
  * @pdev: PCI device to map IO resources for
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9625d8a7b655..6c60f063c672 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2301,7 +2301,6 @@ void pcim_iounmap_region(struct pci_dev *pdev, int bar);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
 void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
 				unsigned long offset, unsigned long len);
 
-- 
2.46.0


