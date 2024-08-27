Return-Path: <linux-gpio+bounces-9236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD36961786
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 991B51F24579
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DC71D6189;
	Tue, 27 Aug 2024 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2wAwU4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3E1D47C2
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784997; cv=none; b=PxrkfFgQ9QlLx9xO/4jABfsd7Em60wrGVAlfIgyvWoJiVBdfswLhFfTG9qjr1M2pEoqAB2ntvVAq2YeU8jhcAnS4q3WREiEhJ7Xh6Tv2nnHvn9NltWQADVBCQsI3sC2ydJ8Nq8e6g4y3VZFFTaQjqjyrC7gkfd3zCYZK3ULvLlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784997; c=relaxed/simple;
	bh=DthlLOD0XWT9pUXf24uzdmG5D5JXhN126raQjVqCgeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCixR5v8sxgNifZxzSMP9Nbcs/akEms+PSSWTw/NwE7xrL6iFgiPif2vV8mtatJcFMPwnIx3xp+3bijNUisfXsJ4bVEWgnIIQttnedyL1zb0Jv/2CI/jfSYjuY3t0LWPpZoyURXvWT3lFBFrGel6ZYIt8vlQMSxAaD9IlpVn1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2wAwU4a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724784994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wt2kRlQoJgJxTzxQjhrYYWN0zj4xz5nEsQIR91A/520=;
	b=D2wAwU4aeFZ4ic2zoJaSIJMCfzQECvk4EHUQtvnu1wsh/l+Q5e09L3/clLX87n/nOSfWFh
	PKiv7oOMH7rRmLut2DlOQt0H4yUpq2oM/CzFNS2lsT5z3DV08YoTViQ2FPzO/wiah0f/AC
	nxHeGuwn9cZO0RnwTzj9SPWO4BNvS4g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-EEtg7Lp0OVWon8GQ2MadRg-1; Tue, 27 Aug 2024 14:56:33 -0400
X-MC-Unique: EEtg7Lp0OVWon8GQ2MadRg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8680b74416so885268866b.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 11:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784992; x=1725389792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt2kRlQoJgJxTzxQjhrYYWN0zj4xz5nEsQIR91A/520=;
        b=cODWDUw4H4TwBdwlX4Qv8rnTI8Rt65h+gSnHipZe1y0/73UYPp0c+FSx5eCSIMEtP0
         4FJYhz8FwfHQew9g1RHkVv2l9f25zHqnIC+feRHcDvr4D9a3Bz57pO8qXI4z8IajzXHp
         KfRvO8R0Z8G/9+w4AjwbrdGmCzbFLzgnfSseO3U4HoTuaL7OEpXsGrrAeyPCn/O/fGRJ
         l8E7vmyo9FwbTI8dIhYChXbug6oFxsF7DVr1PuWXCiu7ZP/DNUgPAKfKi6Enbet1Y32N
         dSvONLbpaEmDl2Ca9mEy/3N6ByUtw90NIF6WOl4cXYxYO3iGI8d8KYCIWuFvq6KU48vN
         6yWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV9EGWIkyMIDvHpOu3oHjCS5nPOl/HPEDBz3UEZd+fidEAgmK8MmL42QcKW3TqAw0EfRrAZvVRJa97@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCDZRpqqkyi7vg5WklbEIiqxkPyAeRpt/FxCiIo3ggRq0UmTX
	OjygY9f3PYTlNPfMnwrXG6baBFVY3LiQKOPR6xdR8clWzPS9Nkwp1Ay6/fkYqSXEG6VI45wazKh
	3IKsLFl1gvsRH3dj93P70VIfrR/Axp84EgPujFEg/TE16g9PhF4Jvpocdwzc=
X-Received: by 2002:a17:907:7f27:b0:a80:b016:2525 with SMTP id a640c23a62f3a-a8707043b8cmr8198166b.8.1724784992000;
        Tue, 27 Aug 2024 11:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBCdBD2kW3vTynmCvtl831PHsM6tyxf6BsBh0sckStVuG33fFsI5thDuDX9Uw77VoCKbJbMA==
X-Received: by 2002:a17:907:7f27:b0:a80:b016:2525 with SMTP id a640c23a62f3a-a8707043b8cmr8196866b.8.1724784991547;
        Tue, 27 Aug 2024 11:56:31 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dbc:3c00:460c:db7e:8195:ddb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549c4e9sm141473066b.47.2024.08.27.11.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:56:31 -0700 (PDT)
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
	virtualization@lists.linux.dev
Subject: [PATCH v4 7/7] vdap: solidrun: Replace deprecated PCI functions
Date: Tue, 27 Aug 2024 20:56:12 +0200
Message-ID: <20240827185616.45094-8-pstanner@redhat.com>
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

solidrun utilizes pcim_iomap_regions(), which has been deprecated by the
PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()"), among other
things because it forces usage of quite a complicated bitmask mechanism.
The bitmask handling code can entirely be removed by replacing
pcim_iomap_regions() and pcim_iomap_table().

Replace pcim_iomap_regions() and pcim_iomap_table() with
pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/vdpa/solidrun/snet_main.c | 53 +++++++++++--------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/vdpa/solidrun/snet_main.c b/drivers/vdpa/solidrun/snet_main.c
index c8b74980dbd1..2b7ff071aab9 100644
--- a/drivers/vdpa/solidrun/snet_main.c
+++ b/drivers/vdpa/solidrun/snet_main.c
@@ -556,36 +556,25 @@ static const struct vdpa_config_ops snet_config_ops = {
 static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 {
 	char *name;
-	int ret, i, mask = 0;
+	unsigned short i;
+
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "psnet[%s]-bars", pci_name(pdev));
+	if (!name)
+		return -ENOMEM;
+
 	/* We don't know which BAR will be used to communicate..
 	 * We will map every bar with len > 0.
 	 *
 	 * Later, we will discover the BAR and unmap all other BARs.
 	 */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i))
-			mask |= (1 << i);
-	}
-
-	/* No BAR can be used.. */
-	if (!mask) {
-		SNET_ERR(pdev, "Failed to find a PCI BAR\n");
-		return -ENODEV;
-	}
-
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "psnet[%s]-bars", pci_name(pdev));
-	if (!name)
-		return -ENOMEM;
-
-	ret = pcim_iomap_regions(pdev, mask, name);
-	if (ret) {
-		SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
-		return ret;
-	}
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (mask & (1 << i))
-			psnet->bars[i] = pcim_iomap_table(pdev)[i];
+		if (!pci_resource_len(pdev, i))
+			continue;
+		psnet->bars[i] = pcim_iomap_region(pdev, i, name);
+		if (IS_ERR(psnet->bars[i])) {
+			SNET_ERR(pdev, "Failed to request and map PCI BARs\n");
+			return PTR_ERR(psnet->bars[i]);
+		}
 	}
 
 	return 0;
@@ -594,21 +583,18 @@ static int psnet_open_pf_bar(struct pci_dev *pdev, struct psnet *psnet)
 static int snet_open_vf_bar(struct pci_dev *pdev, struct snet *snet)
 {
 	char *name;
-	int ret;
 
 	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "snet[%s]-bars", pci_name(pdev));
 	if (!name)
 		return -ENOMEM;
 
 	/* Request and map BAR */
-	ret = pcim_iomap_regions(pdev, BIT(snet->psnet->cfg.vf_bar), name);
-	if (ret) {
+	snet->bar = pcim_iomap_region(pdev, snet->psnet->cfg.vf_bar, name);
+	if (IS_ERR(snet->bar)) {
 		SNET_ERR(pdev, "Failed to request and map PCI BAR for a VF\n");
-		return ret;
+		return PTR_ERR(snet->bar);
 	}
 
-	snet->bar = pcim_iomap_table(pdev)[snet->psnet->cfg.vf_bar];
-
 	return 0;
 }
 
@@ -656,15 +642,12 @@ static int psnet_detect_bar(struct psnet *psnet, u32 off)
 
 static void psnet_unmap_unused_bars(struct pci_dev *pdev, struct psnet *psnet)
 {
-	int i, mask = 0;
+	unsigned short i;
 
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (psnet->bars[i] && i != psnet->barno)
-			mask |= (1 << i);
+			pcim_iounmap_region(pdev, i);
 	}
-
-	if (mask)
-		pcim_iounmap_regions(pdev, mask);
 }
 
 /* Read SNET config from PCI BAR */
-- 
2.46.0


