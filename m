Return-Path: <linux-gpio+bounces-187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E197ED5C4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 22:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19271C208A8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115EE45C11;
	Wed, 15 Nov 2023 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="QK1rzMQp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5A5BC
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 13:12:16 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5bdc185c449so97104a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 13:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1700082736; x=1700687536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7sCUwcBlF+LnWvSB7Jm+r2N1IF61ZdXk6HmmnXauaI=;
        b=QK1rzMQpEQfokpZtS8QHgHQB157NrIBwE/14/tLK6GxytHJ2+V0/i6KgOAJqwqP+Yv
         aAb1B5W8nPqNbOURF3bm8C/0eBSZuezShDgYofKvdK443HUC9TDumdzSO8UEnG7yEzvL
         QCT8U3j5sfc/KeBjdJRndkd0ZASzRcEvX91SxWGepjOF41gkH6uNyb8SDys1XgKFIIlp
         gKEBZkAvNnNdADi5FdZXFLw0uk2+0zC4UqOd96nf3sgrgyXCUbjUXn1z1o7dHHR2bKnw
         JFXdFyCaXKMQiSqRMswPTfK5TfyfO7u9XPBFHS+9KVRO3kZ+ES5ldsgdQvO+zWxRFwi3
         jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082736; x=1700687536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7sCUwcBlF+LnWvSB7Jm+r2N1IF61ZdXk6HmmnXauaI=;
        b=DbUqr7y70j3z6+HohKTm2Ghz9BoRwui8frp97OHlUBbCMdwb9HfrMQPCdm5zoY6j+Z
         OUsKCxKki42UL3jC/yuc7yw+9ZfRWP3m/Mi/CBzg8RQZhFWmx/ap9ANP0IBXZYoK2Ywa
         euwNpJ09uDzvToQI2AAQb4eMKrrE0Ei+d1vL7t6nupI68QMnrAOoCi1fAbdQUJgJ+pmr
         yrdc8EimTj2ULXuLCKSqycMdfNHV6lRUBIoUw1JM+hW+Y4vz9cPo4YcP/I7mqi67Mjva
         Ptjm8Y6lqEwpGV0ZAVQvS12SGtnVSi2pLA/F+90LNsxxkb4rv/AwgRgwILWqmUSGTCkU
         Qa7g==
X-Gm-Message-State: AOJu0YzdmbnEMW82BmmvKRYsuwscDJPBYKq/vNkooPQ/1cXaQC2nZihD
	QYuOF9yoZX+woziiujSljLHSxA==
X-Google-Smtp-Source: AGHT+IEvOBFvCIx2bVxuryxCJrCem8yQIbAY9UFsBdN4FoO3+8M5uv/YfMjfsGXOegflz/Le7wFLbw==
X-Received: by 2002:a05:6a21:47c7:b0:187:a945:8372 with SMTP id as7-20020a056a2147c700b00187a9458372mr597323pzc.23.1700082736303;
        Wed, 15 Nov 2023 13:12:16 -0800 (PST)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:c624:fd:194b:791a])
        by smtp.gmail.com with ESMTPSA id e16-20020a62ee10000000b006c31c0dfb69sm3163912pfi.188.2023.11.15.13.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 13:12:15 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	avifishman70@gmail.com,
	linus.walleij@linaro.org,
	joel@jms.id.au
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A . Kennington III" <william@wkennington.com>
Subject: [PATCH] pinctrl: npcm7xx: prevent glitch when setting the GPIO to output high
Date: Wed, 15 Nov 2023 13:12:09 -0800
Message-ID: <20231115211209.1683449-1-william@wkennington.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

Enable GPIO output after setting the output value to prevent a glitch
when pinctrl driver sets gpio pin to output high and the pin is in
the default state (high->low->high).

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 1e658721aaba..62a46d824b46 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1790,8 +1790,8 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 		bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
 		break;
 	case PIN_CONFIG_OUTPUT:
-		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
 		bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
+		iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
 		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
-- 
2.43.0.rc0.421.g78406f8d94-goog


