Return-Path: <linux-gpio+bounces-22945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287EAFE023
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097C31BC86D2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E442226E161;
	Wed,  9 Jul 2025 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y6SYWodO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D726B75C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043339; cv=none; b=rdqYBR4W2qP7bPRNHB8PBT2/1lmgJSJ22bQ5Tq3yyg/UbYq6L2VKQPyMuwm7z3XM5s23TxsZXTMRDqAP08CgEVlsGCa6w+9nY4AU1e36FdqUu7grIOmjPU29ocgsKDLKy2uP+C73BoeC2brXgCRZc2gxZVImbob1+Iz1+NcyDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043339; c=relaxed/simple;
	bh=38uDbMlKUnyxf6u3/fWJbqpGn4HRsOcQ5bLpsPR4rVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHsKFU2B151JRHFEe+BTGOqLtwnMuSuPcfwcMUVXTLU1lWCkPXJN+0BT8+UJsR72x+8rzdcGppdCxrWekZ3vP7nrDAzhHJtvm2HrewDL8ZxoZ9rcjbjSnSAjlXnIA/vEYN8sw+eisu3jBiCS52VwXxL06DP8eZZwhzzmK3nRCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y6SYWodO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453647147c6so49051445e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043335; x=1752648135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW+Hu/HhbWeKg1EpyA9iilwLRoOXma3zplbfRDKi78c=;
        b=Y6SYWodOX14Q7un+kD6dk5rJpUiohkiWjk1x3oZJ74CEkP/2HsQgqqHaJL20hsyuKJ
         lH1CzebadKS05vmtCO2x+DW9Q2pPjZRfPkDPXfXSjrLNGRtGJs9cPwbV4YXU+kHjr8mv
         xVPhW/+nEY6ro3fip9C+ZKmLlwythH9Qx9WHrTZ/M9zMvasHmSbo4kNDCs0d5a01CYVZ
         P1WTiUwFy02optA3s7HzMswKDWLs2Yx050Ul83lRUQ8grpu61P4hmGo/IOEbRNMmsXjo
         3AlPwa7C66Z9DoFkGEw0lhSPJs1ptyqMdGwIttCTBjpWmsD3DTFUF1FC+Ak5T73E7T/t
         P3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043335; x=1752648135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW+Hu/HhbWeKg1EpyA9iilwLRoOXma3zplbfRDKi78c=;
        b=DXkhfflbXAxD5JsNuUSjhndnSpnYjplM3dQopV9t5qbLz0W7pXUk+VdHRlOtlHP5Ry
         aj7un8/R4atrHQsJ431ODYVCrELHpz3bwHize5A0L8CIow3tvFelbKeetz3IqE8Ih4y1
         PtAyc4os3ASPdGpODb6rFfAJ0l9zOtS91ZBGk3I8RV/wJO+kaXFUjwmz9BILZ+bRi1Fn
         HksvsNEh7TSDSLAdmGhNyLTrRSpdHl131HmdPEf4EoRhKObUmBtf98GFvtQYq+F48w2i
         gC3wgzPZTBPwvxiEJgB8q7xXLdkKsc2ZeTtsmBclZxM7WTqJeOXVxyFGI8zWk0XV9cAY
         fFuA==
X-Gm-Message-State: AOJu0YwEip2RRIV4qdWxbXUVRCYScv72UL2YifGlUDNYFmUQn1sGYOgn
	tzla9NT4zVKU5sCEGnxy7ye/0m/15rvDGMjg6OrcxuhcEQ427r2Xagg1gz5hdsiEltU=
X-Gm-Gg: ASbGncuL33kLMXU0My65jDZnOxuzG5qrc3sJq93Je+VW3vLGe3NEenqv/yonK8Sizbo
	zjPQv2PYTaVYXEET10VFL0KbLDJnsG/0WpyEcFtKFb3fPpB1J9PuGtWdtzImAJmPjzeyzNXGMJT
	mMxjAEYZOF2/deFuDP7Hb9QMHQKCxwqPfriQcpYZUq1KvUrg2MUA95WQrExCjBcOE0rJuZt27NU
	fB/ZKPyrFsi2CP0+tqEq3YyArMnsZb7rOzrvhFxAmQJ5T+aL7EXFPdHPQDP+ipvG6z6xfCBdLnq
	kt35TUvIhQCjqJUs1cmy69fQNiKmQ568Al2MLzUDPEqXXkgcBXBv0+6p
X-Google-Smtp-Source: AGHT+IHgvh6CXMby82j1vAltxhiFw6v8vQf19rIED6oGm0S9ly39Pzz9ZDURftRRJZ+Ml5YyEH0bKw==
X-Received: by 2002:a05:600c:4f11:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-454d53a0109mr8730535e9.22.1752043335203;
        Tue, 08 Jul 2025 23:42:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:38 +0200
Subject: [PATCH 01/19] gpio: vx855: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-1-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pSSyuz7QAfCuLFxeilP/Rt+eCdSSPHmUFgFx2q+Dd+s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9AKDS44pltDDmWoU7foyKSkab9u4k7TbIZE
 oIuKFsT3BiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQAAKCRARpy6gFHHX
 cvW2D/9yMYo7llA0ZmH2ampe2HCl2q7tO5e0ggNvThz1AN9/2JKAQTAMOX4gvm8NB2/koZvGSbL
 8gwOKfCihGNzldn8PfRqPI5kSnmR7irDNKzBw0S+9qoyBv4HhsjkhmlK4lV+16nDMrwZOLLG3Ub
 OY5MAfPNPapEZYFn0P4XyG+Nys06YSyLHTT2xT7Gnh6tfDYTjoMtG+GwlbZMIjahRhij/KORNUQ
 UBOd5A40hGi1cRvpnpNiW6FMsa5+aoJqJ7Sy5NdiUO7ANQkE6WUuMS7GVGYdSGni/PBrTln6IBf
 q+w4rCfV+fVu0y0uB+yQAvqU5HHRuWcpWMReBkLw5NpwMp1gOjQb0rJ8mZOiPqNRkcb7OlO14T8
 VraIJBmm+8lYWWM4xIyKpA08z4Q3Ai/Z0U6gUpFJCVvrlgw6HoyBzCH8CqdQuCCcm0oYiBC1f4K
 DPhyB3H72AKHOS19n3RAS003GN2UwebvMaOi1XIWFyobPs/EwRsC9YAlRJM5FIFOFlPXBqBqXsa
 KpSCLlgPiGGLMjaglpMuFTkB1VuVsUtHpfuER4uVEpTI1r/CRkWBVZFFne4KqqErNoHee1JHhEE
 2L9ZAv9rpf9KnK5jh5oBvxKlwyYZyWeHMw0z8iiZvg614LaRwpahQWlMsTmgB7pgdBUFhiuGDy5
 UL7Gqh/dwi53wlQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-vx855.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 8fd6c3913d6935da37454647cf7500d91c82e0c8..a3bceac7854c0632c2f7891783be41521fd1f53c 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -127,8 +127,7 @@ static int vx855gpio_get(struct gpio_chip *gpio, unsigned int nr)
 	return ret;
 }
 
-static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
-			  int val)
+static int vx855gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	struct vx855_gpio *vg = gpiochip_get_data(gpio);
 	unsigned long flags;
@@ -136,7 +135,7 @@ static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
 
 	/* True GPI cannot be switched to output mode */
 	if (nr < NR_VX855_GPI)
-		return;
+		return -EPERM;
 
 	spin_lock_irqsave(&vg->lock, flags);
 	reg_out = inl(vg->io_gpo);
@@ -153,6 +152,8 @@ static void vx855gpio_set(struct gpio_chip *gpio, unsigned int nr,
 	}
 	outl(reg_out, vg->io_gpo);
 	spin_unlock_irqrestore(&vg->lock, flags);
+
+	return 0;
 }
 
 static int vx855gpio_direction_output(struct gpio_chip *gpio,
@@ -215,7 +216,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->direction_input = vx855gpio_direction_input;
 	c->direction_output = vx855gpio_direction_output;
 	c->get = vx855gpio_get;
-	c->set = vx855gpio_set;
+	c->set_rv = vx855gpio_set;
 	c->set_config = vx855gpio_set_config;
 	c->dbg_show = NULL;
 	c->base = 0;

-- 
2.48.1


