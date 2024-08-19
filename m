Return-Path: <linux-gpio+bounces-8818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09131957128
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 18:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C9AF1F239C1
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 16:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCFD18784A;
	Mon, 19 Aug 2024 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XIUsJtUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5918A6D8
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086391; cv=none; b=FcM8gSWu+I6F+8EF9YKHRwf59vtKzsPbkjh5xPXhBbRYbXWvtwqGurxAddJbwtRJH68AV5f/j3KkaIyvpD8uIteqzBqNRiU1YB5zdwQ9IkUHp6eTcja3Uv/kD2ogKz7iz6PUHeltPh6MTZ4TOgkK1B28roj/10hkvDsoymlXcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086391; c=relaxed/simple;
	bh=SgQa/apEnyQVxi5RGIOMYDsJA8zmcu1/aNTE/QznKio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh1NZtgE35MDCIPemWY9hsiTPfVCjH0wZe5IeIpN7bmlBon07uOAIdN6oRQ2lvU2pk90jrW1PVjjBp8ofemLYcPLItUfsTxXDUAmhhAvfk99UuWmn6A/QdvQ5qMRA3yNr5CoRW18SMXd7yqnzaPxCPt4wFSY3Vo2J9atmO5dnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XIUsJtUo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724086389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJtm3uYD4inmsDECmrMxkvS6gTo4VXXtBuq4LxNQ/Aw=;
	b=XIUsJtUozQpCJSf78jHOPBmCghPuuLvAjnxVl3lzKRYOehdgfF0XBPiZMrgP+p12xobH/s
	OAQNaYugkH+rE/pcU4so6H/mnYN8WNrTD5l8KNuJYFUXhqnynTdH2uWu0P5UWnkiw25FUG
	0vcDFqTjTMbhU8ANPsA8HnDjCs8TeVA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-uEvLhz3hOPyuJyhXAWNQDQ-1; Mon, 19 Aug 2024 12:53:02 -0400
X-MC-Unique: uEvLhz3hOPyuJyhXAWNQDQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a380541b28so7318885a.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 09:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086382; x=1724691182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJtm3uYD4inmsDECmrMxkvS6gTo4VXXtBuq4LxNQ/Aw=;
        b=d3psSDGfuOidmENp2BBztfEhPJHHwnSHDJar71KdHQhPFOF8NaGw85bBd5HP0lIqz7
         ZEFH8dM0HC//87KyCOk0lD0H0ay121qNh49FgWHmIu87j/AYPfYUpCgkeru4iz4rszQy
         D3NzxqltCqtF2xShbmRy7m2OUNIYTRi0fw8NIoiaXx5uXx7KU4V8RinDhsV61be0efb4
         JM5xo6mJNT4HHfjLYEa9EdE1ToMzoHsjNpuj/6MBXLqru8Wd0S929QClluFwkYUhTqlq
         z8YZWCwjXGS2xKcNbhouvXrP1Cmjrx0ti8SeXdZdzvDk+QkFfA8HeB0CucDBwBdaS1vn
         mDHA==
X-Forwarded-Encrypted: i=1; AJvYcCUhbFTCagkaXpVTwiTT04UHLI6Y9zDqSTOnq8fB/nHx3dQAVorFkhTCfcamKFcWPUzxD5oDEGllqfsa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7hCzb8t0SqMcCFym9bBZ8ROIS83t2NOVxDm4XX0pkjHDZ0gn
	0G1WI08yjQEy14deDJA4ypArVwyUuUu8GySrHWoxTV7KuP0BLByoDjIxcXoXRIRip2un4I2jhqD
	dKtV+mHD9FvJZAoMAlYBri3vUq9lzaLyzrTkh9nt/pMX9zVjjIEbFy1EzKAI=
X-Received: by 2002:a05:620a:17a6:b0:7a4:ee81:b81 with SMTP id af79cd13be357-7a5069097d7mr907155485a.2.1724086381789;
        Mon, 19 Aug 2024 09:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM6gYVZPDs45ylp2PC1pdcluR4bdODQrU3S0OZZmC5BxWlFh+hxwevOPD/dWhGJl7MG9Gdkw==
X-Received: by 2002:a05:620a:17a6:b0:7a4:ee81:b81 with SMTP id af79cd13be357-7a5069097d7mr907153385a.2.1724086381333;
        Mon, 19 Aug 2024 09:53:01 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff01e293sm446579885a.26.2024.08.19.09.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:53:01 -0700 (PDT)
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
Subject: [PATCH 6/9] ethernet: cavium: Replace deprecated PCI functions
Date: Mon, 19 Aug 2024 18:51:46 +0200
Message-ID: <20240819165148.58201-8-pstanner@redhat.com>
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by
the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with the function pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/net/ethernet/cavium/common/cavium_ptp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/common/cavium_ptp.c b/drivers/net/ethernet/cavium/common/cavium_ptp.c
index 9fd717b9cf69..1849c62cde1d 100644
--- a/drivers/net/ethernet/cavium/common/cavium_ptp.c
+++ b/drivers/net/ethernet/cavium/common/cavium_ptp.c
@@ -239,11 +239,11 @@ static int cavium_ptp_probe(struct pci_dev *pdev,
 	if (err)
 		goto error_free;
 
-	err = pcim_iomap_regions(pdev, 1 << PCI_PTP_BAR_NO, pci_name(pdev));
-	if (err)
+	clock->reg_base = pcim_iomap_region(pdev, PCI_PTP_BAR_NO, pci_name(pdev));
+	if (IS_ERR(clock->reg_base)) {
+		err = PTR_ERR(clock->reg_base);
 		goto error_free;
-
-	clock->reg_base = pcim_iomap_table(pdev)[PCI_PTP_BAR_NO];
+	}
 
 	spin_lock_init(&clock->spin_lock);
 
@@ -292,7 +292,7 @@ static int cavium_ptp_probe(struct pci_dev *pdev,
 	clock_cfg = readq(clock->reg_base + PTP_CLOCK_CFG);
 	clock_cfg &= ~PTP_CLOCK_CFG_PTP_EN;
 	writeq(clock_cfg, clock->reg_base + PTP_CLOCK_CFG);
-	pcim_iounmap_regions(pdev, 1 << PCI_PTP_BAR_NO);
+	pcim_iounmap_region(pdev, PCI_PTP_BAR_NO);
 
 error_free:
 	devm_kfree(dev, clock);
-- 
2.46.0


