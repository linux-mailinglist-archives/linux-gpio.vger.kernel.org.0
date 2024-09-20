Return-Path: <linux-gpio+bounces-10326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF697D7CC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F99A2869F2
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8E6185B6C;
	Fri, 20 Sep 2024 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/ttkp5Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD799185942;
	Fri, 20 Sep 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847131; cv=none; b=hYylYWeRu80h7L5qLSDOyNXc7ZMd2Pl3BvsP+nMUsY5oVE27pE+C0eWpIX/y33Q+3qh1bXKLbOH6+clPGRnGhMG65TWqupmi1jkBLXW/7gbH0Yg7Na/dewXqnA24qeQUG4Zx7tWXLmR5qMcCuuIAZRIVJTRwQk3hOAHTzQxnUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847131; c=relaxed/simple;
	bh=0Xbr1FdDyKpKj+3Fr+/QuaoEN4dfbHmAhWgDRUgmrrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pS8Abhqaa3hYVyRv5jth+k4V0iWbZvX8OTek0mQd6oHYC4GcoFrpJlj8EySvxMA8WjfjY5nSrazYwiE+/8S8Cqw8ufqUrP4bMysopN7gZ9+jlB+IKZgPxSXQl5mbIHqm5iB9WUWn0NJKv5kybAY8Ki5v2jIamETW7t3sOicqgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/ttkp5Y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374b9761eecso1628967f8f.2;
        Fri, 20 Sep 2024 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847128; x=1727451928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIorSPo7KTJeiqhdkQyEU3TTtvPM5JLNIBDUUuxznsI=;
        b=d/ttkp5Y4fRk+oH8qozRTNTaLUa5bEEo4Us06IVS161ZRctO56KDfyLIBZJYmYCeWn
         VSn44mzN/dZoCaU5bealAwD9fmXz75kkyLZmrNwShFdj0CQNjDzw1uqTjZddTkoXAc2j
         WuNZAsNASDE5vKQ8ZNS5BokfuiXpTxD3XK3pDpFhQQiu2SHiFYrdLeafU9FgFNplEvOj
         tHos739ms7wvKZFk3S654y8nnGfqRc2cKMsGN1cGXv8CpyQJp9LqAxofgNsx2GxS9Tmr
         kjKeuQNk5K6I7x/Xj0MEwY+80H3R44lq9f2QCMHbxZZNYZcfAnki2ZMjssXVYz/jda6F
         ZAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847128; x=1727451928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIorSPo7KTJeiqhdkQyEU3TTtvPM5JLNIBDUUuxznsI=;
        b=VaLavHykvvxf5NKcE0aTNoV0BYs/Z+K5dct/NlnPNW2GvmnF0dclmKqry4TzJZCZsy
         MntesT3aKra+ZlEJEDkoPEGm4h+eFTRs5GBWtXYm++izL5RKj8FgkzmR2FvL4U+CttQO
         QmJHX7ldusKe1AXSqNGkC4Os1gKtAovUhPjD20VqnOVDbhOBv8kw/9aAhpJNisNevQqc
         EtTO/8T2Vhk0+1vDeBOgp8WYJB1o65nzBddFGzfyNE3l8Sxp4BuXALJwZD+caoNidIL0
         GdLFqcbOWypyUVLNsLb+/TpNGMArv+8m2cAUnJGnz7P81/N5D/hzM2ewQXbpTSTfkQR/
         B4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgfEKP/576RRzDicQsLjmdW0SSjzEwd+EEqxfNWN6NhtPJ3usZHVanZtkN3KUO6hnu2LZqaZ3JPGHtMWXc@vger.kernel.org, AJvYcCVgp7zUlJ6q0A+aA4MGzXXy7HS5sozAx9Ys9/8e3HGQ9zPQ34yPMqrDJOhblhATSq+tI6l4YUDbW2JS@vger.kernel.org, AJvYcCW4ddT2ERRfmGimg3msD5d53smNtHIlZKFnn+GaX1vImXbToUEtiDxgii0dTWOgNwhIy8Odw4Ddrjpx9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDg757CijNCLYWnC7QCGvUrst8Xrt/YeqnsWOvEthAfN2dHRa7
	MudN2NPAzjcly2iVvX8SAwPqMEDJshhHhsD61oCRfdzh0G+mT+wt
X-Google-Smtp-Source: AGHT+IHdEFYiJZOjIjQwSOHV+e20RjZjiQKJ6Hu0S/pIfoolKRQbsbVz0qT1wvy28ooyw80L1E2rPg==
X-Received: by 2002:a05:6000:1fa4:b0:371:7c71:9ab2 with SMTP id ffacd0b85a97d-37a42380c89mr2950274f8f.52.1726847128123;
        Fri, 20 Sep 2024 08:45:28 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:27 -0700 (PDT)
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
Subject: [PATCH v5 09/10] dt-bindings: arm: samsung: Document dreamlte board binding
Date: Fri, 20 Sep 2024 18:45:07 +0300
Message-Id: <20240920154508.1618410-10-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
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


