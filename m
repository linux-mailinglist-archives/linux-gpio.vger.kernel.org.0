Return-Path: <linux-gpio+bounces-27521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5648DC00C03
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69F24189807C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEFD25785E;
	Thu, 23 Oct 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ktL680r+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249330CDAE
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219157; cv=none; b=sd6d1zukt4SnIXWMaj3GGLFJwBtDJKsOBhthmN9YwFXXUJ9p7iGB9Eosu3fDofEcLxanHtG4n2Jw794rIuHW+AcdVVvQa0s4TdWCtk+tmNg7rT4S19kltVNTCJ1P/GxoGeGYh5V8lnzDpGeF8RLegKO6XUlKFHaqvCG+UBgFvCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219157; c=relaxed/simple;
	bh=219+BGs1UMALEmF9FQsgxxO0c15R/d1CEwwPyrjWbBc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EURRuWUMZx46YU2PioxitYB4uzqIEvHMF0vYueQGrbhnWy43iXlgF1HGAUmVoqeklstfsWbrIiF2W07eyI9tiSa3gFAP/+50M4PCSk9HfrR90bG5lK3ZM5NhOKcxKU3XE4ZSEQsqwWB/iaXg7HGz9JOOCHfAWgwH19zCp863a0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ktL680r+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso148272366b.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219153; x=1761823953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpNnWkJiOscmYGyhJWmloy2afAm2NS3i4xqcjYsWoMA=;
        b=ktL680r+/bGgwGfs4iM0LEBCWDdZ32JB+LxxFGpNUDTzCbU7BA4QG/Csj7MfCja42d
         wAjctRN9HgOhtWy7bQXL+UnkZG0Y3toczckaJvFJsKBGUOidcftbNpveewu2/5A+oG+3
         cUk/81ju7PXHhANcU3+vxUvg+i/EerIsqF/uOC9M4Vltl5+lNZsd0m45UoFlP8V7FSYg
         DjUlyKnXfDTzxjnimqkMwAjuzTFo+MoGAnIInFHr7AGVWl5o29W1JWTaikRaKMQ6fCBa
         E8mM085LibO3TaxOrPQnyhhR4mQx/W12oDbsUgNr0dLAi/wJAqmpJePoryh7ChC60Buu
         /OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219153; x=1761823953;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpNnWkJiOscmYGyhJWmloy2afAm2NS3i4xqcjYsWoMA=;
        b=uI2YI8pyabX5Rj07ixSNHkDzr6R3aiKViPrfYjHVdmIlwqOyEEVDKNHWiVB8XXkeBP
         6KYWEimVoVCpyzO1zdO8lNS1P9grkaCj+W7IvE+icZ1AwLl6YXYdB6MgxbkiLt47FyOR
         97Q30stgaKy66GnTd8QSrRocmYWeVM0e7p8+o2pXOvM4rozpVFxf0uLH4syp8x0cU3Y9
         U2jyZAFvgSUxlk+CZwPRbBPHVzJ3LHNNG4YRIT+MG8+NzVCp+JW9SOL+xLnRA/UfsVtR
         JGXePL7N14YO+aqWRmNEIPwAaD9IULh5rfTvA1egwvxoyHrdSVetlGkuU1LBFFhZCBys
         qzhg==
X-Forwarded-Encrypted: i=1; AJvYcCUcn+EEGfuR/xm9rfE4gen9LRL2T0+O8AvzL5UcvfbcFi7OeJqylXYRMyxvuDvRmCbytl9E9bvycxHv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4IwDsKYoo2KH7bYAVSXd9Ju/FAnbmtT78r3I0QdSaubmo3mln
	sSbJFdDbt7QIdJD18zlB6dHcPld09kUG+zooN1TK5GFJLDYjpnayjdDv5iNdiGJwuXU=
X-Gm-Gg: ASbGncvCD/jcKEKPug8x8KNwfeT4bAvbPXhOwUWDMKf3Hhfg3ZYmXvYxQDIkgBf8QGt
	XNRwBvPDWW+jaf1PyiwSrUL/cJyovRlpxOWW2seugC3u3SQNJ8xHoc/hzKJTZAUI6vs5fSI8VIu
	oP6WKiceK8zJBiMgQ/ixZfO63YybplQxC3H804lEkPYuqBxPUkCatxsIs4HgQJsOCYodaoQDxGP
	bV9QSP8S9lA9B18AZg53HWaOjUidm5wZPpMsir1PDAPFm7/HRWyPEa6qFrEvCrP/EKtoTr/cy6A
	jOgPWUV61hEoCTCMnJQEWFONb+bqFRWJvBXRszg0dK3xdTtpykgl+3ClYoEkPsKrDTzveU7JObc
	IMD01T1F1DscURey649IjdF/KDfQLyTxqV0xF0RNP62G2VzFchhlJlym5JAC12v7pxtGH46W//9
	MYdZZiIRyfY95CUhg6bQCPBkTXUj6+XCvlLlMEWPeQkR5s0A==
X-Google-Smtp-Source: AGHT+IEl7Syzf5Uc2BCfVDgfWGyxkVxFH1O6RZyXcvt5BTepLqPH++866mvbvp1k50rggkWKyblRuA==
X-Received: by 2002:a17:907:94c9:b0:b6d:5524:5a01 with SMTP id a640c23a62f3a-b6d55246423mr234261766b.31.1761219153462;
        Thu, 23 Oct 2025 04:32:33 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/3] Add support for PM7550 PMIC
Date: Thu, 23 Oct 2025 13:32:24 +0200
Message-Id: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgS+mgC/2XPzQ6CMAwH8FchOztTOsfAk+9hPBQosgMfbkgwh
 nd3QIyJHP9t+mv7Fp6dZS/O0Vs4Hq23XRuCOkSiqKm9s7RlyAIBNSQI0jcmUVr2zeQQFUhmrSl
 NKC0wF2Gqd1zZaRWvt5Br64fOvdYFY7xUv5beWWMsQaImyk4KdKXiS0XW9XXX8rHoGrF4I/4MA
 9newGBAZowpKQfK9L8xb0c6fjzDt8N2qcjJswz9xg7nqOVpkMuGGFCFifkDtCF9CScBAAA=
X-Change-ID: 20250620-sm7635-pmxr2230-ee55a86a8c2b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=1162;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=219+BGs1UMALEmF9FQsgxxO0c15R/d1CEwwPyrjWbBc=;
 b=zH1fNZh/BMIxM2WZik6d13jMLDkIgAarWlV81IJDL95GT5KmmymH99mNmTFVHd/xG9gNYYOxA
 S/NOJRtqIW3C3kWZE3tKqErequGzTZoV6oz/GHqEHB+/qR+6UwUclrz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PM7550 PMIC is used in conjuction with the Milos SoC. Add binding
docs and the devicetree description for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Resend, drop applied patches
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com

Changes in v2:
- PMXR2230 -> PM7550 (Dmitry)
- Replace some SM7635 references with Milos
- Update critical temperature trip
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com

---
Luca Weiss (3):
      dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
      dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
      arm64: dts: qcom: Add PM7550 PMIC

 .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pm7550.dtsi               | 67 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


