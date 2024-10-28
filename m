Return-Path: <linux-gpio+bounces-12209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90BA9B2B55
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBDDE1C218C6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCBB1D1E96;
	Mon, 28 Oct 2024 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VukNbakX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F41B6D09;
	Mon, 28 Oct 2024 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107378; cv=none; b=mUrCRkkv0AdMn7hci4mxNxzmzniHVGekA66uADZ/kam0KL8wLvKNQyy8W/u3pwAuBd+nLTFN4X+MsJjXA08YDt/bkc/KJPlGsIPUylrkAn/MUwqTK4WMXRod3JYSdj1WHMa2CFz11I0P19MP5ToH4koiOOmeWFoOXkyO9hvAC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107378; c=relaxed/simple;
	bh=L3bYZfWAgZW5JNaWDhl/QF4KE7601D4KEfmVId1ELs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5sICwu9vAEonyb6f0lYCWFhJssdL2Y5zTPnUf0S9oCYt2FssVG014tRsDlKbGg2Qt5mfApnw12haUkpwomVR6vuzKfAogjtqbbEcinuUxfMp7ZcZ0WZ0R+QTBL34GuxaPjIxIUACA0OQrPR7afn+7nIHyL3cypMeNZ97fTgwDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VukNbakX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e13375d3so4516167e87.3;
        Mon, 28 Oct 2024 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107375; x=1730712175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=VukNbakXIgmSheJYC/u7SMMBdfDV+1xoW9dcQrCgFpVHz14ZtBnDY9E7t/mLCYTqyr
         mWKMTHlImp/h14FaTJhq10Khp5NQ4R5vzo2gV8OuEJgrJN/vpkV9bsqoHcc7lCEK7/Xn
         za7L1ddCX2WN5QiFFmjRSKse2Qb4GoFsDYH+CGthsmbdKfRphqwN40Bu/ndpA7Z5UWH3
         sHjPfGc78hcNpcKeVTAKtPPDRwvn1Ru5mrJFFogMaGau7k/CG7ku8ek7zCFCpPEwddiO
         R4rE6oe5Phx0t2mV7uJuFNFRYYcJBWdwqMp3AGVKv6toisoqN+wYG4UPZEyllMKVGuKf
         27qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107375; x=1730712175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=bu7t3v6mjnoL2Bj5QmWmu9MUdgGFkCHfJHrH7YjJ4sqBeHXW7IpNZ3a6616lRfDIxX
         Amx598QY+XAG/s0i6y1L6yoPgP9BWXbHmDAh1uyeCjc6J6pTmO7HQ7vaLEAZlGpf1OAV
         b8+y+Ov6qSQrjZbHuqQKn01S9UBCuOe++on/HJyI/aTU0ChNSrrTcDO1biLMuu1miCkn
         S94bJO8QccOMBqD/BjGJAgnhemIrD5zVzPOeeEK04dzQ8AvHwQZXWubZgd3t8RYoAkYj
         fSr2l2tNkP/fk9Znppi949htWG03yzU1fXLBkiIg0vlc7LliRY7QFLKMOThNoD+VknFJ
         ur0g==
X-Forwarded-Encrypted: i=1; AJvYcCVfHOz1nlcJ0vuH9q+4sQmb4E8FJs/5M+M7aFITMHHNcOnF8FCChK/KH9jX0qwzVCE+lRuMU2FqYko9wHq7@vger.kernel.org, AJvYcCVvY/SHDnO8CdzBUWqFtRPWm254IkJlala66XV1py1dw7o/fslz4VpZSaMJ5q+yZQ/Ss55QqAqxXPIF@vger.kernel.org, AJvYcCVypELGMJdbNjaHCF5TsEi8OaoCYfCq1XaT9rV4J4BKDxNKUIzADgYNAewoMonzV3QTmeMc9HxCDOHtrDcKzQLonhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUJMwXVcKjUJ0P/ieNoxTb50YHAAJsWiQbD/KRQip1+2D2n5J
	wRld8U09AbPQbLOF1oPv+u4lkEs2aoq45v9K7Ib7v8KfFbBCiBTF
X-Google-Smtp-Source: AGHT+IFRcgf3ECiwU8IQI519Q27K78Uui6OJ25rmRPH87iV2KN7tLz/GFEpPWHJBQHxdCfMSYb6I4w==
X-Received: by 2002:a05:6512:3c8f:b0:539:8fcd:524 with SMTP id 2adb3069b0e04-53b348e576amr2787084e87.30.1730107374349;
        Mon, 28 Oct 2024 02:22:54 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:54 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:30 +0200
Subject: [PATCH v4 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-2-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1257;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=L3bYZfWAgZW5JNaWDhl/QF4KE7601D4KEfmVId1ELs0=;
 b=fdmZQ/KmML9TiWtD/gFokOgPOpMn4xqVFodJLt1oAD+ah1Y6wFDp03p5Zj/xmIK58ZWzqjqU4
 iERMTvlu9bGDJ4JT02BbXMbWuCLTcYaowmbeanPM0TnmD7VmQmlOqZL
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


