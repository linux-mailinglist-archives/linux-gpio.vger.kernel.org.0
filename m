Return-Path: <linux-gpio+bounces-11427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5D9A0612
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7991F22019
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58357207A1E;
	Wed, 16 Oct 2024 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKeE6e5I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3ED20721D
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072174; cv=none; b=rzqiarzNNaMMM8EwOCjWBtA6zy2taHdOUlx5Dm8C14/02z9iPi5LEDwmV5Y04e7X/rZT/MMYjbBig0GUMIfRWd1CWb6LElgRR4eOCpwi5UDVX/ci4JsPszn9luCLao1dobCmDIBqU8m0i7iP+4GH5sDDV0r7zugOYhALNQaD0VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072174; c=relaxed/simple;
	bh=IPYwte1jdHAl0RXA+w3cBwPZngFH1bdGCu0keKv5zz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmIuU44tJA3lG1/6y1AbdofR6MQPHnVbcGQzE6lKSiKHuy8uujsGUFarJhk1od+MwwYpVfWOj7T0Y5mMaunBHzcmE08bJ11U0i29NpeLxaz+CqKCmFTRUIdeFeiBxBkChpgVemXQs8zn3luejIftrhZdZckem9wmer+KVJHh5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKeE6e5I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729072170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fYrvd5koRqIGUA/KmbRFK2qg2itve32eBCe6OW52Vvs=;
	b=SKeE6e5ITXg11U/pV7v1AbaNbyd5jkhubtv6DTCU7yBawkAPCvNZIYxxSnZEHGWKh5aWL5
	JxiBR19NTXXz/mKLAkbsChEs6goHgxAnhC5IqHt+zpQWqi2pGwVVk+Ytz6Ukp2yGIpagdG
	7g0Qzgs+CSZ24PwTxLCoC+W8qJN0LOU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-pze9I55dM-i5FqIiBEVO2Q-1; Wed, 16 Oct 2024 05:49:27 -0400
X-MC-Unique: pze9I55dM-i5FqIiBEVO2Q-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4312935010fso34324905e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072166; x=1729676966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYrvd5koRqIGUA/KmbRFK2qg2itve32eBCe6OW52Vvs=;
        b=iM3krVOmToZAPqqlAmVhU+q8C2NNqrUOlErNlE6EdxfLLtHAg33AzfiIVhZ4YUqka6
         ORvDBooyIiIcARbFYy6ggQGs0iMUgoVz7KnlU8PXEHddTfKINT8y9f4NK2vNdltyjgXV
         o7mT7L1cBMEnUZcg7YC8m2YHhGTt2Tk7pnCCdJTFKAGugeSbcC8HU8eWRLPVPc6q7A6Y
         R96GJktej9H4asjFPDKz0MVcbQ1mWKeImc8pHmJzXw0/oRUEffrMzgmsYXk1Nn6F/6RP
         ULgWzDSa4+/iyUv+JRV5TQCWVgA5/Iu3K2y8e085TOZKwFtrIJpTGba3CsWJ2UuicgBi
         qYbw==
X-Forwarded-Encrypted: i=1; AJvYcCWEnAHnAYQKTPvaw7r3xB1tXjey8R5Kl3h+YG9//GJbzlJO/QIFDsGfVLipXdR6E3mZ4uS4HCLN6+dh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz204bt7jPdNeL+YD7Cm4w5gqnyDp0uDtIePolTF2wn+fQbdKUE
	ezJ/aKC5MceeGb+QPmpaGkQxdTCd/sECL/D9YVcl9vEQp1QQZSnMCn5N1JRbKI9rajQv63W+wHj
	VgxR8JuLUFYICNs/Lb4bjohBztglRLKRKGCUgvIxLYujg9PtlBEj6UWc3NB8=
X-Received: by 2002:a05:600c:19c6:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-43152a3db6amr13401285e9.0.1729072165712;
        Wed, 16 Oct 2024 02:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAkaJZ2lSkUiW+EXBvu4lsvkJ7W5vgIpbgoPIk0XAjxqd5XGQFT0XY1/aB9+8xJFuJprrz9Q==
X-Received: by 2002:a05:600c:19c6:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-43152a3db6amr13400915e9.0.1729072165229;
        Wed, 16 Oct 2024 02:49:25 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4314b32e487sm28190235e9.25.2024.10.16.02.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:49:24 -0700 (PDT)
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
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v8 5/6] gpio: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 11:49:08 +0200
Message-ID: <20241016094911.24818-7-pstanner@redhat.com>
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

Replace those functions with calls to pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-merrifield.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 421d7e3a6c66..cd20604f26de 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -78,24 +78,25 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
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
+		return dev_err_probe(dev, PTR_ERR(priv->reg_base),
+				"I/O memory mapping error\n");
 
 	priv->pin_info.pin_ranges = mrfld_gpio_ranges;
 	priv->pin_info.nranges = ARRAY_SIZE(mrfld_gpio_ranges);
-- 
2.47.0


