Return-Path: <linux-gpio+bounces-8912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF49595CE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 09:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6A0284CA3
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 07:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414371B251F;
	Wed, 21 Aug 2024 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NOwDeYA8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8EB1B2505
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224776; cv=none; b=CDS+DklgHw2pxZERAZcjzPuzDBnr9a3wMXgWJ1FUR6ec+Ue1ZU0XZ8DEB0mC+Nu//+EQrZWyXnLrgdbJ0VbwRfUD322A79y1C53SiBZWekCa2VgF0xzkyY2jIh7Mr2HM0zym7aKo//9lZUSJFUfrfR2gbb4uzc0pJTTp8QGggN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224776; c=relaxed/simple;
	bh=kigVrUGzwAc3Gfl0QApPC++gUgBQlYDwvJKklnpQh/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKruQoX0rIEgmR/nry1vyAlJfb7SOZuJ4LtBBaYS8lW2eqp7OdZ2yklKAvMV7v4qKXv8lyVPIVj89B5qyKkSEgfJWSloFkSV//qNAhXe/rsP5/NAvZTc20VEBf1u7OLcVeuWzwQxt+d4KQsFp0ddHjWrSbNrRK2PsFntBQqhFx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NOwDeYA8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724224773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEnCsYi4V2PnChy33tc28SWivSiMlK/Z32Tet3XvGFE=;
	b=NOwDeYA8n8EUITz8/l3S9e1zr2pqDXXDbpxrO3eBq5GG9drgNzUwVJnoaCg6ImwpwTe2Dt
	WvRYXL6Xd3F4/vgbic5XS5BpqnG/PoHhLufZQ9iYvvQgrOrjzd6Ge/BWGAMH2AsSgAS1oT
	rsPReVoCVmFLifFJultAgTf8LPcR0zs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-ICYz3MJtPRKguPi3IHjuXg-1; Wed, 21 Aug 2024 03:19:32 -0400
X-MC-Unique: ICYz3MJtPRKguPi3IHjuXg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a1dc85c14aso720246185a.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 00:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224771; x=1724829571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEnCsYi4V2PnChy33tc28SWivSiMlK/Z32Tet3XvGFE=;
        b=L8lmYjWu3yJAUJpvGfU2BLk/0bt73zPBIdmt41oGcYhb41Ohp+Um0GQC7hdIiBxYkq
         4gHBj4gElf7kq/9j537Sx7cnJsyt4oCXcS7a4FT7bXNBWc/fJ5lldfQkAPCEXqHjajb+
         lTkosq29PimL0EDb7Mkkk9X/CJUknoFmT66JHrWTnlmDQZ+AKix+YII8ho8mqVPyKEPt
         zwtNrTHUuMVwif887Pfb+BKiJhDGRPVG3Gh9xVheLpoCypbjteEjrVrLfjV49nylKZDb
         EUjoSRjj/4yBQ5+/VTqVKbAtUK8QLrv0sf7e+7eBHshDf4bIXkTXZdBsq0+P2TjyMaGv
         ZFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJV3hdQQitCX3EU+dJYhvonN/3Gb/XxVLzu0u+vYjtqvdF9zYxqZRHPs1Rnr1c6J1BshIMYbfmFD5U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywere15OHv7Vg+aeTG8Wn2FfLNYQI/0oLkNI1Aw3yRLXqk+iZls
	W7Y3quw0snh2ZNUKFdqCdIzs120IhoN9MKEzzMFoFHIlK+S9jmhjaGP+dLjjfYx86r7oKQTGDB3
	zcwIm7/QJ+2wpwB8rKw+UES9YEJTmfttTIEgRTZr6XttMXWbed/QMeLINJ6Y=
X-Received: by 2002:a05:620a:bcb:b0:79e:f821:aae4 with SMTP id af79cd13be357-7a67404c462mr211950685a.37.1724224771401;
        Wed, 21 Aug 2024 00:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLoW1uWJUMYC+jXOMYEg+1mtX/so2VDO80oVrajYa3fYbYG1AcKfTlZLCcLcpq57M5A2EQTQ==
X-Received: by 2002:a05:620a:bcb:b0:79e:f821:aae4 with SMTP id af79cd13be357-7a67404c462mr211947085a.37.1724224770943;
        Wed, 21 Aug 2024 00:19:30 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff013ef2sm596207885a.11.2024.08.21.00.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:19:30 -0700 (PDT)
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
	virtualization@lists.linux.dev
Subject: [PATCH v2 6/9] ethernet: stmicro: Simplify PCI devres usage
Date: Wed, 21 Aug 2024 09:18:39 +0200
Message-ID: <20240821071842.8591-8-pstanner@redhat.com>
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

stmicro uses PCI devres in the wrong way. Resources requested
through pcim_* functions don't need to be cleaned up manually in the
remove() callback or in the error unwind path of a probe() function.

Moreover, there is an unnecessary loop which only requests and ioremaps
BAR 0, but iterates over all BARs nevertheless.

Furthermore, pcim_iomap_regions() and pcim_iomap_table() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with pcim_iomap_region().

Remove the unnecessary manual pcim_* cleanup calls.

Remove the unnecessary loop over all BARs.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 25 +++++--------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 18 +++++--------
 2 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 9e40c28d453a..5d42a9fad672 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -50,7 +50,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_resources res;
 	struct device_node *np;
-	int ret, i, phy_mode;
+	int ret, phy_mode;
 
 	np = dev_of_node(&pdev->dev);
 
@@ -88,14 +88,11 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		goto err_put_node;
 	}
 
-	/* Get the base address of device */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-		if (ret)
-			goto err_disable_device;
-		break;
+	memset(&res, 0, sizeof(res));
+	res.addr = pcim_iomap_region(pdev, 0, pci_name(pdev));
+	if (IS_ERR(res.addr)) {
+		ret = PTR_ERR(res.addr);
+		goto err_disable_device;
 	}
 
 	plat->bus_id = of_alias_get_id(np, "ethernet");
@@ -116,8 +113,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 
 	loongson_default_data(plat);
 	pci_enable_msi(pdev);
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[0];
 
 	res.irq = of_irq_get_byname(np, "macirq");
 	if (res.irq < 0) {
@@ -158,18 +153,10 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 {
 	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	int i;
 
 	of_node_put(priv->plat->mdio_node);
 	stmmac_dvr_remove(&pdev->dev);
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
-
 	pci_disable_msi(pdev);
 	pci_disable_device(pdev);
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 352b01678c22..f89a8a54c4e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -188,11 +188,11 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	/* Get the base address of device */
+	/* Request the base address BAR of device */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-		ret = pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
+		ret = pcim_request_region(pdev, i, pci_name(pdev));
 		if (ret)
 			return ret;
 		break;
@@ -205,7 +205,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 
 	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[i];
+	/* Get the base address of device */
+	res.addr = pcim_iomap(pdev, i, 0);
+	if (!res.addr)
+		return -ENOMEM;
 	res.wol_irq = pdev->irq;
 	res.irq = pdev->irq;
 
@@ -231,16 +234,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  */
 static void stmmac_pci_remove(struct pci_dev *pdev)
 {
-	int i;
-
 	stmmac_dvr_remove(&pdev->dev);
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
 }
 
 static int __maybe_unused stmmac_pci_suspend(struct device *dev)
-- 
2.46.0


