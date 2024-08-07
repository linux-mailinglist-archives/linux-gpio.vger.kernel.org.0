Return-Path: <linux-gpio+bounces-8608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B194A2E7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2DD71F22F05
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC1B1CCB51;
	Wed,  7 Aug 2024 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEAO1XQV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8905A1D1F6A;
	Wed,  7 Aug 2024 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019345; cv=none; b=EFSkMU4gYuMpcpcREA7zZ8wHl2wn3SxldnM2Ohp5MYhaG+fKyHJewrLcRy42995hnnuTrhshFNbNTvT/+E7e8U6OJXVH/6dF3oRS1ycdjAgS61rk4aAKgdnFRrbNbYpv0196MM81njf9FpYRwCFo1yW4fQ55gNans+2j/CYUJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019345; c=relaxed/simple;
	bh=rRm5tdD/7RT5Aiy99bKbEcWXy4NPUIfqvbAKjZeBkMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFWh+vSBKiHFTYp65O5EPV68maQVrIox3QJZf4HlGgL2xSTtOjwg37V6XiWzsgITu0vIlqVLLp1FWb3tLvyxjvjWSb6Z1Hc7x2baGuzUcNqiByxwIq5DPcP6PAqgXPhUjNABwmSjVSv7bzxDHTc6hxcSoTZNSEJPxbyzR5CUmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEAO1XQV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so10097015e9.2;
        Wed, 07 Aug 2024 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019342; x=1723624142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvGIqP8seAMojHvOZHf0JtzhDewCaVgns8fBpUAVnsM=;
        b=QEAO1XQVIF3x3/u0bSr6giOjyPzgx/8W6bCmeLrEUlbtVAwlvf5IZ3dgHh3dqLF8Wo
         rUWmghhG/xQAkSAcGtygqEGmvW096HStT+mCDMC5RigMEIvycMdRynttBHM6k6rjJylm
         lZAmrO/tK/W+l1DH0xTZdhntsUgzspmC8Lai+t1+QDm0IINFG2eCVYdhboK7j0GkjdoX
         rYe3DmKFqqi+PmTZUEwgU2r4O2DkdKrjWP5SW51J5Msc3Fsoa8aAy5dTLurCCcMNeLLx
         crHbjHKLwi81QWVOJtyGXRWNJCmBhbkgA7jK6LDyRtex0H8ccdq9UycAPfn/wvZ/GuDF
         rSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019342; x=1723624142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvGIqP8seAMojHvOZHf0JtzhDewCaVgns8fBpUAVnsM=;
        b=dFtB6n83HHurzq1MtC+eS05Q0w0FAfnwYlF5Z2wOoragGIDiMYYWwL4APW4MuqOL9U
         G7jiIYlcBLFU0QkUeE1tNTl9VP6ZOgBukRU1knY7bpn/8uYXwrvhBBup21KbQQhZuT8G
         cGHMBG9dENqxLhj7Ha6fK/WL50xJ2OYRlzPLRrVOrncZTOa5bkMmnuMhAC9BM6N6pdYi
         f9nfqUciM0qUwxzPdJ7tfAR0mOaP3v69qfMsusmuYUbkx6bfkISZrr4+1J42zwt7Sfsn
         vpwIVJwO0jAIFGCYDGzcTvRDGmia5AmWfuuWuX9RXU7ytpKK9JW75Cl3w6zSxSwPdIz1
         CKFA==
X-Forwarded-Encrypted: i=1; AJvYcCUdlDXurqZ+nBIZI0jQHgwbcmATVCIDt+Nxub81b+bofUZtS9V+FurusFIf2cq3ZifV2tFc/3awZpQJB+MF2WW5lXO/uCJdsQ9cL8SG3dgg9H9JFpMWrCABPc2tTyrDkrDPzlzBO20Krlc3nYZvAfAr3gHhstaKWbMDnF+bFAUmKDPnw54=
X-Gm-Message-State: AOJu0YyqMqnVJC2OQf40VAd6k8YgzNGLh/DfUEuz2DZnAksAYTmmAvhO
	KXT7Fk85BRolKp4YWQW+xu6D0h6lM2uSajhdmKDrwOINm/nnKXAt
X-Google-Smtp-Source: AGHT+IEnDzQoIVtbORBW3Y1jm1auLocus13gR+zOJooA2n0Mcq1ysKgvVmn/qqhkMgLLESGW0n8HwQ==
X-Received: by 2002:a05:600c:3547:b0:426:63b8:2cce with SMTP id 5b1f17b1804b1-428e6af2fadmr126574605e9.7.1723019341673;
        Wed, 07 Aug 2024 01:29:01 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:29:00 -0700 (PDT)
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
Subject: [PATCH v1 09/10] dt-bindings: arm: samsung: Document dreamlte board binding
Date: Wed,  7 Aug 2024 11:28:41 +0300
Message-Id: <20240807082843.352937-10-ivo.ivanov.ivanov1@gmail.com>
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

Add binding for the Samsung Galaxy S8 (SM-G950F) board, which is
based on the Samsung Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 01dcbd8aa..49884a7ab 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -224,6 +224,12 @@ properties:
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
+      - description: Exynos8895 based boards
+        items:
+          - enum:
+              - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+          - const: samsung,exynos8895
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.34.1


