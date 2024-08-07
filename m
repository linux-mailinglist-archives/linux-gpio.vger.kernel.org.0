Return-Path: <linux-gpio+bounces-8602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17894A2CF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6C1C1F27E46
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9441CB328;
	Wed,  7 Aug 2024 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLEUtGV9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAED1C9DF9;
	Wed,  7 Aug 2024 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019334; cv=none; b=ccnaM57wkm/jXjeH4l8KHigX9yFgvEw4owcHGeDXPRpMeMpRZcfHwha3M060IoAh/4oRPx+DffkRtGnwln2OVWf5pooUM+aKlYdiow4RTrP2eBS4dzMwSRThDFwZUwwJVK06gwgrFj68yUc1HBD0nssEiOdVmxbPzlA3sHgYDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019334; c=relaxed/simple;
	bh=//sBzjBbg/KnayTr7/ktDgohrVR5RveVtoSgKhQnOCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t9ExP5iegx4Pl04Ri9k/XfnU2kbVQrMnf8p0I9EO49AvGjQDx0FDgK1PYzKVEXUuP7DsfNeaIo8Cz1aglKi3X2R06n8n8KfAS1Y/J+b1hrZ8TXRl2QoX1Sv3Picho5CNvQhhHO+n18jzt/xfzbuN1aDnyF6ZFhasT+UdHpqjytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLEUtGV9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso10246215e9.0;
        Wed, 07 Aug 2024 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019331; x=1723624131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTADDGGkujtRsx5sx0WJ8idgyiF8/ZY/eUyT43z9jgE=;
        b=KLEUtGV9Bkk4QhEU3kE1IWMlA20GrWi5VVHtHdGEAz7iQso2Z4IGIjpJxv1VTmjX2C
         UThY9ZndoFl2Ee3ac9ZForQonybsMFQHmloXNHS2E1xPSo8gzYLKQs8bSXfiJojBecLt
         29epoMBy2TGpmdkYEYZaHETnhVdqZXteh3fjQBXwNP4YGK9VKICDdiIo4oJ3A/XmVuUh
         0ZmaIuIbUAzBmy0iHTAjiW1mYdV2ZndJwt1rYOy8jx0yMyydzsEN1jWxHgEC4hrBAdLt
         BegyTvRsgdXP00h9B0Gw3jvoUonsASdDc4xJVqKWSyGtshNDYkJ/ZbKhUIHEObeLouWy
         ZYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019331; x=1723624131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTADDGGkujtRsx5sx0WJ8idgyiF8/ZY/eUyT43z9jgE=;
        b=vkcLKaZvuo6McLxyJxqkMf14mnSHiKLMpi3zkkGzLiXaOvyPial9icuAOkfK5E44wt
         P2RD8nKwsf2EULvh9KrHSn3EkQmjWipz+S08kgNhzwloRoH1/sCBukgN/O4yB/Ro1EHo
         RLwagm7koNc7k1QUR2qOWSoS8eQsmP8cS4eUM3qEN6oa7t48XtZRaCg2pk7wj5vkPPy2
         d2MWuh/ptkXOOSWjSgMzWyEFtyuD0MAfEd53vSSr5eDL0XYcygCGZXuOA5qRyvhzziCi
         MNUJXPA6QB9ubuLhci++7BiLW2mX682H3Ecwqw05UnO7+IbwY60ydvxiv9q/xNYwhWL/
         p86g==
X-Forwarded-Encrypted: i=1; AJvYcCUdKgq1oWMTjzDX9tegaDUNXQlUcZ5aGW3A8DbAlBO/VLFlU2RsVtL4wFQxM1YmbEJZXkzMqbUgu+IH3uLor7njUJpJCev2ITH8pZsgDOL9mxDGMTV6jZKOx+FuKhr2+HdviKz/n1mxjUOdPeOd1kGvO8Tn7ImkmBc0lTzRLKgrH1cOY9o=
X-Gm-Message-State: AOJu0YxCi0U4X5VShlYb9YID6Kp7kicxsQyu49E76eZxnT/alW4omNUV
	RS7StpDl6RQBwLQmL8t0Ug2Y8DeOWukUD6gXotQlGxn+dkDfeRccVopVcV5gNow=
X-Google-Smtp-Source: AGHT+IHmX5zMx1auVU25/54zT9Kko3rSDWSY3rFHsTb6/8+not8tuWu5jdPuXilPwUtIxw5BEk8kGQ==
X-Received: by 2002:a05:600c:4f52:b0:427:ab29:30cf with SMTP id 5b1f17b1804b1-428e6aebc80mr125481145e9.4.1723019331133;
        Wed, 07 Aug 2024 01:28:51 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:50 -0700 (PDT)
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
Subject: [PATCH v1 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
Date: Wed,  7 Aug 2024 11:28:34 +0300
Message-Id: <20240807082843.352937-3-ivo.ivanov.ivanov1@gmail.com>
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

Add "samsung,exynos8895-chipid" compatible string to binding document.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 780ccb5ee..c50ee587d 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7885-chipid
+              - samsung,exynos8895-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
-- 
2.34.1


