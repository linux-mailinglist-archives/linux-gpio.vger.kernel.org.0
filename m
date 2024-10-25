Return-Path: <linux-gpio+bounces-12070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765A9B0128
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9712BB21E1E
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD762036EB;
	Fri, 25 Oct 2024 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtGYadY1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE619201018;
	Fri, 25 Oct 2024 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855515; cv=none; b=VFeaDp4zXpJGnkv8dSMQ0a+9UTNejxXXScUxKF7cXtjoknXPeGJG15nhmRCl7ne1f50Zq3V9PPHbCbr4ZLNpksCdGLtSAxx648UQpnDRgBHa1niXdyKXRou4PMyqgObWUdVRjdQNhuTzsOBOVnv1kaG/ii3Kt0idVv0UOOJWRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855515; c=relaxed/simple;
	bh=e0pUeZhnaxoOJxI70AFSXGBv66qAJ/ODZ80pJS01hrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Be11Lxs7Bi0Vwa4NGJahpvPxtS3ge2aUN12+ewG1JnYjB/Oz4XCd8EevT8PaFbJ9QQgnzE5HpuXLjskyv1Bb9cIePLhpD6ykQEzLYcT3LFpKoUvfdiJL1IMgfhbNGkSRu2cy5+12W/dXbVO4fs3R57BC7o9KlaL8DXjK5sSt8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtGYadY1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1764381e87.2;
        Fri, 25 Oct 2024 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855512; x=1730460312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HNnYCMWwNqSncdK5XICNLGGS6qqpAsQS7/caik9gL8=;
        b=NtGYadY1ZufdNWJ97jcPfU9q5AT3atFuB+p3rX1INPT4Z5dALSH2yAJ926MxLuEJB4
         eF2Ekgze5u5PcUBjEFb/duiFAKYTGI78lUx7X4Xgb3OESXe3i0Du5UZmMR32t0wM/Kil
         i+vgexUfH+GkXB7WGtMe/zmDaz1oNaZ6Ayukz4elJ/urN/Xf4q7K/cIEolsatHExKAlE
         btCZNtdOsEFz524IGBpNv7W2HSEk8ymT4MoBo8EwuQwkjSngu9bAwROTYCr3AWn2FhKp
         VIikW7z8nATW/fp7LZOMtBuS3FnRD+ArDX3Jzfa9Ggix1HbxTJRhxsThhSDP1C1h5ANU
         wtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855512; x=1730460312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HNnYCMWwNqSncdK5XICNLGGS6qqpAsQS7/caik9gL8=;
        b=WqWjjTWQP1GqVOL2IEsWpc/h95E+/991SE1w29RkIAtGPT66jQnYwo3SliXGM8VqtM
         IwnAYhAbQQpA6/B3IS1U59/NugMATxpVNpORBgHGwcEtcyxsGoYG4vT3trdShUfO76bp
         ATJixbYgurIjQy8CSgFeX5TS5DssO/qiGF/RqyHge6TKJv+RASppQ58+n1zU+1F4xPdQ
         fWrY7fVp+vxmy8xQeFXVwAoDTFWanPDWMgsK43tV60cepZedD0Ak49OHHzloSjjy5Got
         bk4hkvU+NPzrQKQBn53KSCabg2S2mMctK1V/Lja5S6expzmI1EzW36Z0NpUmgJjOGEX8
         djEw==
X-Forwarded-Encrypted: i=1; AJvYcCUBWOIUjcZSaAVzwyz8vGLwtiCq/iPlwpg55vwF43GktFDtL1U9/jNLdHGpj0ZlyBeJKCIccIjtHYIfhnhe8nAUDLY=@vger.kernel.org, AJvYcCWBnIbUK5sob7zTztNb32CmNwJNFUoeUqOjh+1Ujnc16HiypEiU91nfayaR6CVFDmYAs+tRn8phlvzZ@vger.kernel.org, AJvYcCXsvDRp0NS9wuJbzi+PjCCWGQqRHnHpYHiQOXbu72EbYljDjjzQFpLEcqmHQsM+SrGhtVfanoQ1ew5Xseil@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ0/FG0WkXxveuEzOm1PiXzqwJYztb5Z0/A+1vBw/8fzDk7Q30
	BcXe46c90lYwLKa0sFhYBwF5mYReOFXRyPXl0uv6u5I+6Crdzl7IZYYbUQ==
X-Google-Smtp-Source: AGHT+IGWhx14LNtltdJxbSM1OwgnZgVxVGD3zuhki3CqEUZoL2D9f/SDtBAiMVIL9e/v9p5gAgVqgw==
X-Received: by 2002:a05:6512:3d0e:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53b1a391e86mr5184359e87.45.1729855511426;
        Fri, 25 Oct 2024 04:25:11 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:11 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:49 +0300
Subject: [PATCH v2 02/12] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-2-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1083;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=e0pUeZhnaxoOJxI70AFSXGBv66qAJ/ODZ80pJS01hrw=;
 b=sQmGok87n+es/tJA9th7JWqP4Nbe8occLtRJWndKkoWz1YPWdc5GUzrS6sxN43GcJj7SXodIq
 RLrVmYnnu5HA8KY70kpPWkTvJauKR56ZvAGF4ak34wFnAgZSirOtDrN
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Exynos9810 chipid to schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

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


