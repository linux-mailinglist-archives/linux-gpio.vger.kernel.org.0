Return-Path: <linux-gpio+bounces-8910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA29595C3
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 09:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 027F81C2098C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 07:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEC81ACDF6;
	Wed, 21 Aug 2024 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fiNdLF6W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8219259E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224767; cv=none; b=FD+fIr+PWkzHTRa/r8XZ4yq4Me0R4VSHJ7bK06WkSga8RUNnVVtIHj+FK6zdDZ0MDAdsczXLYycMD75ElwclqSoYGpsGhNUP4OfRT9SdgOgBNIg330TU7AbbZWrzxqITac8U+SqICcnRjN8hCmVZR2FaW1BKwLAf06euQ4+KMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224767; c=relaxed/simple;
	bh=Fc7LqA4dsnee2e9i3xlXjC/frSEy4rrwVedoLFfxfmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBYiArJfccni5SkyKYmLn5NSpYIBYTkWkzfff4JKVPco8Qw8jl//KTlwfx6qBlQ8kOleUr7YmNZfjttI6ax64fFHQBkAc8+UzCSZBbbLaB1PiLfYnVU6xi0N3lQBVCqxAZSpqgojErAXoeBLzkVqeJ80SvdsEo/HC9900S33kNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fiNdLF6W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724224764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
	b=fiNdLF6WhTTGpEm79li6PUv8RkglfkHcM3r7rbx8rcOFyVelK0yftII0/FGCJM3OJ+NI1p
	jTN6K3m/vo7wHGqq1bnDD+DKwc/z+2x0VWdX6Su6z3djo4aOD3f5NX39pxJOAuEJ/nM2Fw
	aRJWRebQzegYv3Ovf7gE4BRu48kCetA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-4hcv4NCBNoSKlKLkrOtC4Q-1; Wed, 21 Aug 2024 03:19:21 -0400
X-MC-Unique: 4hcv4NCBNoSKlKLkrOtC4Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a66c19d33fso201783385a.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 00:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224761; x=1724829561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
        b=BR+JxGsiLTvjbvqjZBp15VzqlCw0TW/R+HWWOTXn2gO49Wt9t8SVA6satRnZyB4ST5
         Gey2tghhmwaACh/FHQqowWRC6YPB2pBaT5+v4TW1petadkH5ZB1gql7tvyXmpM9JIImz
         mu0oBSrHbo4sI3xw2Hf959QGd+MQx/gnTECe6Pv5RuwwhxINam5YUgylak23HjRLV8uw
         Zx/bT663RYYBufu/4ypIlKjgTBWbpIQ6bwVcmZNxUWJLsPc6JeWCjyG3Qp7t+KXbFUde
         nms+cTuqt+Pe+YMCocO+6A923Iy2sK9D6Rs10NBVbImwIIfx5HiVUKgUukI6IQfL6G5Q
         wySA==
X-Forwarded-Encrypted: i=1; AJvYcCXHw7aj5br9b2gSeKmGnwfKKgOBFCawwQglde8bRk1CtZfIe4Wxnbgn7oES0lCiMDHYh/qj5Pnnd02Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzES+bdagsxSWwUivGU1HFqP8pJq+TkGhOlaX4KRRTNg4WpAUiw
	S5J7BrFrODPiDBfKyyJb6RMsDQL+bN5Ooc8nel60ChCfO5OMyz0BUBCrwYoTPLRzGJ2YYoYSf9i
	yGx4i7g7xWP3lh1S99hl9IQdU7jvysMx5jHg9TfSXu7S6QvAF1T2Y2LYgptQ=
X-Received: by 2002:a05:620a:1a23:b0:79c:130:452b with SMTP id af79cd13be357-7a6740bf833mr201728785a.47.1724224760974;
        Wed, 21 Aug 2024 00:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlHEduRbx+7oLWq2FWdoqLifqFviA1Dz0/eZWADNmQ+nKTULVnIfuczZLElQLlBGhubXgMag==
X-Received: by 2002:a05:620a:1a23:b0:79c:130:452b with SMTP id af79cd13be357-7a6740bf833mr201726085a.47.1724224760509;
        Wed, 21 Aug 2024 00:19:20 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:19:20 -0700 (PDT)
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
	virtualization@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 4/9] gpio: Replace deprecated PCI functions
Date: Wed, 21 Aug 2024 09:18:37 +0200
Message-ID: <20240821071842.8591-6-pstanner@redhat.com>
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


