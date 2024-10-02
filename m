Return-Path: <linux-gpio+bounces-10675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9B98CF4A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 10:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68C272812E8
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 08:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98751974F4;
	Wed,  2 Oct 2024 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKSV8xQ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7480BEC;
	Wed,  2 Oct 2024 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859315; cv=none; b=cNUZ7E7sBzDhpr6AxYe6DuPd0giCjj/LTzZNQ77u4c7SnVOLk/nrfrOeeoMhESjXJRYWEgOspaWBMrlW1fvFKOFCzkCmiPVT/e56w9RuzQUoClUnr346kqOFxhSBi+kGvXRWrtNsrMzXckaEjCC2Xjegc0GTKeRVkUqJQLyzkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859315; c=relaxed/simple;
	bh=VOWLlvsuC+xi5xUTJdi5z+8TeYUwhYP+kSPsBW3Gg4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=crG/8khuIJTe1Ggz438h2ceUCqcTg2wgp2uBol/spAcXE51O8SUFanufMgcE74QHoU/TqoKpp1wg9+vGdZmYskttygQMfbgxNJNpwGpz3pdrD3otLi5GYB6i6oIoDu3XQM4N1wIYOS6NW8GuuM0rhEyW+cVj7zfXcX77XMuco8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKSV8xQ6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb806623eso50543755e9.2;
        Wed, 02 Oct 2024 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727859312; x=1728464112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ryp9L0T3TJyn+wTvhlJIzWTs/aJDiuhNhxqXqYUU3vM=;
        b=IKSV8xQ6RqYPERRkkeoQBV7rCs73eUNHO1j+RXadDCEdpsKi/CVPC+/v9P6JFy0Szr
         6AvZuy1CTbXE6AoajdS9NCUM9LO+BKR9ho7jz6Ych0YHsaLBgw5VsOj3nMQe62hhM+lF
         0oDPCMfyAaL8+2RyMpTbcXENyl+bMqR9I41oNV61w9EpaItDRTgEgkPHerwRBlfxQAJj
         yOlDel8yIN4BsHqs341Ie79vHbKfYB3B9w72tmfGikzmJTYkrCdctcgGxhXH79HUQiE9
         QLBHVle7R2vJ1FQkVJsQkYYnyO82npTWvdhYNd2dWUNWSm4pbWCF4/TYFWibKxH/Me1n
         rQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859312; x=1728464112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ryp9L0T3TJyn+wTvhlJIzWTs/aJDiuhNhxqXqYUU3vM=;
        b=dKG8O+XzzgLzeiXyLeaYM8Z/WIEzvj0wE7pmS+pL03LVmZcfAM04ILr6QaGcCxlMIl
         +EwWYmGu2BO7f4EHMydOseXMR9Km+QXV8G946HnKUJaMHogObxMH1RwN1q+0g9EMASJg
         z5cN7veyKJ3aYNVW0K9CuAnIVNABaP9nvJcM3nc0uRUbXuos18Uq6e1WP+Isgb19oVX6
         1/HuCzkyKr+XmbwIv6+xEPZ45W6vah7fo8mqtmu3bIK6S7zshdRDvSXHAVG1tpGckXbf
         jEcXQFfJoKhx536ub4wwiEFLAqVqk61xaMvPBVaId8sJ81/6NO6fpQDd/P4lfWCzeqiZ
         tn3A==
X-Forwarded-Encrypted: i=1; AJvYcCX8JPBxVV606pcZm/bHYISjpjI0X47wU6yTE/tjZRTbhWEzxDHVzEu9CeNTicXgvRwuxALqlTuVLGGq@vger.kernel.org, AJvYcCXzXQgL33FL4r9sdJBZAPuqSS4OmMHwqbOtia6RwEAiXOXPyN1GaE4KPIepzcZQCUuMrZIzA3gWByi1KiGJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOCzwX/b4LvgRhZeHkG576IaAgeXMPBVzdphHt4xbxGMWj+cPv
	qtLrKCiOvGqhORBBfWp3IoPrWCqzS89Bvo0Z9ugjJtOq2/eDpuRT
X-Google-Smtp-Source: AGHT+IFlLR4aw7gx/T1KKRRfbFiheDQ6i4dkOu70GI6M71RXZVbaf8oPT4yU+NdAmZlXwxFKt2rIMQ==
X-Received: by 2002:a05:600c:3153:b0:42c:be90:fa2f with SMTP id 5b1f17b1804b1-42f777ed406mr16921935e9.25.1727859312081;
        Wed, 02 Oct 2024 01:55:12 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564ce91sm13578122f8f.2.2024.10.02.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:55:11 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Heiko Thiery <heiko.thiery@gmail.com>
Subject: [PATCH 1/2] misc: microchip: pci1xxxx: add support for NVMEM_DEVID_AUTO for EEPROM device
Date: Wed,  2 Oct 2024 10:54:40 +0200
Message-Id: <20241002085440.742863-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By using NVMEM_DEVID_AUTO we support more than 1 device and
automatically enumerate.

Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX EEPROM via NVMEM sysfs")
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 7c3d8bedf90b..d1cd4544c83c 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -364,6 +364,7 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 	if (is_eeprom_responsive(priv)) {
 		priv->nvmem_config_eeprom.type = NVMEM_TYPE_EEPROM;
 		priv->nvmem_config_eeprom.name = EEPROM_NAME;
+		priv->nvmem_config_eeprom.id = NVMEM_DEVID_AUTO;
 		priv->nvmem_config_eeprom.dev = &aux_dev->dev;
 		priv->nvmem_config_eeprom.owner = THIS_MODULE;
 		priv->nvmem_config_eeprom.reg_read = pci1xxxx_eeprom_read;
-- 
2.39.2


