Return-Path: <linux-gpio+bounces-21566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91CAD94E1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 20:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143F71E4B74
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B123F421;
	Fri, 13 Jun 2025 18:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OggyQU+j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F5E2356D9
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840975; cv=none; b=mAsKzndEv/lMCY9MVxooI3+dhTobUFndIvtUuezisTdzYzOCBulzVXZvCB/YksA69kpd7UHnbiG4udbgoPckbyQ8f2GUazxRnraew8gJtevDpZtGMsZRJBl073xljpygHRUtRkZH6B2BVQ/kzk3RcWRDGV3rP5B95fpFg1GsDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840975; c=relaxed/simple;
	bh=CAL7obHrndJnr3rxcS12mN4GTY+FeLhfpJLw2svY0Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbJCxEtciwMPn6H+GRCDSuj3PwwJ7M1UJBL1d7HJRZsfraJpqSSMdUNUhm+pQpUubLXMzivRqe58M+6uN55nBxb96kgKHLWVrPRVvnOjYpYaSHD6leDHNlHVaULpErLyVHlE1ik3suklLGq22lANnMmRvNeewvZjDEB77xfwEck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OggyQU+j; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4067b7d7e52so649918b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840973; x=1750445773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=;
        b=OggyQU+jiAC3Jp30HbM7WZiMRU+ktkuxbLd62PikXn5Qe9DySQ0tvMgE+A3SocbjqJ
         Ry43KBN3omFMAOSUIhyVAfCfC8gNbfHSJlXTi/9dhs3TkmPoPaI2ahalDOoM+YnpUCq3
         XUTTljqkCwZ8YfN1kLsprrfmMuv0C/Bs4rEPQvTDKiciLDTFW26bK/WEhRcAdW0xa3VG
         S5f/w9B2Fh46pCIpB87Ht9mlSCyuqo3qj9+CgLoIn+0zMHIZ8rKSI9aTRp84UaMoEcWh
         TdGL0irh+qk4lIDxr47gopOiaIGgIOw++c/JoC7MJzG5x6aPhcsKWuioMg7RWfrSwZjx
         NL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840973; x=1750445773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=;
        b=Cb0SgS6QawpBTdP+k4kDA2mXsfbz6Ytkn2I5Arbg9Wy7SN7zQkY60dS0g1Wye96DxW
         In6K8YHHav0tlGa5SgAfhBMWy9ES/Rst/3uP9Rh2TUEPUwHCVr5foZ6+reS+TVhPiDFU
         4E3E+e3g769mVoBzczYq0gUyEf4ZtcEEZ4bYc5VHvH7CexmW5dR3m7XT8wwBNfnF5nmJ
         j1y/1ab/0E5Ly/GDRA2cQ7EpJSibDlJ77b5HCSRguoAY3hF6LReulTa1ITQ/glWZ5F5j
         9NlWDuijiU/rqAe7uPPneLhWrYsaMJbrsN42iAnQM66ToIQYTvMIX00xL/Feqg+C4hRD
         M77A==
X-Forwarded-Encrypted: i=1; AJvYcCUFe289XDFUiuyzEiRZqTI0gWezVsPHOhy+H7Tit3J/eZaqx5gaYKSsvcA++/STX7debBe4xQU/6xpx@vger.kernel.org
X-Gm-Message-State: AOJu0YxojlYO4+D3LZX52f4cAxvAtnwmlyTIzVrO5l63kblRvDiebFxP
	PWycUJ9P1fUOCLnV2G2kGnSM3/a2GP+5jCAvfHGof2tI7F0sevNnP5pycafnZ+TVwjofv/zjPFe
	IYq5B
X-Gm-Gg: ASbGncturRuK68dVrl44eft74462o2m8KrU7GlZd/iT3bwOfizPagHhh+GRHjQM/9WL
	sBwn+VFFxulbgN9UylcvGry50WWuN3ecYefsrQyBav4wzK+SWjfxrXcVuUvIHe75SpDprdgiBP8
	vIxNOt5VTI+PaYlI/ftr2Iw8kNw2vkm8iS1qIupxHplXFu6DlwgjhomZfzLNuNKw/iHTcF/3T/H
	tEYyzNkkw890g4zxe1By9t7CfQo15wr18r9UsdGaXzcoVHG2UH54RTA+brRbw3rYptjxuUSytY3
	yzjNgVVsjLUc8U8+h6FdezDKS6u0ntyFeXbYj1ov8OSVn3qyQOqkZfH5UK6FqEfio1g=
X-Google-Smtp-Source: AGHT+IF46sUC7fpnm70pdQWqZs7Gy/g+8A9DyCLSCMcbG6MfejW4kWoNwjo5H4XZGjACXLhKZ/slUw==
X-Received: by 2002:a05:6808:2224:b0:403:3973:23c4 with SMTP id 5614622812f47-40a7c119d5dmr395805b6e.9.1749840973013;
        Fri, 13 Jun 2025 11:56:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:30 -0500
Subject: [PATCH v5 3/3] bus: ts-nbus: use bitmap_set_value8()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-3-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=CAL7obHrndJnr3rxcS12mN4GTY+FeLhfpJLw2svY0Jw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQ7wb/Wqd5uM0itH561zbuzBZLhf8SMVLJOo
 +RXFtT1YgmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0OwAKCRDCzCAB/wGP
 wPGUB/9sOLa34ENc9yrrXBypfPUlomEv0iV2hsaVnJZ7RH8Sat74YHznsdIkYCNfuDpNPMux7Px
 qwv0u/hJtQSgKwdbZkssK8MMoTgQ16JXlUiovxbdDzyM/HqGmvA64mNvfNOvTN8ZDO7nlTG2ojo
 OeZ+7yGMbprFMal41StzydFs9R7FcCDVt8TQI1XvIYRFyQgrjfWqQMY/AEE+l2jDJeFywjM1qtj
 USF53Wt1ke3qkG3Cew8U48WrOPHIhpKgc0r8m69ZbqT2oehrZqy9cP3q3E/64OrKuvuPocmGIny
 wum0JT1pzp68jmyLwG6V9nlIm0RDYuvUFTUFGdT30gnshHMK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use bitmap_set_value8() instead of accessing the bitmap directly.

Accessing the bitmap directly is not considered good practice. We now
have a helper function that can be used instead, so let's use it.

The bitmap has to be zero-initialized now to avoid a compiler warning
since bitmap_set_value8() does read/modify/write rather than just the
write that this is replacing. In ts_nbus_reset_bus(), this zero-
initialization is enough and we don't need to replace the array
access with bitmap_clear().

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
v5 changes:
- Fix undeclared variable in ts_nbus_reset_bus()
v4 changes:
- Fix typo s/get/set/ in commit message
- Zero-initialize the bitmap to avoid compiler warning
---
 drivers/bus/ts-nbus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b4c9308caf0647a3261071d9527fffce77784af2..371fa83ad0db424ea48cd7c23e3070f56162d7ad 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -10,6 +10,7 @@
  * TS-4600 SoM.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
@@ -105,9 +106,7 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
  */
 static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 {
-	DECLARE_BITMAP(values, 8);
-
-	values[0] = 0;
+	DECLARE_BITMAP(values, 8) = { };
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
@@ -149,9 +148,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = byte;
+	bitmap_set_value8(values, byte, 8);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }

-- 
2.43.0


