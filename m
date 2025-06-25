Return-Path: <linux-gpio+bounces-22154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69272AE7C8F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37D616C633
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53E729E0F1;
	Wed, 25 Jun 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uNaTUOOR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59568299A8E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843100; cv=none; b=WNenxoEKk9eir6nnK168DOXVHNTaJN+hUm1kuJyimxCJMIT2J+gGrBbzbp8zHnAF4rieONDbX8GLbEbB7r90kqCQMZo5jMAJGcEN+lcCQPIeeMVxt3jLFIRpeYNuJ1jk7KoVdw2G4acBBEVcQw4Wr4RZ5JdFzr7CgLsyozL27Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843100; c=relaxed/simple;
	bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPzKz0LwYLYemAEW3yv6ix0TjO37x7UGsfqtGnklP6vRi+Q+GMKtKi1L92/1r6HrIKanpNg/47jhjxemFdkQ/5HIvYHgi/5yT+6lXXwAFXGSbusKOCgH7dYImgK/n7cA75o796ve071mt2gdH9w3cHJmnzdYEfKHLZLRq2v18Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uNaTUOOR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0b6532345so136987066b.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843097; x=1751447897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=uNaTUOORyt699w1SXS1CH76sfqNrxw8t2G721zWMKUg64cNvebxu8wBiaK9pjYZ6CX
         7lVBTaouM/NXE8f/sQlh5Xw85+kNIXy7GYIT9Zchphrn0nLsMCEPzXM165nAs6xQ66UF
         r1ZNDkNksoQmdfe1osabRWzW99/lY2gMcJPHcTptlVl3GUZzuaHslSTiWLIDvYYx/fM9
         0jeo95qSbmyKGmHY9jSCZxvPn8BAbvfMKLuW5R7cLZF8ZeNjUUhZ0g8pCNujn60xrX4r
         YJqLKA8qJ0U9+VHa4fgyIqtb0O25gne9FKzEMg1hi/+ZhgyhfZVgxi7WObg7ojCHwb+f
         aZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843097; x=1751447897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=BXZm9F8F0y8jB3MewUQaz2FPeh41WUcSLXIytfAOtkQTROZ5lmHKimZKFKvVU+XRhY
         Az98pyOE2iWZpWcKDPrhYLVCkb2rVYAs/HHtsXMrFb2vWe09aK8MDlrh1bv+pH6KrJvh
         t/cPjkhafm/RBnmmcdmOVO46Zir3b7J9M4S4vg5zPzeMaiRRV5NoOIQP6eK30jbqOH3X
         IYm7oHt3K6ZrW6L0mwTcHO18YOEOwjHOhEVCK/xdfBHZSJY4iPdDoLeSHFwBi2MYOjIX
         yvi5Zs8DwPjaTdq+vHvn9RfDj9KVt4hPqM0g298fccwTjJz2Q4VWJVboD1o+I2deOowD
         kuOA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ltY96UYD2OMjC5xOE4ZuAvnlSoxRBGgziTlwMbyU5lmyp0SLN1PD/nBbJWY9XYV4fSSG7mX0IgWE@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2Ic/a9/3tykZL1FRk7oCNejyyuLBeJ63x8RG1KgkEKivO0oD
	aVPO61a185peNaUGwH/Qb2bsfAKuTGn+Zqjki2roXyDBh6rwHg58/021oSDxjV4DPO4=
X-Gm-Gg: ASbGncttpBiAVU36W4j4bOlfuPJAGB9q9eMUyXyf4C3kAibKxGYRh4Xelky3ShTDqJL
	AOz4WSHPfueiDoVHX/8HfsYtaMS+t/RBdpLSxox55bP9U99Gk9ZKoj6YW2dRivz+8lWc0sc8iFv
	w3mdPE2Bu0nEHnrqRKl6vUBqlgdtDD0rILsBMbqOQbKs0FpT28zB2AbQmrnTNXGvNRkbxUrY1An
	hhYLGxMObBvMHBPfvC6xH9l3BbFS/8xwTv29PYB19ncf2IySsOs2JRgPAO85TDkJIVgsaX1YrTA
	JQauMGL9Zqd2sHXYb4laIiLLkAlDHArCJjqqIMpPLGIiXbx7MZkG1LNN6HplaaiWUj/RiHgkU2w
	5citJ+1oPw4oRYLdfNyw+JfWxRhmqiyMk
X-Google-Smtp-Source: AGHT+IGYD0rC/aYIVmAXapkPflNDUng9xnrOy/PP1ovsYL3Pr4WT+utJBYAgP6x9+IrqYJvL1om8Hg==
X-Received: by 2002:a17:907:d860:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0c4e3ed50mr133302166b.28.1750843096666;
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:02 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-1-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=829;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
 b=cfWhIW16u8AU3opUGXPjIMEz+f97knPAZaejc4RLCxX25LbhEo2hfOqSlizWFGlJWr1mlUCuK
 Lvms8zLfWujAlr9MWTSzk/YxpC+JHEZuQYOZF2Sbd/FZsDPal1KKBdI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with SM7635 SoCs.

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


