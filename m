Return-Path: <linux-gpio+bounces-27942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F5C2AC72
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 10:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0648E18812FC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 09:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170632ED858;
	Mon,  3 Nov 2025 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="diuVwOjd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C572ED161
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162547; cv=none; b=AsrmcCXgZ9FnIsWBUJWQPaQwDbaorXZqB3jEOBdrdY7dGmCIVpY/h4WY9fWHcVdgoM8akBTNbL9EZvniMoWGTL5v1XXW25jyRV2lBeMVQbcHDCYnnclPPLhzZFiC4mkvdCEpAXOaLriJIDutndOngmgNVDgxparjjDFSKQI5A5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162547; c=relaxed/simple;
	bh=kksf8j+Hcw5JU8yFcOn2UF2PlDbCA9geMD8Jwj5RJbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eN0xW6TaCgz26g8a7wpcTFhEP+vcrQ9FHBPq/BVNkgPiiuRkHqr4eud+n8GbK5Cx79ewf68zV1QRoXL3CnmYyklEAVvA+4rZA/8HecjmcKbNw7eURqyPETz5AvlxEiCLJV3MDVxNmtLk7hjMo/oflGTEoOzunS11273lh17MtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=diuVwOjd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so33714735e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 01:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762162544; x=1762767344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ/CHjiLyML2L8csBl+Z0R+SFBYXY+YFQ1rdbVNRMig=;
        b=diuVwOjdQtYK4d1yv8w3kiWum7gW6vBNhl7vYTCVemuRO0vYq0RpllM1OSfvONl8uj
         i95X37aEzqkbSAEZdkZi6LSjuPdlvephPk4A9tegzLE6JFWKlftSMt0jtTl5Qvhn2Y2L
         W4ExjXEPdQasTm/wJduXOQzHbBBmGEfibUcgPpp2yYFa5pVN5FzlztkdLfTqSf+ZDpZ8
         9S5FNH97f2JHJR9dja7fWhZxeuWC40Ys+hYXbffCU87bQe+XnX5e6cVXUg49frFofKOM
         yvUPLh+pCaWIOSbrIeQJht9WV3y7HPTJk/n8OJwxlZzt9ns68L8MwQoN+8pcJOhVFWOF
         cMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162544; x=1762767344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQ/CHjiLyML2L8csBl+Z0R+SFBYXY+YFQ1rdbVNRMig=;
        b=q59mkMMn+mH8oCTOpCzg566PvO6FLBGSm/c1go9plT69gLwrOADpTJlY+bQjV2UKLK
         9VAoNYmbQMwelRTHWDkRsRKdosaaRD//9AnhawMchsec9Xo6bhijY40rmNkWuqVFa1BF
         LQmI+/oaTdqUhDjNX6OSseDyIW864PGccSv0K4GLCxHvO/llb0eV+gYYFT+MVdEhcJsz
         fTXFy8OanamzQP9gbD8iaHK+HPfxleINDvUthcL6b8GsCsONDOM4M1u7iclT+z1+wxE6
         UPUaNPunbiVLSk/Bj0Qj/6+ScHFAcy2njHi/WFs3zvvWTKAnRDoRsb2X9uyofsM6g64B
         MZBw==
X-Gm-Message-State: AOJu0YwLgyAja/aDdyVb31l06UykXePWQM931djnOrPqifWTolKoFmcC
	PI/Dea2E7s8342TFGTOmm2r/2G0SB6pBZ+7qOS4LyfC5BusgQqqd6vWwCXAC3vBlngY=
X-Gm-Gg: ASbGncv4O5ntEuLqKEM+K9cVplxH5xYnZuceXGPCmcWsi1FsWo8bKrAZgBIsddH+yA8
	WWAlqRRmND+b89vnklZ9OnhIjSieC/m/6mUVEDWChGIktKHVuVkqte5xA2BWMyRmM9NDfjHBgLF
	iQ03dsxTG2fdH0ZKn9x41Uk5LGbPr8mSohpMQzUTAj9Ho4Ibq70PxrIx4EV1YNg07gsh60BXWpQ
	5ATWPuE1iWNVTbwkUpfN8s3RRzKgEVy0FF27dUblWKJic75QWdlkmP5Vqc1t4IkPT/5qObPzYtC
	70MY2Q0I3Du/+kCWbjNoJGM7ZMBERFDtdJwJOe+f6tZBUPXMUc1QMpf9c2adDUlGXARcC5hJ5ft
	y/kQjAzpDTou8unENmtHctFDC+cD7+k8ECb5vdG5G9EbSjwg6UMLEjUy++zTuFoz5HlmKhQ==
X-Google-Smtp-Source: AGHT+IHN4PGzBvmPMYk45NnIf2vdYAtArzKxGN21jeZflOCEniXunDu4DmEIafaFywGvHU0MZkLB1A==
X-Received: by 2002:a05:600c:470c:b0:477:bf0:b9da with SMTP id 5b1f17b1804b1-477308aac1fmr112539605e9.19.1762162543855;
        Mon, 03 Nov 2025 01:35:43 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm147285675e9.8.2025.11.03.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:35:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Nov 2025 10:35:24 +0100
Subject: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
In-Reply-To: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+SgeJi/LAPcV3I1FaGjOhnzlzc7OwWZ5YSpBPYWiI+U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCHdlvyju2QWO0W3WvxOyVQeU+3VIAuq4ljqfl
 pw/rdKXyrqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQh3ZQAKCRARpy6gFHHX
 cqCgD/9pcmvHz+OyJCli2yL4AcetwaZfy2T/yDpmBuJGCZtlA06onONyzWew3Ga9U+ryAPs+qWH
 yI6/icLhUGJodJoNF7WyjWgXn+GA6JaqINQzWEg7ZP0Vfa8K/k8iwKF4KDdrW+9fsB1uXkolkb1
 8139psdSciNoHGvvJHyISibTBLlN94PuIIyGOYhbrPk0fOgDWt1vmJDjmVSFP5V3DIaFhxe8XWr
 fc2A8wyV+GwCTACITyrnbqMvc/ZihSWr3W19Aec4HyRLkILGwrWcsyLSeJKVMUbEUjA+5ZkhkLW
 sB9Rpz9uCuQvk5rSOnsotoIGuyamrTMg6aN5VfhXfcpkGSeFQN1E8qHQU2fLM//bPg5OXJk1CKC
 HzeG9mBsjxv73d9q1IKeQcVexsMdMrYRvmNNbSFH/8AylASDKnyatdBJ0En/fGWl05NZQsmYtb1
 jkv/ZYUYixd99lA0UTPhowxxFSozpCTAwNENz5d8zNM9r/h6TnuXjlF9pP+1aSI1WeFcFxCco6L
 BE14qNE4TpomKdm3fI25GT7HHL5oNcISsWRbvOaNtL2aiPw5eX7R5sUlo+O5i1V/GaGPM4sSnzH
 3X5Ts8c8lMrAPLfR7S7+BL3QOhffeCgbXr3og6AOZ8kh3OZh3uWFV6QW6fkn1HuP5qs5oPq9X38
 i/qk7dOpUfyCQbA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looking up a GPIO controller by label that is the name of the software
node is wonky at best - the GPIO controller driver is free to set
a different label than the name of its firmware node. We're already being
passed a firmware node handle attached to the GPIO device to
swnode_get_gpio_device() so use it instead for a more precise lookup.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index f21dbc28cf2c8c2d06d034b7c89d302cc52bb9b5..e3806db1c0e077d76fcc71a50ca40bbf6872ca40 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -41,7 +41,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 	    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
 		return ERR_PTR(-ENOENT);
 
-	gdev = gpio_device_find_by_label(gdev_node->name);
+	gdev = gpio_device_find_by_fwnode(fwnode);
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
 

-- 
2.51.0


