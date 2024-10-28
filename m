Return-Path: <linux-gpio+bounces-12246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA29B32AE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BDB9282D7A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882A81DDC22;
	Mon, 28 Oct 2024 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BomfZmJl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D31DD553
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124445; cv=none; b=Z5D11Hgo27KO2u0LJEkEq3050v+vJ9OW5hTHKHYYQLje2lUF0/gYcBX3pvpd+I0MhMh8W24QsYbWWcQA+J9oo1YBGDP+4gnmnjaKFgqVsCQsx14b1Dizi9QMQOr9nuMlB0svDh6b+BMHMKF1A3TLjGRhSLgvjkNRl7ifGPusmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124445; c=relaxed/simple;
	bh=bBaN0X0jScd/15W+2/fScdw6Spc8ffLYU0CeQxKdTas=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxgHuTK9J12cnOFqAjfB9N1qccJbNVrJoAMrWmrNH4xSqCWVlipp5a7R0XZBbppL3SnPY/HKJAc+XUzpZDxublb7s7ImKCIij2h11DN5XKceJL/cO651c7bqJ269QZ7jIDVqSyBDH0cs6yMS9etcHgUZALOVEFsVly4vxmfm3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BomfZmJl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9abe139088so638828066b.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124440; x=1730729240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqh56MHAf6NGyxNJb5XjKGyAFS1Pm7/dh/+rsUlSsqw=;
        b=BomfZmJlug7ZwpBY6Rw8s/hVg8VMdkshumj8yk04yvy72sDEPdWUREZq2Hhg0S4M8u
         gDJLYX5zIJAZF8guDj4/4a90eBM3JPx9O0eCsZcovLXelDNFW8lhr1XuhO+f5Gvoq7g3
         2RdzF8Kxnj7MBV34UnZqFH2k0c+uRLezZBRIdtqqBM/tm9eFS1sZwatTjloHuVjTalmY
         zWOifKCEMs/rR3S8FsrgqmN4a6oOLrCl1Kij/mBRZAeQtNAhcyiw67Q6tS/z+fQ2avFr
         Ez9u30lvsd49FVcTxDrg25C5V4aYUUTUIBTe9iCyGrwRcaxRllKu5u32vLi7PRUTt0BG
         +OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124440; x=1730729240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqh56MHAf6NGyxNJb5XjKGyAFS1Pm7/dh/+rsUlSsqw=;
        b=eGZovkIwPPY5sS2aILrN+Wom/yRIsGoNtlZci21JN07ffSNeFpzRZXntHysBRWsfep
         XI03LHclg6wttaBIVwlWTDPncYoUXBz3C/31SBpmpnCwHxCx+COT+30fhEXLTIneP9rv
         uFSxoQNCQFjV5dYgFTcT6bUPinLs0TmpmS/FrTtIe42zhe1aX+oVL9sUbWXsN2WWxNIS
         4p2q30f7ggk2VGec15NhjtpxA2uYfOb11jIHRbVuXm5MAdn2pL+KfjHq37Db3JeX7Dio
         qzCVAbHlwUclivarf0EhCs0gN7Enb7RjEmXfW9HWlsCwTpiuxXwD9TwvJLQ9pDpxfxAQ
         8DTg==
X-Forwarded-Encrypted: i=1; AJvYcCWd+Ca2mRNhqJzf0OYEPLqmp4QqTwKJ8yS4VpANje9IipAZf6Ccchl+bztF+VP/lsnVGipeexFvn5DD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+rNywXPRcTktoeWsogPs7rr8rTUxTqtD8Us/5uoQCigljArRA
	U1bXDzFnGfu5MWs0OQhb7sLjsZya4mgMITX++nSWtCfAaBiv0tbCUVB7bMqs21g=
X-Google-Smtp-Source: AGHT+IEJsXz3JLUo8t8BMAbJDLTmQNDfk74M3MzGZPfukI0B32f64s3so2uEdukAd0Pl42XLPpmBkw==
X-Received: by 2002:a17:907:3e1a:b0:a99:f4be:7a6c with SMTP id a640c23a62f3a-a9de61669cdmr835551966b.52.1730124440047;
        Mon, 28 Oct 2024 07:07:20 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b32455a14sm388970666b.178.2024.10.28.07.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus address to dynamic bridge nodes
Date: Mon, 28 Oct 2024 15:07:22 +0100
Message-ID: <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
bridge, the window should instead be in PCI address space. Call
pci_bus_address() on the resource in order to obtain the PCI bus
address.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pci/of_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 5a0b98e69795..886c236e5de6 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
 		if (of_pci_get_addr_flags(&res[j], &flags))
 			continue;
 
-		val64 = res[j].start;
+		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
 		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
 				   false);
 		if (pci_is_bridge(pdev)) {
-- 
2.35.3


