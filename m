Return-Path: <linux-gpio+bounces-12152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58489B1ACD
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F0A1B21A47
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5891D8E12;
	Sat, 26 Oct 2024 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLPgfeQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD41D7E4B;
	Sat, 26 Oct 2024 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974779; cv=none; b=YuAyKV+GZu06zt4aEKNXwbKvmkrmTZ1++6JOC6vHKlcHbF6sx//6gzgDoOHfbGTy/DlwwzOz7vp7iIta9BSjfHSBt6siOMhCWrcQTYpRcImR0kOC3ATkTz54OB1jtV4346tcv7f/VycTcsrOOM1LtrEJoVupwnXOW45bbzlrsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974779; c=relaxed/simple;
	bh=L3bYZfWAgZW5JNaWDhl/QF4KE7601D4KEfmVId1ELs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcJv5+yM3+L7MbpVw+V3nyseTTVWOlB+5S+TvPs9RihME+zdgLMuFxV4P+0u1XA+O0wUqBa75GJIhJeWFwABMFlD4q2jgkolyAhbntZZY5cYt7RFs+Dt+07ZnBzn7HHM3QuAekGL2TczehF1NuJWMUuBw4GIZCjHtAZXQBIQNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLPgfeQb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so2835580e87.3;
        Sat, 26 Oct 2024 13:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974774; x=1730579574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=PLPgfeQbKg0o7AqJqZZJwqcdPWW50WamKXc9YM3LiLA026eiTx0sH00/d5ByqqKpjz
         rJz2Pfuj9ppgoOg8IvCwrSmfy95aiQfDfW0/FTjXPbpbgEmO0uYa46HKLVATbdYLP2uM
         0HtXTCqQelww+nwWQ/wBl3KFN2cvNQ4kSGSc2qtPxn5J52vChlRfFtjJfS9j6RbiiN/W
         NPRGOk3o8iMzidcORZraI3qY6XDcYGamwLSJzZwopNEhPDCiGCqJABZ70uCLv45jLyj3
         qi7nbWB3mg0bAX8AuxoZtGnhy/PnXBMNbyuplnBojZ3jvXyjJaVWN4NvnYaYugh1fbQi
         I0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974774; x=1730579574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=inTQrCzx0N28pGFoLpwQfKpBRWaUqPVKUYzNEAOqeSbgSYn4jbvRtpiMLZn7/EebVH
         ui5r2hR2dIGAVny8vfO4yjvLIPcGRgHCHS73A4kEKwuVHZhKBxrh5nqIOG7CWhmBv4kw
         eIohClr1o+6+3Vp865wILFeOU/l4HDehmGDDyno9af3L1egsyt98x6AV4J0PDiPRRb7v
         aedkxJ67EDU7znVT1JIv9/c5echYnDzilj7iD8eJ1WgabWDQsgaEdp5MRg8vcYvs1uvr
         oW/z/sKymXQ8Nz0yYwo9b0Q3iDR44hewG8JN430wW/m9eIonS5qdXe0D4G5XDU/vrXvt
         vSVA==
X-Forwarded-Encrypted: i=1; AJvYcCU9hmdmGV02BrAQzl87hwFdF/1mGOtRiceCAGclNpTegR6o3O/Xc41iWTWV1ULJkkNYhssrSuA4i6Q+@vger.kernel.org, AJvYcCVkMIDbS2cntw/uboOH9Qh9hSpK4JilLz4DOUrQllDMG0DlTTcAjiUDdWt6NPyIkWxKbCUZZ5sBXnW0J4ka@vger.kernel.org, AJvYcCWphm1/DyKy2Zifq/5sRim/Uf8Q4HX6X4svG3M7YLdgWaf+WR1t6gRKZMmAbTLsUkts/TIaSYJiq2IOorj7zP8vKUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiR7sanh0t/dwtRXd//Z3YGa6Oj2CxcttD039BjjJrL8g7LK0T
	kwvVbQqrLQh6ctbpWf4yZ+4y+Z3qPMCXPHVFvLahcgWwhCg+yy5b
X-Google-Smtp-Source: AGHT+IFiuAmfPjlgB/C/2gEPUhMkLfqDRejoEvfIm9rhcA2aU8Ra0zcTZ3+8dY70y76GcxBaBc8BZw==
X-Received: by 2002:a05:6512:12d3:b0:539:fb49:c47a with SMTP id 2adb3069b0e04-53b348c38b0mr1707159e87.4.1729974773683;
        Sat, 26 Oct 2024 13:32:53 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:53 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:33 +0300
Subject: [PATCH v3 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-2-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1257;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=L3bYZfWAgZW5JNaWDhl/QF4KE7601D4KEfmVId1ELs0=;
 b=dRSYGEsoUXwVRZD/3jxhOaqXTUZub/HGYwcxzy8l+bUINvG4QBuof/tzu0RzyIco7LwH5IdrZ
 LKDQOtiIY0aBqWdLPB18QU3D3w6OI344UqMsVux+L0nw9u+iYfoDauJ
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Exynos9810 chipid to schema.
Exynos9810 is a flagship mobile SoC released in 2018 and used in
various Samsung devices, including Samsung Galaxy S9 (SM-G960F),
S9 Plus (SM-G965F), and Note 9 (SM-N960F).

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


