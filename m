Return-Path: <linux-gpio+bounces-12072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE79B0130
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 453E7B22F32
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC342040B2;
	Fri, 25 Oct 2024 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKpaU+yZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DAA2036EC;
	Fri, 25 Oct 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855518; cv=none; b=AglP9OAe3MIc6tAP1lwjOP/E36OxnNrk0MVav9NN2+2yOh2c1l+JxDcMKMWdi/wQNNeWEaLi5J+LLg5qljpN0ocP0+B3lKle41je/abVVEHf2AoBFie8nwRuO31UhhWJG0qFJK4yuBAVZWl7AX47l/K4vgCtSuE00VjO5muOA4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855518; c=relaxed/simple;
	bh=anfc4pv3kBFwMUC6+boo1nr/Fl+OcGuNSaeW1M8DaGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikbC9LLynOrn5UuPj1kVVCea8S5ZEjzDcUTV2e/s3ya7p2TMu4iHlRAsvXN5mIJj5sBRY1Ys5zrWxDS6bFqR6DUKUjFNyNxhaLq/5nDNGYrz50tr2+JACUU01Kqsq7An3CmONsQRohPdS9s3CWnBJpYx5iT2cMABpE9kkLdQcJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKpaU+yZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2028015e87.0;
        Fri, 25 Oct 2024 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855514; x=1730460314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBspKlYH+nN4eI/HU4r3dQSnTCqsjAVwwkRAWiGEGfQ=;
        b=eKpaU+yZVUvwB2/woqVnYegP9jDv6c8AaFsbHSGHARcpKq/MLRl/yW6HPgzi8S9iY5
         N3pPuC+fJpPttbVD/CoYRQj+9R4zU+Hnq+Uqs7dMIUWPJ/7GuzhzQ5LUl72hnkV6wvCY
         6IcKIqRtIJVDj0iBnPzV1he1cFcpw3E/4op4HG2mc5jhglBrVY9vV9WwtAtryNcfV7WA
         mexwAuShnln8Untb+70wF7dBRIxuGVv6U/jdOkxcPCv+y0lqMufsooYXwaT/HIu/74B5
         GbJBlgzGCYErZ6P1UxFbAsrIeQerLMMT/rK5fiYj40KoIFNOEcCLaPCELZ0ke84FLmA3
         KTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855514; x=1730460314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBspKlYH+nN4eI/HU4r3dQSnTCqsjAVwwkRAWiGEGfQ=;
        b=useIg3bhjRXhylHajucwSn1fS4vG8tF0J22JFeM95kAkERdMiOZ7EfxFcFeIA+R9ot
         LQt5HLyI0WgU8vhHnx9v1gvzUY0M09UQMPpr2icPFClnjeVCGeFykUBKL7EKdQpB5Msb
         w7R83givQgsZsy3cz9KBgfum9qMrZhipiIOKM1f86gweIFjDUVTbw3lCGBp3ailrmgu2
         zmLwVEz4GsuDDRt1U38AjoqPjP7oJSC2V0PlxlUITCIK8IatuzsHIR7CyAhIVyipxDSo
         9ahA3Tx2bowieU7/REs623uG45E7nBYI1CQP2iWNd3fW7UbjGHMF15cSME0JhQB7bQEY
         w+ng==
X-Forwarded-Encrypted: i=1; AJvYcCXLUaZTSmb6pydKfw5qp+3jdmEh44MVniLdNSwExpb0R+sqBfjYxZrb72U4yj3DqCCWhuz7gXJb4v7C3VyzZmpnNnc=@vger.kernel.org, AJvYcCXSOAarLGPrU+dsCc9asO2hvdxGeGwhzFMQ4FlVyxfajo8MZiQWe6aSKptofbZqqM1EvBuiKTTTybmW@vger.kernel.org, AJvYcCXjWE34m4zVbZj+ZaiArVf7en3NDWuWmUTBRRvWPN31B2gXR6A6LvF2PSKd2IB3sP+Q+Kgdqalxs2zHxbo1@vger.kernel.org
X-Gm-Message-State: AOJu0YwhrF3JUzlfKEmXHkL4GyDpbI5VdSS858qe9kqKRvEZdQe24twI
	8GTqB4WcwQKoJY7VjNAVsiGmCpjNXUyBjsd5wUGcrEUPpcokBaZOnuZcpA==
X-Google-Smtp-Source: AGHT+IH7aD0bikl6FQMGLNd7VofETGubF8sLbJJ8xzo9F6OJTAdG/SoIoBlpl6PgXjVQzoxxi24rqw==
X-Received: by 2002:a05:6512:230b:b0:539:eec0:20de with SMTP id 2adb3069b0e04-53b236dc96emr1633454e87.10.1729855513818;
        Fri, 25 Oct 2024 04:25:13 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:13 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:51 +0300
Subject: [PATCH v2 04/12] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-4-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1142;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=anfc4pv3kBFwMUC6+boo1nr/Fl+OcGuNSaeW1M8DaGc=;
 b=RN0biJqpKerXFY2hT9SMKUf1B954dfTnBJCZk//sc7T/EYhl/mogqBMxMnDQf63uuf6f+l4XM
 Z8JM17GPDkfD3Lk8H8da8XqD/ZpvNEoUoCSKFR3Oj8zbQJTEt94iY8M
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Exynos9810 pinctrl eint block to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


