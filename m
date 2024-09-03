Return-Path: <linux-gpio+bounces-9640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC5969E10
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D280E282E7B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063F71DA107;
	Tue,  3 Sep 2024 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1BiF/M9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747D1D096C;
	Tue,  3 Sep 2024 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367478; cv=none; b=EGyze911tjhg1xmN9Jta90ohTBbkPx0W/XlO93hnybaJg7fUt/9Q6f8dMSOS9tjDD9nL1deN5pNJbMMpzRrcibcINYhPh1ZEaUSvmb4F8v39d9nYwCjfmHw89f52leCkrqGFTbZ6HiLTy/xQvdmQDhiqkap7sodLpn5C1S2QnH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367478; c=relaxed/simple;
	bh=iuWJjTI0mje2fCoCmmIcE9TUhsfeqtSk83XOw/Ho0+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kzeMLKctvqLPAXp3l0nUxqN8ESsz8g87i3fgvNnWQ3yJCRFD+nfLtr+QJyCwv9iFnUt2SwlobSP7bDIrW4bt91RXCpT7sWScbRSpyHEk/XGxSgCDfuZUAXSfZYF2eWEvXx9ht1qs/MYwxuHX6JbKiwxYtHcCh5IPeUlw7uwUO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1BiF/M9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so2822293a12.0;
        Tue, 03 Sep 2024 05:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367475; x=1725972275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81DH+LPBNoXfRGAcLzh8y+7rUBjIkmKd6TgqpUqqzZs=;
        b=C1BiF/M9v/0g1U5gv3U8+cUZIKQcuksuKwMS3AXtQFYwq8vaeweiskM0fPztDHni7Y
         oujXJWMSH2QqsLpTUASdV8A3GcxxS/l3Lf8mVA0iaNrn0XDrsRkVf/lomfGXMALsr/+z
         eBcHz7Fk9erSMv4YOqbJtyF0YJkPp6bHUO6hmKmYjljgYdWWk16KHsTnxDRg98FrWtp+
         szwEer6mY2kz2Jtt5/R6w3pZrIMUYEnya2cD9A7MvuOm+fW/GxWwmJHx8D6SWm2N9SKP
         xDl/oHgVYWKoEFrijQXfb94WJdLshESN46Db3NwBSo0lgQByLVZpxnThfEedpHBTTMMj
         YqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367475; x=1725972275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81DH+LPBNoXfRGAcLzh8y+7rUBjIkmKd6TgqpUqqzZs=;
        b=jPuMqrnHPK/yQ1pHmV5zrvtH6soQ+ac5tybOrOyovW7V5VdproJeWUNd2ZjaV3Xnel
         klbVIaieUDNTXe+67Oikgn8uaPjU5AHgQ9gcUklyde3+KZbeZKpc6VsqEc511iPQQN94
         19jeSeXT2PjgkgNgeWS05g0pIrW5Bh28v/WbvQFvZUXFFFjUzI9npTEjcB82Lotk12aj
         DuGA1NNzoI8+GlU5EpKg4kTlSdlScRF66E/22EMgJt3gFgsOB0Q70fkVAiid+GO28feh
         xN35u9zIfKoxXXQgG5p7IgEZVYY8yV5z7z9Rvz2Qqa4VmigaH9nz6ckRNnXyEdKcffSk
         3NgA==
X-Forwarded-Encrypted: i=1; AJvYcCVTUlPKUGKaNVEKc8fOFKPio8qJ4q8FAVUg8wVVm/BY6CP344uhtG6hjQlQ4M26JxfSeFG7eg7Dd6Wc@vger.kernel.org, AJvYcCX0Lr5+BT991IUlmOA8sktu/+R4fi9JoObDpLsrsLOo959oO0iR9ouuzG/PQ44r5FnY181nzDa6gLpeOBZf@vger.kernel.org, AJvYcCX6Y5LvJ1sZBdVeDegkM4YmgM2BVV+jgp1Xx1dgaDdsBijqrQOGXG4sWIy98hhH/U26JlOE6f+IeX+zOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKwgtxnnDLtJ4tP6wMB7UnjCAwJ19KcEXod7db3pK2wJ/Er7R7
	UwdPquK/mFcJegEUc+NqHiiZbGC7Bd10RSuLQnjxWWY81E1HKBAZ
X-Google-Smtp-Source: AGHT+IEQJpK4ku8iIQeBognKv465YsM+MHX/YkVO4Nv14We7PiDsQfl6sJUhjEFdDK/VKzSrpmK7yQ==
X-Received: by 2002:a17:907:7e88:b0:a86:af28:fc2b with SMTP id a640c23a62f3a-a8a32fa103emr50818566b.54.1725367475153;
        Tue, 03 Sep 2024 05:44:35 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:34 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Date: Tue,  3 Sep 2024 15:44:20 +0300
Message-Id: <20240903124429.107076-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the Samsung Mongoose M2, found in exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3..e41a8aec6 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -206,6 +206,7 @@ properties:
       - qcom,kryo780
       - qcom,oryon
       - qcom,scorpion
+      - samsung,mongoose-m2
 
   enable-method:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.34.1


