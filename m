Return-Path: <linux-gpio+bounces-27985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25597C2DDB4
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C5C4734BEB5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD5A327218;
	Mon,  3 Nov 2025 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixb4czkH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D8325498
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197300; cv=none; b=OzHthe62tBgMxC6gDw8u6oqS3jDDGbIvV1O4yfCRoMKTKCQ37jvBeh0x1qF5Z8nPCI8rG+dKqpXu6zE0DfNxx9ml31OXjCLGzG1dbQeJw76yrTTZbkHF347w2q9XCA05Q6vIE/fMC/vDdDfhrbuEdZkwpFdWX7vq0yKEKzKact4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197300; c=relaxed/simple;
	bh=2sTVmTa86pv8fJgdD5xjz3zgzXpYVywXrSd1pVhx6YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6DqoyT2f1KuGenZCZ3J+WRJ/r0vKWtXq2gGM8HLWhgtMR4CgwyTwXH6rOBlPCfp3zdeokEPJsYNhAkDSPPmMtDtVIfBeJwIRfca8mUaQhkn+jrpyBj1fkoAVZgTYdQgiOyp/ONGVcUQR3FucWh9otaBtbZyxk+33iIxgSeReE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixb4czkH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso898096166b.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197293; x=1762802093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swaPnlZ0H028w7OC5FVRDI8/szcqshYIBFL4ftY69C8=;
        b=Ixb4czkHCp76ittYEZ60gpEpQMoN0MUKFJEh0y/qG/qRr4oCt0gHjh56+u4bzCj9rV
         d7IUlkOzUVM0D7mamTzdY1kTIoJFCJONBnkqhLa9m+YaDJyWXjTym+o2Zq1inP2VeJjc
         L7Vw/deuhmRQRP44YJL8c7IsgprjmpbGsJo2HdWGWwhO/auHWaia9owRMq8Y03CKFYOc
         CVINsRzDV0CYuQjuli5EvJoN5NAnwQ2VcBXRM2mfpjh7lYacJG/kfkWlasbPz6nYzXg1
         SzxEiOr4OErPXv8t1qgpR0aGmaPbXAbzxttGoqkC+YzO1N4I4OnHE9EXVR4G9esrJgME
         Cvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197293; x=1762802093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swaPnlZ0H028w7OC5FVRDI8/szcqshYIBFL4ftY69C8=;
        b=S2c00XqmiZYVMnmzTj1ow//Qgnt8cJvGHXn0hycEmzHTNRWyQyoqfxgGbDDdA67wSe
         AaPUhnu2x3DqxBXByg7WPP3IUavVQD9Ng9Zkot31bN6ZZYWc5c1zi6O1C0jyPTuHG52t
         WSLqqXBbjbYuanV+WhFSAa2bp6ujAeHtp5x4g1qa9f3Gj9seLIPHydxTsMFKXWwFHrPd
         rWOm9vXnoNtV1aeeC+Un4dfFT5HjKMVfKTPrI10olzZNeBPZ2mIxi8KqBmLkK/OWFJxo
         bA4CbrMdW0kJCDfUJvdCPV3jlbnCbqn111JV7uQwFBhZxMDH5teKZjmTTBpA1kvnWK3A
         Kl2A==
X-Forwarded-Encrypted: i=1; AJvYcCWr1M7PiX5zGPSQYsrat7/Zykx7E+qgFzTti4z3Oo9RvQHMMMVtn6we545Pykxz75Z0pfUXps0QjCGI@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLF/wLmTkwgKPsbytYShxZs1FsniPqxKGyCzc5uGBZdazNtPA
	p6oBjyNYp3aQQG2a/PbdJxsqEmANTtxnLNAmhAEKp6BukqlSPI4V27/4xvnVTe1oE9w=
X-Gm-Gg: ASbGncuY5UgH362/QljuY6P6Xe+T8orKzW6eesZm/gl67ZHpBC3BOL9BIwU9KwnXU/y
	R4LmdAIJjAx1SagK2moGFEA5OIWYOS4ZWgZIDVOEa8EQPvq5W6C4a9A8vfDZ0/w9FsOKS/kdyS/
	hXhPSNDd047/eNS2LSd4mmXI+XnYUy+ImqEs6x8S1XjLVa5Asdq+HA3e9uMAXgCAJk9hpWV0Pd8
	JB9p2+Y5D1O2mN0ORxWZLTwnq1PvoaWuGhvckeLBtShFzUf0me4ANOrnK3hljthfLs12h3BKEUy
	v7QXZFSorkKmZU2saDXGJJj2kt6ivUQnzmYlkKpTJSXPJczCd5oGrEN51lsJnCrZxd1uRRLxM9k
	yUvdVmhefKKkF4yYxyrBCmbXu4ZRQOjHQEdrNAZQzW/jpfe3q6rpUD+jn6ZDeSbdnSxpxSeQvRg
	9qDkZF3s/5fsrZePQsoBiWLjBfmNYaoJLo009hJqoB+TIHrV5jxrQWYOtvGvCDMRJa012P1+E=
X-Google-Smtp-Source: AGHT+IHiNqxvdvsqsXOblsPDou25GeBmEyZiMxNTIJQm/CkhHutRBIYZb/OdlmtQUhYFXs6N4+W+Ow==
X-Received: by 2002:a17:907:6d08:b0:b6d:3a00:983a with SMTP id a640c23a62f3a-b70705ea59dmr1451359566b.38.1762197293134;
        Mon, 03 Nov 2025 11:14:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:59 +0000
Subject: [PATCH v3 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-20-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f19140e97b9d7a5e7c07cdc5e002de345aad32d9..3e9da15081e680d7660c60270af54ba2a4f8da1d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -363,7 +363,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.51.2.997.g839fc31de9-goog


