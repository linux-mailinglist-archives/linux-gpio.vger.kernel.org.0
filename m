Return-Path: <linux-gpio+bounces-9915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A04971606
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE3428454D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AEC1B81A9;
	Mon,  9 Sep 2024 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpS7/DHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650F1B7901;
	Mon,  9 Sep 2024 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879661; cv=none; b=lKSNQlphOdYGgirChO1mHQ0mZcgBmTdeaFG4gGjIIr6/vF84sMMkaSAyV4hNwh2EmDu1GFhvAM3mp+Z+VIVm95ss/Xy1b9iI8i8f7W8JEBGFsfp3o8AyEINhuGuBgBOrvOi8VVSJvyRYw8z6SaLlP80jfo9t9F4M4RFJPJbH6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879661; c=relaxed/simple;
	bh=yMd5DLIFL4KIeheK3HmX082PFerBBz9EYOrbqW0N5mE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=efFVxp69d4s7JiDJ5CG/SCsXDGt+KocHvciKJQKYFKbhR5MYx5FZRAYdDqtVIz0ELOB/dPtj2Yl/QyWgYKATgs4jWHIpGwoBhglu+KN1xXW4pb7hJW6xZPcV/5fLmkYH4KTWQ0Z085U3LjfU7/a9W0PvoB1ArqdbMEXInCVwXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpS7/DHA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8ce5db8668so411531966b.1;
        Mon, 09 Sep 2024 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879658; x=1726484458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPlQaV17FO9rLqzivtvGzpDMjb4IPNY2uj/S533b4BY=;
        b=JpS7/DHAlASoBPRLYt5V7rshxDHIsJyYbV/H4KM8+srr7rg4LYH+8P85taFrhvdFgo
         mKBmFbLZQMq/u5dx0UbqJjCtyQY1J6OR/qdZPR2ZaVVwzYRG7FHdqbeyG4qhqp9isE6G
         GW4BYX8USCk5Qdh5NK7FKs9lec/zoK/hcUTO5hSV6ECfY0lWDOa6rMkRbkUddvkEJjj6
         E/kQSLePz4zwpxaWuGCSfm7K7PTHbesGan2ec7Xh1TosRKtQwISQ2x5o5IuvRwA+0mWe
         o4h+FxYLjXtr1YAjpmoiPB5OCEB46TdAUicU+549GcdRn7WASCfVHcPBHIMCVdraOvnX
         OBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879658; x=1726484458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPlQaV17FO9rLqzivtvGzpDMjb4IPNY2uj/S533b4BY=;
        b=KKoh+GUHN3B1Z2sd707Vf/UdOTB6lgT1mIWQM7G94rmlsJi++CMLpOxAu8VdS/u80t
         l4ostz5tlTnxqgcipdv6Fy6PA1LsuC+YBjR532KOl9isNVq6uDC05V0l67c5sUyrzxpQ
         O08yZLH5OaCxdwUnsjPLLJPhUgR7ohintLv3bkmqAJt3tuxBFyIEO2zzqNttuLe33fy3
         JblXPgC2vCGEsNnd2eOjXI+GdAKxJmz0ihAuW99mMcJsWSZ1Yv2j01BSageF+gHtk5o/
         aVH9+tOwazhCah3TO14xDxcyhIvdjvstw2aIXiBjm+yv7xOo88qo8qLqGvIgpfT668g0
         Nh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVXBxjll6zE4w+i+DbgkxlM3DPmLSi8V0PZPV0qAKvubJFynqHPZEGVOrxe+xVQKyqeu9WtCfvbs+U6RVM@vger.kernel.org, AJvYcCWIZe+S4BKqeuERzfgpd+DeoBuxkJas6Lod+jErxjRyvxTQ9VYKhR1s2u3gApDH9SOjjpHFb6SbxEGi@vger.kernel.org, AJvYcCXJEld9pRiy9bLP5KBzPpTxdX/+RX/paof2sPH0on53kbO3z5xhybCI2H/4VUTNyawqSEKzh7HKnQ0ZVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS12wq3dK0tZgrSPgsenJztfZ4D5cNEcKN2yb1usy08tq9vME6
	RLIgXtt2LEJKIhgCyoqUMmB9CwifqD7HvpMYwrqUdmPeDH8xBMIG
X-Google-Smtp-Source: AGHT+IF6qmaczArVVg9E/gdfrDl6lzObu/G4Pl0MoGKZQdaio8d+ms8KTqx/R7WjWMO5DAguyJONtQ==
X-Received: by 2002:a17:907:1c1b:b0:a86:7c5d:1856 with SMTP id a640c23a62f3a-a8d1c72db0fmr838667266b.46.1725879658183;
        Mon, 09 Sep 2024 04:00:58 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:57 -0700 (PDT)
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
Subject: [PATCH v4 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Mon,  9 Sep 2024 14:00:13 +0300
Message-Id: <20240909110017.419960-7-ivo.ivanov.ivanov1@gmail.com>
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

Add a dedicated compatible for exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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


