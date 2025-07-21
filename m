Return-Path: <linux-gpio+bounces-23582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C07B0C4F4
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043483AA1A6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 13:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F632D8DA1;
	Mon, 21 Jul 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YUxC9lvL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC37290D83
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103722; cv=none; b=peOtoLnXEnanKh/1LmVKmM8VbFqQ6z1ioFEAOfps7NRe/M6A3zmZb0fWB//9QqPQIHibb+KtlPbxy2WOS59OfV7srJRo4PCkGdzkR2r8esCY9BAkVPJDGAPWgREL8PU3MggLfg9J7msGIC/k7WXU+YCsjJ58hTuGTtKu54zjhSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103722; c=relaxed/simple;
	bh=OLFyRAWYVCojqMOaG4pRHzi1oiXlwO7AEnKO0IReBPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfgDC1nx1C8C8iqqgpzbepvPRSf9gCTBGE1AY2kSEkYJRKGUp0VYjlfWdjMxzxYdTvpmXUZ5HeHXl9a9G1m5UR3T/dddV5Lz4j56DY2d6JMxXIqcaLt/gwmE63sqNm1Ya7KuuOarjKI++CmkiLrIOwE9VHE2MAhOkn/Kskie1d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YUxC9lvL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d54214adso30821015e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753103719; x=1753708519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
        b=YUxC9lvL528yD1p5Pehs3jpGldRKS6H6OO97qa24H7c6/fCC0vVMn3Qo97jEqKjCw6
         k8peAN+d31+0AblB+GVA/QEgGxgklA2PVGjebCIDZkED/3MLiGwd6sTq0zyMptv3HJwk
         QKdm9Rht9aZWno6TUp5iGW60gYr+eCUWWxsrPfgGfjMZRM6FCDj5Bdt+bxOo64H7jGLn
         qfHviwBEg/CrugDUA690oIhwh6Co1HYHt3if/+zaMnNR0SUwy6P/jfHFmMZHK/4kVfAD
         lOhxRPUEwObLuT4gO+SDBVZ2pTn3eD/zB+b3d8FTkMjGgNx9zbOtBLDjbWnH9V4mvhFz
         IaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103719; x=1753708519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
        b=UR0MFZlugNsKqoGLwTOGT/aG9byUKiuIjM97aKPSPU3x8CtM1VTHRkHeO8t+at74jG
         W4b8HWUCCxzC2yUO8zIfSJHLbquRin9eAqR/pwN5sMvCnBoBQPNwTRSbghGcZaRYfdy8
         azh+V7/WoxEcIhya4rSm2gQ1wXAELISC6opXRJ2GAKN0CxtMrJ9Tx4ULcDM0DuMdKLPQ
         XzZaJ9sOLEkncIQCk6BgdpqHlpHPasx2I3b905Y9hVm02GDO14fGICvzJYKIOpIRrph/
         v7npN3omWwnLFYSms9eHqdv7ZhEKB3ilbLakM4PzlebwE7lUR8oOIQm9mmK7wYHdSJlT
         TAIw==
X-Forwarded-Encrypted: i=1; AJvYcCUGFkqayJP7qgLb5RgRjzRifvg2ZMjIbMKclqpSi1DyKxJV0SretLfQMdn7IsZUup3+ig/moa/mYMTY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ACpv4AAaeSoqHzQ59BaXR/gGaK3te5G8iwrEpKwljFHJamHc
	R7kTiluMPshPvKijjzfsZcfKzYl8J3bZGNqbeX8ReN+R27y/kamoWNWbEv/p36VI2Ng=
X-Gm-Gg: ASbGncuNeUg3gPLOOnT2alq4vb57iCkjeeiGR9pAXeY5Udb5SfMeHUNQKTs0VPRFqm/
	7/Cbi6fZehTNXKno4glQx74SjfNqhWlX6ZlKwVshtrDEH50aVsRC14pFAuyTtePBoVbuTJvRAI5
	dtf4Rh8GKuqk55g6d7vgxtLQenFXBV05VoEirAR9OLvdVcr7SqVvLMtrRKn/AyluhOmX1eRsp5f
	AHmILGwiF2wC0LgFr7Cvdj5x2IvMw69ryA0PdlZ6VXBN1odgLnEPF9gMsmViEDSsDs0oTX9lghS
	STKhAwiSPcOqtDzI/aYfOKcAb7ehOAoHxqmmbuJBFwlOBfdUgY0pdNJG7tHnWFcCOzIVQFzdfUV
	yHflvq4taemrkubckCskSet4=
X-Google-Smtp-Source: AGHT+IE6hSA6IgSYZzhjcHqll782tZfplfgYxnmAitmMV8tqIpsaPAw0Kw0vQ/HRkVaESo1pggEX6Q==
X-Received: by 2002:a05:6000:430c:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3b613e984ccmr12169355f8f.32.1753103718407;
        Mon, 21 Jul 2025 06:15:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e818525sm159556685e9.16.2025.07.21.06.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] soc: fsl: qe: convert set_multiple() to returning an integer
Date: Mon, 21 Jul 2025 15:15:11 +0200
Message-ID: <20250721131511.75316-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The conversion to using the new GPIO line setter callbacks missed the
set_multiple() in this file. Convert it to using the new callback.

Fixes: 52ccf19527fd ("soc: fsl: qe: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This is a follow-up to commit 52ccf19527fd ("soc: fsl: qe: use new GPIO
line value setter callbacks") in which I did not convert the second GPIO
callback. Could you please apply it on top of Christophe's
pull-request[1] and queue it for v6.17?

[1] https://patchwork.kernel.org/project/linux-soc/patch/c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu/

 drivers/soc/fsl/qe/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 5391cce4e6ef..710a3a03758b 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -79,8 +79,8 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static void qe_gpio_set_multiple(struct gpio_chip *gc,
-				 unsigned long *mask, unsigned long *bits)
+static int qe_gpio_set_multiple(struct gpio_chip *gc,
+				unsigned long *mask, unsigned long *bits)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
@@ -104,6 +104,8 @@ static void qe_gpio_set_multiple(struct gpio_chip *gc,
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	return 0;
 }
 
 static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -320,7 +322,7 @@ static int __init qe_add_gpiochips(void)
 		gc->direction_output = qe_gpio_dir_out;
 		gc->get = qe_gpio_get;
 		gc->set_rv = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
+		gc->set_multiple_rv = qe_gpio_set_multiple;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
 		if (ret)
-- 
2.48.1


