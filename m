Return-Path: <linux-gpio+bounces-22978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105AAFE78E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10EEC18913B0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EA72D46A3;
	Wed,  9 Jul 2025 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="04dw6U7E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F322C2AB2
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060161; cv=none; b=IBcFEq6eaKeixF7xwUwLFkyY/WGGKXZlh+vlJ/ocftxtMdW6nIXLkqKdXcrLiaEtyLbo3K3hnsEj/uFwjoL5Wm2StkdBJEsNqClFUZ0rP5yJGW0Tgb/FbwwTbEV6Na2LskUru4E1iCc51hR+5kkMZE/PEM8HswtbXxCiZuP2+Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060161; c=relaxed/simple;
	bh=v8W3GINcz/JRFuzQFTXnjEqR4QhQwIRLE6x327OiNU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XokcpilecHvI8Y5DX24KzSBnUCXeLagHDeBiW1NutK8DIdQtcelgMppBVpFylM2ytuQHI9o2+XkaqSQc+E9aB1LAF23Elgx1BFTLzrXyCQvqTGkC5uuNNnUpTdYv0jqMl05mIIupFLBeY2Wsq8En1sxMfPvi4YB3iTzNfN2/kP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=04dw6U7E; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae360b6249fso977218366b.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060158; x=1752664958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4dOumLNf2zlAbgSAyMPBNKWH+vCfQ2X+/X62wCBIXk=;
        b=04dw6U7Ek5LafvOGTqY0m78dHoV9wA1VGICE/nKznHED4BeJFMVmQLtrFoWgCleQgf
         7/VWIGFQsDy6+fVmn4nxdXklMjHnon6xqNc1A5nah/broM73B957q0XCooLAmkQ6bE28
         2DzHmqba0pGXDRNFRhUotZ8SvB0EK8QUfHyMfEAqkyMevdr+FaJJUXzp1fEDKLrie0ch
         QxK4WJj+lBVpS1MAoWSIHF4mwX5MlgcZRKKCn9GDacyzHg4b8b9TvG17aNTSl5t7kngZ
         5O2xf9Em9fBDcHyNuhu/3bseXRrnvxlvSMSMpAKchsECGyi5LY0wIRgXvMz8Xmv2S5hg
         xcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060158; x=1752664958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4dOumLNf2zlAbgSAyMPBNKWH+vCfQ2X+/X62wCBIXk=;
        b=EgNF72LbYXS8zyQKC251ng0lx7myd2VK0AsjYS7KZa72d7xvKUJfBCfnFwp9O91n3E
         WbpNyw0i9Tdkkx3XyzYItfR6c7SIlz931iHgEHyFqS3ZqeDhwHkDdLaMtICN0H1oO5BU
         zLJcpyO+UsmnH7nwK85rmHXADMYRSDw7WF33ELLqFbwq8Eimb1pXV5csZPlsh8ohXuKP
         x/E9SRJD8R79Umycac7jkOqNMPdZTXLeh5YNlI6tbtWj4wXYwp7iBjTNJh1apMn7AlAm
         CZSCJ3koxhP0l4v6he32XF3GuskjyNN35rr0hkMfFNbC9TxiRB6co0e5WeaiIJmfbPBC
         BAQg==
X-Forwarded-Encrypted: i=1; AJvYcCWFkg1F+8TkWOugc7dDbj1+7ZKn4bPNizn+6wcdnaLOiDvMRqzyNGiMOJ/JDRCTAiPeixPDiKglm4t6@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvi7omo+/ucOXVId+Qwe430ZvlHrd1/MA5HBrSg1ATywsaEX4
	nGkwBbnL0H2p2wG3UqZnhwevwT4WeSKz9Ba39WB0M/U+4b2SnIy+yliLKQCWSqYT5Y0=
X-Gm-Gg: ASbGncsBhTVxlBKmVZ9P8XirhqAZUNSpJpm+d7HeibA9ne6IkIiUGCIGX/Yb+KOUw0Y
	7JSh0/HV6N5eKwz+uM0w9bprGLwkQWD5qg+xD4sez3ipdi/2EwcEFA9A+JUQSU/Ynqu5+V8fFjb
	oqBhTg9ErV1g0pGWOTciL2El8l/GPxRHCwKqzY0Mn8QDdy/ZfjltQ20L1opHlNwXCJjGAT37GLM
	ZrKEKM7Mx/5dgagN15PvKFq1WFBCh0F6t+yNdpXFgDUIrwRawQVecw1R6NyGsut7BJYB6brxyp1
	nhDaETCFQBy/FKMZcTranFyKZPfqumvseup66TiLIlQiw0ULfUz1tLzixmiPOuB2did+2FFfpBy
	0v7AtnKzDI5VLND2r4sBA16hIS8G1gAGw
X-Google-Smtp-Source: AGHT+IH9vnwKDQS5PWwwot23KnBBMguALefUJ1bpdte4R5ZQwSrr0oNdJ1eGm7MuBqcVRYX5nvBBlQ==
X-Received: by 2002:a17:907:7e89:b0:ae6:abe9:8cbc with SMTP id a640c23a62f3a-ae6cf58d2b7mr206062666b.12.1752060157745;
        Wed, 09 Jul 2025 04:22:37 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:22:26 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmiv0104-v2-1-ebf18895edd6@fairphone.com>
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v8W3GINcz/JRFuzQFTXnjEqR4QhQwIRLE6x327OiNU4=;
 b=Otrw6GqfkCGtNrkH58EJ4GUrammLwH2oknPOBewjtua7t9KC5rGMlkhlpPhzPUwHFelgxeMT3
 +qMFSSdu4mSD2v5n3Q0vKlNgtFDFVb2k3tYJ5KIh+u+xDXf114lit1D
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..c416f25c90d6d9f8404947d1fadef91cf664e666 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.50.0


