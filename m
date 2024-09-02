Return-Path: <linux-gpio+bounces-9513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E7967F69
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B05691F22537
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 06:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EDB1865F3;
	Mon,  2 Sep 2024 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P4r7jA2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C8185B7F
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 06:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258275; cv=none; b=AOPCyQNbszBNWvceF+oRQ7fU2JjQ+9ybRBnSQ7mKGKk9dJ3CIlRiK3BNKtQHumepAHEzmlzDpZ1fLKg3wSZ2EoGRe4dJlPV8DQIJ/3SIM01EbB4UiR55BzHMEgQhzSYle5MRGDE/PoCQolpZonNxZZkw8a+8W/NjfeS8iVtG5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258275; c=relaxed/simple;
	bh=Fc7LqA4dsnee2e9i3xlXjC/frSEy4rrwVedoLFfxfmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILShz732M7oMiu1cqvHJcR2JiXVQQ5I1w5gYxIrFl6nLIprd73DFR1K5rRaEoVqHZQogVdYc1E9EmsJI7OrwShflYUsQ3TP07Wgw9dGQFL/7LNVZ5RyvkCKO/FHeFvfPw2raFTKAOzl3OOZFL6UjJdhIw+amIutqovlneU0sYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P4r7jA2Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725258271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
	b=P4r7jA2Q1KAHjsmkQDCMyioXqUbd4AjDGo9s86C3tZUoA4SbFOTpnw3KQcQiCG+LqN2QaU
	wzFpK8fkmeRFoiooqQ43y/cFE1YjD5ulYANnwExNgo9jlctvCRb259z6h8y988tm2Lj7vf
	Umbw49z9ru96Ow/Vd0MgeDrz4DP84MM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-SwEU_YwlMlCvNNhc5o_POA-1; Mon, 02 Sep 2024 02:24:30 -0400
X-MC-Unique: SwEU_YwlMlCvNNhc5o_POA-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-846d4fe1ef9so150011241.3
        for <linux-gpio@vger.kernel.org>; Sun, 01 Sep 2024 23:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258270; x=1725863070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H9qQSvRoJEHuC9fzeIRZ7nyD5NIc+bT7koxtRIZd8A=;
        b=wwfrbWfYJ1FjPlNTNr0DykTsarRsCPHFuDGrSiQ/5j2SJmdFQF8XZIeaYUiaubAkYS
         RV/wpCtGh6vOL6AycMjorEE+dmOi7idCGvGDhwp05GjmBjUv13TodxAjEcu5EHPSYFGY
         RQBlEPnmFOKLMq4GjbhoXeCPPOwzC3rjeoZ3y0FdG1uDCK9ktOxDnVRJdps0+M5bKWvv
         y5t+iz7fPwlm6J9Dbm/kT0A9m3gZGRGcmHnp3F19illHpDcnpWSwWy4jMNc7d7JH/Yfk
         ag+ErOzD8h6ATNiABlgu/uApMdAZE9MhzOSnctor47PkoxuZo8qbUj72SdPdJsEG6laC
         cTew==
X-Forwarded-Encrypted: i=1; AJvYcCWDXizXuNTWi2W7OjMe8R/j83GEMXOBDVN8MvURP2zLyKP9u4byk+WNnHdLog0C2uQpAdKxxVdFXd7J@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1go2tzwN0Z06i5RRZmH2oU5GlLiksHBX1dn++CAZZmrmYGBt
	Ct880Cc8mvXiZkJiyoug8vnRYZ7url8LUu/FBzPuTuELN1P0sZlQE3Pke9AMesTNlLutM8Bp2yo
	50LA1GVjCWGoBWzWlhVPl80AN8ZvBT55oxNTMLgCdv1mglDUB4xBKp4dKM3M=
X-Received: by 2002:a05:6102:3e89:b0:498:ede5:b20f with SMTP id ada2fe7eead31-49a779a41c8mr7270563137.19.1725258269940;
        Sun, 01 Sep 2024 23:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvKk7L/2Q+f5ePTEDKBoGd9wpJAI1J/cRLRuOI8ztSXLRi4Uiggu4Svtva7Pn5OPFtOZyMyA==
X-Received: by 2002:a05:6102:3e89:b0:498:ede5:b20f with SMTP id ada2fe7eead31-49a779a41c8mr7270533137.19.1725258269592;
        Sun, 01 Sep 2024 23:24:29 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3a34asm389211385a.84.2024.09.01.23.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:24:29 -0700 (PDT)
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
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 4/5] gpio: Replace deprecated PCI functions
Date: Mon,  2 Sep 2024 08:23:41 +0200
Message-ID: <20240902062342.10446-6-pstanner@redhat.com>
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


