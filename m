Return-Path: <linux-gpio+bounces-16063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FDCA36DC0
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 12:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54DCD171721
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB2C1C32EA;
	Sat, 15 Feb 2025 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrT1oqFt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFBE19F464;
	Sat, 15 Feb 2025 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739619189; cv=none; b=qI9anvGdPBWOPxzemSu5P7YPcsO5JjTGbqCZCo5wVtLJg1yUEpZukSrIfh2zUsTuqnY5Eez9Zk25z8u9pYUZkB767SaGHi5m6fjfXHxPxfySHvNG0q8oD/VPv4IiHj0qkIfWiUbAt5aPDgg0jlNjdFmXETRbH1HpDh2ELgThxZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739619189; c=relaxed/simple;
	bh=xrFccTCQhNjW4FlGna92NqWGcHO/SN/bjKxMvgfvHEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxkVgPUh6asqhmOwEAoLz67KbbQEtlaYxSsUlV7jtLvdpK9W5BPPotHXvACCXWnUC+FTCg1u6KtXcfRhGgOGSgIVX7zn4xVB+7sG/oCQBDX+N4zkn6pfShUXFQNqFXTqrN4hnt+dKE3tnJjLBnrU591mtuGxu/LPka03fc8YLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrT1oqFt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so712815f8f.1;
        Sat, 15 Feb 2025 03:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619186; x=1740223986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Tvnq+LrVTpNcD6SOjzWHbTaQO8qIplkrwBXtqGldE=;
        b=TrT1oqFtQP+Egy6mJHPL8z/vjZTnsKS++YhIJiyyrUjfL9lm2klTRi/WNWMM1d3Oy5
         KIKdv39qDQBXfSPk152qhK4ctG8C0yEbthYPFKGZ7F69fG32xWE2eGgB1k3p3jBeFhL+
         66Bi4dSP/UMD2DB0j45XfHd6E836UDgzWiKZSXUXGY/E9dkd7G3Sr5Wo6ZRT3t13ZXxe
         A3CDFICp9qOekA2XVvqdVha/nhV6t09GdKs2uDzND0d1x6bEs/GJfM+3FxmCvgJW94Yw
         lcgqZZkC34BE9S4avnKojEWOhVt54d/a+Rk2B5Fje57FnIeIB7gs+7Ytp9AJngYNoP9/
         m5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619186; x=1740223986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1Tvnq+LrVTpNcD6SOjzWHbTaQO8qIplkrwBXtqGldE=;
        b=lTGf6v14rMHfHQDFE4Xpv1vYGgemEVW5jrStNwYJhkP47WsCIEh/Xyr6ljgRpIaw0C
         o1V9PrAFORswgFpcCe2K9FxxNU5R3eMJ9XMN/sZ8Xv0/dfxFBjuQa20vTmAwf8ZMzjsb
         5bvQ7H4JCUKD63UHZpOocpPxq1J3j8JUHVCZx8XYzT5HZQCaWsWpmDjLmc0pkCOAeq0X
         cBskDjzcRAnWVx9q+qfh73Zkn/8rJKCkma9K1y/yHDzH/efvBgHke1eKicvymZiC1wCU
         ZEalVpjXpZ3iCWMkRFnRRWNHsWloR3ZrliagA3bk6kc0IfSNF+SmO1Yr11RePJbA+x1g
         uTcg==
X-Forwarded-Encrypted: i=1; AJvYcCUKOozFZouOSwC7ququ/ZohD6bakEfv+ylmubJSZ2QGDlf9422XDYX4ZIgAEA5EpFTPRMYXLJuGn+U9@vger.kernel.org, AJvYcCV3+9X2v9mJiVgLYQLmyQanwXDr5d27w3tC0N+em6jzkbZsvRuSbyiUSf0Fi5d/W3uXiIFnWJtUfJcX/w==@vger.kernel.org, AJvYcCVoscMj04IPyhY2YcaU3y20jYRxyI5pVcJu9nk7HPOxoSGkEzMLdigHBSMUjWbmLvhALZd8SbECqv6Tsywt+IXFuJY=@vger.kernel.org, AJvYcCW8yWSAeVUVXD1F0hXVX3P8rcefa+gLAGbW1bruTAxLt4r37Fx4jA+97n0W4BD/rMXY0ZoqEH0JJScoL0fd@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYUWilOC0ilHFubk4uw9aenSydRaucUkhtrXbAtuuv7INusew
	g3J+ppn9u2mFpmA7tLSMhOw5K+Xjoa9V4bQPomZhEzjImP83sJ7r
X-Gm-Gg: ASbGncuC7qt0M7OARnvZbFbGMtGJj9X7VNigs2uVWOOHIIYy6Si9JQAk3DrxO007gEH
	mXG0WgPH8iSdJVgvgAt5s95wUsMvlXSKMeb4/Dfza5VbpaMDVvvkC7pT0qYFeMrfghLx8+4ifnH
	a7gGUNtgtQ5TegqHBHtg4vVShnFL8kRT6KeJ7zC4EA53wZcDYUJ8hEZNsEPrHpWTMIDJbF36yYS
	Jw7vtIrHKqWlwfUReyqfCZ2mU0ob7EqosLNjf1V10W7v8JAq7JMK21dN+hKM0/OuRHgMvydpqRo
	pjrgu6qRysYQCXenvr0sNozEK1HFxa6DqEJ000P32T3yyVErI+sF4idI4mO2cslAuQc=
X-Google-Smtp-Source: AGHT+IFmakpoCCXWSEw/L27VxX7gbfbjGhmA9fL1AnfWp8TEfa5fuTujZtmv6nXNEKdXKcoQ+q7oBA==
X-Received: by 2002:a5d:59ab:0:b0:38f:32ac:7e69 with SMTP id ffacd0b85a97d-38f3406786dmr3053506f8f.41.1739619185887;
        Sat, 15 Feb 2025 03:33:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:05 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
Date: Sat, 15 Feb 2025 13:32:46 +0200
Message-ID: <20250215113248.159386-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated compatible for exynos2200.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 68ed714eb..64db551d8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos2200-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
-- 
2.43.0


