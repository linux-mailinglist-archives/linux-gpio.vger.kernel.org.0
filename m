Return-Path: <linux-gpio+bounces-30206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60ACFBCF2
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 04:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA5630A2E4F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 03:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965212580CF;
	Wed,  7 Jan 2026 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Qfv24pqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD36325CC79
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755273; cv=none; b=IFfkIbzs9hJ+uVoI1af10T7cu5s605s0VzadwkudjuPRRRspGsRdwXzzTCvGJk1Wt5rz23gmI6T9J4xx/Kc2Ncwhu2oaAHEHriaoHvo+FKElKPn1UBZoxJZ8rfEBhQq8PN/h50PO/6WJAur+YooW5h4uyoXlitMPDQhT0dqpHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755273; c=relaxed/simple;
	bh=YCtL7XIQ2elQSXG/uJJP3S0gGTQbILzmG4WP4VYHMLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mc/MFxkIuwzEuusOM4QIJhXQVUBR5bxho/oCPmmuNSEEzqAk+RLb0lEYXeHKKx3OKJUz04MwDPVgoYq054x/COINczyalzXw3oeUrjNeuGOJlTatA8NZVMwVy3azCJetVhs6yxDMmSNZTbUcwC2mX2IyP8aPE8/H+e3EjT6q6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Qfv24pqE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a137692691so14672665ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 19:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1767755271; x=1768360071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7ZFdLTnDvnIrydUNeznKuyxON1SPga3Daneut3hK8I=;
        b=Qfv24pqEWgseRlnjw4P1mHrXUDrBpTvLmsenXQiyWWzG22HUvMRrurXJBzybeyo7bq
         /TPNkH8vSWsVnQdjDoKIvyaM3w7OTplNWXt0RBSBbPz65/nvPOGskK+h0bYzG7PMFlmg
         jwrxyDMSGwnJ6pICFK8Gs2wS9hFJ9kpUcCX6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755271; x=1768360071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7ZFdLTnDvnIrydUNeznKuyxON1SPga3Daneut3hK8I=;
        b=oEK0I3r3N6RsdFMCNlL0aAvf3QZmFrD4/nv4HrsN2CFzP1od6GNb+zN6hs6Ub0aqXt
         xWWrigtcXLAM/ySWMFC7R4PMN7yadSSdPVcWvTdH+p2qaa164VN1AVdpHPgeGz1L19An
         kpYx+Xpn1XZFFNqM/rx3PWm1WvauqwBAscCu2Gp69m7xhIXFUu9p/kL5mEZD9X0TFPZi
         5H+QaHmeizKlO8+b3iAUxzN+uHeWzZndxjCTO1WSWsy7VSaVIHvB4i3NhdR7KMc9Pl1b
         O/HtGmlESbd5VXZgUls0zwJAWrvgD2RiToVnfvGZdLYkI+VluTtemPBPgIJ8aLwv3fYj
         0QPA==
X-Forwarded-Encrypted: i=1; AJvYcCVnZ+uIFBbPEOjSn/j2lH7bnDNSB7l/9XpTpBm737OMsi54507DOjXTLzc30IrOTq8EkrnXdvEQjnN5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sl9Vn6EwKwM4+qTWVAfV6KGqwW4TF9LRorHZXUMAG0ekNgiU
	l7eetk9yYLqzx3Yjup1AiGnkaEif+kxe5rTyiXdYAm6leIguYpRw0GTjbMhWXWTexeg=
X-Gm-Gg: AY/fxX6x92bo9PQRx1hfu88B/fosVJKq/jbL3CyQ8tSdjy4XAxFdcLdLFLxz5sSx2Pa
	brEjsegMq3sTrAz2VPEGy+7lfLxqot8rNVoBmgFtu2+qZQNACVDWOJn8JYiDUZJsxdlyaqZgHlh
	u+DjPHg0N2yRsCK3Qxf8RIYhPqbpt6jX056WgbuvTQZbjd5SzXSC0nWZgzcosq/JJtpbMlVWNBk
	H9TPdMJ8e6CvUCFctnC2CQb4edbxf1htel9BvAPfm3/bcSr9AsR7FEHLr82lNr3HejCigQaxiID
	Vfuz3ZQmyHqOv5nqB678z/LXGYK0u1qgbRWpQAxR6RjgNXNkrB9R79E1TgDfvqiedDU/g83dee7
	+8oCnZx0N2nN29iRUILWb65ZQb5bSbbOpO4WS+YmBWX1juJTU0FzIjeLshd/3O/8Au8tTVKTdpj
	7ayavoIHdVrLHXmTXI8BHMwXgmWXEyj+k9CYuyQAvHyVd8nFStirzaZC6xHwhteb95rcQUig1yd
	Qc=
X-Google-Smtp-Source: AGHT+IEdpj9FBlTpGGiP4vWM+VPJOIFZzgRKvhnaBLXZwRM5iwazxSKJvIV2JHH5i9DicVEy3eXR5Q==
X-Received: by 2002:a17:902:f60d:b0:2a0:daa7:8a3d with SMTP id d9443c01a7336-2a3ee47f15amr10294815ad.23.1767755271138;
        Tue, 06 Jan 2026 19:07:51 -0800 (PST)
Received: from kinako.work.home.arpa (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm33694165ad.102.2026.01.06.19.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 19:07:50 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 2/2] gpiolib: of: Remove a bunch of compatible checks for spi controllers you don't have
Date: Wed,  7 Jan 2026 12:07:31 +0900
Message-ID: <20260107030731.1838823-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260107030731.1838823-1-daniel@thingy.jp>
References: <20260107030731.1838823-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_device_is_possible_and_compatible() + The kconfig symbols that should indicate
if the compatibles being checked are even possible to allow the compiler to totally
remove the code for most users.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/gpio/gpiolib-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8657379e9165..2c87f1fa1f95 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -93,9 +93,9 @@ static int of_gpio_spi_cs_get_count(const struct device_node *np,
 		return 0;
 	if (!con_id || strcmp(con_id, "cs"))
 		return 0;
-	if (!of_device_is_compatible(np, "fsl,spi") &&
-	    !of_device_is_compatible(np, "aeroflexgaisler,spictrl") &&
-	    !of_device_is_compatible(np, "ibm,ppc4xx-spi"))
+	if (!of_device_is_possible_and_compatible(CONFIG_SPI_FSL_SPI, np, "fsl,spi") &&
+	    !of_device_is_possible_and_compatible(CONFIG_SPI_FSL_SPI, np, "aeroflexgaisler,spictrl") &&
+	    !of_device_is_possible_and_compatible(CONFIG_SPI_PPC4xx, np, "ibm,ppc4xx-spi"))
 		return 0;
 	return of_gpio_named_count(np, "gpios");
 }
-- 
2.51.0


