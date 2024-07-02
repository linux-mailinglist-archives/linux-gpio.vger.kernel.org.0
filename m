Return-Path: <linux-gpio+bounces-7867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7FF91EF6F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 08:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A512B21D8C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 06:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC9E12C54A;
	Tue,  2 Jul 2024 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KV8E3TKA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18D6EB7C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903042; cv=none; b=NuqQOanZUIbbk5oDsB3oUtsTolQbUKwdTexqpV4S7vbfov+p8c9qYMQGIZVmEmMEsvLN6OVGq5FxgvD74UW0ZsmTSbZtDVHbtIN6EhzQugjGoJc2dvTfIUDFrygr/ZWwfjDMyca/t+6Q/+LPBuBjQ633Ls+Ci6iL/CdL7rkA24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903042; c=relaxed/simple;
	bh=aeTJuXlmelJ4wJSbMLE1Njn8kScgm4grqFdJERZyVX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lz699k/Vt03ndyl0g+hw32WT9N2riXzuPwjY2mPnsTaNq3k258ywdJhbhnPzgAP+HwWQhnjFOAimh64gIkqrlzVyjx7kJpH0YBm7+G808jdJ0rbtXWR+wCoWrgGeyhkThK21VD9ryV3yLhg41caU6/kr67dfjBFd2+U3HuBeMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KV8E3TKA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42579b60af1so19298645e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2024 23:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719903038; x=1720507838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5MqGP2gX9AkAToRJxFTqpGWqLvpLwY7q08IsTrvA0E=;
        b=KV8E3TKAU6k5+6+7TGnLxdsWHTpjvQRj65S7Ga1hkELiXDjncobBOcyfGuXeBJ/g8Q
         +d+o4+y5408MD4AaY3mP6KJbM88yt9uXzNZfQHNFjn2sLdzCGRplkdLARuiNoPA6E2iW
         T+mh8hIUlmkJbiLvn+Z5ND6sDKWqf9As1QZLUDeJtdcqeJsYHx9SDDmfaE7A1cc/iKv3
         8UJAo+XrTB2psKVb56ZF36nnIjT2lPy3u8IbbUhQrri00zyKeee1RFGwwOsu57XQ+2XG
         aXR4G0gHAcDZzPPy7NZaYUhvkqYbIggG1cYUIO7hV3szFiV7F3O861CinwWlgjKkao58
         MEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903038; x=1720507838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5MqGP2gX9AkAToRJxFTqpGWqLvpLwY7q08IsTrvA0E=;
        b=amuVGpMvNKApgdQrVbCRrYVHxYFifMqXP5erUPmQdUhswJxgw/0sQ60VDKuyLa6ul+
         MUUyXYnx4ARrcC2rXMgTOtubs3klWpR1sZTokn9+33oxwzbIeFLhmKkXzr8coX5wijV5
         LrxtqERBAdAR4U+EDCsald1/R+2xoYu/Dcs/NVPWDxbunfgnySLpwjv8HE1csfxGJuhV
         ndnjNWirrCYJPAIyjNU0t6BHZ/S9JieQuf4uk5rNmxjwBJjvzIWU1m4dtF+0I2Pkt/+S
         dTTHLB/3T31MArDsvLzjlIWBrIyWf7OoOcYWnutsPTLiBITHpvLFEx3EmaQwwF0KDG49
         EQiA==
X-Forwarded-Encrypted: i=1; AJvYcCWL0owiah6/ID7S4BBZ7CrIS81+3uAUtG/0xj+92OAmzclB09Pnh56DsY8IiGMvF+Q8EXCFBMwITsvF8BSW28Dek+z++OAL57FRyw==
X-Gm-Message-State: AOJu0YyJnTtnidi62USK4K596dLgqH0fKHAaLTj8dPgryJqZpviTpi/b
	RhqtIb7jR9O6VTC7VH0/8+BoAtOmOIs7PHbALV7I2sMMxCt4OWKWO/jtrWfXYnc=
X-Google-Smtp-Source: AGHT+IGy290Mlz/GBKbJGbTHK2+sP47RCY+LM4WpZQ8iI98ebhw198jl8csOsfUAzg1S0bE2HR28hw==
X-Received: by 2002:adf:f98c:0:b0:360:7092:728 with SMTP id ffacd0b85a97d-3677571c8d0mr5906736f8f.55.1719903038410;
        Mon, 01 Jul 2024 23:50:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:628b:5bc8:edc:9c60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e146bsm12204082f8f.57.2024.07.01.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:50:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Martin Schiller <ms@dev.tdt.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: of: fix lookup quirk for MIPS Lantiq
Date: Tue,  2 Jul 2024 08:50:36 +0200
Message-ID: <171990303303.5837.16545270429395849054.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZoLpqv1PN08xHioh@google.com>
References: <ZoLpqv1PN08xHioh@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 01 Jul 2024 10:38:50 -0700, Dmitry Torokhov wrote:
> As it turns out, there is a large number of out-of-tree DTSes (in
> OpenWrt project) that used to specify incorrect (active high) polarity
> for the Lantiq reset GPIO, so to keep compatibility while they are
> being updated a quirk for force the polarity low is needed. Luckily
> these old DTSes used nonstandard name for the property ("gpio-reset" vs
> "reset-gpios") so the quirk will not hurt if there are any new devices
> that need inverted polarity as they can specify the right polarity in
> their DTS when using the standard "reset-gpios" property.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: of: fix lookup quirk for MIPS Lantiq
      commit: 3645ffaf2b334abaf5f53e5ca0f47465d91e69d2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

