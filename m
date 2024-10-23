Return-Path: <linux-gpio+bounces-11885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F059AD7C2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E295B2849EA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A301200CB1;
	Wed, 23 Oct 2024 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv9JkFwo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D332003C2;
	Wed, 23 Oct 2024 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723044; cv=none; b=U9rvBG9w7cb3Gk0DY82i4cduzN5dkfXpU2Q00Eys1vCqSAMU6V5Pj98gJR1ClWrcQSTeiq2JI9MkzAwbi0NQ9TrEDc8FzcO0nkkp0T/hVM3p3rvenPzDLy6NC1dWz9pNtnrBz7Ri/i237eSwl/cSZs1kQxhsGZGwE9ZnVL9RTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723044; c=relaxed/simple;
	bh=PQY2vvSVvdmqQTK8ZrI+efD1G2TGl0x3uNfjf2Z5EVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYYA9u/hROPIE96zHZ69iJVakRq+5Cd9aOKG7Z+8WmxW0C9J+iNzDysfLZ17SqVDs5rr/dGtWnCHmclmqu5+qnVwLkKbkPb27pG1w+NRaeKN40uknh9nDVClsVCZZ1OEetFT6eYDzmhXCr70e+3UF1tCtd1pDaP7J5EuL9wYFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv9JkFwo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so2618605e9.0;
        Wed, 23 Oct 2024 15:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723040; x=1730327840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXtQqg3yJgLl+HjnpahR8I/TE+d9AkhS+y+OvbC+UXk=;
        b=Rv9JkFwoqUAwu6jhBFKrGKxH4lG/3NGhdJ564uBaGRm6pL6JXFidDBmLZ4b5soRpR+
         i6qcfiMWT1ifmW8GxfcY9Qef7uOB4mKYACxK/OkgY8LGVHYCyKorXcXU+Et4DW5nobT3
         0OUCHxPdI4vZmq70/R/CbJD0UglFt4n+0b5kxYzO9cUiPqM1Hm8l6IknWaGf1rjRrTK7
         HcpfHIE2NuJRwRT/IcOcebwVieavIpxxDCzJfHUscFEH/vM1v/7F0mpQvYF5Lxh5va83
         hubkEN1oNA+Hu6FDtqYVCZEvxRTnEwwERZ3wOC9vAapUhQV9qPyRjAakCPj+h4nSfgxm
         txSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723040; x=1730327840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXtQqg3yJgLl+HjnpahR8I/TE+d9AkhS+y+OvbC+UXk=;
        b=gqTZ1BzsRKKJrLmOf91sxzzY4TjOFfiTIKn2VIOft/WurGwW6ZgVk00MIbhXsh9uvA
         RlNOuZBZVFWiZhDDGqjoEox0VrrCVNU6ahNz4DQ73y34aOURSxWcRoDxfoJSaGyBmOUL
         v1ZBI+WevUPynGWGQZ1x1jI+KZ/KrImDJW2s8RrmA88VKvq6+kuqG/0Pxz14wrIEIbTB
         3GzDHe1SyFIW5T0F1u0ZTx9Lfyr4eDo4fDITZR+O+XsQi9j9VTZ9TznG1+01M5M1Qx3I
         UaLLA2etn0ZrAPQwpQkWXVVWU6KRWsIKiB70RWq3XdMhg98ZXpMZ4mehhnwru/1dexl5
         dpCg==
X-Forwarded-Encrypted: i=1; AJvYcCVXcQ1uUxBvU3d7VEa/LWvxvvdwAXPM+R7BmMasVK1SkCor8e0xW3TVx/qSSffUsE3F7gKE6nL9Zfj+juRk@vger.kernel.org, AJvYcCW7fh1tCElKprhCBe1iXyCphrLqhMEhudPka0lPuiwSacz4Poxlk4NCnJiVlYtA/RZFUFmg56X12EO9@vger.kernel.org, AJvYcCWGefejMi3ivbrArAb07WF4BzduS7G/EgT01pQnACAqDeHJz+hIsG8v+L43McJzriDoTYqGNHPLI5T8ix25CbXX+QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMjSOoDyb+VF5mLFdf9Epdyx9/TBrZ4WO6ArEYoHLeHY75j7J2
	N2p5/ikbf6dmfFjNPiN4/akTJRuVvU5Px7GzDMyfmU5PjcynakkQ
X-Google-Smtp-Source: AGHT+IEv1LT3aXWNGlfQxfdfR1++WDJp/zgt5i4LxTmGAfPafps4VrBKGIrMxV1xd9yfdRIJxSyeHQ==
X-Received: by 2002:a5d:46c6:0:b0:37d:2d45:b3d4 with SMTP id ffacd0b85a97d-37efcf8530fmr2600249f8f.52.1729723040279;
        Wed, 23 Oct 2024 15:37:20 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:19 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:36 +0300
Subject: [PATCH 05/12] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-5-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=966;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=PQY2vvSVvdmqQTK8ZrI+efD1G2TGl0x3uNfjf2Z5EVY=;
 b=OH1oLPoXvG7knPESg/Z3HUVLfSYDzQCUOPxLstHrQyyXHOQDNxEkrMjK/EUc/OUpMOVfIWGQK
 90hki70VyyjDgdWkuFx3nYxNtPuJU7T0Bh+EtRjfAuB4uV79nhP89My
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add compatible for Samsung Exynos9810 PMU to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


