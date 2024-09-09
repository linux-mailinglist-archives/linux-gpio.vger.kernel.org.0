Return-Path: <linux-gpio+bounces-9910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F309715F2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2BF1F2595A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CCF1B582D;
	Mon,  9 Sep 2024 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWX0Fs5l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A515EFA1;
	Mon,  9 Sep 2024 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879654; cv=none; b=DbqiDszDmUbDZOXzOmzgLx/sgihef617MGSt+flXhvw/j7rFlQ/22t3AaltOt2A6KDQVA3KTACRaNcP7VThytN5/uEKx8OjoHpYAzOyv31UHwWigRDeJIf1BbT3TVGQEgZeGjDh6jCFsBAhP3fSyoOZ7+6ULjC8A2k2yRaWGy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879654; c=relaxed/simple;
	bh=iuWJjTI0mje2fCoCmmIcE9TUhsfeqtSk83XOw/Ho0+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rMPF5HpHnKOWVfSX0B+LOALCq2ceQ/OzdRJrR6vn1xEhcp2H/buefH1cNhxabs/5lWHXrWnVf4+jJwz3KR0EprfAsjdSwJ68bZwifNvn5fK2BhnpCUVe243J7DDmDPbPL2918WRaCH2zV9MkXMk16URW68f6hXy6ZH2MywwO2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWX0Fs5l; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso3333230e87.2;
        Mon, 09 Sep 2024 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879651; x=1726484451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81DH+LPBNoXfRGAcLzh8y+7rUBjIkmKd6TgqpUqqzZs=;
        b=eWX0Fs5lSbU1coVTjGrUPNFepVEEL84C22Q4rYr0WNvo0OAftNys/T5BgiO8GlgQb4
         znaSC6w/XsA86Sf9BUD3Xyu8NUw6WLsZM76o+qoLam33vosO6wFPYJ1JmW6Q9rDC2BxQ
         Qkud70igqJ4i9imtYpqYD5NgNAEIVqVmv8DrElGNJU3ISmIgi17z0DTlmGmtScEW+Brf
         /zdI3aUBbErywXCDoqq3r8ORFjFufmI8Ha3w/zVVvIgf2U+EMycCA9mQNFBqf1aiYqtk
         gF9Rcxlvlj6XOeFZyW8E8Cip2WfSw1uJJ+UYn1G4UcfLz/u3DcObzldGAeEjg66KPMwt
         7FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879651; x=1726484451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81DH+LPBNoXfRGAcLzh8y+7rUBjIkmKd6TgqpUqqzZs=;
        b=YcDMIJWOyTEaHTSQUmXpprDPp2261OZSU6I1Ev0w2+rjlVVIq3mxcQf11kp+u1P/xm
         7Ojhu8/qhfehzXM29DYYwKVsGCIk6Qio+eTV/htKOdqo3ndRp1I07kT4yXRzcBS6JrRY
         q5Y4wJVQ8cJ17rTrf3gdGEvIOh351MzNbg/Yw0GVAMpSeR2C/dtrqVtZ+KC0V9rB9Fsx
         cIcXRBB4glr66uDvR37kMnGCdq7MYwNmY/MxipomLJHbq0YamzwV0p1+kiQP7QqW1Aks
         8Aw7TezNfrpI+/IDc9Qq3hBgvYU/Ndk0MfxIjF2Cp3pcI7AIBxDCxo8zeU3hc8zPMvZB
         Y5bw==
X-Forwarded-Encrypted: i=1; AJvYcCUTJWRAbQHKtFbOEhFvx1KKQWqwPc6fJ5lZSWYsj6ePQ+ou6svaiBzu2zw2Ogcz5tsQeozht6f/oVGPgPcn@vger.kernel.org, AJvYcCV31Nu3Y1/Iwk2sYUoViLrqIUQLWLckL4zkeuapnH581ZLB8b4HC/6xZfWx8SeGIFHuXXlfWk1Sg86N@vger.kernel.org, AJvYcCXhZr6u0wV2Z9WbMYR1+f/Q/FrvTi6NyBNeg3MxXU3jKbv8slNWZiKT9Af8Iqb+p9Fkm5iBspX5FjPN6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Mo3rkzvj7mwHzCoKA3Ufr2a60tHeshyB4LC/6avt2QPqvmbV
	EvO4ev4C/DyrbvLfCPR0QztgpJCAlWh9CbDWGp7WQXRKeSFXCFJs
X-Google-Smtp-Source: AGHT+IF/ur0h+0OYW2HRvJM5QYYZBNcC+3Jv64inyuImOpZJ6snrsh9hMvsZil8CYs7SiaRwUFZ5Qw==
X-Received: by 2002:a05:6512:10cf:b0:52e:a7a6:ed7f with SMTP id 2adb3069b0e04-5365881947cmr5941140e87.60.1725879650649;
        Mon, 09 Sep 2024 04:00:50 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:49 -0700 (PDT)
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
Subject: [PATCH v4 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Date: Mon,  9 Sep 2024 14:00:08 +0300
Message-Id: <20240909110017.419960-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
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


