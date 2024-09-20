Return-Path: <linux-gpio+bounces-10325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978A97D7C6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A1041F22DDB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CE9185932;
	Fri, 20 Sep 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJNmp6+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0117C224;
	Fri, 20 Sep 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847129; cv=none; b=DRTu9O+5LwtyWFTalRJYtR6E65lRoQTNtyjFwCGc0hkqletjOG66JlF3k2GGHcSbhaloVZurDKzq5UOlTFNxm1XwqMnSaIRLZ+zOwQVD10a4DroZGvzeMk9xqRvNSAX8+nGIPPU+C/ugKu4JrrLquzZnE/1FBxPFiuIwOWVBnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847129; c=relaxed/simple;
	bh=AiWC3ZfhqL6ldc1FB2y26ZdRa35WGsVGr4Q8zOs9JoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V17J/+cJBpZmMuEkLjIVwAl79qYOpRqdW7UlDNblt8/IfAHUhQ4Vb9MCHWN+ysDvW1nO7N1CszkDs+9D7Vn9KSYkbIQcum36lfxlQow/x7cHvDQlktzvHNKRqPRZhs6wLSs8Kwd/0xsbDkpG2YnCvgvmfTDtsMOVLvkePV7Jrag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJNmp6+6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb2191107so17827885e9.1;
        Fri, 20 Sep 2024 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847126; x=1727451926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS4Hn7bIf4a0dCsNyQ0Lh+IAlZYQwZkw+bfpG9czwyA=;
        b=SJNmp6+6RJbp1JUq6UAlkDPuNQrJrvQIT4zKwn64TSp3SSwpqAt7z7G/PrcTduKqVu
         3+ZjzsS0RPRw4VdV1ALnPFGCVpyLHmX5m+jU2E/Kop7+PPsIwq5ZBHV03iPbWn96+z15
         MRox5M1k+IqeaLjZywREqCAKDtctPgliZMiAMcqaoGe3eQJ2TiT3IFnWpwAJXHlvQNEj
         8GXyW2Rrh5yksud72r82ySrsciCxwaI1pkdyrZ/lt2q19oIKU/MFwacCzAR3wW/fAGtv
         ABYh9hXkF3VoFPIqHS12611mtPiz35XhAWttAjpGPD8TIW711a0dhDzjmGCRllvHonXm
         XP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847126; x=1727451926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS4Hn7bIf4a0dCsNyQ0Lh+IAlZYQwZkw+bfpG9czwyA=;
        b=UFDJ5D7KGhTNpy1CPMz+ysrl0xXRiR56j/ZE37/P9hyy9Rm9qze/CnfHt/5YMBWAN5
         bb1DeV98sl2C/hX5wXOmOHyXmMjvCY7F6SYGl/diQTeTUxhBtG+Z+KWuE/TVgzZ7ds1x
         PAIGWMAK9R0FJQ87S1Pi0pP8As2OXO6dW8+2zTsZYvhVRbm8+tWn8cyFajFbMRnrKkrW
         8c4/AZ245XyirF9I0yoWWwuksaV8Vxf4U69aELHThpoBl04b6G7TOQS0OooJHR/P3b3L
         4B64DnUX1OOmh7F7okiVCmAroMsEY2JWj4dQzWz872fzhinZsJkqcko07eNOKhdnp+Wt
         aT6A==
X-Forwarded-Encrypted: i=1; AJvYcCV7KaFI8CCIokG4F/rOx1uhosPmtkYqzD38PqNW+n4GBAcTNFvWx0YJZLF2ahtSMNyxKBkHZ9QOBSSLVQ==@vger.kernel.org, AJvYcCXTHWpLvxf/2DwTqhBqt8rrsp+S88n9cnTDJKL87WKW1w5PMovlHMQqoScgmheYkgrvLCmu1QMGoD5ySnox@vger.kernel.org, AJvYcCXUyqhkxesJoDp2USi2QUarWph9qdy5B31bOiJF3Bi+QPYIcPZk52XeD5vkyYAdaH7jtEHq8w8rNgi3@vger.kernel.org
X-Gm-Message-State: AOJu0YxqkkB+pAtrtSsefHimTHCwIthhDYXqKlmC04Mc2xUxGo6Dljdw
	zrxcLsHXMp/9w4p8Ee2nLzMrnvQu4AqDamUG8+yjdNGn2b4ggjt+P/LvmA==
X-Google-Smtp-Source: AGHT+IHY25UpExy00pxELCZtmWL0cwgHflAc/xIQBXzfxlo1bmBjeJTb7/7+74sOTQUKIg3Dii3AAA==
X-Received: by 2002:a05:600c:4ed0:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-42e7c165df5mr21216725e9.10.1726847125562;
        Fri, 20 Sep 2024 08:45:25 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:25 -0700 (PDT)
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
Subject: [PATCH v5 07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
Date: Fri, 20 Sep 2024 18:45:05 +0300
Message-Id: <20240920154508.1618410-8-ivo.ivanov.ivanov1@gmail.com>
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

Add exynos8895-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


