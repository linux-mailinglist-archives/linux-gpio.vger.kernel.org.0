Return-Path: <linux-gpio+bounces-8607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5230E94A2E4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 10:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFA091F2131A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97B31D1750;
	Wed,  7 Aug 2024 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gondNFZJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B1C1D0DEE;
	Wed,  7 Aug 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019341; cv=none; b=bWQq3Mpmd+RKeGrRcAlGVSA6w3tk2T3IFUtNu44CmpZALFF4K1RCNmEag+jhbEh8kIcyRjC6pnCjChXXf32dTesJkcFB9AEcsDH4tdTlwR745y0paJexZap5aOVc96qMEeIAFKrGzCZnPxqNsvwhgdQoowPzWPQEcEFOUmf/t7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019341; c=relaxed/simple;
	bh=btZNuKtbrLOxTc/1g/mlT7wUnIiZEnlg9YaDrJn/gEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bwh9XgAt6kBDGp67aqJbY7aOxogEd5uxwb1Ovv9BSzVaHAXc3QzJeF5ajjaxG2QhVTpQsy2Vf4ZRtp+n5zbmiBQ9tNDMGh9mDtV81y3pQpzXcvmwATROpDMxirkPNRpcjbU35h7vj7YiKA80HxfB2Cran5KRrtkwGkC1W5nkrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gondNFZJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428141be2ddso10263155e9.2;
        Wed, 07 Aug 2024 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723019338; x=1723624138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgYO+7EFWkjSd0MjzwfRXjoLEBWQnBnbxUw7yFFfQ9o=;
        b=gondNFZJSOHm3xYqow7j/Vt5g+5YGcN+YleHVbyitNT1EtAn2XHRiCdR1RCOQ/fdL/
         5TGw/CBh9y/juJL3X2shYEnY1Oe+v88Hq6cLPzmRRwaCMfTNNysfg34HADxjGhUfd11S
         zyFkNGr3Rn4OowEYA9U4G0g8I38x6DSjdi24tA34PfiSsyFCz2TQa01R8uYlWdAfxEd8
         gd01o3+gXksJAP5Y3gsdE6QUA/wNiGXh6TWzUSbbTUssYwVY5qwqu5pwC//fwdM3WvIS
         yoHbzIIq2n/RaznsQgAxls9IwOHXlE4n+sSuHi6UtTmMH1Uj5bCXE3nPLQg85Hgo9n1K
         xTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019338; x=1723624138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgYO+7EFWkjSd0MjzwfRXjoLEBWQnBnbxUw7yFFfQ9o=;
        b=WxW3eYBx7qiXLYUg6gEUgu1/J9ESA1JNHWWi1/3BORiCifnCd67LpRYegG2smthURV
         bmKsFz5vnGSXoHSdb+Z+scOTqplbrck5MKRoovZtaCEIrjL0sw2cp9mcMY9HHYR4sJN7
         kOmjb5nNTA7EbUthNYTKNJtQHDVhdD7rxhLmu3oD+87ZLhH2bp1Pt80Hs9q6HiEDyofz
         mbUa4xRD09qoWJniseKVkHeL+NjiLTLaBvoT6R45SXMa55NpHhRyib5wI5+D8NDUW4x1
         TuGqndb7AGjxhvag0Zl2+U3z+NQg0szrwGrpSb0v9wF5zmKFK/uKX30BmIy/5cFzhPcI
         +tgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr5vo9hI+NMwh6g/TX4Lc/aQS2D7fE3r6srAyuNkGq332tKWRXYOmWX2XJbZ4IDQuwm/atyOthdOUEy0Jq9hs6I2Wv6q6qfYMVVlWXizKx9Tnix7Z5/XEwx2gQcUYQRRO9I3SA/aQgnwOPlRwkm+FumrL+t+kNMwtPyOID8jK9jGbyTNc=
X-Gm-Message-State: AOJu0Yxuj/B19k1vEtDKWh5HyP9FzYHNnQ6XKCcALHSz3SiS//+I7f9q
	DQos5mG6LaspJlKDybTjKZsU6F/J/3Wd7cd4I/a1ztLXRgpX3HsDuMK7svSl
X-Google-Smtp-Source: AGHT+IEil472v9miiItMSePv4rUXf33i+/tTu5C2MTDU+ZPvyQ8uEl121WBVEEo71DgyTHqPQzGawA==
X-Received: by 2002:a05:600c:138b:b0:426:5440:8541 with SMTP id 5b1f17b1804b1-428e6b81e09mr116165625e9.27.1723019338343;
        Wed, 07 Aug 2024 01:28:58 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm18168505e9.14.2024.08.07.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:28:57 -0700 (PDT)
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
Subject: [PATCH v1 07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
Date: Wed,  7 Aug 2024 11:28:39 +0300
Message-Id: <20240807082843.352937-8-ivo.ivanov.ivanov1@gmail.com>
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

Add exynos8895-pmu compatible to the bindings documentation.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 15fcd8f1d..5c4ba6c65 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -53,6 +53,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7885-pmu
+              - samsung,exynos8895-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.34.1


