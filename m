Return-Path: <linux-gpio+bounces-10933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B689925B9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99275B23348
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540C718454C;
	Mon,  7 Oct 2024 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFWQfH6h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A79184532;
	Mon,  7 Oct 2024 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285094; cv=none; b=mQMbaG4i5gjwNy0UO/O7zE9+8gpgf8cNyPUhZu4C9riwI3WC+thfzVKRo8ajo5LYNt0AicGErb47jzAfJ4BdmEJUKd1nzX52NAbL0j2Fde6/MRewNDwl7YoPNIxADeAvmtxYQMQH/DkaQ9X0eZI+pJG4PbyxDomaFcc01voEQWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285094; c=relaxed/simple;
	bh=q+yZEZLbfrZ97FtYE3jrBTOvvmkiN5Akp5HZH94q2so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QMFAMyAB96Tvz0ruZ/ZCQzpmrVeNThyJM+kkqv7gaW/F6VPea3mUgifcXhs1rW5+9ZXGeijnRWzC8UT2iwgs4zi5AVA2hj/qFXVVOhkJ/Gf/AWXlIEId83aSvo1ZHu9wrePUrPsJpAFPYUbPb5nJCmQes1PBNPvBDR4whEE3QBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFWQfH6h; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c88e4a7c53so5093518a12.0;
        Mon, 07 Oct 2024 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728285091; x=1728889891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxZS6tLJMAyExojdu109fWj4TPm6S9/8L9T79FsFPfE=;
        b=QFWQfH6hNpYGe6xWuVakX/8ah6gKgJK5UTGH99AEB/wOBN1a7HCk7MXMp7+3j+usQP
         9/4v74kZUFEX8gz/Hx82nY3XrS8ccSC0eTZYe9ev1d+2DbIKHhrwxIt9fc1ASZ1efp3k
         M5I9UdRENCR1FQ5GU/QtZigR8HSXNQLlKlx/NdWG6VR6F/Rg7t3Z5tNWX9bNWMvYBEwE
         Nbnl6CycFuCxp5P1M9++zvmke+tbqH/rGc/D2vw/8NjuBSFEVBt7dtcR9wSGJd7KPwp3
         k8QeqqcrWbyQ0YTMnisNVv6b7Qcl8eJL669AU9Z7mzE0KYWlL/tisr8Igs/0IUrFOw4z
         xZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728285091; x=1728889891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxZS6tLJMAyExojdu109fWj4TPm6S9/8L9T79FsFPfE=;
        b=HglonArDJJrBNM3WC+QB2vtWL0GasTuHMgwhF7CuVQ8ABohdOgDZmVtgSek5B87znm
         8HTHQ5RRP18WiXl1DQIEkbw4lDu2jrTv1VLPA1Tm/bmyr4seGhriFNVFfs3LmgxeXePo
         BTUa2f2BHh5Al4B0pPiVgWS5rsYgERhWuWrdR57uUOZzIJ/mHKurV38kc+w20whhe4Rj
         pcrDhEgJ8zwz520Muaskn4jYrYitow2OYOftA4MmOVqIrr3aW29GOAWrmt4uvGuI7lRZ
         +cP2FBn8o4Lcf3mnXZNKltn8/U0WullqKzsgTxDRgVdsegA33Td1+tlH80iOIGjHEv6O
         zKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0FywOylCOh2quCbAEpCqWJ5KMY9b6EEePsDp8Fd4XV+Qb+EtR1o/c/MV5DdOOGa6fv31FNd4WiC5Q@vger.kernel.org, AJvYcCU6rmt85Q6rme1j3Rp+NRZIKqwCgyI9wTLJ5HomPANSWv73SrWVsDQGdfFX4gkrnvWi4woVqhTvlN8ux/+T@vger.kernel.org, AJvYcCVT5GDCCmzKf++iPaLoHsfVnsOd6ANT+ZGWOhm7cNhYkicDOk1FuzfhZiQE5m093mclWIsObrZ1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzu2NXtLgyUJickA7ajnFktJtENQ9WxphrSyHhH7Y8Fuu4Ezap
	EWUQPETf/L87elkcGaha4RuXmYqXF1OxrXshfl5vgIRRRLdraomKCkd3fw==
X-Google-Smtp-Source: AGHT+IFpCyMTwpKCIbUXAsVw61MVmB7GcR1ZGmj/beG8sfphNebyvKpI/diB/lsdeGJTO0sLngEysw==
X-Received: by 2002:a05:6402:388d:b0:5c2:6d16:ad5e with SMTP id 4fb4d7f45d1cf-5c8d2e25770mr10031727a12.19.1728285090623;
        Mon, 07 Oct 2024 00:11:30 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05f3c06sm2819052a12.91.2024.10.07.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:11:30 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Heiko Thiery <heiko.thiery@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] misc: microchip: pci1xxxx: add support for NVMEM_DEVID_AUTO for EEPROM device
Date: Mon,  7 Oct 2024 09:11:20 +0200
Message-Id: <20241007071120.9522-1-heiko.thiery@gmail.com>
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
Cc: <stable@vger.kernel.org>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: add CC to <stable@vger.kernel.org> after receiving friendly mail
    from patch-bot.

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


