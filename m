Return-Path: <linux-gpio+bounces-10676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1C98CF4C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 10:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8192864B4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 08:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342841974F4;
	Wed,  2 Oct 2024 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/Cu+D0k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682780BEC;
	Wed,  2 Oct 2024 08:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859325; cv=none; b=Ff+gYSHogcjrONIvpEjrI2kF1Whczg39CVa0k+zPEVoMyftTKaff2y8HL+P+pz9QhGtknDZ32SyXU9VhFCxWbkSY70wAooRAFzBxq73nEtIG5L24kRI6I/P5tPtZihkZL4J2VVQgnmQq7tbM4nz84CtqcwpAgxRhlRBjByttg4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859325; c=relaxed/simple;
	bh=KbrAkFzr0utlwg9j3g6a9w9jxnXNHEnl1dIJMpaIwrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J9ygePqJW3G4adlDFG1gb1FNerAwFZnOzR9sLB0pCAHxONZqMHd5+taapzTsXIZgpWZnaMcrzNggPSur3BtR6FqMR0n3arIl52VqRfYmSOp158zAyDQG0OIx7465rghCNLjTiQ6BfKIidb0qG/zoQILfFJQ84lwpHblnBOdX+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/Cu+D0k; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb806623eso50544935e9.2;
        Wed, 02 Oct 2024 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727859322; x=1728464122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODlXL8Ox8f7VfKshYXcTUoTZQaYuJaQq6XuNe88QYzw=;
        b=G/Cu+D0kWtWNO21+EqnKxNK4jm+PmTckh4rHNFa6plAL5ByFJpzSpfF1cZ4a5AOpe/
         vLp5F35G6yN7/m1aKZxMS5buv3KqgOLtZnjzEaLj/aCvh+Z0f5ndDLzPJ/tCz4vs5PhY
         WZiaWtQYnJZZgga33NMmOuRj0WsJOwXOc2JKp//6gLwpB4q1/FQiJx0t1DL/Yd7Yedo6
         QUfO9GOX8ixfGn3sVBzdC2HEkYLtLbdIWeQl1iL63jaq60U4JHQU/gOx2loOhuLqyEPp
         mzhDDMCsk1y9p0BB+Pijm2uZnR4iKeue+nWx6PkwB4WQXsBJYLkM0bJhfMZf8cMPulSV
         WvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859322; x=1728464122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODlXL8Ox8f7VfKshYXcTUoTZQaYuJaQq6XuNe88QYzw=;
        b=M2+6fEI7vI3V+c4xQQVtl5WKc/vCYoZ7brrK6t7uCLrAtt3f/9KRnSBNzTeZywyt1u
         gQnH6CHQGqno/lQhXYNYZqTRMuRRgZ5edyCivclReiEBmCDI69Bry93Ijedl5ftRT5L/
         1cMFyuBiX/QqoDom/Xsl2C48k5HI01tCor1SplrcXA2yllnKqbqALI77hGNDl7XVWAD5
         PE6P8NtdMM5J9X7pTsO8DS3mXrZWUzksAuQ5nYL+UDfzIVA6gF/mBcpjY4Z/6nPTClsj
         z/yEj4b0w+Iju42fHs+eB0APxi6LOhu9ATAiJtqWJqkGNiCw6jlLX/mvD2oTtyFFNHxp
         meVg==
X-Forwarded-Encrypted: i=1; AJvYcCV1vHYOZpHpiGfn+Aczgs2ShGvSgHlEFdt1kP9B3U7oODhudJooe1vJHgn89XgOvYW26dlDNwfTvOQc@vger.kernel.org, AJvYcCW+YUyhgbomAgT2NrFDWdZax9P2tWFqAsHAq3HeBv/QilXHbYvt2kR/aEMC2OKHX6MzDvSX8fWLY0qfVHve@vger.kernel.org
X-Gm-Message-State: AOJu0YzOPdyN+sy5jp2t6+KFWw2l9B8IZb/Ez75WVMnsDpZueBoL7UjD
	Pju5NBoje0HXimpNO5M2L/bwAgpBG4yjI7VbO1PyI6Oi3s9KtL1z
X-Google-Smtp-Source: AGHT+IHK6XHiWaSA6VlpTwqdzS2h697jtR078plTCpsEp/p7f5yojjjR/JWgQ1+a8BNLG2kNSqriaw==
X-Received: by 2002:adf:b1d8:0:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37cfba11c33mr1351244f8f.49.1727859321406;
        Wed, 02 Oct 2024 01:55:21 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564ce91sm13578122f8f.2.2024.10.02.01.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:55:20 -0700 (PDT)
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
Subject: [PATCH 2/2] misc: microchip: pci1xxxx: add support for NVMEM_DEVID_AUTO for OTP device
Date: Wed,  2 Oct 2024 10:54:42 +0200
Message-Id: <20241002085440.742863-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241002085440.742863-1-heiko.thiery@gmail.com>
References: <20241002085440.742863-1-heiko.thiery@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By using NVMEM_DEVID_AUTO we support more than 1 device and
automatically enumerate.

Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index d1cd4544c83c..a2ed477e0370 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -384,6 +384,7 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 	priv->nvmem_config_otp.type = NVMEM_TYPE_OTP;
 	priv->nvmem_config_otp.name = OTP_NAME;
+	priv->nvmem_config_otp.id = NVMEM_DEVID_AUTO;
 	priv->nvmem_config_otp.dev = &aux_dev->dev;
 	priv->nvmem_config_otp.owner = THIS_MODULE;
 	priv->nvmem_config_otp.reg_read = pci1xxxx_otp_read;
-- 
2.39.2


