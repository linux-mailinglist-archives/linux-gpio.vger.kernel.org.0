Return-Path: <linux-gpio+bounces-15650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE453A2EA0D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5047C162778
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A035D1E2613;
	Mon, 10 Feb 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0XCdfwVO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91431DF992
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184734; cv=none; b=oCE0EQc5L0XjdbpQOAmUPA1Fgt8fTS8VzKNw6r1Y2YIxNNAwVHdhaBMiK9pgv5GqgQTpxc6TfPkbtlMgGHZLW0UPhTblJr7wVVrO9cVtgUCXXS62K+4SHru0jL0/jb9YAMf0fM2F3wKay96BjecMOZ1+77Yd3lpVkYeCYsyesuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184734; c=relaxed/simple;
	bh=HiD8MOfVO6NKeeMuA8BdD1R1bH1+rCekUjVkFE0Z6yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTjepC+RfxSrUJemb/nJAN/lVilx0M1+a9ce7frM9atI7t9pzFLcTfrlssAoOaWz8U/LPl5Z3zajajZAlflN8B0IqstKTx+YRo+pyTlbQa8N7in6R6OxCna+9s7ZcFg1fgJmZ2a0NciKEA6sZidgRVxeXavo2kuyDlV2qBczCgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0XCdfwVO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43934d6b155so9181825e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184731; x=1739789531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P+XIrg3e48T+45SB7OV7xfhAg5zNW2nJdNfDkQWT08=;
        b=0XCdfwVONJ5jhKywk/IrdXsTjvFzUulwJeZAUDa5vnym9h4Fsk7Oj3jyMlcYfJOMRk
         sa/XNuv7B2a5KKFXBiCzZDxeBMUBaayFU+lH/AB9GG4E0CQUkB0iTSpq6ro6lPialrBi
         pADrnTzPxsSshmZ7mnNJtYMYcKaxTymZu9fJ4p8QJSbvgwTosE+eKQ/Lov1q0oH109nw
         xZDpkWFhlJpq1t7uDkUni8wCVpvmmCeKFN5V3kZ1hu0jL9MXaJEqsEsEeau9zBpoQkja
         ZqMX6bc9WDJdEQbmRsFdd6dwaWh0blqR9xuk6alH8lGiaIv6tkTgTmHiy2o194RvJGox
         OT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184731; x=1739789531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P+XIrg3e48T+45SB7OV7xfhAg5zNW2nJdNfDkQWT08=;
        b=Qm6nvMGdQGZ8RukvzAMnbKdoBxLlqmEmMISGtSXEKdtan/sd+Y85mGQyDNtkzD+HHZ
         S+skx5uTCtNj8Qf7I+3bmPyP3XHFE9PbnRWaEY+Ds72Vg1yR9BG79V3I2gKLuc75YHM+
         ugV3wm9Hj21DWE1DzO5+iYFdoZuZnmuE0zVfdmb0h39DqECPnPWnDRNphY3LhR90fLXB
         t024u2p3lfazZ5IfPFugbj0luon8OwszeMYWcRiwGuGzhZltqXMigrrfyiN0n/YvROEx
         2wXkwUuUsFVh8JerWbUJ4QRzp7eX7+o8Nn83Buk/xu/GxI6mCP52hAlvUOE/+L/ndCBM
         HW/g==
X-Gm-Message-State: AOJu0Ywqq7cfwZNwyY6znlQQ7hreLYQ2bpdmp1/K4VFiAiIc5mX8Id/B
	QdK/9VNtQds/N4AEwnXWwU7+hI1LgDGjwLMGLwteHfwxzIjkIWbH+rwsGR+qyd4kEiTN/nNplPv
	8ijw=
X-Gm-Gg: ASbGncs+zx9CngYwUeJJ8G7B8HmFU8QYSpMFJCRaeflMfgSdylX6RQ0ZkbvlkuiMb6a
	4y/0oyUfWCgTMQfVRgP0rYPR+odtQml/1eHzf87FOrk8zOArLhUuj0fjjhLkODK+s87J96eGt06
	HamglPxOQCzZzA8j36QgQdZBGlXd4wEdwEocJFhWmU48YfzyBORosspIy8Z4kZYX71tXb/mKsRU
	V200riSxcwIFlDDSBv3KmmBKfamHOXgBa98h16AB51GNkzuNlLdTG/jpE8GaICjOdhK6ApwVL97
	83qrYCaX
X-Google-Smtp-Source: AGHT+IEzwSIHGoNewIvTLcEhxf/kvVRgtP5c2APQDYBcmqg0Byln/uiQ28OJCvQ+bKmommBuoCUsBg==
X-Received: by 2002:a05:600c:348c:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-439255c10f7mr90135275e9.14.1739184731083;
        Mon, 10 Feb 2025 02:52:11 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:51:59 +0100
Subject: [PATCH 5/8] gpiolib: sanitize the return value of
 gpio_chip::get_multiple()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-5-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ooqgFTnKyGUq0xodNGxj0NJ5WHZ4siV0rPbv6X1n4l0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpTz03CtD1sSmlmUvJeBfmOF/PjBOFxKvIoT
 Fg3PrbKONmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUwAKCRARpy6gFHHX
 ckFvEACH52s6NAoQ/9TFvaFeQNcNnY9bdDsYFk5YCAehtc2TOoX8FTbmcOgWBnYOSdLNXCa9xB2
 btHB15kbHII/rFCmPqGTcmLCqADxG4uGOR7vQY1kiQtQJdN4Sv0xyi2ZV7k+MZ3M+q+OtNa5yqh
 aeDNzr/NrRA3lo7FR+bHj+M2qC87j2tma/Ol/86klYc04X+GcXFSAfj3Ytfc2w5Scd7NI9XzymK
 POzvnT7Uz2usEUmRjClf70luwKH65GZ2l7nshpKsmMFQbsjXcT3noZFz4+rZQtZnGvUigEkxb/D
 AF9/lcpZfG7zF3TAYZcuVLzw6SWbYIMzqrzwximCZNy4cs0WRcQtHeCkMgkc9+v1S2sxYfqsZE4
 UdBnNuc5wUxkjK9JAkisqdBZfzfuSaagsEo3OOlAtQEDDDtqqleMmdrLLL0Nke5PN2/T0tWKxCR
 HiF4hL4sYN0ZEFsqr3XG2wk+hdU/jAqUJtJ5yz5kPF5xF4vd+kH9opUE3v+A+UAv9Cj/q6atNiB
 uB4288uYuNG8ihkPygBRCYp4VH5tu6BdSC7mD8J5CqRscAXFmwTL8onelkGEdat3f/NSkTBX/Er
 Au30IbWiVEz7FQt2k4HJoUg6FHoO0BDamBgOANFiqOf1x7BtbXlC78oQkWXo0Ct8Wbk9nmAvh+K
 cREp2IAL7WYsr3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As per the API contract, the get_multiple() callback is only allowed to
return 0 or a negative error number. Filter out anything else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7bc316154fdc..7255f4df6a8b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3164,8 +3164,13 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
-	if (gc->get_multiple)
-		return gc->get_multiple(gc, mask, bits);
+	int ret;
+
+	if (gc->get_multiple) {
+		ret = gc->get_multiple(gc, mask, bits);
+		if (ret > 0)
+			return -EBADE;
+	}
 	if (gc->get) {
 		int i, value;
 

-- 
2.45.2


