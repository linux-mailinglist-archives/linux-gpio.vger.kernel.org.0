Return-Path: <linux-gpio+bounces-11267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B399C229
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50946282147
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC015747D;
	Mon, 14 Oct 2024 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E+0MSFvU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D4156886
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892428; cv=none; b=G3A4nTTOF3q5m1suSY68erJe5x1bYi5ngrToX4o9xNijVA3ROOE6gW97LrZBr8KurAjVTtl1nK9lyNgT7vuZSN95CfNn4HluPqz6H1K6M4uHC4BVNrvqqWw8PwkbdoiJrJr20PzshihaqFpD2ZvfWxlKBDr5/BY5w6+OrrCGCFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892428; c=relaxed/simple;
	bh=nDMOGSQ2XtB3JrRu0EJ9o56SNXK6RwOh++m09iUxd1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnEvDI/MW/1UH2uV2Sl7VrClUfD1upCK9iBLRBlbLwtfAbQe1CUZJJM5OpoOrTIMp4rQrbFs8P+/OPUR+gReZHfFleq4LTt7p1R5vDn+CwxFts7CShZ2kg13fukIgg/ccaZEH0GxjUpdw5xSrbPOFdDBVpwALkChsfjXD9jRoYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E+0MSFvU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728892426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OVHqbDsKjJZaqCqMxaVmR0wTbzvoxMvtns9x4ea75c=;
	b=E+0MSFvUoW0z5PNWvXHkPNR23a5QpwM6ocZm0qD37cHIWEJvmgMqXwNo8sWY4QuC4W29ga
	m4UJDTKMzmBYBFojEp4jJGpt6lDE+G1NfexoMtixgGUd8YTljnHwM6IK6jmDRY1zx16UiL
	dqdN6NIJ4Wd6eagkZaeYPoQNpJQNylc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-MulSgTzPPmyB1mT_ln_lfQ-1; Mon, 14 Oct 2024 03:53:43 -0400
X-MC-Unique: MulSgTzPPmyB1mT_ln_lfQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a1b872d8bso6385466b.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 00:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892422; x=1729497222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OVHqbDsKjJZaqCqMxaVmR0wTbzvoxMvtns9x4ea75c=;
        b=j6ZO4VMGbPrt/SJ0zMydvIah50HzHDau2liS5X64F7R0ZhLNvoM45nwl+BqqNzaPnQ
         0ARDPtca9AEp5VvQa8iHl0M83H1pfmW/StQfWTL4VMbGB9MjGkkTCBR9PcszWzwgg6/Z
         ymu7hmbwo4B0Xqztqwg00gXneRrnVbi8tHZ1JJa/Cd/vH7Sbr8SwyZ8iIq/MSzrxeCZ4
         AymD4z/XO2uLnyd/gMvLkJn+owFsHq8sPnpLKHOCBAjiCF93dgOv02psiW1L6hiuUA/u
         TEqjTpbNm7aGoFijrSZAkoqex5fzo2JntxTA/GWfpikytbMKSnr/05oCJDHNsYra+Guc
         4yWA==
X-Forwarded-Encrypted: i=1; AJvYcCXoXH0lOUkOSw+a56uYBW6q3CFCXo1K1FybzBtHmFaAZUZAPeddYF2WlHFQP0zxy0ZR3NlMXvrPVQRh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz36/bjVb41B1Jm0AajwMLgwo23fX7B+fQULGmfRxRlM737l1H
	/vG+LZz+Hg065w4huo1B7xsFlrSBrfAz9DcWg2yEjo0TzHwMgWq/X44CUixsbvQVa0liba33sl7
	YrfCh+NtCdIC3GKmovz6kr49zSYn+O/OFSbVJEQe24NA5wpDhkwbMhiFd+KE=
X-Received: by 2002:a17:907:3a96:b0:a9a:183a:b84e with SMTP id a640c23a62f3a-a9a183abb4emr54361866b.40.1728892422210;
        Mon, 14 Oct 2024 00:53:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8RdNLydaZorD0CCxm2b4SOOSEXdTQ49hlT5/qPmabsGXJC6XJB2cZBBIAjLdsQqSMvFgt4Q==
X-Received: by 2002:a17:907:3a96:b0:a9a:183a:b84e with SMTP id a640c23a62f3a-a9a183abb4emr54360066b.40.1728892421849;
        Mon, 14 Oct 2024 00:53:41 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82d3798001d5778cfc1aeb0b3.dip.versatel-1u1.de. [2001:16b8:2d37:9800:1d57:78cf:c1ae:b0b3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f86fa986sm243291666b.92.2024.10.14.00.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:53:41 -0700 (PDT)
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
Subject: [PATCH v7 5/5] ethernet: cavium: Replace deprecated PCI functions
Date: Mon, 14 Oct 2024 09:53:26 +0200
Message-ID: <20241014075329.10400-6-pstanner@redhat.com>
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by
the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Furthermore, the driver contains an unneeded call to
pcim_iounmap_regions() in its probe() function's error unwind path.

Replace the deprecated PCI functions with pcim_iomap_region().

Remove the unnecessary call to pcim_iounmap_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/cavium/common/cavium_ptp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cavium/common/cavium_ptp.c b/drivers/net/ethernet/cavium/common/cavium_ptp.c
index 9fd717b9cf69..984f0dd7b62e 100644
--- a/drivers/net/ethernet/cavium/common/cavium_ptp.c
+++ b/drivers/net/ethernet/cavium/common/cavium_ptp.c
@@ -239,12 +239,11 @@ static int cavium_ptp_probe(struct pci_dev *pdev,
 	if (err)
 		goto error_free;
 
-	err = pcim_iomap_regions(pdev, 1 << PCI_PTP_BAR_NO, pci_name(pdev));
+	clock->reg_base = pcim_iomap_region(pdev, PCI_PTP_BAR_NO, pci_name(pdev));
+	err = PTR_ERR_OR_ZERO(clock->reg_base);
 	if (err)
 		goto error_free;
 
-	clock->reg_base = pcim_iomap_table(pdev)[PCI_PTP_BAR_NO];
-
 	spin_lock_init(&clock->spin_lock);
 
 	cc = &clock->cycle_counter;
@@ -292,7 +291,7 @@ static int cavium_ptp_probe(struct pci_dev *pdev,
 	clock_cfg = readq(clock->reg_base + PTP_CLOCK_CFG);
 	clock_cfg &= ~PTP_CLOCK_CFG_PTP_EN;
 	writeq(clock_cfg, clock->reg_base + PTP_CLOCK_CFG);
-	pcim_iounmap_regions(pdev, 1 << PCI_PTP_BAR_NO);
+	pcim_iounmap_region(pdev, PCI_PTP_BAR_NO);
 
 error_free:
 	devm_kfree(dev, clock);
-- 
2.46.2


