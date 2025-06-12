Return-Path: <linux-gpio+bounces-21454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDCAD7180
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6991728E2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C03248869;
	Thu, 12 Jun 2025 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="amNVPMv5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4824DD1E
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734134; cv=none; b=sjmrRohuH2jTp/DQupiK833GlXlVFyUb6+QBUMu2FADMZzSsDjIrdt2PCpxC0/RK1cQFz+5pGsMc+rl+UXu9iwk0MWlzh/dd/C3OcGQXSzyI0dhss3VpD3Uf115nHFinr4829Fomaz58ChXE8ylrI4VPKiVGkMSF9qYat8l4+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734134; c=relaxed/simple;
	bh=DCdQEcUDLTTl1/hH+Diq9E/bx+GpQ/RAE5sx+LPA2K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cS3u8+A6vslBkgzdyde77vd4QYnEJGTrzVSqy2XefORXIgyzNHpHDNSXeHe145GIVpGzEqz39YWQeJx8kmofExNWWLFLKySF5rOmqO6i8ZlVA6ZTxtmVAPmr3K0FMjLw2ezTVeVRhF/b0zT82x/fs4FWNTZJTDDU5MYjhtuigX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=amNVPMv5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so715153f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734130; x=1750338930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=;
        b=amNVPMv597kPo5AbSI2ALOoyyMalcc97LG/14gUbwQ5jPogXtEwzUcNPmLogapk30+
         Nc8REkfJzWVcu1mWAzOhvjfHdvKE/5RdC44vbt3LeAQzI+TLtDU0GezCzW9Nt3IWpB9S
         /0smo0c9YpDRsn4JhgJD8T8VKx2Qy5nKioc0D+VDHGEeCkbbmta/T303xuDr5mxrErAP
         MRETg2wF+ewOqmlg6TGs5c+1xOP2OR5ce2s3Ktd8rjPBDeihPbBuKw0z1J/FCDke1YRO
         ooOOdzCPJmlbS64iF+C0IKBr969kWOH+ALpt9Kl79q/YV91FuD57P4/wM33YjK/VO8AU
         HGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734130; x=1750338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=;
        b=odkrXrCSvKgN0I24LVimG/EYCuz99jG5OeMV8homyFxTYPBkTbB/PjaCHUZYy7wbYY
         mU48GhDMqGIoDaHr/otm0kQmEq1qYzHXJhLkiNwhgq4OAkpFnwXxvdD/aHHiOEo3iJn6
         IFFKjguX5HEa2NtMaOk6HTvFgG2JInDZL8j55T9pmtbSTP8gCd44ukF48PRdWWqRRrMX
         Yqawcry7M7v73LN9f+mbV1pMD3KXkHBaq/EUY3cyDWlJJ7+gz/+vBPU8EihDzUH1mnhW
         Cw2ESoO7xymKIhnDoL8jSb7V/piXR7XNhu7T1ThU+gmBF6rcrHtnnCCmWuu6z6AtqG4+
         s/fg==
X-Forwarded-Encrypted: i=1; AJvYcCWG4NIb5isBqKAJ7K0X0+ISVw1K7z1ivHcUIFDOD3oALzjqohuT8xSsTq6JhU3tz4UZ/c8xRLSePQXk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa8Ce5OLkqSIVi5/KSqf75fjwlioe0WAMvSw6iO3zuMdQH5k7Q
	WCewxLuePHOX3Dh2nBDrwzn+CfA4ZCatw5E1UUsE6eG8/UYrxkKDeYuWf+J7oPJkATo=
X-Gm-Gg: ASbGncvDj+mfwFU+dbQSu5JZCdEHWL3MUjEz/LW2fSFYvq4SGVKWM5++/cPNtlYQePB
	czbfwvcSMNXhmrBu49AeYw7AYHm+RZheZAv3Zl/0cTJXykGou0rOe03eC0D45M9vIje1Wjg/xcW
	MOndi61Iqh9ficRjdC+UA2Dcr2tP10IwBT7bcfTPO4DWX7rBa3iJT3tv3530RQKvLWwupM8DmGg
	VNx4uX6J5gRoYMd9wdQewr5lexv3UiaxSjhCdk1wxR227zPTEX7JoUkZTLcbm23ZU+UktkTc2y6
	IRKS87iBy2RC6a6kfrgWdMhVx6x7Wz2ujvdwD+95OoYlNE3oo4Is8nc=
X-Google-Smtp-Source: AGHT+IEjm92mzG6iTvPU0aaqMJR5tJjcC1kKUVwpXp7/ZRJdx/YJfK1/AxyJNMPRaZiUgO8dI0ZM0g==
X-Received: by 2002:a05:6000:18a2:b0:3a5:3b56:974e with SMTP id ffacd0b85a97d-3a560694b22mr2626108f8f.6.1749734130365;
        Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:17 +0200
Subject: [PATCH 08/16] pinctrl: xway: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-8-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=83dVwDjCWymw8bEavhDOHIM+hxScalMSI8x7KJC7tWY=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhK0uWivjkySga8kTnFeUwUE68bmLo7YM/dAt6M6sI+TJxUj
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoStLlAAoJEBGnLqAUcddyEcsP/0U/
 lQ+/N8a7qZ3Y1MwY7dHUJKTAx5Dfzvi0QNp3MMjqS8cvsbF+baaAXMW8ngmt+x64NWoYANmZ6bH
 1lRgsQ8pUweyVIBotIf0V1huvpTG5o6r6v6jVRpqLWw6OTMlDXHFcbpZDl9MFXQm1LgD/gNqkaR
 pOAY8yWvG5YXJGzz5PaZOxE8Dn81QWKgYwJh0kY4qgqOrIy5eefHE0LjmtWWWvlpkU3unM5uTWa
 k8Rw37a2U49NeIX1dz7lM8O7RicIdC/a8YqDuRkU99HRBPnMawH93t9cSlWVVqi3rEzt9nMMlZn
 8YZVHGwgC2TaJWyVzd+3zMJy2wqx94f4WFgCMk7oK98TbH6VaT57g3qyYorVUBPJ9DuYeiHN3Kz
 0VXawdCFHV4VwHWhX13VnGIo5tHIFn1PCQxKz6LysoKHrvPDXKdvVduU3lAOX9d4IUiND4hUSPx
 6kD6UrXqaS9XCdctmTZROU1jqUSo+jSET9EqeIsb/TfqSdc7CBrSiyFIKaTXDZNVF0WAhJA8rN1
 yANcZDYks4P2EiL/bRon27uP/947tNFjIXoY4QHGBfTBfi9DSQfyCoIoLs0SbXbofzs4A74Bxgm
 PE5Q269V5ir7Xb+83MPmRPLy4bK/9pOzT3CdEFZfGMhdoZZ9bpHDY0j6tS3nlEPrf6rllqjrk3V
 U+5o7
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 02e65d25e72911b812446ad4b90bfd611c9c1714..53c6c22ff24d752ba66bdd8d46c860bfd9a93731 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1293,7 +1293,7 @@ static struct ltq_pinmux_info xway_info = {
 };
 
 /* ---------  gpio_chip related code --------- */
-static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
+static int xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
 
@@ -1301,6 +1301,8 @@ static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 		gpio_setbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
 	else
 		gpio_clearbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
+
+	return 0;
 }
 
 static int xway_gpio_get(struct gpio_chip *chip, unsigned int pin)
@@ -1328,9 +1330,7 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 	else
 		gpio_setbit(info->membase[0], GPIO_OD(pin), PORT_PIN(pin));
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
-	xway_gpio_set(chip, pin, val);
-
-	return 0;
+	return xway_gpio_set(chip, pin, val);
 }
 
 /*
@@ -1354,7 +1354,7 @@ static struct gpio_chip xway_chip = {
 	.direction_input = xway_gpio_dir_in,
 	.direction_output = xway_gpio_dir_out,
 	.get = xway_gpio_get,
-	.set = xway_gpio_set,
+	.set_rv = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
 	.to_irq = xway_gpio_to_irq,

-- 
2.48.1


