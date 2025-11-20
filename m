Return-Path: <linux-gpio+bounces-28904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC26C74322
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5516B2AF7E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5F933ADB7;
	Thu, 20 Nov 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FWTAwCPp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD632C31E
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645056; cv=none; b=BfWcKnIE5ujWADLzR95Gtp77H005qB1hs1ozhisf1bMTX1uCGCmTZ3GA/be6TPA5K0a/zharFHy5/SZLa81cavmwULKZN1lO45UDCquSul/cwKeufZLetuMNr2sCnfc0o3POMzkfbkbSuHqhyHQFoF1IvWGS/wOdy/ZFgvH8guU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645056; c=relaxed/simple;
	bh=nGvOsKJSYyuX08yZfx7ehkwdqK43axSBuUV3X7zPZPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzH5GkG+OukiTZtjbOYwB+CjgLbeupN9h/SZ/fWT1uZLDypKAn8o8Cj7M4Xk/lUAwzFbkmTqJ0FZhwcQVJJ0iSiaYQALzNofgF+M3m0Cs2eeoj0SPx9d7qA1ukQtCXaJwPUhwtxMJGt1oLwMQhuBEDbiovwK5CmjLrTncjSwXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FWTAwCPp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so9794165e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763645051; x=1764249851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjurEy66uFzhgqR84OZ+03Q+oPyKtXngi2acMZEt35U=;
        b=FWTAwCPpv8zMKVYk6RmBR2VcLCilJrqKmIuPryZvlYK2tASFQyFmtXfn21PP5Uzr8Q
         O40HOid/Db42o0VF0e3WO9B9Nn/x7OnexGenRR9sNyjwlQfY5sKedWFLgv8w5TW/BoeY
         oWMEF9QXBqnkCKT5sI3qzzz91L8Hs71xJDKgSAsD5dB1mbM5990K/Ag4F0ywvlfbn3TQ
         7ZpAfboyEH3jAja4klbyekpy8lfKBatR2XRLxNycVMNL5Jva2V960s2W0rnENuh0VjNl
         sm5+h0W2WV6B3U1FmHeliTRb8odAxTiNAIBd/yetuulgNPtuVgvZtg8JO4Etvlkmf0qm
         s46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645051; x=1764249851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gjurEy66uFzhgqR84OZ+03Q+oPyKtXngi2acMZEt35U=;
        b=KI7VuuQWND9xFsd7oAINT9FtkkudedBoGzKoyU4OgSXB0Z/wyZiB1t+fvvq00cXMjn
         0gSrpvpGehoB/gDUbd/9IfIkuN/rU/pATncIwg0o7nyKs7J4DbetGOzzq1tgs+uGazHy
         h+V8ajYgDl9iu36HuMJaeTdWl8UhxRsWegQHNXIQNqajGgIoVZB90s67ryHFpeDhhtRv
         sJ/o6EU4oXQkEQ35tI/XefJC89LuTxB/C1dwGFkfLHLVcW5GqgbOs5gxo3PCgSGQBbor
         rRH+VBg+c5XgMQ2p0+hSO6w50HJIHS5eaqFuYIOW5WLqggdu/4zUrcrPuCA6VMzLBAtN
         gtiQ==
X-Gm-Message-State: AOJu0YwFV4RVoJLasZyTcknhvgM4uT4V3FHOUSSpPRULjYATekquSXih
	707TuqL6XVyGvLAXtWhxBtbAq3TavROSZ4aHly7DxQU5VsUqCg7wLOx8fcUmPKxFAag=
X-Gm-Gg: ASbGnct7/Ta3qKrIVXEJZ0U2IiYEukwnJqRO1WRwYI46jRAvdioj4BdCEDUzKi0ZEwO
	0ToT9FRPKwr5y9VRTCtZmD6t5T14CRLkkVKnIfo2ywGcz9SdGGr9wjT5ZOIz0Tf9qlcCmjIu97h
	vLyPvjeXMvLu1KOfHyi2VA88TFIiziWRvXnvm3h5sWn9MEjvVYAwsQ5425aqcyDmnKko/8+m9JZ
	cv6TKeGOYoXRxODHIgPsLzQI/4y5fpXCH8JIOjAtse7JVA4kMz+t04BbFgj5idqNc2W0LapgUu3
	zzV7kGFpH5MtDOBFLlX8KTGtO31E1oHryMYXWQuOYz7G4QlK8XjRnXdNVEJBh6yWXaGbkPIypp3
	vG41MifyCkurid+54o9w2t2fPHTul0JnXHyzsOzCqlNzeD5QcwGH/2kr447ofG4ElyqCP5HEfTL
	s8Fsc=
X-Google-Smtp-Source: AGHT+IEoNE5KMStZzlaZi+zRosECWOIXlmzVTWZ/StxtAPpEZjiVCwXj8iHk/ygAx9K7h6245IYWoA==
X-Received: by 2002:a05:600c:154d:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477b8953efdmr36161755e9.10.1763645050673;
        Thu, 20 Nov 2025 05:24:10 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:37af:6c1f:28a:47d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm46762935e9.1.2025.11.20.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:24:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 14:23:57 +0100
Subject: [PATCH v7 2/9] software node: increase the reference of the swnode
 by its fwnode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-reset-gpios-swnodes-v7-2-a100493a0f4b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=prKyYsy2Naj1W4DD2JlmvlVbpPDmr3NjqYB+l80Q6J0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHxZyYz672OW3spWBP1aLSGLK6NVlyo2KR15zD
 qV9wSVZNSeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR8WcgAKCRAFnS7L/zaE
 w4uhD/4lKzA6330y3LuwdXfUPHULtSPTWc2hSoyUauQHiF9BW1gHRCnIxQciTJcQvwBgShkQnXN
 MmPCgqPvHbL0ndMm7oRye2jzzt1FiOBGCxWDNdsuopO0Uy0SqVTwbkPrVsqTtuk90ygUnxrf75j
 pCsgPkPwONimP7Dmw2/qQz8uW8J87ZRpVRoy2+z6sMdyFwtD7UySvytPJa2Mik6zVtNYoL0d3C1
 3f73uB8FTTO1yfVvTbUqMzlvRPlOSUkr1z+BEL7MozwcslXpOeqDhC2oFMBS+xBn65aEM7fEZQ+
 JIaJGzVOjVm3jtJ1L3ghuWRKQvsOULZI7XAmRxL+psqlnIts8elhdXU/B8uOSV5qmGQiqi/aHE3
 88Ec3e9LRJL4cvfRlPMXI++28Q/TLHjBJhZ2RQKelVGenfzL77Qe8RV4ZtSeixonVvh1bqexPtj
 T220Uu1tJa4WPY1BaggY91dYNwuEPpYDVGsDYOGuGhb+E4hxoUGGwMxyiTxCHflzZewut7TjhiD
 /LIiaikuy7GhKLaj9s7gu+Bjnyn+FLIJ8VP6NBrrVL5ByrpXceP2mC1mIgw09lSsT5Ppowsaftn
 FOvmyngYhvw9dJoYvhxQdyr6rXsSgvGy7sXdCW/OpEFtrMCf0E3V7inlVkgzTSzjj8Dw91tednT
 JRxaeZqtlup3lkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference other kinds of firmware nodes,
the node in args will no longer necessarily be a software node so bump
its reference count using its fwnode interface.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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


