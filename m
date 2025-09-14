Return-Path: <linux-gpio+bounces-26104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0361B56801
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A6116BD1E
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 11:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574272641FB;
	Sun, 14 Sep 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMX26hlL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD32586CE
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850309; cv=none; b=bBASXVByHPI3rtj1BXe03h4cdZj8DMfsWd33HJqNn82WB93pQPPnmzKCwvjqEzMFQXoiaw/JguOadbJyH4ph7LbXGNw+rJrLmUPPuNVt7zHovtQGLSXZElo5F0BV9XU1rm3JpFXueZN0TCCpZnTHaEPpxKHv/v1UszzfWbHM1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850309; c=relaxed/simple;
	bh=ogSWVbPDpjLlo4b+vc5rGJJ9Kt1VHCymn7/dpTScrdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjllc2JopdhSzE/yvHgwMBFofWrHEAanJLIB4MxG3H7EfLt9uU7N+nPSGPzy2GZ8empFJwEQcPSifBtxetuquQxR3fM4pFPh4sRJmTIqeCLe4je8JT9+zXRTRL4emga/A94NyNxPso3NdcNq1BbtqJ+g5Imu7Z7OnUaaoeUG+N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMX26hlL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e9042021faso541402f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850304; x=1758455104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=;
        b=eMX26hlLeMJQUl+9JAc8GKmh9N274eqJ0STTZv/Rcn4W0aoyZxkXwkUYVJ/fnDiPF0
         GHtBxSbog6J7RYYqfUe0i/mHu1fxAAC0LOEmkT2mb+Xt+4yWTRhtX/n1WeON4fDLMCgO
         4NbEaEmy7y3QGXsPVf8lAaHaGDInfVOqUXSPObMJKZSha4R00p2pt0f24ZEAngjurKjd
         6V/R0ZpZ6kqe8KBLb/MIEhytbn2kck02y3qjZfUk94pRCBHloCT2VyF8Q/NyaoRzyIjQ
         CoIhb109g4Zm07nvv6JRJoOt/cSFzXq20kIkkeOLYJYKDlL8536sdbeugzEjD6ozSV5L
         RvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850304; x=1758455104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=;
        b=L9jiqpnzQOtwOWyTke9RXOXH2zKmICjoS5DlRcQ59+iWi8bSNRSrW1dC3yPQWHjuVC
         QwRaV0diVFXuGbkcxO7J7zNxqb7AvSbc0nvFWQjoJ00jj4/mVrAaPvN3BLkui3P1lUFm
         9p+NTkN43rHEdkZ1RI6HS2NGXejoJpND/CZSV6ELNSDQ3JInHdEmpcJyDzUz4IrnITzB
         qBPkrLjCETLkxZQ7ePvK/4g1FYXEH4NLa+p1FHFQXeFIGyTbVYK723MJKgoyBDwJf3BN
         AZ8XFBb1qhl/de0hW9JwjcH03Vss8iylqanDro/m5cgRbEb+zKLDKQa4CereOu6OKv9c
         n7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWsySzlRTUs8HeOOkTIZ36suumpJxUmGytqt1pjGgAgsToVy/0sDeAtzrcs1S4DtnKXXSw16Uqx1FCT@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbX0dWieJNDjJ13s8w3+TYuc+dCAqZdqYIG6ngF41JsiFJpEW
	Yz2MSma50qttit7RIf1/DItSyJjZD6Pa9nLNBplRF+17FWFJ4w4Y+hR5
X-Gm-Gg: ASbGncsvTVLUw6AMhZvfEwpzmL9MGCB0y84NMr25YuXxfEIKdug7hS7cA97S5cR36Yx
	3Sai9hVombCt+6bTPoPHGhBWobyHFtsHyNrFhX+vUZPlgg5eLfPQc5XTMLOTNcsoTg08o0WVFj0
	tZtA2GTSOEeXeCQRfEcnm9WhW3gS18csX51CgU45OoLB+3pI8hgR2FTuiZeLIjMbVdeJB0Hb85T
	eDLCzyuWSoRmRhA/LOH6au1IRqA3rG9a27GEKUBhLk7Kt/XsL3flnUZEHYd0TCMPXdgotHRWI0T
	C3Fdo68NpsvfmY4CMaU0xtOauGVSuz5yg0gY6HhXnQcK+L5fynKlnmlOiacTS44+GBolNYYJEiz
	2784tnuxwLepe7z1pk/KBKDnnQb3vnO/DumTh8MMeruMWBt8t6eUihRo1Euxi/461T6XslLKydr
	rCGrJZr24i
X-Google-Smtp-Source: AGHT+IESZdZImuHvupg31XiagY9dmwJfZhjEPnB8mK2o9JeW0P+8+vI82HCX5Qrgtqz633EQ0Ul55Q==
X-Received: by 2002:a05:6000:2284:b0:3e7:47c7:9d5 with SMTP id ffacd0b85a97d-3e76579652amr9007686f8f.21.1757850304075;
        Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
Date: Sun, 14 Sep 2025 14:44:56 +0300
Message-ID: <20250914114457.2610013-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated compatible for exynos8890.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 0da6d69f5..dcd96104c 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -43,6 +43,7 @@ properties:
               - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos8890-wakeup-eint
               - samsung,exynos8895-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
       - items:
-- 
2.43.0


