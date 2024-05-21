Return-Path: <linux-gpio+bounces-6525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D237B8CB137
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB731F24FE2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A61144D2F;
	Tue, 21 May 2024 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Zdbx9h1Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5DD1448DC
	for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716305205; cv=none; b=cVnzNkI7NVdI/KsAzgYLak7JZlwZTujS4ng/dzKH09gg93a/dUek3M3UMIH/lNhmktGjobyhUcrYrgvl6PsNXR4pj8eRAWnS6ni08y7i1lZBRdm+x4ht+im6mwvmnoIixBr5Cct4oGdLvb0j6vcOkNiojLi5oW9hOi/s6pmJKMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716305205; c=relaxed/simple;
	bh=aiHtBVIcUBQAnB5Q2EBmNg8ODIWt4KSjAsZp4MaE7bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIRCs3uia/gaRyWWwJ5zqPmJ0MvJNf3eJWKJJAe0oZq/eHgIzWbf1Zs9BeOGg3/Ow1puX0675W8bfts2XyEgn+9kcsJ1CL/fPKFAPOjFBMg8gjAmEU5xIN3TW14rjcZFMzGLedM6nvVOAAjUXOypTO/qSuVjxV7z2joSnT7sIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Zdbx9h1Y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59a934ad50so844854266b.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1716305202; x=1716910002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjFz7A85flN3TvntQYJ6kQFqr3/C0cpeamTEx2vLXLU=;
        b=Zdbx9h1Y1VzFBHgpKkn0VUrx0LM9HC/BZnvkVkosPwf07A70+JXWaV9PtzKWGXvBb/
         wCUsmOg0bvA9G6ia8l3I3I++UI+TYEK99UVEBAnCD7K012yPC91Ji7FHjXNNaf7Ro4FU
         At/c2fEf6EEGrrbD6pquSn8OUSSEG2pSGUtXaw6Sefa2AnhyY9u2tL6/tPweLuE7zGML
         iptl+wIW3HB4pVXb/6vSEPrnc96l7eK2isZHDodpUw+gKdvcDpLqnoxXeY/997x7IxWD
         8zorYdOsSDrE1UqX6W0yXpu4Dqz4iM1ixpEYFNsNbY823BcMJ2V4Sycsgjf5qBm6hDa8
         JKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716305202; x=1716910002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjFz7A85flN3TvntQYJ6kQFqr3/C0cpeamTEx2vLXLU=;
        b=wF0ln2HDUsW7FQ/4ndDhbkkJ717RZbElC2BHIOsRPnvWFRQhgCh+sAO2JTAcFTCM5h
         PSUncWJYMetio6LLxgx9nG4qzwiwtdYFje/qwSQV+g92us5SfdwYt5QKITTA9hzVH880
         tE3Cq2PByAb9Kh6nTb76GnVnwif8qs3Vrnmpj8RFluxaL9Da7jNGYYTVRitZHkF/hqCQ
         E3Msau7R4ZUUHV7aZPBAC/wGtGJsVJipXfTUIJ2ZMrntsEGh/NsMQBUiMLdRctYTcyWi
         9QoZz/bKm43vu5OZdT3BiAEhyuRkzUav9j3CPbUmUFsjqX8Sg2UZbGHFXH6B+FsVcX22
         JyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdoaJG8Dx7ng3XaLUxOvjGeVBrhg662yPwoGGoojrRzoX+td+gK2Bf5uvNYENa0V92/5RUDiIyhHFIdKubVPL0+5jiOtK+sLt/Zw==
X-Gm-Message-State: AOJu0YwQqTtlu0USXG0JVMtUl6+T37lxsoyb1DcNTqhoqbvZVuGQei/7
	IrggUBFkIm0doXpIx4m9sRqHdkmvqEomxhPmD2swyq/+a5ODQWnw9QWDB3f+oW0=
X-Google-Smtp-Source: AGHT+IH9GEyPJ76wtwNB4/jHWZs7niX/sYQbANa7CsmlIy9vKqofJGQiIZsdI4gRpsE8eF4yskDYXw==
X-Received: by 2002:a17:907:845:b0:a59:b376:87b3 with SMTP id a640c23a62f3a-a5a2d6657e1mr2483206366b.62.1716305202032;
        Tue, 21 May 2024 08:26:42 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b180c7sm1638327666b.221.2024.05.21.08.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:26:41 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pinctrl: cy8c95x0: Use REGCACHE_MAPLE
Date: Tue, 21 May 2024 17:25:59 +0200
Message-ID: <20240521152602.1097764-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use REGCACHE_MAPLE instead of REGCACHE_FLAT.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 9570de598193..4efb8b5cc2d3 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -457,7 +457,7 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 	.volatile_reg = cy8c95x0_volatile_register,
 	.precious_reg = cy8c95x0_precious_register,
 
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.ranges	= NULL,			/* Updated at runtime */
 	.num_ranges = 1,
 	.max_register = 0,		/* Updated at runtime */
-- 
2.44.0


