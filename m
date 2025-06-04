Return-Path: <linux-gpio+bounces-20996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4802ACE144
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4FB63A8AEF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BEA1D5AC6;
	Wed,  4 Jun 2025 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEEDtvhr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049811B4138
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050754; cv=none; b=O4pURa+c1Mv387SMYTtyZtTi51byBb2N1GFmsnhrZAXoI2YvqM7bx63VP3B+noF+Dz2DoyZk6LIF6njVnVriSPB3fiYsIKBT1io4ouLUDVCQcxaqJ6IQstGt7+BjTkj0n9j7nmdbeEvpXtxcyb8Nhl/dG9/sWTqommMjcdszSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050754; c=relaxed/simple;
	bh=ZloWrNFeMmVe3/HDuD1aXKWP+8PNEOlvbHUi95SknjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0PSV3aunznBBKG3T+KJf6Me93my6WIwIvhLq4ilwQQCCkVt00paI+GwzJAy+ibxVsaO6Djs74VTuGa6A9Sj8gR0g6qci8kW89+qAe452xtFSkS2j7VcSPjqLVwrKvmP/WUEZVG4Th6u6YYQGyjvE7qFz9SEDn0AVWAOfQInWPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEEDtvhr; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso12822901a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050750; x=1749655550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RK6fDlVurrAhSO63sHrDo/ZYoV5lV5EQ9BPN02YtAuw=;
        b=cEEDtvhr+N7PEGXPEhrUeFyCa2qMbNtm/P0Ohq03cvSAEPWkKTQWaWgvMzPAwZ3viP
         zRE3yGsRYKJMYizY12jupVh2sj3akcOfCWdc/140wTbE2OBIDZWodN3ul+idJosE70Wl
         BY/6GrHREpcUeewuFqLXsOvtYOV1JaskxSaHVUbsJyyOHlWHBLbNi0mNS/pfnmupNFSA
         tXt9l0KeJhXI7DAkb0Zl2aQOo6P5IA35b9XKeGqJJURCP+AVdn4so4fa8Ezk3m3TXbqv
         4dhlX32QPgpnBAjxfTJCg3PHnfEAX3Ig3NsyaNCKZKqNb2OwczUasGSt2lB0HXxTLiRm
         QM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050750; x=1749655550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK6fDlVurrAhSO63sHrDo/ZYoV5lV5EQ9BPN02YtAuw=;
        b=hXEJlZo96tnA40o8YxwO0zG5HuQvhHL+GuuxkfeVscC6XHLixMDtdqUGxEHKhZ/yH1
         4TiJa0Z5ThN5SRtuewIvjq7imDqS+GJjyiJChjg4P3f8VejLeE3WMDEOefIwPuv50i+4
         lzjppK/klJ9IQZWNPxTCY9oShz1EbxvqKzFSUZ8lZJrJEJk6Lq6jxrQO30d8Pfb30gQJ
         83l7pV5OrEXCKT4WxOEWKv3aG5tciYxD5GyeZI/SImwKo/wizZgTeRO6yDYU8gY0JHq9
         MM9kTwsnbBA2HIOKqj9q90ddBhhC0woBu/LMItpoennWZqNtq6R7bxN9DjTmDTmNwvoj
         CwYA==
X-Forwarded-Encrypted: i=1; AJvYcCWcVvyUAzKv4rcA3/tQvYnvmU2ENl1A/KfTCrDCMlRHK3g87rGuX84ZzMHYPxksF3Q24ypOqYKmj1e/@vger.kernel.org
X-Gm-Message-State: AOJu0YykRFoaeclqVwu3Fn6pP2TwRTNdRTMzKllPffxJ0HrAv7iOs0BM
	d4OoCqwwjZGgUDF117sb5iLwrNn6EysTVEfVpZ3/1Jl5Qbyrx64V0eVqiTX9XcDir6o=
X-Gm-Gg: ASbGncvLbW3+c2INHkIc58coCk62bxP5KitlMTQ4EWqjGhS6eCUdGetEBfCpG44jSJn
	739vfnIR5Bc+VskmVffRRZxiZXd+nU7On9A0Uzgr3SbWgK9V4yRRu7PB2ApS14zIFvU+fu0IRb/
	5Q07WHZgvr4YLZdXusGzqrpCZ7PVNhr1tCYuTE/R0GbWU5XQPAgWjCJhM0mqoZE/khh4avPcErn
	srwURS4fER8sI6B0ROFDO2ffx03QS8PnchhFDPjENy7yoF7Ev2rkAWIiOWYhyS6CZSZ6rh+iK+l
	FVgVqC4pOjZy0a389wqvkkraVvDa4My66ykLOrwvfYvF4K9TIO0X5Kn4ug0P7Y29gD+1uKeeAqW
	ssMPnLGVpMRo4czZsfihjnW1tTzLu4n4nBDnwePXoWEFIEw==
X-Google-Smtp-Source: AGHT+IGie5OT/C4dKIZS01jGdu9pcMB4S96GfIIlXrVLkYBNWiD38sd2vviPzRoeqlZOJ6SG51yRIg==
X-Received: by 2002:a05:6402:1d49:b0:601:31e6:698d with SMTP id 4fb4d7f45d1cf-606ea190c59mr3038407a12.23.1749050750307;
        Wed, 04 Jun 2025 08:25:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:48 +0100
Subject: [PATCH 09/17] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-9-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.49.0.1204.g71687c7c1d-goog


