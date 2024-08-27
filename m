Return-Path: <linux-gpio+bounces-9234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AEA961771
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB1B1C23648
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24F61D45E9;
	Tue, 27 Aug 2024 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CY3wKPh1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8171D414C
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784992; cv=none; b=SYLgFyAO9ZQN/IakkNdAH4GG0FFrFVJlavRLxssGCokAWY1dPEw3spmU0EnFCWnD6ozmtPSPMidnXV/2lAvhqbfOixqRHJLHuAPscA8o+q0n4lMHgZRWY2V76FHfzfG4coaR5kbnVKpoXDM9xLW7dn/70AUe/wxkMfHgUNR+f6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784992; c=relaxed/simple;
	bh=Fc7LqA4dsnee2e9i3xlXjC/frSEy4rrwVedoLFfxfmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMIxE90OM5mpEeoKaspWo3o+LUzrADcLFBH5Trsq4KqKbB9jPQJizqt0UIPKQtChW3KffoPq8bW4iDTAC6FAFp/lCj5rnGbLWfjyekTHFDdlJGNjFrkvK6V5dWAQ9otJqpGc5oq7ISHRZlvJoLm+brbR8SH2ShTxkU2BBlEAXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CY3wKPh1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724784989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
	b=CY3wKPh1rKk4tPoqcQyErpLK3+ZIqJCH7Yq67p3QuDanWTRikxjQeTd+eDBv30UzRpkd2/
	5cjmNfhnpkjZri1S1bxkY5meXQ1ZqRn3BA/KEhFDjVCcmjWPE/Mkjlm0+QeQJVI9Im1gr9
	ILs7ZQmArz60vEkgt1OaXwH3/kBDmGw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-P28sxT6QNOC6LGiZWjD3PQ-1; Tue, 27 Aug 2024 14:56:28 -0400
X-MC-Unique: P28sxT6QNOC6LGiZWjD3PQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8677df5ba1so543531666b.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 11:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784987; x=1725389787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
        b=R1ahPUlaBq8RRpRGTZ1Jpiz1j0xkv1GaUVFabBLYNIorK7jFZcd04xKP2dOsP/aLEE
         m5K2faFzrAqXrBkxc0wqTclUrSoWAzQXIhlNyJQCT0mzKQDSgU30xThM6F1SRhagm08U
         8kLoNxn+eF6XGLp8cmggC0y80fHV90+httXKJ9xkMH9IR/pZtB1F0FWrh8sCly+T+y15
         aykYJSSb+M9bw+N5EeQnY9kFq19x698Lakd3O7wPpk7I/W6N/ueHQ2ith0eM+xJ1+/oE
         dYz+xh9kVFsP6JjFCmY3pazM7R5VuR7s1vMHQJyXx7Yn3jCZcAo7IHb6UWR3kSrW6whe
         qYKA==
X-Forwarded-Encrypted: i=1; AJvYcCXJLhneyG1EtuBG3er/xuYyUS7KO5YpIm/8a1MwSd8VM/SARXdnDZ5orX7lwxGSvU3DHLG9jaClKLC+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmu+RMFQXS5XMnsK7Pw3f9VyzG0PIKIZ6LYV3fYTgRDi0RmieC
	nZygF0zWJe0SRMGNEBJnPw1Eq805Lb7DLLu/sm4gkxn/tOqvWshOJbK0aF2J2BsOxaOh2MavuuN
	MQG3uTcZWgNVEiyfn39VHngfZxzPH/4lghcVIRrKr9sXbS9UljzfnaH6ETTs=
X-Received: by 2002:a17:907:1c18:b0:a86:880e:eb7c with SMTP id a640c23a62f3a-a86e3d4d268mr222024766b.60.1724784987126;
        Tue, 27 Aug 2024 11:56:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGSDqS2TZbtJE8cSGpMf7ENec796YeMAplFL1fwkmHHmNQCeEVuMFIsH34dzhyzm3h6h9CQ==
X-Received: by 2002:a17:907:1c18:b0:a86:880e:eb7c with SMTP id a640c23a62f3a-a86e3d4d268mr222023366b.60.1724784986665;
        Tue, 27 Aug 2024 11:56:26 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549c4e9sm141473066b.47.2024.08.27.11.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:56:26 -0700 (PDT)
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
	virtualization@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 4/7] gpio: Replace deprecated PCI functions
Date: Tue, 27 Aug 2024 20:56:09 +0200
Message-ID: <20240827185616.45094-5-pstanner@redhat.com>
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

Replace those functions with calls to pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-merrifield.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 421d7e3a6c66..274afcba31e6 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -78,24 +78,24 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	if (retval)
 		return retval;
 
-	retval = pcim_iomap_regions(pdev, BIT(1) | BIT(0), pci_name(pdev));
-	if (retval)
-		return dev_err_probe(dev, retval, "I/O memory mapping error\n");
-
-	base = pcim_iomap_table(pdev)[1];
+	base = pcim_iomap_region(pdev, 1, pci_name(pdev));
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base), "I/O memory mapping error\n");
 
 	irq_base = readl(base + 0 * sizeof(u32));
 	gpio_base = readl(base + 1 * sizeof(u32));
 
 	/* Release the IO mapping, since we already get the info from BAR1 */
-	pcim_iounmap_regions(pdev, BIT(1));
+	pcim_iounmap_region(pdev, 1);
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
-	priv->reg_base = pcim_iomap_table(pdev)[0];
+	priv->reg_base = pcim_iomap_region(pdev, 0, pci_name(pdev));
+	if (IS_ERR(priv->reg_base))
+		return dev_err_probe(dev, PTR_ERR(base), "I/O memory mapping error\n");
 
 	priv->pin_info.pin_ranges = mrfld_gpio_ranges;
 	priv->pin_info.nranges = ARRAY_SIZE(mrfld_gpio_ranges);
-- 
2.46.0


