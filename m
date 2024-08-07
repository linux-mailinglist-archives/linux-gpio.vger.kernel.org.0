Return-Path: <linux-gpio+bounces-8606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9594A2DE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0BEB1C232C0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8EF1D1737;
	Wed,  7 Aug 2024 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op5i0mV5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE51C9DE8;
	Wed,  7 Aug 2024 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019340; cv=none; b=Su6KLQlA9DO2+bqrKpM7nitxFgJD31/ya+GXL55Q8mpywgRikCLH3WGgoWjxolZShmscalyOJLZoy8MlDA6qoe8PnqfLVwbBV143m+Q8K1qqVEfkHtDqE2OSlC8mXRtoTujI17aph/tqG785FO3wyEEGNl0CgpuOskIWPCIMmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019340; c=relaxed/simple;
	bh=Qp313Qci2qoDQ0KBr7854R3qoVSrbpqs4ypoWdANf1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VHxxKxDB0HKRka/+R9uZtSFNmxrpQrR5QqLS6ZxugzKdW6K49HrPHNOw04Qk95Hv8szGg7r2Vp8s1+iie6Z57xH7RlLxRV9xHmgnsoh2rhw9qYQMdRw1ITuEHYEVRVMk/SLraOgfo2t7HRGSs6lKiCYkOk6AsZf8HIpeVq5G6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op5i0mV5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42803bbf842so14399515e9.1;
        Wed, 07 Aug 2024 01:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019337; x=1723624137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sq3JwLnBQHuVxTPE2kwPA3hSkUmPi6deaCJ0xrrel+M=;
        b=Op5i0mV532YDhHxYrijCmntqUE9d11lV9lHCrYGgsmtZWSGZnSZjkh0v3AnwAEL3hE
         w6UqZIAjv9gWw/4l7huJoVZ2IZfiQecOG1HdTzK9g7M8Z39nIqi8b6A1Y5apBR/d7H2v
         se4BhtsTu5cDw2AEQvUhGGI7ZdmLohRGxyg2cF8+SbRBvkoi8D38u9WLb1SxaKVPVAXe
         KqUJ3vPxZ5GPjW19TEj5UDtjIQiPE8tk4+F0UbLtaJbi936CarVKvIbqrvRZ9suppnsF
         hkrTs/Rk3dKOo2r3Rd0Ge6i1kyWRyV0zHq4zLFYmTOGuVM3aTqsS8DdebVBhuio8kRMv
         31tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019337; x=1723624137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sq3JwLnBQHuVxTPE2kwPA3hSkUmPi6deaCJ0xrrel+M=;
        b=wGrn3JVCnOcDAXuXsArRBgHHoOHRur7Y3KmRMkwV7XUpjbqRtEV//YA/YagP9PXhWf
         5zhlSUyCWh6/UssVnTBYKcIskInLGprq6cGozAJEpbsOyBqvzGLeOqLiYkZlrCE4CanX
         ZNU4WTpZt5MlpFNXA+WquQCHE3ZOZBGHYWGP2P5qtHmDqzKEgHWNgBjCkQ+rYRGjZb8x
         gOX2fLGR0X0SgFqkILTsn5AOU4bHOaPaq1d+cwe82uumEs6vJlUR+tjm3z5TSKsYEpQ3
         oR8pInoWOe4RTasIH5FtRAUrVspC0urUQw2NNKl0EL08FbNDF+QlOPaBelTeCiOrmx5q
         mMAA==
X-Forwarded-Encrypted: i=1; AJvYcCVwOzqDjo3e/SUtP9CCePznEtWHM4QDc7lHmsjS+paOPsP9pRLXt2hyUfFxo4rYDdye7WikslAS8nUYoOK40+4cL79x8qYVn+wU28eBodtW1wwBApFMl/kGmwnirH66dmmsrdcSblEcj03amG6wqTqGPYvfTyNxEq/mv2OBOlqiqlwUJzU=
X-Gm-Message-State: AOJu0Yy2/vIb2BIIaWY5WocbxwOI7pey47d5PWp7E7nGD43cZG2uTBmL
	qhxz5MxKFMU+2CwrW3wcq2zPKCM0AcdgQbzG8AtDAFbhIXE7XBA+
X-Google-Smtp-Source: AGHT+IHHPywzXI4aPPp5NGgYM1bDDr/F5vRJhMeg+odjTggXPHZzxgudtT/YVZcrdTndY9lcAMPO6Q==
X-Received: by 2002:a05:600c:1f96:b0:428:f0a:3f92 with SMTP id 5b1f17b1804b1-428e6b2f142mr144905455e9.21.1723019337114;
        Wed, 07 Aug 2024 01:28:57 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:56 -0700 (PDT)
From: ivo.ivanov.ivanov1@gmail.com
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
Subject: [PATCH v1 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Wed,  7 Aug 2024 11:28:38 +0300
Message-Id: <20240807082843.352937-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Add a dedicated compatible for exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 4dfb49b0e..91516fedc 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -42,6 +42,7 @@ properties:
               - samsung,exynos5433-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos8895-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
       - items:
           - enum:
-- 
2.34.1


