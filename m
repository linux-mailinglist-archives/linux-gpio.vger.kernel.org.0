Return-Path: <linux-gpio+bounces-9514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D5967F6F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529821C21B6C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 06:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3B3186E30;
	Mon,  2 Sep 2024 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAg5CVsu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A031865FB
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258277; cv=none; b=C+mp2rdHaf+C7w/9AdTWomCtWiNn2Pla6KslXKxAeZYLI82+ITuJNqHqaFqecqvhr1DJoE/sXIhFauqvePE97aZj7pg0izmxNKo6au5KcL6OXbiqYgw16dj79jgwQ5QHpTibwlheYnqXOtpi9uxGqeMF9OsF6OwPh3eSN+7HUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258277; c=relaxed/simple;
	bh=nzy04PgDjxRp4clOpzx7ZwAQtwC8BOnrH0UdBVVoGHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNBPOAVz143NzO/0QbYJnfz4LztVmkXOGnWnEE4L32Ah9RJuFy3NJJBeHKJTKUqYdEkxscACycBN3cfKRA2z48nGWgYI9DachXYWhOsuYtcsPZi0nPhi9tY54lOoC/Spo8JGKQN1EOGHAt7WQtLpXPZjcoGMtlhzVYgVlieZwb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAg5CVsu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725258274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=osuRWDMAcWp5GKuvb2jQp7XxiFBFhqIKDkkqm4u4oTc=;
	b=DAg5CVsumCopzMeZnK3RuP4UIb67NO61OIFEVdn//bPvHvujNHwwFafb3ZqMNsYxKVtQON
	AravmhVKHR9JYENpEZBzycGsFAZ6SKhly7DthcGmFsN6MyV2Ia3d5otK5gWtT6FwynX9fE
	xOByABYfFRrCV8iypqY6r57kWI6Kttg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-gYzaRdSQNxiNBctS7mBdpQ-1; Mon, 02 Sep 2024 02:24:33 -0400
X-MC-Unique: gYzaRdSQNxiNBctS7mBdpQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7a802ef1e6eso700979985a.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 Sep 2024 23:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258273; x=1725863073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osuRWDMAcWp5GKuvb2jQp7XxiFBFhqIKDkkqm4u4oTc=;
        b=NmuRD2H9GcKOXadNybODkdCqLjDiJbfoxXT3sc4xL4t/cwKOLfpgukJQ1RP9h8B+ip
         73Dl8M8Vot5OonKaA9h5R6+aWdI9Zkan/xDfK0bnwTZ1c9nhe9mB9WsYOBNmaPvBNQbD
         HdNh7Q2yYpCL3C6VzQnkIum/Nht5hPCpUnmlXvQSVZEOx/04qJoD5nZ700z7Zn9hPKCy
         Aai1cwOmmdWlKt+LKD846JG5SvFjtzTwMnMOk7YGsbqRskSaFOp5s0BYk8CaWNsYnzya
         1WhWJx078cvjgzC5K6RH0EshhI+m/qepHZ4AG1Kt6QrEBmTOZstWxsLfzRNdqM+s7+Ik
         zkCg==
X-Forwarded-Encrypted: i=1; AJvYcCUCFa++3hIMcXjWuFfE8ghPOXIULqYMweiDIdGjv3R0q5+Xp51nKU9Xucyt1AWy9MEwL4+OZC8RfmYV@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEYrDzvDAHzHv8jcYVoLlAo6w1YKHhJu57vXsS/mkCYMHoahm
	5WI6u5IEGiVPeh5xaI56jfftU+CTQXkRQ0vqb1j4KGNTGFT5BnRWdQ8UB5XfzIVB9tsiEnQDiHW
	eBRX1A4RkyRGOYx8joTSjozalaR2Ck7W0FmeR+gp0oaECkecVCkGujfsH1Jk=
X-Received: by 2002:a05:620a:3951:b0:79e:f9f4:3e99 with SMTP id af79cd13be357-7a811ecfe8emr1725900485a.1.1725258273271;
        Sun, 01 Sep 2024 23:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEexv0y+qPfnTJJBqxCFNiKb4Lgt4+HkyzFHyOqMwr6MWuDLpzTLWaUJJYagADLPPfibqpGLg==
X-Received: by 2002:a05:620a:3951:b0:79e:f9f4:3e99 with SMTP id af79cd13be357-7a811ecfe8emr1725898585a.1.1725258272892;
        Sun, 01 Sep 2024 23:24:32 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3a34asm389211385a.84.2024.09.01.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:24:32 -0700 (PDT)
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
	John Garry <john.g.garry@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Philipp Stanner <pstanner@redhat.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v6 5/5] ethernet: cavium: Replace deprecated PCI functions
Date: Mon,  2 Sep 2024 08:23:42 +0200
Message-ID: <20240902062342.10446-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902062342.10446-2-pstanner@redhat.com>
References: <20240902062342.10446-2-pstanner@redhat.com>
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
2.46.0


