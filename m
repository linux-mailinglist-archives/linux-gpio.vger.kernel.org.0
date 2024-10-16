Return-Path: <linux-gpio+bounces-11426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B879A060E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260E21C22626
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C04B2076CE;
	Wed, 16 Oct 2024 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAMsMcQv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4246207200
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072172; cv=none; b=IB68P+nALRjtaO5RoZjUYP8WqHK95OlPOLs37SHYNydM+NywW2m6Tw/e5o0s9WR64yqajGUeR2EckFCVf2HXY9leMc85+nj66V0mwo7AfSAlY+9ToZbqjHKpeDmxMfDnU01snuZR5AckBr7BeQQKsNzq4d9KGy8HgoUMyPK8K14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072172; c=relaxed/simple;
	bh=htHW4nC4bbnEa+ZM/uajB/3THIEyeC3KtURYUab+gk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLEG+Olixe/z1FVtjMBut/lVcOYI13bOsZiNxVTyH2sS4TztHF3lCzlg5jZ1hGH6VeETdrcSj338fYVqOxMMpHTkJhPEC9LL8iOWU/gRhH+jFLvKd3TkRFAnIpXEjSovn2bRPFtNQgj+ae5wBFXkdzH9FrG9vfUA3MptU3Jm2w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAMsMcQv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729072170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAXbZXITqmfuNpuSA5zLMkRUqa2IYxNYDUv+NC55td4=;
	b=PAMsMcQvkUYrWUKsVAKMR6MQTkZoyqnVv3r/aJF9G3c9NXErptBNerPWDIO8MpT5T+C14g
	s3MMgb/IQ0vLPSwRSjbfQHE2FbYmrNR9gSjJhKwrJfUm7O44rAvmDi8+BaE/IpVhBhRgvB
	pMy8cY0iutaIIM0J5TMdA/LV7i380Cs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-q85A8bruNluFxLB09su4Lg-1; Wed, 16 Oct 2024 05:49:28 -0400
X-MC-Unique: q85A8bruNluFxLB09su4Lg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4311db0f3f1so34234165e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072167; x=1729676967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAXbZXITqmfuNpuSA5zLMkRUqa2IYxNYDUv+NC55td4=;
        b=UHUpWC0BS0vYEr8ygdlzxRWjPpq5Tnp1pXB0CVsGvdfBK57GDz8Ud6sWsiJzReI8UC
         zwh05fcXs+jpZv4Mmelbet4iH/XdPXXtvIXx25DM1O7sSZAYqkXNiLjcUyRPQLpdilLC
         pzhBBMIaCfIrT+/tyaU47ZsUfG2aoxPctWUTlQFZ+5Qs09REh7LsZNSuzKZSfxn2p9rh
         zhfnneTukN3hrd3UH6bwRdcrZnOm1bkgwVo7kQIIf9zo+Nb1rQadHz9BDeK70/sdD1ba
         ExfuhhOrSI/VDMUJgLW1DnpF2otyLwgmAVYG49MtNZlZ8GDJLfm+LxZKWX0fRJ6N2DzK
         HR6A==
X-Forwarded-Encrypted: i=1; AJvYcCXLl6FGMuyA6aJu2XqeaYFZrgV5c13yl3oRR+PWe97ieOeKD3rXExrEwDp1IogOkILfIaTkmgxeKeCo@vger.kernel.org
X-Gm-Message-State: AOJu0YwqAjpdXgyvRSYuXavx/00o3q4s+GMKVTTZ+VgssyuH0ZsEPZcq
	zbmNfsydd/Lrn3eKFlsMdXig575DxId9e5DBGBkjshOskhnhTsJZmc0G9R7pyRMrs+pkpKwwLyE
	74JjL/IwUTLxE/+G5jf76SZo6/ERXYhG9eRW5om96EnqyqnFZbH/fuRec6+U=
X-Received: by 2002:a05:600c:1f8c:b0:42c:b220:4778 with SMTP id 5b1f17b1804b1-4311df5c639mr160032775e9.33.1729072167203;
        Wed, 16 Oct 2024 02:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmQuyn8hv0hBqxE0+BXi1ZnR8824mqMCiYlhK9JU94GmSaFPjJpOmCYUVQWoBnqBXMHnWe8Q==
X-Received: by 2002:a05:600c:1f8c:b0:42c:b220:4778 with SMTP id 5b1f17b1804b1-4311df5c639mr160032565e9.33.1729072166725;
        Wed, 16 Oct 2024 02:49:26 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4314b32e487sm28190235e9.25.2024.10.16.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:49:26 -0700 (PDT)
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
Subject: [PATCH v8 6/6] ethernet: cavium: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 11:49:09 +0200
Message-ID: <20241016094911.24818-8-pstanner@redhat.com>
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

pcim_iomap_regions() and pcim_iomap_table() have been deprecated by
the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace the deprecated PCI functions with their successors.

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
2.47.0


