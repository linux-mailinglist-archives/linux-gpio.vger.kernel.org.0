Return-Path: <linux-gpio+bounces-11882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E29AD7B4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 308E11F24926
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1704200128;
	Wed, 23 Oct 2024 22:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb0eBXMu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936D2200111;
	Wed, 23 Oct 2024 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723039; cv=none; b=FrPaHzCRPTrv1oLZhT/8RqMUhFC9kR8qszA/SCyd25DXND4Hl08CtaCoStpEzQnsmcXgJDkjSoE7ax2c/hFAy1N2tMRZlKosr5OAgq/YVQ4JvHxUZ+bDUuufC33I2ekiS3kEJV5dY0nbOZKk+qjFLQuNMexrcns/Fy6yAKMYeZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723039; c=relaxed/simple;
	bh=eegFh3p7v2cDf+inlqxOGvk4hoeYKqgh34JbZw/w8nI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsAbswyoELjXgkUyWoQ9V4r4FIgpxL1jKBDnxzGa/1bvFWjuaGap4EaC5vucMdUnQCrfCahHwU7Mi/JTsxsAKSOvv8X2aBWbdhsSwak/9D5UbrKGaHZiDOGAzVUxnbNp4Fby6yzIptUp87ayCmw6Sf3lmW4zgNiu7kTGdSxXm/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb0eBXMu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so669307a12.0;
        Wed, 23 Oct 2024 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723036; x=1730327836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbIIsZZ9TdX0oWXf8pQROsVaLwB4+pSHbj6T28fJF/8=;
        b=Nb0eBXMu9THMZVJY04TbIJpg0ccQL3UIBJ2oUU4Bv0OIiA5En+q0F1xkBAmS24KzsO
         28P4bGJUOLEtd4jsjy99tPQ5obbQ+sORF1OV7R1Ywv+jjBF3hiQOxZRE2tpDclk6F9YR
         C6Hi+q5KNuPylo/ZaWFtfbt6oiftp/kMLMdsLikjR5oNi3sc/AsbLpl2CbBFwyacsQSW
         MWbPUWLXqK9uNP8lLQWyzqPVIF1YGg2SKe97cYPrviRbR+XG+fr+S1Z1uNzWB/paviNP
         FKOUY3TCnuO6mYZOAiElmD95PFfIxAg/n9mKyOT4QJL3dTAeEGRwks6mHEY2nYa2x7LK
         DkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723036; x=1730327836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbIIsZZ9TdX0oWXf8pQROsVaLwB4+pSHbj6T28fJF/8=;
        b=Y2afBLwNSKII7dwwHKjrtnP4WXhj7LXfkkhFF9kRLpQx4esn/ydBVvKfoY8bgr/nxe
         NRIypb83r21IFn4U9xwNvXPheBNVw+HBCslAU4URV60J4OKbLvZRC5Y6f+6DC7Eb9u1j
         yE9n+zjcEQXWObYbWashALXr+VFjux++5WUfU874CScJGOA0e/Pk+fqB80yKBBOWeMwm
         HqgHP8WLScSeRnhdcYa3WoSNazRUE8yo6PZuPWFGnFyIQCP1OIOK32GA49gJ/vmNdz/l
         8G6+CQby6CaUs+VdTN9KYbwTAwADih//RaYS7hgs9mNV9OzYQCrwl5q66S3oKcdsMay/
         +uyw==
X-Forwarded-Encrypted: i=1; AJvYcCWOtIP3Hu8nej7qMk8TnK50nMyXYS3LCGPEHM4y5YyitOBXgu3adEuyAJ31fu2O2SGCVGG0KwPEFlvQXvWUzCJdeUQ=@vger.kernel.org, AJvYcCWVWTCsPHFvRv1DycIplsWmqTwGym9erNGCVKf1gyAXJenSrkdVq4bKlNNYmX88jM+VbBIVPfXXNVuxWaW8@vger.kernel.org, AJvYcCXgaSjJBZRjGe0CfRfpaHc4wrTL4pE6atPXW+xnbnhiL315bd8VL0nEGRbU4RnW1EzJPHy1LApnLvqc@vger.kernel.org
X-Gm-Message-State: AOJu0YxhuYbAjBaFDtZmeNFaNjUCurBl+ukPQS4v7CWcdUqCVc+p65FD
	SOmqc2X3OHfgqScukvkkuR7OlOyhszzlPBwYuT0a4hKOovo0r1ls
X-Google-Smtp-Source: AGHT+IE4iE8RupOHGaicMpOPwSO0o90dUKkcJw+YgGb1yq5Z1RRoBU8m3VeF2FnJvx5BDI6kySbmzw==
X-Received: by 2002:a05:6402:378e:b0:5cb:83c0:dd69 with SMTP id 4fb4d7f45d1cf-5cba204f9a1mr25409a12.12.1729723035695;
        Wed, 23 Oct 2024 15:37:15 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:15 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:33 +0300
Subject: [PATCH 02/12] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-2-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1025;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=eegFh3p7v2cDf+inlqxOGvk4hoeYKqgh34JbZw/w8nI=;
 b=xZPPKOrxbtOyuJz/f7kwAfQvm5ahcxHo46m8pMr1CGweVvc1+tFT56z8xFY4ARW40FQxh/pGm
 7bzG9rdzGZbBitxltfJL1lqhlydx7uiHJhw7tiN1n/ooUpjiZO/478B
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Exynos9810 chipid to schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 47a8d98346ebb83a7ea4d11e2fc7fc87df6bc5ad..385aac7161a0db9334a92d78a57a125f23ca1920 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid

-- 
2.46.2


