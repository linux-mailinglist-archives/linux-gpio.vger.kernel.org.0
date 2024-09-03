Return-Path: <linux-gpio+bounces-9647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15C969E33
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B60D11F22F39
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE2A1C244A;
	Tue,  3 Sep 2024 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bb3HrXTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105CB1A727B;
	Tue,  3 Sep 2024 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367489; cv=none; b=MTA7KV/fHZQJXvziw6Bt9yOya75rMWCruV1kLux605+JMtv+xHHIJsBazO3wImQ/13ZRuqKepkDv+YsVwu5EnAEHkt9gA6OIggnWIciRvEDZO9Xh8Dmm3iiPtNCaHFm1RP17mK1MmuToLvDDopDQeBqUcLSlPkNuZiDV3WqNeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367489; c=relaxed/simple;
	bh=0Xbr1FdDyKpKj+3Fr+/QuaoEN4dfbHmAhWgDRUgmrrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wp+wzqL3qzsradftKLQ4h7ujOJqJggI7nkknzHAO+qz5T4CeiWVEdU+96Ptch6xPLqGrj7cZnNncMxIYIUmg2BRBeUTwJ27BRVoqETHtgLlvPUIkeiPIQcXgiMc/aTpAbIn35HIBkm2gnku4Et1lW+yBj+UHYQNIuivDMELuCTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bb3HrXTj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a843bef98so534588466b.2;
        Tue, 03 Sep 2024 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367486; x=1725972286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIorSPo7KTJeiqhdkQyEU3TTtvPM5JLNIBDUUuxznsI=;
        b=bb3HrXTjTUG9+6v6HEAsBacvj2n/FwqbHNMHHa01RiRN4B8Z37fb8rpqfQ/sDq8JfX
         b1d7tam+cHCF/YT5DhpdTnZi5GNoBh/VHz82cHS+DBuXAOlfD40xm1lGMnrlQOWaIt+r
         J449dNP31KbgPpz8QCokLQ+ji2L66qhSnrn4aEK/3P3YXx16EBW60rlyBLRhz646NHIJ
         0RJy+JO8e0TW6f+n8MYjjbFQc86c/y0WFT9mEWGkokoGwiSrckK36EZHD7azYbA1cCvE
         WxbD211w5g7LCHweUmD+ewSq0odzDMKKWr+DQVFNvYfUsvUT1xsuGKo62D3HZhztvkQF
         z/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367486; x=1725972286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIorSPo7KTJeiqhdkQyEU3TTtvPM5JLNIBDUUuxznsI=;
        b=D+Xhb5xbCHyTw1P6IzyzQrglxGvVfyKCLYUk0/HPbyEZ3C332srQiBmFv1ZYqsGB2M
         92Tuae2Q+oJnmaNzvx+bFVhWSWD3/69YWGDhWp+BDnO3YQPC/hdV4LYsLEZ0BK6WFs2K
         X+NhCIgeFMxHeS+98UaLrUuVCPOdqCsM/vUHlX6Umkwnf3dBuBDhdI7le1HLT/3WAJ9o
         QqM3MZVk/CzgAgb4q9WTFC81E0mh7QHKcT/ZIdEVXRx4PoWexy2LIPAg5T7wfzetnsbn
         5PM9INj2De1r6ZTjHdcLgUQm3tJCbBp4bKztimtlli3px+pgDmMU54c3uHAJUBR55Hts
         D+BA==
X-Forwarded-Encrypted: i=1; AJvYcCUVMVT/2NPr+rWVEJGQNptNngTel+s+a+EKFl2LrQvZqAbUuGuqdyts8LitpYCujjCbzWmFwNkDuKceFQ==@vger.kernel.org, AJvYcCWPMpZDxP1LTEMCoHdlTNR4PCCyNaPwbqbmUaFWHOATkkZ3s7D1Tz5rn7kFiV9s19ztrMSLdw7H8Do5XAUo@vger.kernel.org, AJvYcCWXPXmSIMIYu3/teCPHMhzFajcriKAt6YokEVeri3fw52eI3Pq+Mgkngd6hnwEiFIfc27H0qn2bL90G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+TZNAQ3t5pS3mXM8Zd2S4d1b+TrFhCC0rc0UWa+ZHqOckHHe
	j7InaGiLfH0siVv2oAEDARfTc8ooh1pwMzvXaesA28D+F3FK1ngs
X-Google-Smtp-Source: AGHT+IEdwvcT7E3u9QDz+G0ZpbSGGBBwrEshpahNmLeBa/DQwG5ejm0Mhqp9nTECbSduhhMoBm6/bQ==
X-Received: by 2002:a17:907:36c5:b0:a86:6968:3b93 with SMTP id a640c23a62f3a-a89d879c32dmr642023466b.33.1725367486099;
        Tue, 03 Sep 2024 05:44:46 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:45 -0700 (PDT)
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
Subject: [PATCH v3 09/10] dt-bindings: arm: samsung: Document dreamlte board binding
Date: Tue,  3 Sep 2024 15:44:28 +0300
Message-Id: <20240903124429.107076-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S8 (SM-G950F) board, which is
based on the Samsung Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


