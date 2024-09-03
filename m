Return-Path: <linux-gpio+bounces-9643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 270EF969E1F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5931B1C23274
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E16F21C180;
	Tue,  3 Sep 2024 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHgx88VO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3835D205E02;
	Tue,  3 Sep 2024 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367482; cv=none; b=MlEgMyDfq2N0XMELZ3PYePK9E1vskbl2X2jC27rD8o88RLeSKUyuAvhNAzxlfWTG6AHNtnw8lWc3QZLZJSlRY535ghJTET5tUzH4xXx3wq4hA7VfWvqhsCyYWeFjVa9Oreae1Bnt+LhD/Y8ntn8AH8hh0jRHtHDZsiFk/k0gnLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367482; c=relaxed/simple;
	bh=BACZp2t3koNpk0Kx5baIyUrgPL9GxILVFw3r67ukXfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HRtQWYpYZpOsYN4U9fnJi86fxTzonI2AXKqbnAXQcA3pfV2WU9w3xbKrNSFVCl/+dNjt0uxLhG3XF/5YMcIMVqEOQUvRaYulQGNHWm2wW/1gJ3CL6YvHFC3s9+wDnZock5q/rwM9wp203uEsOTnwQA/0MXHlNNUyPH908+7liHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHgx88VO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86a37208b2so604685166b.0;
        Tue, 03 Sep 2024 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367479; x=1725972279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+rRgxOmYLi2N4XWgCIbZjKsFXKXkm9CvD8Sxq31aYg=;
        b=eHgx88VOHoY5s88vKuOFCPl9cYSV9O4oCoXTGo5tyXm+pKXN1Uk73c0/6i2/HAkadh
         BClXzodhqgWomFoE5FHYCApJvOFvwynuXjKsidkXuyP9IC1FUxckO1o6EPUtd4k4MZ5o
         H6Ulf+9xuMmY1Y3oOdHCGsk2oJPU5yaXrMghrG2eLmFv1vt/gHZ7OL5Vp+Zc29nxOwqI
         iffvJv/FsxNJdPAvgU9kvtsT5Hi/F1j8yXstVMWMjNTgidvHcUZipPOqRqcvm0RShQ1v
         c6U7xKEJzA88OL9QT4Duvy+SlXw3Z407vKYIwjxBz3nMpIXZFFg4VZ0p/xQPr792vaBI
         J0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367479; x=1725972279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+rRgxOmYLi2N4XWgCIbZjKsFXKXkm9CvD8Sxq31aYg=;
        b=bGmTjBdxcVW2Q9ZX22TfZNpzW4Csqi44aII2lEn9ppGbjwSjxJvdOJQ1eFAq4GFbo2
         z1jH5hYrh5hPS0l96YE5nSAF+wXWehEwoLtsBUNplAnpjI8VKT1IYX/CVkMKiRdpW7ve
         5byueSw0rdHKPOBZGwEn8nvpyPWqFHZC/W4KAt3PT6/zptWzMsew6xe6KMClS/Bg0I+H
         yrDQj86WMB5wayNQrvaZBq+7uQ4aGLljJtSnvh/xbx8KCeuDWyCtrisotLgy+PGY076Y
         JPtl2wmaRW9nzwPRSxO6XlRw6ynEashQX/rgvCCncxGTwgxB5PACWhcROOe0v3+SAAvw
         5VvA==
X-Forwarded-Encrypted: i=1; AJvYcCV4hMxdMxeh0NwHCdc12JD8ad58drwf+StpL2FQQiFuftA+SA/4qzyW9WbVVVTX2UBjNsQ7ejYqCCF4@vger.kernel.org, AJvYcCVuiHidlW7r7oN36EXP3KOxUx4kjp+suR5LTw1RVMAF+0eMRxtZwp/pWUOQu9PQop4NPFJif89jh9a8PhSR@vger.kernel.org, AJvYcCWAatC+B383QxRbgmAb/l0aDIVKHd6RIeyUrt7Mm7F9ZrAc6JbImvWqx7dC3bPdlbS+yDY1cZFph7Eggg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmJy7RrJVOYJF5n84cOJ2KxRNSTYFiP+f3kfLIsekiNjLBHpE
	Cbo1An/qenI7MkaQACQobi0EOOpM8hdWUpRudet22DB/TIiqS+Lq
X-Google-Smtp-Source: AGHT+IElqrYiGA9ATZz7fYOjvgJWliSRpqw9Y0cbA7QGO3soj/F/Oa6l5tO6pMmjyeXWH3ra3QD2hA==
X-Received: by 2002:a17:907:7e89:b0:a86:aded:b089 with SMTP id a640c23a62f3a-a897fad808emr1192327966b.68.1725367479485;
        Tue, 03 Sep 2024 05:44:39 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:38 -0700 (PDT)
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
Subject: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Tue,  3 Sep 2024 15:44:23 +0300
Message-Id: <20240903124429.107076-5-ivo.ivanov.ivanov1@gmail.com>
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

Add compatible for Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 242dd13c2..a2af2c88a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8895-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl
       - tesla,fsd-pinctrl
-- 
2.34.1


