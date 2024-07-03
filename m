Return-Path: <linux-gpio+bounces-8021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A99926823
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 20:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F6B9B260CA
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 18:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12219187549;
	Wed,  3 Jul 2024 18:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mI+L0vWq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C322186E2D;
	Wed,  3 Jul 2024 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720031174; cv=none; b=A8nl3CGgfZWZFsTb1IQx/TyD8ON4i5aoQfYLYeKXclxxsMw37GIRU8VgoQoFx7iM1FXSNtx86GsgJiobkf+PJfThIgzQhvnwF52zSYFWavXOIQmy5j4xF5U4fipfmaFCmhcgw3aQkLstWfOyMzhKHeuU/CHeYUyw1vDQWiQu+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720031174; c=relaxed/simple;
	bh=zEyr6WVfLE3xaWnwlabZXzwIk4eydgBvGHM50aLVa4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBAnDoZnBrL69gnkADVdipYpFvKUgljQx3GDSpe+aYxxnMYJgrO3FW7FmUEUjrCt/MdBNM4o476x39xleWwXGOVGkLWo0Q3McPxEQkv8dpCHNSozwbVf4pzxz5LS4WVtOIQUYX4Ds/T+JYh4v4gml1HzHgBraNhhRbjbyFJ8t4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mI+L0vWq; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so3921501a12.0;
        Wed, 03 Jul 2024 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720031173; x=1720635973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VkRH+KMFMQGxARCBkVlgc5hZU+6gk0WysqWggyfzFs=;
        b=mI+L0vWqGeNw0UsDG0EZaA32VYcaNOYpQZokdhTYUnctlSnapQQY2vH1RzFSYm901L
         kfNRljjJXRuy/RKbu1Id5nqH0Iu3V6pYkpjcpBo7mlpSCkJqlq2wUlbnXRj/sy+l+Cgn
         7a646jlhnh6vKCbkwCzPBc4coPpmYS75f4q4sCcgyvNmXLtbsr9ZjBC2LPmM5Q9+K7zA
         coV4PvuMz7IAAq7AOw0KL7sN/l5nFbl/CtK0tulXwcVFKwj78DSa7J9Z4T2PYyyPNl99
         Oy0dyfyK+KqQjOOAE+CX0YMLhmYJtA7YeIBelP6jo6czWmMSyoN3g+5DXZ8GzsIC8Pem
         ZYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720031173; x=1720635973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VkRH+KMFMQGxARCBkVlgc5hZU+6gk0WysqWggyfzFs=;
        b=oFgi710zn1LTh4pb1TZc7MajKhRr3VG6g1wNb12PnxqieTnpGEpGLkzDzLuL6P3NFP
         WfSjaZcI80Oooz/E6eBb71hdFaxduNOKUGzuzxVSg2Bfpp8YKUae2gCKN8z1a1QdMcIh
         7ZBQiCD7//jr1zI3rDoc3f+IxMIplasJTV5doRBKJqv3/OQPssGZ/tu03wbAZ/LfY93o
         u81Ho4kyIXD8H7XVWt9geNF9GPCiq2KsFcX+hFxulZyDxLCMt6ZqqFoMb9bxvoiG9Ros
         xheOyu0j6rmhCV7ATsjsBT2RbnFBsU2AVAYKtvKj6rBHuXIum61H/zXA7XvqCs/W3xSF
         qW8w==
X-Forwarded-Encrypted: i=1; AJvYcCW4wFil2oDzJaUQkKH0vuVvdRj8pN8tF/gVi9HGwV6VZ/Eovph/Y1xbrkyIvuv64USFwmOPd2Gc5HMG2W7IdGQAjXVmtAXuftGDHvyGsdwB2vIUKK/ASKUZLbsFdoaGqzeqjaD2UTrlIw==
X-Gm-Message-State: AOJu0Ywyv7Sz+dclV6cstheZgUCGakeL+bzkYPvcNwel4SM4QNXpfpql
	XFy/tKlUBFaDIc+4BSuvBjd+kcn/9HfP8AXZFWBEes402Gsqsm5f
X-Google-Smtp-Source: AGHT+IEraCPwSRhGWVbSF/yeeYvvKY0k9BBqSWTg8q5G5VtWr5y+Fg33zdHBOu7H9RxSpWXuCcPpDQ==
X-Received: by 2002:a05:6a20:12c3:b0:1bd:2870:f9de with SMTP id adf61e73a8af0-1bef60fc49amr16240570637.3.1720031172452;
        Wed, 03 Jul 2024 11:26:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6993:3d0b:ab92:3a8d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a95fc4sm10696108b3a.215.2024.07.03.11.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 11:26:12 -0700 (PDT)
Date: Wed, 3 Jul 2024 11:26:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: of: add polarity quirk for TSC2005
Message-ID: <ZoWXwYtwgJIxi-hD@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

DTS for Nokia N900 incorrectly specifies "active high" polarity for
the reset line, while the chip documentation actually specifies it as
"active low".  In the past the driver fudged gpiod API and inverted
the logic internally, but it was changed in d0d89493bff8.

Fixes: d0d89493bff8 ("Input: tsc2004/5 - switch to using generic device properties")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This was located purely by inspecting code and DTS, I have not tested
this on hardware, so copying folks who have been involved in n900 as far
as I know.

OTOH if this was indeed broken, then it was broken for ~7 years
(d0d89493bff8 went in 4.11-rc1), so maybe the best way is not to worry
about compatibility with old DTS, update
arch/arm/boot/dts/ti/omap/omap3-n900.dts in the tree and call it a day.

 drivers/gpio/gpiolib-of.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 38679cf1969f..89d5e64cf68b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -212,6 +212,14 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 * for the property.
 		 */
 		{ "lantiq,pci-xway",	"gpio-reset",	false },
+#endif
+#if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
+		/*
+		 * DTS for Nokia N900 incorrectly specified "active high"
+		 * polarity for the reset line, while the chip actually
+		 * treats it as "active low".
+		 */
+		{ "ti,tsc2005",		"reset-gpios",	false },
 #endif
 	};
 	unsigned int i;
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry

