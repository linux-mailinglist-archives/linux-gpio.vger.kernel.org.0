Return-Path: <linux-gpio+bounces-10991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041A993759
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A8E1F2429B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415271DE3C4;
	Mon,  7 Oct 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T22Edcls"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B71D935D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329438; cv=none; b=ELD8l+sLvaeQqevF6fnRdGA8xQUI1aDO8xk1hVNVNlYssH0wkkM+tdoiKUcflNuVHUSX+/9iembzPAvgUR6APKOKPwaKsKZkcmrI+0CMeSaxfAG3bC5E4mGChBO6mKmso0ZKStCnYP7laYUUDsHZFU4Jvw9rBwnEp4IQkAoYK/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329438; c=relaxed/simple;
	bh=zgmVYRzyWM/SdztsAByJnMxMP1zjIU7ySm+mi9M4YQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLdM+EytsKjDbatiMqJVNr61grQ+2C7tqkFEGbyzjDYnPFf91M0Otyerv385A6mTNbqnv2TvkMSO0g9IbY0zwWd+OhgOcsPEC1PrAf6lkCO6xgE3ezYbm6EbnkmNNQPu9m/5O7y5iwJYiUYortFPG6xcUfiGpYumejsvcXrez3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T22Edcls; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42e5e758093so42120175e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728329434; x=1728934234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hilv4Ii4eTmBA7qb5KQRRNfefq6cWF0PKDiqvEJnT4=;
        b=T22Edcls+dD6izMWRIzJz9usaZ2ITwv9qSyPGndn9/IjeZLzT8lO132ffVgrI09mT0
         riwcMaEGmGd/cw/MvupZyId2CZo2Jt/WAIVJPM26dfBqzRjiIflWn0WkiM5lq1fccX30
         4TmezkbyWc6Ym/T4fbO3e1Gqis3ZV6Y+7h8IaEhRSCk+p5RuynTuUllaftBE7E46COwk
         BhE+lMZ67HcDkohBs3cay/EXaqiysyBCsC3XdIC/mRjwga9I7Pp0x3ko7Gxkvz4Pv8ap
         8EIMrsQi3T/LwSGCeV900+8p4Htc5HYlydpdaHq5xC77RWmBt2cmcY3rBnbcT/56XsKC
         tTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728329434; x=1728934234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hilv4Ii4eTmBA7qb5KQRRNfefq6cWF0PKDiqvEJnT4=;
        b=S+XXMrw1kurw08HkntFSO/YLVbat31kCRInT2r97LDsMI53Rtq9nrncjZ2rlDfELRy
         InBDRbsTHZhIdSvI9oqwDWHbdz7nhl3ogbFAxEUhHPwVetAKDmatuXZVpXbjNzzGcDiB
         QvJUJrCu2k4BIYZ3yp2Q1XKlERa4KBJRv1R53iumUhwg6SuvR3s5kYqivV/IxNVySRQ0
         Swq4YfxtBjeI0zSCIjiMq/nmdPg6eTVXSKrND65X4fQXgITOS+drTF+Kjt140lJsnrF1
         Xnx3XxN9/Ml+lx/mTf9OvorZD4sZRIdYO7sHtLYs280/PaTwMfJ351IhPxlOgjQwlL3u
         SnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVAVq6LBRR0D/RsnPaqgR2SlGTqsChITHXcjl9VLuMHY7U8gDlA0vfc4nzLwhhj8Smy0Kha1dOxlAT@vger.kernel.org
X-Gm-Message-State: AOJu0YxNz0UH+PK99V6JSxL9EeveTXm7+IZM9VGawELtnmsUgerMLvWb
	XZFWv4Yfdq1hzvKKw8fU3bQIWa2bApn9X+bom9gWduHKjOZPK11Emp80g/p2IIo=
X-Google-Smtp-Source: AGHT+IFYcwzeeCaEunm82a1aKvqD6FdMYaRMTLfIAmS9pqGZTyXBKciqoH7ZNw9UzgtLbg0JKCGq7w==
X-Received: by 2002:a05:600c:1ca5:b0:42c:cd88:d0f7 with SMTP id 5b1f17b1804b1-42f85ab4830mr94103485e9.10.1728329433790;
        Mon, 07 Oct 2024 12:30:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a2052asm101321905e9.18.2024.10.07.12.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 12:30:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Oct 2024 21:30:22 +0200
Subject: [PATCH libgpiod 1/3] dbus: client: notify: fix reference counting
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-dbus-memory-fixes-v1-1-0d56d1aa032d@linaro.org>
References: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
In-Reply-To: <20241007-dbus-memory-fixes-v1-0-0d56d1aa032d@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MYhIU0N3++ROKfLK9GhlVxMWZ/O3JQbWQNoOx+sSke4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnBDbXTAbFT5UXBHXOk+d3apZynny/ky5Cn3w5X
 76mdrnKI/eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZwQ21wAKCRARpy6gFHHX
 coKgEACUoN8Eusk+LUzHNyKltNgQhvEl4Z1ax73RSVuiyMgvuo25i0mAGUnjo9+1dr2LooZQleK
 ayrq2JMV8tRSnEhVpQrUg2LgAk3LwnmrupK6gKnzKhq7YYdswVupoGjJslxK5faPm0xpOFVynxV
 5rO/4CSwH6jH4FEHU8h09R/3PAoFuKPTzjCNxD7bdKi0a+Ux0ikZUR4Pwrn+oNphGkm5gCm7FQq
 lG8cSLGBh34Bb4U6lPFKLcGw1CpeyhjiuVsTk/nYUhSpoebw4/jl63f5G98GXbuJbytERO1gTcL
 p0gk/rVI0S7aVOnnurokES2rgU+ppiBDf7PMToq/2Ba417EY3HBRx4mflUm28ACrOXistsV497y
 2CLLDzGaK3pkHiPs+3aId4HeQqM+Fd2Y8ai/sqC3ZiQJv0t2/lMj6QcFHJuydUw3vHAYevZZA0U
 84XJ9hDHSgXIH/lwlJ0vb9OUMjdnF1dNjmnJ3l5Vb5NLJO3aHEgXO/MlqDHJXrTBlTS4+tfcaVK
 Sg6Ph291klGVG3ozTUtgGdNUKuLyB+DQw7zzehLrPLR15vqbzpe44A3Yq4pTMwFd3b2ksFSyB4r
 x50stv3PyhqsOHu1cYbXpulgsxERmD1n1NS4hCSNOHKE1pwdOAhFfSimbiNy0xl9mZ/wBY8R9DP
 31M+XJxTOa5Y5qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's a reference overflow when adding chips to the global list and an
underflow when fetching existing chips from that list in connect_line().
Fix both issues.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/notify.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dbus/client/notify.c b/dbus/client/notify.c
index 5c73343..6d51a6f 100644
--- a/dbus/client/notify.c
+++ b/dbus/client/notify.c
@@ -211,10 +211,10 @@ static void connect_line(gpointer elem, gpointer user_data)
 	if (data->scoped_chip) {
 		if (g_list_length(data->chips) == 0) {
 			chip = gpiodbus_object_get_chip(chip_obj);
-			data->chips = g_list_append(data->chips,
-						    g_object_ref(chip));
+			data->chips = g_list_append(data->chips, chip);
 		} else {
 			chip = g_list_first(data->chips)->data;
+			g_object_ref(chip);
 		}
 	} else {
 		chip = gpiodbus_object_get_chip(chip_obj);

-- 
2.43.0


