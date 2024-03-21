Return-Path: <linux-gpio+bounces-4514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99F885F2D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 18:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C710281B7A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 17:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB3C135A48;
	Thu, 21 Mar 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=destefani.eng.br header.i=@destefani.eng.br header.b="KpJhirgO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4640135419
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040433; cv=none; b=KrJCQ+acZAr4fT7nRp2bCwvr/o+N03WR9aqrTpevXSJmtgFY7ZOZveNFpDBH4zXp4eOjjxASCuZwi/dmxK1a+iUBG1AkxpJSQ6ASziNd4wW5cTQc/ct0nRA1edaA9bq+I3yQW8V4wmV1FzKh9gIMhAoXv5h8EzjcX52gy+0VLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040433; c=relaxed/simple;
	bh=azUOIpCSNtAQoBq7Udov68SZNXlcMxo6wXKCHVGZh18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr5u0hIRrd+1rpy1FOUGN5WRpFX5yudE+AB6cSaxQVBib1OwHO12/YSH8+l7waYSnzpizBXvmsIjbC7VtRO/YAqvfpAMqVUFGDWJh5zIQ6FORxrYkE6WxPcgqSUSftDaNiCQXg2/HHQsJ6LlXlyNGfdEoWvHhCoI9jvUqj/WpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=destefani.eng.br; spf=pass smtp.mailfrom=destefani.eng.br; dkim=pass (1024-bit key) header.d=destefani.eng.br header.i=@destefani.eng.br header.b=KpJhirgO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=destefani.eng.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=destefani.eng.br
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6aaa2f02cso850636b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=destefani.eng.br; s=destefani.eng.br; t=1711040430; x=1711645230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8Qeer8PCBOUjDeaJKPpEKNEpFdXCiTMROIO+CYJFPU=;
        b=KpJhirgOigh975gX+iGjlnQ8trhbiyegnbe3d2Ghbmsdz4xb9/M5nUCboBgJrxJPF/
         KaxDjL+MMLJdkH47cIN3dV0xKJnv5Xk9v7VmUMBaYyp5CyT8itEOtbsMf30BqIQlKPB0
         a6SNGID5nwylsBmMyXgwmBISbt5cRCLLFWN5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711040430; x=1711645230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8Qeer8PCBOUjDeaJKPpEKNEpFdXCiTMROIO+CYJFPU=;
        b=sHdKRJMpowhb0jS1YHWeCVXwuuK7hSuGea9uVwIaIH6z7swN9jX9fABPExKGMsdwMj
         HhsJ1IjY4CUFm3xs3JoamMGnnWkHkMjB69/FmdRqZvDdI+kXI2DFcGcR66EtLPldRaFB
         OtWW5qYAz7/Ui3iip3Ny+E8lvhoVC84xgVihIvv/zBE7YT0lmSzn1r2uiOiJqM/IJBHG
         SdUqbZEcENcdSL+NFFZG2/KYcLVYzc7zdtQ+b1soycPAKte7Me6oCjsHT/mSgA5Z9aY5
         3PzP70TlctD65MYTv+gOLJsiP/rMWUZhtVmZQukBRQ78GFbpiFolNHwr/B3XHqcm3Vx0
         bl3A==
X-Gm-Message-State: AOJu0YxB3bOCzaFsouxTLPg7/qaixRW9q+eD20OxZ5oPzuQVwQRWmuC+
	JVpN8ZiH9ePwUtsVrotBaUUZvXqauEGTQZJet2YMk6yty/1eXcpeqxNh2ywe1TmyUiSoqZkV/sN
	M
X-Google-Smtp-Source: AGHT+IFf2Jezbn1IaK3Jg9fLIvmCTDB5UjlcUW7BUzRcFdLW/RzthXwMJ5aYm9SIURyAG6SVpBZ9NA==
X-Received: by 2002:a17:903:1cc:b0:1dd:916d:771f with SMTP id e12-20020a17090301cc00b001dd916d771fmr7755749plh.39.1711040430107;
        Thu, 21 Mar 2024 10:00:30 -0700 (PDT)
Received: from toolbox ([2001:1284:f508:4314:8c5d:889a:4b96:5])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b001dcc8ea6247sm60319pla.15.2024.03.21.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 10:00:29 -0700 (PDT)
Date: Thu, 21 Mar 2024 14:00:26 -0300
From: Guilherme Destefani <linux@destefani.eng.br>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl, steffen.kothe.gc1993@googlemail.com,
	linus.walleij@linaro.org,
	Guilherme Destefani <linux-gpio@destefani.eng.br>
Subject: [PATCH 1/1] GPIO support for Fintek family F819XX
Message-ID: <20240321170015.74544-2-linux@destefani.eng.br>
References: <20240321170015.74544-1-linux@destefani.eng.br>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321170015.74544-1-linux@destefani.eng.br>
X-Mailer: git-send-email 2.42.0

From: Guilherme Destefani <linux-gpio@destefani.eng.br>

Both F81804 (64 pins, 30 gpios) and chips F81962/F81964/F81966/F81967
(128 pins, 80 gpios) share the same chip ID, but use a different gpio
mapping. Read the second serial device enable register and test for 0xff
was the recommended method suggested by the chip manufacturer to tell
apart both chips.

Signed-off-by: Guilherme Destefani <linux-gpio@destefani.eng.br>
---
 drivers/gpio/gpio-f7188x.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 3875fd940ccb..819ea95fece6 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -40,10 +40,11 @@
 #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
 #define SIO_F71889A_ID		0x1005	/* F71889A chipset ID */
 #define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
-#define SIO_F81804_ID		0x1502  /* F81804 chipset ID, same for F81966 */
+#define SIO_F81804_F819XX_ID	0x1502  /* F81804 chipset ID, same for F81966 */
 #define SIO_F81865_ID		0x0704	/* F81865 chipset ID */
 
 #define SIO_LD_GPIO_FINTEK	0x06	/* GPIO logical device */
+#define SIO_LD_UART2_FINTEK	0x11	/* UART2 logical device, needed to test chip model */
 
 /*
  * Nuvoton devices.
@@ -60,6 +61,7 @@ enum chips {
 	f71889a,
 	f71889f,
 	f81866,
+	f819xx,
 	f81804,
 	f81865,
 	nct6126d,
@@ -72,6 +74,7 @@ static const char * const f7188x_names[] = {
 	"f71889a",
 	"f71889f",
 	"f81866",
+	"f819xx",
 	"f81804",
 	"f81865",
 	"nct6126d",
@@ -253,6 +256,18 @@ static struct f7188x_gpio_bank f81866_gpio_bank[] = {
 	F7188X_GPIO_BANK(8, 0x88, DRVNAME "-8"),
 };
 
+static struct f7188x_gpio_bank f819xx_gpio_bank[] = {
+	F7188X_GPIO_BANK(8, 0xF0, DRVNAME "-0"),
+	F7188X_GPIO_BANK(8, 0xE0, DRVNAME "-1"),
+	F7188X_GPIO_BANK(8, 0xD0, DRVNAME "-2"),
+	F7188X_GPIO_BANK(8, 0xC0, DRVNAME "-3"),
+	F7188X_GPIO_BANK(8, 0xB0, DRVNAME "-4"),
+	F7188X_GPIO_BANK(8, 0xA0, DRVNAME "-5"),
+	F7188X_GPIO_BANK(8, 0x90, DRVNAME "-6"),
+	F7188X_GPIO_BANK(8, 0x80, DRVNAME "-7"),
+	F7188X_GPIO_BANK(8, 0x88, DRVNAME "-8"),
+	F7188X_GPIO_BANK(8, 0x98, DRVNAME "-9"),
+};
 
 static struct f7188x_gpio_bank f81804_gpio_bank[] = {
 	F7188X_GPIO_BANK(8, 0xF0, DRVNAME "-0"),
@@ -482,7 +497,11 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		data->nr_bank = ARRAY_SIZE(f81866_gpio_bank);
 		data->bank = f81866_gpio_bank;
 		break;
-	case  f81804:
+	case f819xx:
+		data->nr_bank = ARRAY_SIZE(f819xx_gpio_bank);
+		data->bank = f819xx_gpio_bank;
+		break;
+	case f81804:
 		data->nr_bank = ARRAY_SIZE(f81804_gpio_bank);
 		data->bank = f81804_gpio_bank;
 		break;
@@ -553,8 +572,9 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	case SIO_F81866_ID:
 		sio->type = f81866;
 		break;
-	case SIO_F81804_ID:
-		sio->type = f81804;
+	case SIO_F81804_F819XX_ID:
+		superio_select(addr, SIO_LD_UART2_FINTEK);
+		sio->type = (superio_inb(addr, 0x30) == 0xFF) ? f81804 : f819xx;
 		break;
 	case SIO_F81865_ID:
 		sio->type = f81865;
-- 
2.42.0


