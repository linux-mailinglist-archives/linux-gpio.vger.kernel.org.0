Return-Path: <linux-gpio+bounces-12424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBB9B8BE5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F6C2B211EF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 07:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1154C154BFC;
	Fri,  1 Nov 2024 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uu6SeCRc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6321547D8;
	Fri,  1 Nov 2024 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445335; cv=none; b=cyPYVmU7gWzmDEXXR2iiFFGsVU/LvI8BAPzu2RwQ/1ABago3mY6bjYb/p8273yGDrQGGTQvaPwQZY+4MXBizQ8rhuWrLGHIhcYVN4wEZ6ep82rUbkIF2vxOiMuYvlfoikfJruVE9FYSuOOVJQFoOTIaGoDZ18U9hoIisdXXIAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445335; c=relaxed/simple;
	bh=Sjm00QEBvrr9+gjMgcJgKfjF19vL6wR3gvmB25nW2BA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEtGQaUVAjT3VrJNEOnmkRcRGFAx+PqDWmBBGg1Ek84N2ER8HCkup2mAm1PsFNhJJ+CkMLWJajh1qHDAO4E7woEKhf+VigU4/pbXw7/q5FZRNTm6EGGTMWZRyogN4WFClcqPaSf4cjXQMF4Nc7m8n3PE4aSjFxef4nXuzTk2Z1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uu6SeCRc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F4EC4CED2;
	Fri,  1 Nov 2024 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730445335;
	bh=Sjm00QEBvrr9+gjMgcJgKfjF19vL6wR3gvmB25nW2BA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uu6SeCRcgueAUbZkWKfHjLKBhxMxFKAgZ7mbRGEpmOtfYkenpUNRtqA4l4YPzbAms
	 XgxDF2c41+p1tHOB2Okr4jGPOkc+J5wmgIs8mJa1HkS+5RGWtdCACsrQ07e3+kvKSV
	 QvbPt2TQio9GsIq87Pnx4q9BebriZlY70abjU8ZmfE6fZCwjiVuKnU06BfUox+IZy2
	 omBIDCccUzow7H1cWKRZ1w6llV51GfNUK8epT1afy+U65Nxeg3NcjrWy29wMc+AI+m
	 tLNOalpJe/vOpVBd7md/KmywvmqZDnqKfnOKYSHzNYM0h2Zm4mTq8Euo38kzfjAAlL
	 iyszSq5kiZFOw==
From: William Breathitt Gray <wbg@kernel.org>
Date: Fri, 01 Nov 2024 16:15:09 +0900
Subject: [PATCH 2/2] gpio: pcie-idio-24: Replace deprecated PCI functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-pci_iomap_region_gpio_acces-v1-2-26eb1dc93e45@kernel.org>
References: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
In-Reply-To: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=wbg@kernel.org;
 h=from:subject:message-id; bh=Sjm00QEBvrr9+gjMgcJgKfjF19vL6wR3gvmB25nW2BA=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOkqDSKXc9bc4/ilt1/eJPl/9AoxybeJ1f+YnqkU/pZK4
 dS/6vWoo5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZgI3xxGhguqJ9X+v3/k7n3s
 b9ti92BOyRUH3DR/JCwwlHg4qe71p5OMDBPVXjv6bVgQ67w8tWG99umcZM9dFrblGgtUjYKPvOc
 O4gIA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

pcim_iomap_regions() and pcim_iomap_table() have been deprecated in
commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()"). Replace these functions with
pcim_iomap_region().

In order to match the rest of the code in idio_24_probe(), utilize
dev_err_probe() to handle error for pcim_enable_device().

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 drivers/gpio/gpio-pcie-idio-24.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 7f7f95ad4343d91de13b5c32936bc132f93d6a68..80c0ba0afa672d276d553787fdc499010d4619cd 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -305,19 +305,16 @@ static int idio_24_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct regmap_irq_chip_data *chip_data;
 
 	err = pcim_enable_device(pdev);
-	if (err) {
-		dev_err(dev, "Failed to enable PCI device (%d)\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Failed to enable PCI device\n");
 
-	err = pcim_iomap_regions(pdev, BIT(pci_plx_bar_index) | BIT(pci_bar_index), name);
-	if (err) {
-		dev_err(dev, "Unable to map PCI I/O addresses (%d)\n", err);
-		return err;
-	}
+	pex8311_regs = pcim_iomap_region(pdev, pci_plx_bar_index, "pex8311");
+	if (IS_ERR(pex8311_regs))
+		return dev_err_probe(dev, PTR_ERR(pex8311_regs), "Unable to map PEX 8311 I/O addresses\n");
 
-	pex8311_regs = pcim_iomap_table(pdev)[pci_plx_bar_index];
-	idio_24_regs = pcim_iomap_table(pdev)[pci_bar_index];
+	idio_24_regs = pcim_iomap_region(pdev, pci_bar_index, name);
+	if (IS_ERR(idio_24_regs))
+		return dev_err_probe(dev, PTR_ERR(idio_24_regs), "Unable to map PCIe-IDIO-24 I/O addresses\n");
 
 	intcsr_map = devm_regmap_init_mmio(dev, pex8311_regs, &pex8311_intcsr_regmap_config);
 	if (IS_ERR(intcsr_map))

-- 
2.47.0


