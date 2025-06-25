Return-Path: <linux-gpio+bounces-22155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8BAE7C90
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB508680578
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B03D2BD03B;
	Wed, 25 Jun 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bdI0cXv4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9F299AAA
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843100; cv=none; b=jejql0sZ/v7ySZgMADcXJiHqZjXqBY2EGjcG9Begoynt+H8gRYsuZq+tOxIAGb8izP686e+0OdfQiDlqo+GLfdK9OVkv/xFAihShOLuN39aQSw1aNQHDU7dDTrbTrvguwjAbrZSkei+kGwmMwLAJddxXyDW6RmYie/XZCAjUmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843100; c=relaxed/simple;
	bh=++8tpkdPFuMzMYNmzWCbpHolnN0VwNt0g40Ud+3vh9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i9edFa5nCUNwpMLaq98JeEbmsbPH/QRi9GwGxb9dJZn0fq129gRetctOOyJBvhCo4/IU7z4b1uUkQu+tcCZpDpt2n59AIgAeoDzd2duzgazySZmSWTzcC1MsiTypC2EBkluM1sO0GTGX10fqwNE5CIA2iPVvbA0KqwXPg1ECYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bdI0cXv4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so283487a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843096; x=1751447896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfeGnw+d+Kzu3IEv8ekNTJRu6MZvUT/JsOK2K76oOBc=;
        b=bdI0cXv4WTlA9lEiXxIFdMl5rNk6qoZVltetUn5rzEu1ZrzQzZo5o2ITEskBW81rgk
         qxo7dyBKOWMO7IGQA3GTis43FuhZXf8vXgxULUC3s4zBzotsTyo4Vtb3Cuef5Aos/4xm
         Elc0Eplxxw2i3tR9t9LPY2nKRBi4VqJylCBkcQAz8ochMdal9JD4qHYIOu6m6CZysdgJ
         9MjIoNbvxhSJnh62cuQkRC+8ql2k9i1gGAt4dJufRYTW7wjf/sH50dqzQvhMPgA7kqjH
         SdK1yKfkf5k1usnL/RmWiV1ev1dSU81S69IpzmDq6IciT9JwCd5Iima3QVlk4H7HqFcc
         n7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843096; x=1751447896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfeGnw+d+Kzu3IEv8ekNTJRu6MZvUT/JsOK2K76oOBc=;
        b=SmuOwzhJ/s+QWagMcE1mAKqiSvQDd366wv55MSHQbPfCO8eYTLCUzk6vuJfIxjbECW
         UVe8w2F/5EZlzY1VoYUIw5DmCLW5st/jqBZEPt+KL+cLF9AqPgoTLHsSOa+nFUf0Hus2
         uBjbZzJeDqrHDu4JpMqgqDM990Nu69TX6ANzzQY0s8reIKIIk9XYTEf43S1xmQM7H1nB
         LxmsMkGb23tl97teOU7nksC/k58LSl6d9U4OovWtKA5iBwMVptW5ueD0Q7ljSG0GnbWv
         VWxr8Z0ZoEoZt4gBSoeQkqGPU8I3KKN2VP6sUMM514NaptzX1FlBqhWDJAFe/XWbkfR/
         oK/g==
X-Forwarded-Encrypted: i=1; AJvYcCVnEKjEf/Kiy8V3MBfO9gLtjyehW8ThjwXNAors3UwspcjcT2XkAgDnmHPyYzW+ka+kexbSbH8EUkGs@vger.kernel.org
X-Gm-Message-State: AOJu0Yypzrj+0wllFEm8wivmzkzki+syGdegP6weC6dzqFZddqlyHGZv
	V+mIL23/C+0eu0x+HnjUTiGHa+shbbWrtTnYrLpc+SxcI0mmCHxrTaYGDAMKEZD/8Mk=
X-Gm-Gg: ASbGnctr391Z97nwxzjthnswWLhaMAhjbV4FlIzy+JUdMocueAHzx0+ziYU9Q6cRvOf
	HANwRjbr/cwKN7T5lws2dgrUJ1CS1OHMFaJonZk0u9APKI1cYfnXbIz8Rxi3xkN9dU1AxAOofei
	Effi4b4rx11Pdk8AKm4SUx1jrqW/wVrhZlxuIB901N/rVI8kwlsiKcrp2md3XCz6nb+W2Qo2dTe
	BahsVSM+klXWh76AoHC16h3G8ObVyCR+r7I3wFsMMgoqk4IKpEldAnL90aG/kLIyUTa2XDYwZOA
	p+4TTY1O5TRHWMt03xlAKyNW6LsmcHwDYDyz6gYxjKYDKcb3HBiCeXM4S+29BFFgu2lr1Par7us
	uinplp/+4iKeZAA0dK3iUuuEKTkVE075M
X-Google-Smtp-Source: AGHT+IGN6O/Pb4prPG2JZZSnB8sceSoAzDmx52f7W/LnMi89wzQjcfcFFch1scJfwQxaqsIw8dWK/w==
X-Received: by 2002:a17:907:fd01:b0:ad8:a04e:dbd9 with SMTP id a640c23a62f3a-ae0bf154a67mr213304566b.31.1750843095781;
        Wed, 25 Jun 2025 02:18:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add support for PMIV0104 PMIC
Date: Wed, 25 Jun 2025 11:18:01 +0200
Message-Id: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMm+W2gC/13MQQ7CIBRF0a0Qxn4DtICwFdMBLb/KgFqhJSZN9
 y7agYnD+5J3NpoxBczUko0mLCGHx1SDnwgd7m66IQRfmwomJFOCQY5aNRLmGArjrIWmdUob02h
 vPK2vOeEYXl/x2h2d8LlWeDnGn2vJv4pr7iHhjG7BBMzryyilFoaNtvCP3ruMMDxiDIslRZ25g
 jRw2u37G4U81h3KAAAA
X-Change-ID: 20250620-sm7635-pmiv0104-34a679937d9d
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1415;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++8tpkdPFuMzMYNmzWCbpHolnN0VwNt0g40Ud+3vh9g=;
 b=abfm9BCmpgE8TIw7teCAFpzQAAI/NGSQHPbCljUXMjiOSXMhEBfh6tckQOJk0WSlYyyzTvcwP
 vNQLVOaaPuhBFN8AFOk8gvHK7dsq3xm986EQLPdo32+04ZwQ5EB1jV8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PMIV0104 PMIC is used in conjuction with SM7635. Add binding docs,
GPIO support and the devicetree description for it.

Depends on the eUSB2 repeater patchset, as specified by the b4 deps.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
      dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104 support
      pinctrl: qcom: spmi: Add PMIV0104
      arm64: dts: qcom: Add PMIV0104 PMIC

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  2 +
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi             | 63 ++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  1 +
 4 files changed, 67 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-sm7635-pmiv0104-34a679937d9d
prerequisite-change-id: 20250620-sm7635-eusb-repeater-0d78f557290f:v1
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
prerequisite-patch-id: a618abb349c3de5b49f79b4b0f86d9ab502ad500
prerequisite-patch-id: 09f91ff3a25c16a0375bdfec80604a64eab0b4fb
prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


