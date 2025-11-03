Return-Path: <linux-gpio+bounces-27940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19323C2AC57
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 10:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 153424ECE7E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 09:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ED82EC54B;
	Mon,  3 Nov 2025 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JWtpCIPI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33E92EBDC7
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162543; cv=none; b=FJzfoO8oSrUGsXSEoMzA3Z7wlCosKY2/KfWyJGIt5qq+l6n0RcoHiBxADS7+5gzlnWEBb0hr5LVRNRLEZUY5I29BXC9uR1xex5NsMmHHGLM5E4slHHkVEP/1j+UUQegL5fuWOUGf86rLHDn9/tU11ABnM3tzw1XLaWa4xVNCcTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162543; c=relaxed/simple;
	bh=HTd4iZaPRKiVM5g3i5e6EDps+IClJtoB1LFevsHD4CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnspSVPW1FLAOP9dummJXKJH6VZD+Pdiglb+1nXLD17zzvzOB0sO8B71cLsPG+jozZHRrCT9ShYdn0eyQN5dv60zEMwo3X/3OHiiCwScc8AyYXcvGxlFJ9SqtpB8QZDr7slGJkJtdaXlweWqr3pmwWNeXugXmaNOayhKvXrWkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JWtpCIPI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1294968f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 01:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762162540; x=1762767340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MR9/q1uejjwqNisgWS/5bEtUBR0CMunjlT9KIpTJamk=;
        b=JWtpCIPIuRvgg4Sg13FMlCyblxReTvVv2jm73Kmk/EwGjo3NZZY/+EzVhbc9cjAKkU
         nXoOP+YtehM/qX6yAY/Ci6diSaxW2gCHcuDOHqbsSiGChBW6bprtUfcXafQQ7heK66x6
         Yu0EwMo/UM57YX9IB1otdeM8MHBMotRoZYwCx55ndLXQnFpLhxh84uiMhvjsYz9C/3m7
         iFXjvKQBU8Dv/YzGaOlJ6bTucGZLHAckDeCNpczEntObRa43Lsc3mdC1vetVUIYcbNnS
         HaEnp3Bfj1GJoSZKtZr7/TXFeolVuor+mLXAK5192HeybFMuMJ6huOUm3ugeR21Ydrqp
         Pj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162540; x=1762767340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MR9/q1uejjwqNisgWS/5bEtUBR0CMunjlT9KIpTJamk=;
        b=YLgV1RoGRf8+axjTeKKOhxL7wSX9jeyklo54ThFynr7t/WH3EkpZeEgLVa4qS5C5vn
         NOJcwXjMDBzUtGtRS1dG1RzlOJhLCMUPiCosNLzu45w15RU5ueU1bt0rBniNKH1c7un+
         IniyworGcuZIehr8y6SLmjnSkfO2p9RqMXRupF3jyiNo/Fedee5GtadyWL2ahdADFTSZ
         K2lA6w3+xqx8BBmMHaTHdk+fbYySB/NqB8W9JqO+PbzDyGaK8nlMiUn2XpTYgMQF8DZl
         OeKAKalOlE4NKLG/E8u4wIH+7DNT/zYkJ69OPBh4n+MqdsS0X1h5EiXHSlMLsfEvYGbY
         pQPg==
X-Gm-Message-State: AOJu0YxjDGHOQRGRawuCV678XmSsgITF7IqsnAZScrOUKBkgyu00D7We
	Ow2d3iWK1tW1ofc87jYug/okZYezHV4r+WgHMErF53YSRUfR2VG0D+nNBLhLPMqmIuw=
X-Gm-Gg: ASbGncvdXdz5PditzfPT49pjcBsv3VYPFJgTdet/kBBfdoRf59x+Ei8oXYe+E7i5qsI
	DwRRtkqGvXLMLNhyaPj0eRR/wzPyVgz377tPazInD0VO0UbU7GGIU9VW8km7RFSSkKDvBH85cCA
	ejF63oBzlER4XiEmti3Gx7rEa7xZP8pYbEZ1F3+Y79XEQ7BaOb3jOk7zUXwQZGpfBMYH5MaehGF
	YcFzzNE/W2K3b0eeDvjB1XcSez2bv+DDs1jEsyz6Tm45I63Nf3Z7xIYY6AkvWpAQ8BxarJs9vJJ
	MvjNLflyBFDFcpJOeUraQ3TbUUkiCNE48sA0dTyHpbGWu4LdQsUUfXkCdfeXHfjhkFoGYlV/JqS
	VXFJWafTYF8lE5Zs0ywgYDJUGcVFyahfQK510kVJNQnGZQtKoZZm4KRbAK9R+iWnNJ2C9huSLOo
	TKb/tQ
X-Google-Smtp-Source: AGHT+IHRSTk2bASAi6bSlqK3LuaAJPm8yPphUV6iZEA60aV9YtfO6Vgj8NiJ0oWGdqgc/FbytjRbkQ==
X-Received: by 2002:a05:6000:2882:b0:429:c6ba:d94e with SMTP id ffacd0b85a97d-429c6bada73mr6241828f8f.12.1762162539894;
        Mon, 03 Nov 2025 01:35:39 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm147285675e9.8.2025.11.03.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:35:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Nov 2025 10:35:22 +0100
Subject: [PATCH v4 02/10] software node: increase the reference of the
 swnode by its fwnode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-reset-gpios-swnodes-v4-2-6461800b6775@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cWEXsl3g7Qga/+zqwiTnXs07zQEFM6f4IiHgGDiKRrI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCHdk+HcXSqYzV6wtK2hDXg7D6GqjdHCZYrzNH
 mNXIIVvAOWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQh3ZAAKCRARpy6gFHHX
 ciivD/9xjHtYcd33CT4tvDonwQ66b0vfxLxMbHV/nO11V92tOAvwAjfGw/ojqixgfmPdF7Am0uQ
 Im9zZSwkQpWnJqhA7DRQ1sJMNmh8o06kZYqSCkFJHicAYFtfJ6dWQYriuT5C26OuUkFxMPi5TuH
 7Ak2d6zirsj8qZQZHY9oq2etd4D5ifDwFk6tOYNa5V6D9Rig/YC6WQ8H5nL2C8KbFmgQ/TDkwTq
 i0IpO3k7U93Qdef+NUsvbyOisc9epzhm+1QykzdTFx1rutfkuEZbgN8chSP6HKlNcUkjOkdwgG4
 FcMAAvJa2i0Hk/ulvK5PRd4xEnKpZja2+5ogMxt8+2egEtXLVfRzh4YMuRsJF2cf+Ioza9OsmOS
 6r3fwUH6/I9xBk6y+zJdfCiHYw8879CtKBYz5rEeAm8HWJx1sbOxSyZ3b6VeQPccMIM5kgcQSMo
 bxM2HJxErbnCovM1w+K7k1YavCJdDpAZS9NWOEXk6xtyc+Epw8/PgjVDrOQfBaYd3XH+u9IrsG+
 MSXxk9NjcSaWhb2ppu04meUK2XIsOapbRE1e33Ak/dGj8bmDY5DsP/M2ih9j5GHaJCkvqA15HU0
 hbnNfbr6h9tILvvJQE6b02v59X9+vID4kWCnnsGpB9I50RkIJ//+G0itWtI9z2rAy3uPjgwv9yj
 RDPiRSETNW3Z2eA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference other kinds of firmware nodes,
the node in args will no longer necessarily be a software node so bump
its reference count using its fwnode interface.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 016a6fd12864f2c81d4dfb021957f0c4efce4011..6b1ee75a908fbf272f29dbe65529ce69ce03a021 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -553,7 +553,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	if (!args)
 		return 0;
 
-	args->fwnode = software_node_get(refnode);
+	args->fwnode = fwnode_handle_get(refnode);
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)

-- 
2.51.0


