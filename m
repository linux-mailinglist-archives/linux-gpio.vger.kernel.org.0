Return-Path: <linux-gpio+bounces-21083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B678AD0489
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02CE2188648C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B59028A3E0;
	Fri,  6 Jun 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9ePEAzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878D289E05
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222201; cv=none; b=FGdqiJ5QYORpl3huc0WfDdH7fNRBu/LLy3Zqv3UaSZy1Vw2b3YFCIOYQ1FvDzgIAnThbyus3mPf5ieJ+BOPM/Wj2tqH7oPsTD4fXV07nUKZ83akhDv5Qqhv+8lrWGQYq9HNU+ggLdmJRGhMevSfH7K7OhVm3FM/B7uHKjO3s+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222201; c=relaxed/simple;
	bh=8YhlHBum+GMkpxcfSNF6Fsr5CtES7Gq7MKq60ULoi6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXWac2fZSNDgTPpWc2CDOFGgpl3febTL7teG14JlsUm2UvfVEbJQzBPqgVbfDClm3QdukCJlpfm7qMbBUHXtGzpf2LXEHgUbA9gAcEjZIzRodLyqR36wX0j5bTCEsKL4etrHVAZF/+JSYahkWRKpaWdJULdoH6N4/5VCcuazoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9ePEAzT; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad891bb0957so354248666b.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222197; x=1749826997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86/sdIvo6lqhOQlCC6J1qPyFFkh630x60KJMH3jfrKw=;
        b=o9ePEAzT7/z1ZCjcl4w44NvBa55hiT0AUGH78eEXeygoTZaBbbb+ziG5EmJh+2GP/3
         0vhe+3pMmVcaX11kozQLRhBQhHyntljs1yPwHYGXjmWcDxdVgYbNiaS3LjE8bEmQkNp5
         TZH2jjANbcJSJ9dQt++o1kGo0CXHvJhPLG+wVh1bKgw/hkfnfcl4UKQZUijAK2sHwS4C
         PkdAfMytoRKD8SfdwVtTm75/Vzg38GQnnILxMsxpOjZHvFbSSAmQkU8Swkb/zEqNr5Rt
         4v+yxMdbg4k1O06XpiN+Mec8mxhwGu+02Et7BDtWOSqYw0wRwIVYSKedmgFoHLdXCb7T
         ku6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222197; x=1749826997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86/sdIvo6lqhOQlCC6J1qPyFFkh630x60KJMH3jfrKw=;
        b=A6rFqppuWztHdG3F/9ah1yHthNT2FmGvoM5rK3s8p+nH0TtlZbtfKfHwF5tT2F2bsr
         gefzvPggswULviU4qhuvnSWrpXnb427kPlY2XMTLkRrXK825jMdWJ13v25cnIEdXIokf
         06i5NPeyieKSNAqhtdDikC4MtimMvkuKwwFPcq/NNjs9fGfATHszHrwqm64J3gq2Itfc
         66mEvpPhhDFcoIX7rSBfsCGZfzD/pHOM2oWB6Ou2eQ8zpbluTfiUlcr23xRHYvEghivf
         34VooDVqViJKyiwYAoj0rDhlWCKLlgjjTUY0OMmL4mBAcXQMZVqIJOGadoZuK9Zkv62s
         Iojg==
X-Forwarded-Encrypted: i=1; AJvYcCW3kkLcAExLd6A6ZLP2sMYPr/fEHZ93HOgz7hFm95VgACdUonailS6NOnzxD/QypHy9mwgYhs/Ay2El@vger.kernel.org
X-Gm-Message-State: AOJu0YxwnBdCplnTulim6XDAGmo78dETgRw8ERMTdKPmPT4Ce3Dc1mE5
	7Q/6JfUW9bQMIZJGhoNSKxtcITFokdhLTa7Kfa8F0eWY1uyddxGNDIbsURerwxj+AgE=
X-Gm-Gg: ASbGnctJSWCbeECHUGiZN4ZZXh3ecuKQpZZ9qa0PAK3exAc1uB/nc28IF1noBv+u0tc
	CNVAPWDhvc6L+jmaYY+xFL/+z6AXkEcgpOOt3gZ4uf3wEduOkzYL0aqcSVTpwDPqjv97VXQEGYv
	EOU1dEv9GKGsIrWCn9em5w5xJOIKb7WszjSGkjws0rX6uxEk5yTh+fRXCdHEd1JLdeW2zQTQfpl
	34vA8LR6fBbknul6kdvygLKDHc4vxMaiLSfQtSnonE1VkXqVyeXInt1DSNshFvQoGAo/m2hCGy8
	DpsjNfjdMAkOkY+0wK/Gz/BB6JFTQ9nNUzSZrU5vC89l6E3C2U9scqwFBR9BXCbS2+6GbRnEcb0
	h+0ISz9V3xxR5SyaLTFYJQX5sYcvrzm/8GVU=
X-Google-Smtp-Source: AGHT+IFqXf9+Um6DWXqgz7nJCFTyJ4x+s9ENYnuEsI/OTxzyyQL/fitGdfmm5vxFgTyc5juu03zvqw==
X-Received: by 2002:a17:907:94c8:b0:ad8:8a46:f156 with SMTP id a640c23a62f3a-ade1a9c825emr352106266b.6.1749222196713;
        Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:05 +0100
Subject: [PATCH v2 09/17] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-9-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
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
2.50.0.rc0.604.gd4ff7b7c86-goog


