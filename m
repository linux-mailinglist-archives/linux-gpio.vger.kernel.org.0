Return-Path: <linux-gpio+bounces-8984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0295B73C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 15:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1238A1C22AE8
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 13:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6449A1CB33A;
	Thu, 22 Aug 2024 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zotl45c1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE131CC15D
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334489; cv=none; b=dnlzfglIo2L/JdjJpv7Y9HRn/YTiNOd8SgEP2feEBSj+lzGpXQ7pNOAizIY+QtT80lecvDxXRrX9wd6fK7Iz7QXAFksxEZYucS9i5kX5zqS4aot2N3nxjneaTVcBoBbQkV3mDMHo638YINhIufdUKTUaHnr2awPYZLreIXgeMiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334489; c=relaxed/simple;
	bh=Fc7LqA4dsnee2e9i3xlXjC/frSEy4rrwVedoLFfxfmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhFtPATDEGEFPVCU0fA2V4Q9X2LMUXFiEPbTGqJAZlkO7uvHXMr/PA8YkifU9b+3VmeqC0O7dZarhpQmB9Lwl/prVgvCCTo7ylUND2cNx3UnYJO6ujXLfGKaqSNIC0NVZjf7nn5YThGFaHOWV1j12jj4BzVPuEjoKrhyeCBPgeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zotl45c1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724334486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
	b=Zotl45c15X0icBSVeARcTnnFrvrgBtMHS2ozyLDXsTjyPqJE7iY1JWAHkb8Blgtc6FfPVK
	YSMQ85LzwO16ewP+gDArdzYc6f+6tXABwh+06cpBHqOuOsV1bboa5zYHvwiPiVP2pu5Fvo
	bwJAg7XcNf/kXSXDYDVKgWI8/Ryi8M0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-po5KqWsOPUa3nobhRs-VgA-1; Thu, 22 Aug 2024 09:48:05 -0400
X-MC-Unique: po5KqWsOPUa3nobhRs-VgA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4280c0b3017so6481405e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 06:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724334484; x=1724939284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
        b=jaXK81bujJec5pyS7xg92Y0NebhBoXx+uZ3GY7sXfqM3MGnKOGTXthXBqExFFeXdE5
         SV4fbq8ZBKC2qgVuKqt8baq0P6WnGejp9EELDhgGElUyimAWabrOdNY5DpSrHopHYbuA
         /To82s2ozRn6T/yhYngEJxrGhz8Yn3TU8p2jxCgahMIxvr3LUJfSkvOxHxnDSu2dUy29
         h+R9coUW662o3Ax3hFcZYaTHCEzzRCIrEcA5TEHcQ5SIQ1hrw82WipWfsxX3sta3P5KG
         vdZcDQnDBJHHuWIXSIYPH543bz7lLheX1n7noPgnaO2VZGArtHpWCiqztFqYoALcSR9p
         J5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU6r5TRuc/Cu+lTx8Pye4aWF63AvD29/hhmPQbDL6DF02cuANCyVdY8p74m7Hd/6djPBIY2JdVifat@vger.kernel.org
X-Gm-Message-State: AOJu0YxYsvkAq3q81AAntuNRA55pMME5KcAvyPtftCiiMmhnbrGbLqx1
	lCym7l1DYBJAZWQLLZweCnSXuJgwCI46G3Q6onZ3oo56hBpPt8k5EcCIrbAMCw4tFpJNMpMeO6p
	tSEuFNM2VWyX1bacaIHU3diLHO3SkmjXhQCUHzUA7vNqCiEOnUTUphXLOi5M=
X-Received: by 2002:adf:f802:0:b0:371:8c06:82ee with SMTP id ffacd0b85a97d-372fd82c3dcmr3699798f8f.49.1724334484240;
        Thu, 22 Aug 2024 06:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/dGSNW4Q5J8zIjht7W8w6lm/DRlJe50ZIJE1uWbGQpR5tL77ENnUxbm6ccKv01r659J3/tA==
X-Received: by 2002:adf:f802:0:b0:371:8c06:82ee with SMTP id ffacd0b85a97d-372fd82c3dcmr3699770f8f.49.1724334483816;
        Thu, 22 Aug 2024 06:48:03 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162322sm25057215e9.24.2024.08.22.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 06:48:03 -0700 (PDT)
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
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 4/9] gpio: Replace deprecated PCI functions
Date: Thu, 22 Aug 2024 15:47:36 +0200
Message-ID: <20240822134744.44919-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822134744.44919-1-pstanner@redhat.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
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


