Return-Path: <linux-gpio+bounces-27814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF97C1A690
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C643B358E43
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06CC354ACC;
	Wed, 29 Oct 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rtLeqQBA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8F354ACB
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740940; cv=none; b=hJiase4QTLOsBr4PPb6xaIY3Xf0yh4sLAooS4zRwHeEGjD2JDVayVEG381TOyM29qEKjqpXlyBKhxbuFvSN9ZQ0+d7ZGUCJ97g1ht9FrLH/WOS2uTlj3qvtwTBrxtY6lryKCKNrRrTsyikcUuBsjITwmhxv1uyRyiP5+c3VhShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740940; c=relaxed/simple;
	bh=4ect7wcRHMZmzFsechyHf6/4R+MNpwXcjK0Q5MMCaDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocS9E6GKb19fNxTOpDv5Y2/Cqqublk2cKHxYzhln698FC6fwSIuQ93Lc+SpgvuHdVmmkvl7KSmPq6P9f1GotO9EDzxw85hOLWj3g2BctLqjeIKwMe92tqwHh/Pt0IYoiSZNbOly2XFWY1PNIh0LEG9jtyiVnjALo9uX1/81OHjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rtLeqQBA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dae5d473so44550415e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761740937; x=1762345737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRhCeiPdliuBRyPofLeFsSwRxTI7EjHhQbIRBNN9fyg=;
        b=rtLeqQBAefOkeJ64SMfEnSYOfl2uqBmlMdi/oql6m+kMJ0zKykN4PxyHRNtraAefim
         uFi0KDZfXrlyWxsdDQC+2ihg50yjnyM0qTGe64M0FwdzvGhjdzWye2GHDXQjkX+8Lriq
         E7juONqxteEXHzQSXloY8pEBDtsyEZupJXjo03tvotyUXFterPY1WHfQctMObAxJIa2O
         +vXtyE4DI1XvUG1+oSNtbhxVIEgPBuQrV8dnB+1Rau5pvte4/POEAa6+JDVpQa8fDxo/
         F10Om/6qFHGnIpBruEObohvQxs4CKkSOvRwtUW8Mka1slUSG6+c83ng51x01snd6Wax2
         P/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740937; x=1762345737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRhCeiPdliuBRyPofLeFsSwRxTI7EjHhQbIRBNN9fyg=;
        b=j/3A87LZOQSR+jGJyhRQLLlmy9RZmr58mWvgbJSydKt870YFxDBd01c0dtQ3vz3YOP
         +jkQCwM20sv3fOYNj0vtzw0AAkxNJvBk5cfwHl2pn9yH9+ZUG9hpn6ifg4sw407AYMwF
         GYKA8eTavOVWAmzUkUSktV6mXX11wXHyaG1GOrWxEun8y9wlDrJEpsoifXumKVPutL8S
         1FLdcMKG76j8/AyeV6cPisSxqnIi7uafR7e41+ZMro8Rb4ySWWqeb7bLFY0oNq92f2ut
         ovkwuwIBPo00N7Wca2NwLfSimMBksoFEtyDGndB1bU5vpxwz0zhqivh+wnm2/kBdv19j
         FZEw==
X-Gm-Message-State: AOJu0YztkCfg3jDJity7G9cIKMhrDUJHBgNuojWaSFplM8HHe8jmQBSc
	rFzyr/zq5TKzVq8V4WXAsp3oifX1UygatzCT7RazZl32eu8UanpGdseVdrdmZBzvlCY=
X-Gm-Gg: ASbGnctt2KGyZmX6aXhnmEB7DorMl7JejrEECBCu5NyzZwBFXyY6EIdB1L9s2994hHY
	8zCiB8mnKND5ekIEKDJi5qyf7nh8S8uO+4tILd08UvFvf7deBCqCmab1xh0pGuiNjxObabVF1im
	ofEMLocUXLKWlK8+ZvolxMRjPXEtXzt8xq3kygKnu9ihWFnHw+IveGQPXD2rpAbvpyBeVMTIEyl
	26KI1kUgfNIy20iq8LRuPxs6jo811sU0Z/4Zd4C/10cqLknfPTYwuAW9wl6jmWDHByraRT5du/9
	Fb/5XDwYGRPyPMfvsWMo5UwjpauK+zHrYF/lqd54YIV2IBdM6Mzjn3/jJsA2TdDROanBhuOzfNE
	gJwSz76LWqQbNz+j3b4k1JS2WpQzeUhZ7KySCsA+tphp1u9HqzyQ1FiwLx+n55RBPof7siC+IHQ
	gKVwLN
X-Google-Smtp-Source: AGHT+IEPQz3YTfXJLt8ieOl+lOhyjw46aZJZu7fHPE+eOz7j8SPbJazCBGcfMpnzBZAH/pW/wZ5NHw==
X-Received: by 2002:a05:6000:144d:b0:427:9e6:3a64 with SMTP id ffacd0b85a97d-429aefc26e2mr2306173f8f.47.1761740937234;
        Wed, 29 Oct 2025 05:28:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm52775545e9.10.2025.10.29.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:28:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:28:39 +0100
Subject: [PATCH v3 05/10] gpio: swnode: allow referencing GPIO chips by
 firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-reset-gpios-swnodes-v3-5-638a4cb33201@linaro.org>
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
In-Reply-To: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2sDZ/ng0/1T7nWdfrtzJZfWAdJb/GQGwbNCuejtuSIY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAgh+RL8x6ysK0j4vaEMu5ssQ0Lnl6HKlu5Nvk
 dtJNVI/4giJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQIIfgAKCRARpy6gFHHX
 clFMD/41/OfmaqSum846DdilwE4zku1SwWsqUU9pbGkI5Z46DGTFuvwSZCj355xYoIKToauhkWa
 YtWO/AB3ux05l4htGy2EXtN2dMT4ft4TP1K6pg9J9/OyqJisIjZ0FZqAVYy2PnM5D1bWWfDup6/
 WugoqDKM6r6QNQIrWvHp8IM+w4af6PKcF8WJMkcENAUfTM+PHCCjWoccqknV3AeqEJT6fo6vx9K
 Ea6zpRv3TGGYdm1QP9FnQoykJ5DjCmWpBGWsyoNQZWHhOB1+ONmikBgfM2lU9j4gdYQI5QENXRV
 7/iWwBkdECYPO7+cc0fAsjo7bS9/9JBEvadh9LCesmAvASMj2ONiMCEKl/Qim6wncv0pNV2kX+E
 7Fj4v/nBDsBM7VBM7rUTcC6TvV3aPNn9qsiG7XMhLOlOynx+PDniSGiCs4M9+pVtCyu6rhkCdZ+
 BBpwyQWYEIk7hFD8H5oVeemRsu6w/EjksKqpFYu+SQrht/2FRVNQlfh/CqFTkSBukoCtvtkuV+R
 AuiSGpyuhjwSbkGeQt1vTkXcqhRFro0dVdvX8Be9YicDLiLzBVfYw9QlPAyGdxLIw+DMia6OzO/
 Dp9Wcmvvdmmj/KF8K2ZN/z7L35YDS6SbHIOugWWuxoShMuxCbpM9uLBd3BtI3vpTstpftWecmih
 COB9pUsgEtDlmtw==
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index e3806db1c0e077d76fcc71a50ca40bbf6872ca40..16af83fcc5aa886dd009dedc26b1ac23e5cbc4ea 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -30,16 +30,15 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 	struct gpio_device *gdev;
 
 	gdev_node = to_software_node(fwnode);
-	if (!gdev_node || !gdev_node->name)
-		return ERR_PTR(-EINVAL);
-
-	/*
-	 * Check for a special node that identifies undefined GPIOs, this is
-	 * primarily used as a key for internal chip selects in SPI bindings.
-	 */
-	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
-	    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
-		return ERR_PTR(-ENOENT);
+	if (gdev_node && gdev_node->name) {
+		/*
+		 * Check for a special node that identifies undefined GPIOs, this is
+		 * primarily used as a key for internal chip selects in SPI bindings.
+		 */
+		if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
+		    !strcmp(gdev_node->name, GPIOLIB_SWNODE_UNDEFINED_NAME))
+			return ERR_PTR(-ENOENT);
+	}
 
 	gdev = gpio_device_find_by_fwnode(fwnode);
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);

-- 
2.48.1


