Return-Path: <linux-gpio+bounces-28908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1EC743D6
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id ED639314D5
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ACF33FE13;
	Thu, 20 Nov 2025 13:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G8RLaYZY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5533C184
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645065; cv=none; b=IyUXBD8oNbZwbdkkwzbC8AquL687OX7bAWdi+pSPLrI5sQ6yS/Uw6hRlvCANrXf2eZJId9yuncLpCO1F4WM6uF4huZ0XvRRJFDQR4o0XZfLdFwxRGNwFQQ4Rv6rcgtEv2+1iwMhvEjW8RlORB5IPydKwQe51WAXt7ot+wip7jFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645065; c=relaxed/simple;
	bh=IiJdl/f/j3uvqy4h7tqf1b0BVcaqoK6kqQxRYGFXj78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REDIVQkargKi5ElAQ6nKLcDATpNaFtrL1oxwcqp3M/jlnfSbM1igZ4adEa46YwBoSWDdGhMONw2jzw40Z1m8Efq5jqzla4u1b3I/DcCE5nk32ocnDg1qBmnggq/j06lTL5tzLmRmzScyL6Nz+O3gVabUfpKAO9/toTEEYRzpBmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G8RLaYZY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47118259fd8so7366295e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763645056; x=1764249856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUtdFcR7PDGf6skoQftKs9iIKGP/DcX0bvw39dndE/w=;
        b=G8RLaYZYO7Gw5jrw62+cc4YGs8H+5I87qrk8yqJyh0+Nc4+zvBs8qVUZywf4gWYG1e
         F5XhH3TtXDPqkzJ6t95+f+XakEd6eWR+gcHGRJpOtL+oqWa5Vl5FLnIuEKVnKcTyvifZ
         cj0lz5ljqc/hEBDLbwzHeG0TuzxZP49kTZYIb56kxDZ3Dvw8ikpMLBfIiEPpaUMCB8S3
         mVt39iyIZ581uwlj2d22bCZTTc3JS3H/KN6jmJvSf39UFimFkCq3CV6PfODYhUrKA49k
         A98GIM2mFEZzT2aZth+OcVtt/a3OSohtRSLbsdcU/UlW4il+09jYYUbBbejxTxLHBHhE
         3Auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645056; x=1764249856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUtdFcR7PDGf6skoQftKs9iIKGP/DcX0bvw39dndE/w=;
        b=G4NydqP+LTyStRMUmrj64fLvbW4ofuGf+w8L0domTbl4xGY7iG4T5Lqmp/oY+KYUyO
         GiHxGP6Y4pmHWwCBJFGVA6h9xUoE8dUbEJKiAD6cMHaPgUkLIEMDetzreyCuWPOGHzIN
         y6lPWMKJBYCCPNZBLZ/jWHqd6A06kiloHjiwx23kfs1Ew5kSpN3jWlnXvezQZtfrc/lN
         b5zi2f2IZFctygvl00Ljne8X6q2ZsQc5iu6TIb84DukmKl9W+VH62PfSkHqD5t9h2FEc
         NuS1UbCbfhFxmEfbfhSik/Xf8gxe4ON4oPzQ78O2Uuc1x7uMbLM4ISv2eJgYbFXgOuD1
         ytfA==
X-Gm-Message-State: AOJu0Yw0hssgO/1aU/zCUXgRA7GWQvKs2hf1BjxyNi5Jh9YR6wIRH0je
	UtZ5vDvcMfTCO8hcwjWEMS04T6BtSiLKoNvB+MT4GnbSPhn/LwkypXLnTkIWYB4UaRM=
X-Gm-Gg: ASbGncswpmtHm2whPmGeaqmNroTptt0hgMiGDUdnoPB4j0cCqR61aVyr9UAzAv+UZlI
	LaZJj7uzB3o9U/ldJRyQ9kfKNfkTZUHvOnr8uWQxVXHQt2B+Me6O5QxbX1LB6D4DiWPDIAR8TeQ
	f874kcht4gBX6UlHBZXKlUCiKYJW99zX9OqWq0CYw7MoYCM9IuRUjQs+NgY6KTlgGcIGjlzncUb
	IzYJIPPfsZDFogU9qY9C0K2kRWxmHkt97k/KWjSD4tsJGATKfcQPU1ZB5/EHlltHaSI/gA0ujUR
	bxLtnsMrp2/AON5XezfJSsgOqRC/51AeQfKG9DB7uCHvy80QAPKMniA1hqQcOqhNZNUm48BtG2T
	aXhorSFGbtNYV6X59p/fsk464d5cwpZ/afO1LYzID6AnmyeDrJvjpleYkrP5al7k8zn82APb3pf
	xIisE=
X-Google-Smtp-Source: AGHT+IFalJewbs1LD2Bkg7N04ReZJFPTXvGDLHsrCVhop71bplWxSwFfjvzN6B/bqixKbIyPFxze6Q==
X-Received: by 2002:a05:600c:19d3:b0:475:de68:3c30 with SMTP id 5b1f17b1804b1-477b8a8a606mr41272065e9.16.1763645055734;
        Thu, 20 Nov 2025 05:24:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm46762935e9.1.2025.11.20.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:24:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 14:24:00 +0100
Subject: [PATCH v7 5/9] gpio: swnode: allow referencing GPIO chips by
 firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-reset-gpios-swnodes-v7-5-a100493a0f4b@linaro.org>
References: <20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org>
In-Reply-To: <20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-spi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VYVRdSRaxEEjo1QKUSMSRUCNb9ltdhV2FCewzDpDJRI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHxZzTRyJ3yFk+mKcntqNTthwYQeC6YFUGZ0Ss
 RRAJgqCEViJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR8WcwAKCRAFnS7L/zaE
 w96eEACluwaG4DnypsI9eVhneBH8csPp7dfpvZWX2U9ADqrnfnjShOcHSdRtJ/6DInZkKYTbv0E
 d/lwYpejv4ERfIxbYqmBHtVkbNhZqHsh9PSpQom6diLujjOyPDDj1I7CthLXOHFJ/8/b4eoI+oM
 fY35HkjgHdiDdtKrJroee7ywHg+TP5ONgga4+0wPK79bEfVj/1/RlbVALT//0oEWiNempXiVm/w
 k9c4bfya9La1vu2YWwjMjwkRIP9UQ31ho5DQ7DsDrHR4Khuphfg/ufChhcZMO9TDdP0MXIHRjvB
 Aw76+E1oOhmA89IVtjtz9A2CPpkmoEjzsq6XZapNNcWEWR+LUVzh4hq+z2IYfnyHIemQkXT7NHM
 dsEX2HoktgqM98LyyjhngznBQeUD68dPswVnq+r6pOVzpQ/iB0450krvwDwX2cMgaQXJWROoxFE
 CvgkXxRxvwthH+4rMO1c5QsnofHDOkZa3JUgoH6OfKCmktHemI8c0K/9JTgD+GHVJ2mHK5QzMGD
 bPF7a1MWXaEYumrdvhcHjqd4oehQumS+BimuNSKTgrEbnVoKmihFfA5yqmjK8s82eAyNqAeYFSu
 Hkzz5AcTcWNVHlYUXJhfRKYpjZ12Fv5Z7z7xsmmFpv3iASlW+egbuZTnDGRw7CCaXk7cvI3JYMt
 1dydqbyLuCc1THg==
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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


