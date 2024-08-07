Return-Path: <linux-gpio+bounces-8618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B194A3AE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6F62826E1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4521D0DDC;
	Wed,  7 Aug 2024 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiZOovEv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EF1D1F5D;
	Wed,  7 Aug 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021763; cv=none; b=h/Neykbs8eXj+35HH2EG+Sq//IW1qBbpXGs8hFEyFxSIguN2XKjJEzmUneF740q1YLH/bQC1M5+q37/rA2RMwnVxIfyGkLrUi7FZrsGYwlxGUPVvhHOMx7gA0MGT9PodvtxTLEpMXNM/OUA8hAcxLzCiEfWn9XXG7JWdut37Kr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021763; c=relaxed/simple;
	bh=5FtdJwBNy44CCAGPZp3r+pvpx0fO17ueQEvlT6PqzIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qgit5IzfJZ8Fyt0YAng4vWbpIhkpVCmaPqziwwW6y/wjoi6roYGWyXGe78fhDnhQNRyTDHKTfyEnH9uS12f4MWgQZzJs0XiwRiSBHy5FGDMulbbJmWW7Kl/vq2j5jn/toYVJJiL9yDNPqeRy0UcGbxOZW+7pXGQ2dvMlGCCPKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiZOovEv; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f136e23229so16348951fa.1;
        Wed, 07 Aug 2024 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021760; x=1723626560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w/3GixTR0u4eiWFnTsGuL6Zt1CcVf1mK0qeoNVvXt8=;
        b=fiZOovEv7vgEt/lb9KiiqkB+g4+rmIjqF1t2NKJD7hBCgbU03/5AAmF7tq4a8yggqd
         ane4oIyhOleFTkX7yY3VNNDWlW/MUCcaEWQfmOlBgCnkZmpMKFyUKyJnGaweDLh5vQxI
         vNOo6v213jx5N4C6EbJafrY6s26pbhXEu9EWBLCWnzFpLDzb8QdyK1RNnONoWUxq17LF
         Nuk8rFRz41aO+d5Gg8g2wAFF9x/aTQR31en6fboZGp/8C+Ydyyr7Zv/+Ypn8G5BYVgBb
         1DUBP5j2SLogwEvwLE1PJuZTA1ip0Bz068yl3MKLjYZ3SNHjfls3Pt5SVOW8B8/CF08J
         GxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021760; x=1723626560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1w/3GixTR0u4eiWFnTsGuL6Zt1CcVf1mK0qeoNVvXt8=;
        b=fYROnMY/4AVRUUJD2D04N0DxTL+ROLnyQxDrDj+0ke3xAJqUEtX06i1AhiafZ3dYCr
         SvXrmcuQ83SxY/6B6+vn8lMW3sCGFmZg0Bycj0UhsNbBWWF3ZjHLn0mmqkub3p8oOXX5
         v8JIgBvYTaQBLWFElKeQwpoqch4rFok37pDREU5R5/N71LxqjICyY7rMUbsULa92kibx
         LlvtbFcyF9QXfdI6PLUXMSDrkBTj4/jS9gz1b5nsVk3KrVkCusa3KLqfituBL2QYp1XB
         5/83MzeV1uNlV8iIB0PhvL4WHceHzE+L4Lq1XpnsnqeOJ+BlaLFCI+DCjlyJX4IaRS0e
         EiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtmn0lnK4goh05aAmbG+ewoFZIPRznFDYQWPdV6jyNJusRNeUqsj1j8GCuZC5ml0frzdcV3HZn43deNQBkohyCxMD6I0C/QBdDDBEwsIAd8v1oGrG/ddf1QG5mUs7X1ZAOGi+JYa4AeDnKAm7HlnfjXwEuvCPN23ruEoDlkcCkt0FvjGY=
X-Gm-Message-State: AOJu0Yz9Ocwkj6DcKzZuY0+AF/xPqyVmSx4aF29bd81vTVi+vkQ4XpTm
	zWCTEjKkiZRP/a5k+uLlD+10lAyRy5fnYSm9UUzETVvVVJFsOk1T/5+hZmz+
X-Google-Smtp-Source: AGHT+IHTFuqmCkX60HqEXOugSbgQh+FkoCaxOC10srFEOqPUlWUXBEBNGhtU9EJjKDxs9LuKUeVXNw==
X-Received: by 2002:a2e:9816:0:b0:2ef:1b64:531b with SMTP id 38308e7fff4ca-2f15ab38068mr118412331fa.42.1723021759798;
        Wed, 07 Aug 2024 02:09:19 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:19 -0700 (PDT)
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
Subject: [PATCH v2 06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
Date: Wed,  7 Aug 2024 12:08:54 +0300
Message-Id: <20240807090858.356366-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


