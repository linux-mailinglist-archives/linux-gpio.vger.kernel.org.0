Return-Path: <linux-gpio+bounces-28080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6ADC348F2
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 09:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 607C618C5AF1
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 08:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7262DC34E;
	Wed,  5 Nov 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xkiL3bNn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE152DC34B
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332487; cv=none; b=GQNhfEdvA6oG99+VNjKMF+FM1zK/glO7PKRcDbZhW8cFD+fbOzzTU2xgtAcW3B12fcy0YSXExhEzlWrwo0oPpntxI4MefYr8J2G4S451Y73fvL4/nuORs+3PIvWlsY+l1o4DOn3lF1xNef2qu/tRZt0DlmFp3p1ZUqT7f/H43o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332487; c=relaxed/simple;
	bh=oi+kOXiceGJ/Rz6eL6Neo6UZLLNYuqUvbiYaC2WT71g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5ARYSnbiDKtyUYnub06yviLHyIp/2zQczd5ObV0TBc8UikTQt1JR7Baq23KK/PfJl8asinAu4Wx6U/JpdaCVf8SZWi9RhFKNvYjj68tPG3+u2krQq8xiWJSeyzJ3SimyHc+yu4p/EwCISA/c14gsx52CJJ4FjXy3QT/ejlWASg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xkiL3bNn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47754547a38so15824405e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 00:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762332484; x=1762937284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wjk7eFDeNZdnh41d9c98RA3CJ/jbvUDFmdSB3a+yBf0=;
        b=xkiL3bNnVuMspgn21cjJcJ1inmRmnFUDHHjmQiQs32k18ihBPOOKGCfIBG7OOs9AVy
         gGu7aIG2pVmrdyHx2dWf27I1f/z/M4guTHQsllGZDNKWSYFlzFrDtxXFtsib6kDiPmYq
         T3yq3IDDXkVLf2PK4yxyueHZbV5NhrJ5EYysuB51IfRgK78uhnDrchvtnqWVV61yTEHr
         KFmGNpk3LdmPDMSnKClnW9WWvKuiSzC0chtAxjY2ilrJgnzGffnlfbnflXLYSY2iBgV+
         Wd4PrKMY0Nl9xebocPoDjaX2pf9E2pKNgLE/fbrVXp3B9icGcWTwVI17a6AjAe6ajen7
         VU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332484; x=1762937284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wjk7eFDeNZdnh41d9c98RA3CJ/jbvUDFmdSB3a+yBf0=;
        b=ZCNp6qS8b7cZSC7NgEkYQZzpnEe6Rj6R06FrFdlTXCQYMl4KhqGkgpOx3h0pbJ3NkC
         OWE9Vb7REFjm9SGfXbSBwH1dQOavrZODqGoCIfzSuHTR8lqcsQoFEc4qcDILE0tvlvB7
         rYCDP6Xez2gVd845+g90NMofVeY+nq1azIfpfJagQKxeU4dy/8xj6Me74tsaJO7KTSsJ
         hDQTOGLjBt/j3yvnymX8Ljmn8evxsDkdqRA3j3uL2inkaIx3XkXcnzNzU3MzY/fnHehV
         79Y5A0muYy7T0tfCw9g4lZj4SGRvNFpc2lLEe1OB5RIuzbZUDlPqPelJqG0ESrnqlnFJ
         6VhA==
X-Gm-Message-State: AOJu0Yz0742/hh5w+esSu+1Z5Rt5WpcHX6YoWuOJJ/cYf0UohVFNliHi
	qKEwb7Me1cWhfZJzPiWD5zcnMbD0dAHQWsrIktsKgtJAp6KH4FOh1kbFmXi4+PPHJeE=
X-Gm-Gg: ASbGncs4nSbLyjBSnw6BfQsIzHuSeI6uhRO9UVv9VDjK7bXcQMm2LFok3jFDt59bhg3
	d3Wo/fNydFFElrzyTFWbxOHUukCv6c9q/vEZDdeNTCIAAiH8FbAge9umV3N4Dl+8nFnNfgkux9D
	9hP8YAePg99IWTLvYXQ3N4JjIYKB2fV32oPAa4xDfBlDt7tJ3dUjEZjv9ti4iyXMW5+ROSBWELn
	yAdTzLh0EUeUwZjg2J8C/1DXcLFcRS8sKVe6eR4qAzjtQJJSh5E+Jju1CnxdBZSoYnfhH/sSaNC
	Pga7v+V6havapxvm6gt8MjIVXu6rnPXIb4LSU9SqI2o32U//kow67Hyx4HVA8qxt5JsVFAawLsU
	kX+LAYU7kRJj17Grg1Xv4wGetBitf6ZqLq1CsBU3FMSvHlyJYAtQrRC1ok0L0EokXqiDnvFaiZW
	pePJQo
X-Google-Smtp-Source: AGHT+IEo+JuIve4eGxvv+L0MqTDEpIF+pl87mOhFi/ng2h5XVmblcRW5etjFhkKZ7kr4GjUAr/6QHA==
X-Received: by 2002:a05:600c:5297:b0:477:c71:1fc7 with SMTP id 5b1f17b1804b1-4775cdf61f3mr14533835e9.26.1762332484024;
        Wed, 05 Nov 2025 00:48:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4e71:8371:5a52:77e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1f9cdbsm9315936f8f.34.2025.11.05.00.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:48:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 05 Nov 2025 09:47:35 +0100
Subject: [PATCH v5 4/8] gpio: swnode: allow referencing GPIO chips by
 firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-reset-gpios-swnodes-v5-4-1f67499a8287@linaro.org>
References: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
In-Reply-To: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8uWrhgtN7CzxKixK+Z5LHouLHteEbmCYlT54UUspwT0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCw8x4m94z/YLOUCD5YwozqehQx2kgN3G13Ma9
 8C5VFflfqSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQsPMQAKCRARpy6gFHHX
 clexEACWP4g6mcaYH3zBEhP1X2GcSqzaDXym/euuq1Tl69CfTJDylZvxKEb14yA/OnoLlE8rxMw
 sUvtI1fF4CJ+hxZ8m9dr6LttzQkMuIkBT1MEchkNJVHrKgWiSd5VUspCKox3PdCQ4m5Q4uRlB2o
 HmaI8Ka3Gz4oOCThSVhtNeFxe/g4pr37JWHNbIq36GzKlyaELb7dUohtJz20mm40cNPXRkzdLYj
 dIw03cQLHnnTh/R42GJosFFZ0HJW1qOiFfpld44kEOp8xJXRpfjYendleQmMES4ldxTh0f9aK0T
 diOiQl+A1a6KY3jWgKq/YdFBzEMNXze7kRq5fZ3f2Cq0YsQG9rQan/l5i1KiZ1HFaJbENpVxyvF
 rdz3Auqy61oX2WLWtcxkdHcophQAVyw99bcXAv0cMQdmSa530kOzGRak3lvdcsZbeNtIukSmdVG
 zkrMLf/qHRKoATgZb7ZeIYwuPRu1jLRPVhQx+fjYi+V/YDGUFcfeBgVMqfk6lHbyOPEHOY7UJPj
 zqBOrxB1il+wLqdUEhCpsMJgZlL2sIBEjkB9Oc7A82lw1KSpZ5Rlqg8sOq8X1VkZNy1eZ8aXs9y
 Tn3IsJuU2dTTyzZVaJ7AghutrZ8im/rNZamDjWi4QxF1CAMmSyxfqD6yoEDbt1uISDmdp1/+flm
 Yk9X6AAjWltrHSA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

When doing a software node lookup, we require both the fwnode that
references a GPIO chip as well as the node associated with that chip to
be software nodes. However, we now allow referencing generic firmware
nodes from software nodes in driver core so we should allow the same in
GPIO core. Make the software node name check optional and dependent on
whether the referenced firmware node is a software node. If it's not,
just continue with the lookup.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index e3806db1c0e077d76fcc71a50ca40bbf6872ca40..b44f35d68459095a14b48056fca2c58e04b0a2ed 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -31,7 +31,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 
 	gdev_node = to_software_node(fwnode);
 	if (!gdev_node || !gdev_node->name)
-		return ERR_PTR(-EINVAL);
+		goto fwnode_lookup;
 
 	/*
 	 * Check for a special node that identifies undefined GPIOs, this is
@@ -41,6 +41,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 	    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
 		return ERR_PTR(-ENOENT);
 
+fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }

-- 
2.51.0


