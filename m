Return-Path: <linux-gpio+bounces-19664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFFAABE1C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CE11C24544
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71102698AE;
	Tue,  6 May 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E82NgLrd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282F264A7A
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522119; cv=none; b=Y+ADZA/rNvXNvDlbf3j5JL6ShTXib7EtXXmArM3dH6RDOk1oXlStT/40sV0XwvDh3s6eIarC+4BZPnouCdnXoV+qOpdMDGiA2lnS6z/No7lOSh2pm5lybEr/ciffbJTKSzWj8wkjQNkkoCrfo/mOPcUodEFwKGZgHRzVzWOYDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522119; c=relaxed/simple;
	bh=gYKt/V/uMuHipLynaF1K3ceGiFbenp32cyT/tx97Akw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PO54IeDo7NOqLv9nIbXIZszefA5Rgicw2T9Z8I3nav++2HbMe715B7Vi1M7IPEOHZK0l++fNSmXjypxEjvHx8tqEvm++BYbMRNDzrdTAgKqcYuv8ztwvC70uaSQRzr1Zz5niNMEglsiCBlG8e/4FIKHoaCd4OMrG78DYUlmABBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E82NgLrd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf848528aso39896895e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522114; x=1747126914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=E82NgLrd5aQePPCmpkwHp6MC+yNO5DOha0vWYFlF6Q5aYeifX+SWL6nYaeVHSx4mr7
         P/HxRA6mP89AtNKvVfP2SCwRoAFyf3JmcsLJbkONuTIvG3orazs9cQkFIX/OZOeWwT2F
         yWCnfXkLhrC/qVgQbubyv6LtctGSw47Vb4p0qMPfsWv1ESdL3QR+L6MN/mDh9WFatYpJ
         +dnQaKmS0duVcgh6ZinsEfRBP1kVpeGyB7M2ZvJSf2oMM9553pUfHJ4svHtx2eUQXpWx
         t46a2g2p7k0aN3GBLfXhg4ZxO4DqD+XVg04gsUSG3Ia1Vf/6upoY8AI9BVkz49Dv5Ma6
         LKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522114; x=1747126914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=p/Qh3XvPxk+fhyMUeHskoSCb0iaiTFA9YSdokUNsGIx0SJI/WRlxhcCFWmTaTExoNQ
         x4q93xjjNqJnBnIeE4mqMmcT0Kaq7T8Y6mvLdp0czALGowAHD66/xiz+LEBungtHk5bI
         8QeTIOk7klpOID+qk+XArVHQvgdECgDxBSWM3arepZ1k+FPCLNDIu9Vpm61gCLhlQ+Ie
         uPQ23BLenko+132569s5YQa3duHO5OJy3mF1WqYowaq3sQ3p8YIAVSI1YKlY9fX6I/Sv
         62V6gjhHcJZUhrztNeB/C4NZOUtikBs7J6tSoXlQVHyP2is4gHgpPIn5ytugqjvS5qFO
         R84g==
X-Gm-Message-State: AOJu0YwtyqLLcX9jSfRLIWqQILoFR0L79EmHIlZYg60opPms35woQIz1
	EGN5na/veqKm5FDI6pgICJhBg9Nra3qke/RIdwX9PWrxhnMZHtoxGdPF60Dq4xAgCyqLLa1sgeW
	W
X-Gm-Gg: ASbGncu86pu85JRTUOqMCXlBQKN+TlDhrRNX71lQIS9BpH1/P8ScNlBUb6FAqwSI6Ws
	WRLgcK1+L9NA8imr2cmrRQLGik0A5lhK2OTXuyI93shojrz9Sw4wjDDJ5b2VhjTQU+he6dGHpsf
	gP10RTZkZROWdjsQ9FIFTG+qGWPKVyE+inaD5NOmN1Pq/eHan6W68+i8BDKEOw3s5hs4G3vjNDi
	reijqKljfdjLBkajw6cPvQXR4cmO0UqCtPzJ91hj6FtpDOqTqIUnmVipF6wk8VWOAHcr/9iNubS
	iQh1NuFVn0uqa4U4osOp/jKzmiY8CLWjNjg=
X-Google-Smtp-Source: AGHT+IGDU8UwVARAbr3wvLnx+R/CMU+fndtw+gPiz5QuLHtsjMKW02FOMERXLYV/50G6vY3UpD1p6Q==
X-Received: by 2002:a05:600c:a375:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441d10154abmr18934305e9.31.1746522114107;
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:44 +0200
Subject: [PATCH 01/12] gpio: lp873x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-1-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KzVnua5lKk6LSZ+RA6U6z6ophC29UZ2psB9O2qSifco=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/8PZdeK3eoxj5LZCAwJ2tSgAZHtlOTQquu1
 TAv25EMsKmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/AAKCRARpy6gFHHX
 ciBXD/9eOGxP6WMpRIbDeI4ZPyWQdRiVWSzDMz0kD+ULzuBS7OHZLm1Lxi6rYWDOoZpA1aa/qRm
 T5DXumO4TNeoTYBlW4zeeAEyA6tdzECpf1BhhK/71Cn3CTpEE5pCBPbr1SvCuil2ysLA1n3Xg75
 kgPpAliYslsoCvHFYMZmoP/fFYVs5VoMLCCbAt25ueJJhtaMLmaUr9+nsxjQWRQFjce8XjxLZii
 uJ3Itxgyt00NTON1YpRsK3F1mGAeoZ1Pd/RUkCVXkRsvFN+faFyk9IbdH7qlAUYAG0U+ejvRtYm
 /UyYpvwOe23hQyg+2Oi7V74VaTaEQoEy4t/s95EwAXun2JRR/3iJiMs2DCKh7mu6mmarCHQ0UJ9
 rxrMU0F8SWGoNdoHJI84PkrzCowsnyGfaRbErOycQwKW7sif5ra5B+FBN0FTOzpt9H50VtulR6u
 ki6ZquD5iMa4DJg4U7s5rj4LSL41DL1E1PI6WKGM1SotlSot6p+ShkRrgong21J0XZ/Ct28bQfO
 FHWNqOgECDw9gWlNurVLK1udL3d1qtF24kPC+tq5Z7CmYOa+J86cFTFVihnXzLEUpjlgrhnsTd9
 LVPrjLlEel3vU7pgznmnDpKarYuIvU6If7rb8TRGHcBwE3diBLGk+eBSPYNSNnX5lDbsWkoDzMr
 JAhTSgymkWD4x+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp873x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 5c79ba1f229c4..1908ed302e923 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -58,14 +58,14 @@ static int lp873x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return val & BIT(offset * BITS_PER_GPO);
 }
 
-static void lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp873x_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
-			   BIT(offset * BITS_PER_GPO),
-			   value ? BIT(offset * BITS_PER_GPO) : 0);
+	return regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
+				  BIT(offset * BITS_PER_GPO),
+				  value ? BIT(offset * BITS_PER_GPO) : 0);
 }
 
 static int lp873x_gpio_request(struct gpio_chip *gc, unsigned int offset)
@@ -124,7 +124,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp873x_gpio_direction_input,
 	.direction_output	= lp873x_gpio_direction_output,
 	.get			= lp873x_gpio_get,
-	.set			= lp873x_gpio_set,
+	.set_rv			= lp873x_gpio_set,
 	.set_config		= lp873x_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 2,

-- 
2.45.2


