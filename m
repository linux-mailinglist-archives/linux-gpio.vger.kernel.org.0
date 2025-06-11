Return-Path: <linux-gpio+bounces-21413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B2AD5FF6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 22:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4DE1890540
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 20:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D4C289801;
	Wed, 11 Jun 2025 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pne2+DQN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C81B0424
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673130; cv=none; b=WyvpevGvcozbfXR8HmmAixho0WGMSO2ZmgTPpIElWxaXvCDhBHBTEnKQi2CwrLG1J+TxsFn4MlVb+bTCJ5tb7ZGjnx0hbgU1EJxQlfUEhnyNXP51nhtq1eiYh5mvxu4LvzGgTGh8Uepm9m7X5RPZOPbyWMRdAmjK0sqDP3xi7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673130; c=relaxed/simple;
	bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrWUJMUMAlg+lVBbM9t4TIljbzo7cgI4XXUNGrhA5nxOk9liznM+mCSPX2FHILmmRsx+hsPqjSkY7c1TV2zyf0PKux8xcaQqpf2HtqsKg20OYagNl8h1lbyhpbI5JmxEDjPA574p4ITIlwPqP1TLfbAFiGnWdAoG/DgD+neFpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pne2+DQN; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4079f80ff0fso796635b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673127; x=1750277927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=pne2+DQNEBE1DBmtW322NUW6m73qsrlwzaXJAZjtMN8V+DpH72ZChl338zc3C7N74g
         0kft37MZvxuWMRQKlCYun781fo0yJz8qCnD/HWIkaIByLHVVPrZ2xc0OdL4RT4cmwDFW
         IJTsohFMvzZOWuDTZfL4kZg9+KxE5ekUCpsqVkoci1tP3mm/B+9B7OFmCkuwfdC+WF/r
         mwYP3eh3KJ4zINwwEFkU7J1qW5Yix2SEzGetA6ExRBgAdCPgCDirALkH7Va2rfSx2/sI
         7ImVBdal5fm/6lMAZ0t9ExbU5qXcILqgCFmbJmIUhEQygL+UjzeLi22gRw6IWnIz9yoI
         uGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673127; x=1750277927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=Ee0NHQE9RCoakCNFYhujOnMTelJenlHd7zoY2F8zVetY6Yl8eIc2vMiKU/nkdtKC7U
         gzTq9AREUqRsOGQu7uGRGcGdx/0wae4Z9vIbjNwYQHd8gR13WtMhPzm4fANNp10LK1H7
         peNcRcqJmc0tU/S4yGXFtzibDAC2ImBK+4AcYIepCiwFpGuqj8hGvXGjM5CImOK9s9r2
         lWiJF3YDmyVYmZ0r94afy1c2KciOt2Xga+zD8T0PKYYZ/vgrW223HTVXsc61K/Cm8MPw
         1oTQZSZkZOnzAVIpCmKfOy729PF4iuVlto2GGbnGMr/hhIyTFPtso00wIoUcC+/UC0Em
         iU9w==
X-Forwarded-Encrypted: i=1; AJvYcCUxlTo21DOa9RhXumCriiAUY9xQxFab3PhMXOW6sNeVZSETtvetDpC3jMhq52MVyXRGY/Aad1t/819z@vger.kernel.org
X-Gm-Message-State: AOJu0YznX85nKHIB9jIA/o83syMZyH6MbqBCKPCIQfcvQPtMYCSwVMzE
	hY6WCZCsJtb1+ktiIHiH9B+nXBcCP25trz2E94js0/2/YtTKFllmx31KxC7EjJgDF+5mES+hBvc
	iTSDp
X-Gm-Gg: ASbGnctAq/4ZZZsQEeQrEacZcdhiF7UMbwPFz6lW3YczlWF5q9sv3g6QBpc9ACDxFRp
	BCwJtPyqPDhmTl3K6HNVSLsyCjlTlMnSkF2vzBCfp47gd7jp7iJ+nmupJMvxqCWaFauMj84zLiZ
	LeHnZu6pkSZr14B9irv54G4a5BAJhGq1zfopIzqgdgaxxrSjJYNDbz4N748WCGEVANMG4k+Yzam
	TCwwEZYh605HtCFCZWPK89BZ9EwAtuHZ81tb5ORKkVANsU27jJrPM8zOX5/Sf8LwzFv9cXZ/zEu
	uDcSWI13s9qMRurHhiiEhBErbOr1skxnbxfJdD5r9ESGKBm0r8gKyOFqXJnLMGXgo+WxFcgMe+y
	5ExY=
X-Google-Smtp-Source: AGHT+IEsgVOS0Cay3UgDCHS5flNsvIDVMlhbLgckyCmrDV07SD5UV63dS599YfSdekLGeOGNrlRAZA==
X-Received: by 2002:a05:6808:1a13:b0:407:9d24:af03 with SMTP id 5614622812f47-40a66048f3bmr626458b6e.14.1749673127379;
        Wed, 11 Jun 2025 13:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 15:18:10 -0500
Subject: [PATCH v4 2/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-set-array-helper-v4-2-fb86a9b499ab@baylibre.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSR3WFNtYYJy+OvDmT0FfOVbE2ZWgN1LwSvI
 hhaBWo6iEeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkkQAKCRDCzCAB/wGP
 wHGJB/91c9MDNHlXlq7EmskEj83sq+4fEyuAUc3SHN4AMqTJs8bzFLhHYUn3PqHXh4DPulwulNb
 f2NoBOAUwUg87Ss0koyZ3DBw1f4JBL8nHCrvwoK5XUNsCuFClysvag/sDr25+YFa89zZDg7BJuq
 h6uZlbirLJj518mNiTG1gVdiP3ezMybNzNLfuma28EkBum7DzArMY8sLulCIGGeiZ2yRrNGEgY6
 JYYMW1zph/pP1NEfwJWZALncH6owE3WbPnYlL46IA3VO30CqHv7NOJnMWBCXykHmee6Eq9Zg+Zm
 tak73kkf4T1P657GshPZBolIVryP3HqVteJGR2V1K15G1dRO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..b4c9308caf0647a3261071d9527fffce77784af2 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
 	gpiod_set_value_cansleep(ts_nbus->strobe, 0);
 	gpiod_set_value_cansleep(ts_nbus->ale, 0);
@@ -150,12 +149,11 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	struct gpio_descs *gpios = ts_nbus->data;
 	DECLARE_BITMAP(values, 8);
 
 	values[0] = byte;
 
-	gpiod_set_array_value_cansleep(8, gpios->desc, gpios->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0


