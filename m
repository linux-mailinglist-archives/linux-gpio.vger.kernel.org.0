Return-Path: <linux-gpio+bounces-27813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC6C1A8AF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1076D5627CB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26AD354AC5;
	Wed, 29 Oct 2025 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c94k5E/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC8351FA4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740938; cv=none; b=G8k2BEyGe/0NlaUEqLrDNTbgL5MMJqpL9e4+5yHQgJyYqT64K40KNB2mBTiaxW54rvOXddK82ImqXcp1cP3mLwlU1rrXZI3OVUgKjKlUnf4jYxOEQO+8kqyWouswpmERNQygq6/ebUW2fDQurMArpYV2+hEKr2OoajTIIXBigDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740938; c=relaxed/simple;
	bh=fUpAzw4nM5JJHuP8Sbb2LWRCGoMnGpXyqpqEf+oHz6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRwOKzlBJc3TV/rsE67cwvMuJqJc5x82YbMkKPWNz9E7sdghq9KZeVS5o4u6/PSslT4SgsWFhPRxyTC7ABntryZ4/2+tbc8V3mV+vDNgzrd3hnuWn/TWkiVcV4CF9s+aNrjN4O8g4IVYqztKmYrBetHEUcfwAPeKI7UJuSp1HcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c94k5E/V; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4710022571cso74590725e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761740935; x=1762345735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rtuwgtaf9SKTSGooaAZAvmcQb87Z9EWsFJYmE2FTQuA=;
        b=c94k5E/V1pFsMxyTP+Vj7EI5IBJz1sK2zoCDAvhYUbPykxErFVo0GmAd8AAnlLeiG0
         dnX8VvtD9uuDDLpWL869UFy1fWqbxsHAvRpTIqZfZE2mUT6ZaBv4nj4vInEx0bYpfcX2
         w1rhVcyjZiNzJAaIb2CJOG4Z+BODTk0PSpLv+GTBUkDbw5ZAd/9gUDpgdqw8j14XjwqH
         VrC9VTFl3mpcvb5Y+LLUmsevMsY7zNvyp37dG7gQQftwFQuf6qHzOKuDgNt4qnl1EjJv
         RKX90ObiqG82F6FgUY1yvAqRSjYhTSELZbAgKbTMjjJjxM8jb2X5Uic7P1GziNsfz+j6
         fm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740935; x=1762345735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rtuwgtaf9SKTSGooaAZAvmcQb87Z9EWsFJYmE2FTQuA=;
        b=ls4N7LM+CtRlaPSchXQzagjhOsxSPXxZPZwfTJFZmbOfOgFvn7TuZroDEtPQKJBqdO
         t5f/G9oNiQMYJsfhuO/nuTCYoluV0kp1eeOlTtZ3pOZv40P0MOdRgtwlBKwJQHCtnJ7L
         i3g/Fa2VhLch6VtOS50sNPHGSOHOcC7CiyMFIHpAUoepvmt93Z/9fM0cLV+CuP5dtfcz
         s9gUXSDBDJ/iiVb+F7KLVnOZmG2DenIKM+Yx386iL5KxzGe10GnsSIC1cf2b9nVf3cIo
         ZnVPrctnCkZY0DiIkA2BPylaL2NGz4VO31Fa96YNwJjwHC76PtLGM/lU+WO4q8QxtW6b
         mkmw==
X-Gm-Message-State: AOJu0Yxj77+8/Ovf37ZFRmfWwVlCKVNkw0QcIVzX82oaeG577H+le1IY
	f6y0mkUuj1BZx6lFnOqQgCD/5WZ6fMTb9szrqG6ky0IX4UCgsz0jc6YyrTeShhAllFQ=
X-Gm-Gg: ASbGncsrJD/WVET0oB+YRXE7ry+5QaCFpM7MXmlTeMMhjnWKgeIgScKQSJtSkcegtKj
	ONdHJa+eMFUwaiLPjxJq+CHnTPdqloOd5L1NPSwRDmYoVMtTU6kz7y4RAW4Y4gBlgJa8SRPq3bf
	ChqrGFQec6CxZOFev1EpZhWvFNXjrlmJNOdo8/CuUNn1fhRhJiyPlIu/zkceQ5gbrlN0nhUbYpV
	P7H1VSD2oOUP/SX5s6cXIoz3LIXNtQv5NZ1poUe0APRu3UYTlulDxa+wVq+uyEFhQk/twGrT3+e
	KolnYLCN+AaxY+TA4JcutEwAMnHn3unt9z57rdzDStUCfzbYYmP5KSW4620NCl+1cPkxrEswk0n
	OsoA49n2POYOp2ej59wINWfH5bKW4qCSFpKjXXgDZu1+19OPKorltAUQQWQjjsoxiYfAncQ==
X-Google-Smtp-Source: AGHT+IGUkE0j8GnZxFXdtLst8ZzK7+0a+ebiWGoWZ/vdSeb7tn59v7NbOMfFAUeELlw3XtGyxfLkYQ==
X-Received: by 2002:a05:600d:839a:b0:477:c37:2ebf with SMTP id 5b1f17b1804b1-47724beba19mr3491335e9.22.1761740935341;
        Wed, 29 Oct 2025 05:28:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm52775545e9.10.2025.10.29.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:28:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:28:38 +0100
Subject: [PATCH v3 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-reset-gpios-swnodes-v3-4-638a4cb33201@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=D4sw1MpA8EvavyQl/IWO9QhPPoCb/aOZziV4a/E68ic=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAgh9B0+8gSBxF2B7dDKAZZTR85rAZCeOdh8Mv
 PbglPLgh4aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQIIfQAKCRARpy6gFHHX
 chVXEACaHEVjpy4elgZrhTWNtKiy3iyVJDwmT+OeDp3yp+ryp2ar37ptrFhu2lPCNcnNM1An3Sr
 66dl8XZ0+vV0ObraU0uOC2EU+yuThOBzKn5tfMpQQIYtmEwoD7C1dxW6+2FU0N5xKjTv5Wk0gwY
 2UqFAO6K9MUz2c6fNDfw6XXDc/nGW74gI/Hw70CR3Wl6TVDu8xfzuRvmyduImxQ7lh/wFr0DlEa
 dXsmBcRLFyyG+gdO92R8C9JqiF6EAXRQZtXB6XONAh+c3YV2bJ9jK84ig82oxtv/P+sT+qH6hwD
 pEGOcebEXzUVFjHhdORwEPmRz71pE2xwb2V25ZrfwlJC3UGN4jtJP9Cq27He2b0wo902YwIF6nm
 OxsbrCqqFqXghp8hrB5frtsEicSQwKF0iZN+JJTpDwnpYWcs5yph5Jq7KKntWCfwKq3ZzWnkCon
 6WQO+8Z3vUJ/CTUO6cg1i+qW8O7tD7UeB/bgEK1XDeSaenIg6IaW8o4uVMEs5B0Gvk/G0yHx3Z6
 WY1tXYDxM+Urf9xPiNc6VxQX/XSEebO22oQ6bN/xhBWyuZdzVCYK0LLGUlij7t5t/7RsgP73xXq
 qLrS+vcCIbZGlMR/w0SHF5XbsGiEGl/iziDlFHhLTDs8EGCKbVNjIAjRTOeREMWJYjJFJZZwvuP
 mYfhRynX7TSZHmA==
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
2.48.1


