Return-Path: <linux-gpio+bounces-10934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A14379925BF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E5F8B23680
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ED618BC16;
	Mon,  7 Oct 2024 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9PS7lhi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1818BB93;
	Mon,  7 Oct 2024 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285108; cv=none; b=ivpiJWI5TlG1aa+b7OEaQ4SuXe40cLGgqBdyJ3SzB+OJiSZL5SD5whg2t9hIboECzca1TSzwUGXrse0bgDtcmsTCGHdY7EXI12FN5bXLM1sXGnUeRCTtND8MmAYyOrXzFoKmdPU9eQ3VHHqTe7p6PYMWBwtnogGr/c8SrNQ6qSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285108; c=relaxed/simple;
	bh=BhITKZXkpt6g27hjP/4xEZcdcdQXVKzDKSdNmijwYHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GxhgCeYBCpbgmBrabgWoWuSR2GKbr7s5oEEwZ31pjUHa7ySs9yS1jADyBtr3X5BainiwxRlz+LEBR9KCk7HkOPPuPEI5oJPzlCHZ+VysHilqOXf3huGbwgZGW1gviGBDVYXUma0hmn+Y7xJCc0CnuyVtbUleLsQlvjNJ8SQIBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9PS7lhi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b3e1so5737809a12.2;
        Mon, 07 Oct 2024 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728285105; x=1728889905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg4i6iLNPFN1cxnsx1LXLyItyf2hgwuisZOsoYDzoBE=;
        b=E9PS7lhienuFw/2JqmL4BmuGnCe7u7HJUlan512AaS8j8ke3xswMmTETfJwcPI1Y8B
         L1liZS1m7fY1aMbS4h/zaeDjpf5Mj8kKVoXCE+Q3uGbw0iH+D/ndOCeugIwj4ppzLufw
         hzdGiqo6qDawhQmPCBagd/lEjjABweeTBkbhVO3jzCRR4IO5NZ4Khxyv0TGPQIO3VGkL
         11KFz+0Ai+l/Cw3Jnj/c/Xj07eR2WJpCViR8n71SjXwh4VkmW+aViC0gi8KaRHiw5FPD
         Ezd9qlL5o8uqmj7SjDRaYRoW4r6wrlZB9uPNO5PLC0AFQLAJjWd8ixY6B/xO8ZOBP30W
         XkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728285105; x=1728889905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg4i6iLNPFN1cxnsx1LXLyItyf2hgwuisZOsoYDzoBE=;
        b=KH95q1KKzrlptXHbWJo1tO91wO+/blBJ/0xdMx9AbQqhQIoz+hbwAAy1DcRkmXl8VF
         ygG+HHodmrBGAQNRbD9iIfZkjXCBf9zpE83p5xTNmcrexH0uYV6TN+mGSVOeu8UqFc9x
         l/c5+53h6i5P86bbV0nKkupvZObeAYL/3a3TEhJaY7x7mFzJVz02pZpDOy6PfDUjihnd
         5gGWkoWvWj/3DOi0juSqECqs/AYFgZA59cX9GzkTd25TBxi0fV+saoZTgjEpEwdmfNrV
         YmsTqpu3Cr+nVtKQo29QXiAEf/oYdrQhr3S0G0Ne6XWRkrwgoDGsvItfH9ONc++TSEBB
         wywQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+99Dmtul9Z9u+MxZ0nVN5LdpWdx0SbI1uPX+BN0tWMCyw/LBebDX/zHI2b1HOTWskjv53fKc9SR/K8dEw@vger.kernel.org, AJvYcCX4nCWFeFK84qaS7MmW1fzkSMv0qpX7sN4p6rRUgabfMeIlhKasMUEGG2pYwERQfwdcu8wPY+hyiFt1@vger.kernel.org, AJvYcCXve8y4x51twCh8w113bsbWEoCnmuUO2FTEdpdoVbFQ/oMBCHOptMD60nvU9+Z0ckGpPMpBm0+B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7uY8HEDX+VjfyDyZHLijNOJP+WV18TRsIoBx8gyp+0a2EH2ou
	Tr2jbEtj01ChDb19aJrauENyfk3MxLFCGoRRcnd/Aew1sOwpdtGh
X-Google-Smtp-Source: AGHT+IGOzQ8KyqVUc0GuwXGDXq0mWXBF4KCCJMy+L0QwpEwx29h/wn4foiNYK+spN1lugv1qyuEnoA==
X-Received: by 2002:a05:6402:40c9:b0:5c7:2122:6b3 with SMTP id 4fb4d7f45d1cf-5c8d2dfda0cmr8181708a12.1.1728285105107;
        Mon, 07 Oct 2024 00:11:45 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05f3c06sm2819052a12.91.2024.10.07.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:11:44 -0700 (PDT)
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
Subject: [PATCH v2 2/2] misc: microchip: pci1xxxx: add support for NVMEM_DEVID_AUTO for OTP device
Date: Mon,  7 Oct 2024 09:11:22 +0200
Message-Id: <20241007071120.9522-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241007071120.9522-1-heiko.thiery@gmail.com>
References: <20241007071120.9522-1-heiko.thiery@gmail.com>
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
Cc: <stable@vger.kernel.org>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: add CC to <stable@vger.kernel.org> after receiving friendly mail
    from patch-bot.

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


