Return-Path: <linux-gpio+bounces-25740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA0B48D8E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70563C7F10
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCAE2EDD64;
	Mon,  8 Sep 2025 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sADQX9bT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cNzAORJ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBBA1E489;
	Mon,  8 Sep 2025 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334721; cv=none; b=nUxAANe0iNZ3Xg0/15FGIgMG3aVLYL97h2/UZLBuyZLthuc+KnKbn0LTS1Hbs3iiMyZGn2I8Q+ifaRQ0+b5tnSVlEgJQYAG7KCe1xrP6ITsIDKjTrr5W6tlKlkkccZzqPaIkLXIcJKs715oee1e6M+HmY89HwM8iiD8Sqhve4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334721; c=relaxed/simple;
	bh=sQt1nFjjL/JDJ+BrO/n+fAOCSOgjWhKflB1AA8PgDRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jZaw/9s6tRzmyFR8NviMBpt1ZOflFLDgw13ByuO9Dz2nWGhLPBKLBBywFYco/PLxQrS8g+YedWmLCYWMxwlL3sv4RurUy5SfEhyeiRppMk2Cl41WbDPgimHkgPiuoeo3ZrhEKC5BqmKfS1doUmRrZ5/fMwQJo51jnlpjsl2JHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sADQX9bT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cNzAORJ9; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1757334526; bh=eQPeLiEAhdjsqCN6eMr2hYW
	y9nrryrJhtYPyQ3bnKgI=; b=sADQX9bT/tWhSPQe4PgDJGLjKpNob7W8eVveg4i5hMOk4WUhdm
	Ag07EehC4/J3eyRttL8LgRiSt4Q8/TV2olrVh32Fxf8gWI58VxCr7GC7/zheLugeuxxb5OJBb46
	VDN1b8lezfsyynQYLkvn5wOGhFOVzjp4EJ+LFJGB9n3DrK6fHP84m6Sc0o258iUD5T1LqrGKi5u
	Utyt5LfoiAgPklUKlguhz+Hhrw3dhyZAYTbjw9k21JaY2uqif8vdqVSmUfbH5Sb1/V3ZhajYS15
	Vv+1qVpP4slOBof1djTCczYnUx5iFlhD5OHMauDMnSZQqjNYSYwhKmU0vkn7/TQhXTw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1757334526; bh=eQPeLiEAhdjsqCN6eMr2hYW
	y9nrryrJhtYPyQ3bnKgI=; b=cNzAORJ9KTFjOmizsItK7ARR7LdwrBvnGkGODr3xc26OpPXhTJ
	akD2UK+BRCYN3YXBN0iMaaubaBPHResoDJAg==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v6 0/3] Add SDM660 LPASS LPI TLMM
Date: Mon, 08 Sep 2025 15:28:43 +0300
Message-Id: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvLvmgC/4XOTW7CMBAF4Ksgr2tkj3/idMU9KhaT2A4jgYPsN
 gKh3B2TDYhG7WakN9L7Zm6shEyhsM/NjeUwUaEx1WA/Nqw/YBoCJ18zAwFGONC8+JO1gh/PWEq
 dxNF1AhCUsxJZrZ1ziHRZyK99zQcq32O+Lhcm+dj+gU2SCy6E8qbvwYHSuysmHy7b/MMe2ASvg
 FkBoAIYm0a10fTQhHdA/QeoCljjNWrfQet+AfoVcCuAXj7QGL030FrzDpgn0Aq1ApgKxCAbKVr
 XWZS7E1I6UqI0bMc8sP08z3ddEAp0uQEAAA==
X-Change-ID: 20250824-sdm660-lpass-lpi-a8b02a23861a
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757334525; l=2795;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=sQt1nFjjL/JDJ+BrO/n+fAOCSOgjWhKflB1AA8PgDRs=;
 b=hqzfikXF4QCTc5JcFG5LBPz3rRpbry8pWlN7D/xCvhFK38kQJNMNWg5UYQOMPnJBzSGel+rwB
 ZCimlXlhZN+BnZ4isEI4I5uDXbvoLG74xj/JnF7Owho0izKQ35UPa3Y
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
introduces pin_offset field for LPI pinctrl drivers to support
SDM660's quirky pin_offsets taken from an array with 
predefined offsets from downstream [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v6:
- Fixed indentation in dt-binding
- Remove a comment about functions derived from sdm670
- Added Reviewed-by's in corresponding commits
- Link to v5: https://lore.kernel.org/r/20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org

Changes in v5:
- As suggested by Konrad Dybcio Renamed pdm_2_gpios to pdm_tx, dmic12 and dmic34 to dmic1_[clk, data] and dmic2_[clk, data].
- As suggested by Krzysztof Kozlowski Added pinmux nodes to dt-binding example.
- Link to v4: https://lore.kernel.org/r/20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru

Changes in v4:
- Replaced pin_offset callback with a pin_offset field in lpi_pingroup struct.
- Introduced LPI_PINGROUP_OFFSET macro with additional pin_offset field handling.
- Introduced LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag for indicating use of predefined pin_offsets.
- Replaced an array with offsets in SDM660 LPASS LPI TLMM driver with pin_offset defined for each pin in the new pin_offset field.
- Link to v3: https://lore.kernel.org/r/20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru

Changes in v3:
- Fixed compilation of LPI drivers as modules by changing pin_offset function determination logic.
- Link to v2: https://lore.kernel.org/r/20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru

Changes in v2:
- Extended description of "pinctrl: qcom: Add SDM660 LPASS LPI TLMM" patch.
- Resent using b4 relay
- Link to v1: https://lore.kernel.org/r/20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru

---
Nickolay Goppen (2):
      pinctrl: qcom: lpass-lpi: Add ability to use custom pin offsets
      dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl

Richard Acayan (1):
      pinctrl: qcom: Add SDM660 LPASS LPI TLMM

 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     | 109 ++++++++++++++
 drivers/pinctrl/qcom/Kconfig                       |  10 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  18 ++-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  18 +++
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    | 160 +++++++++++++++++++++
 6 files changed, 314 insertions(+), 2 deletions(-)
---
base-commit: ef67c54a170cee962b09c638514d55790b68bdf5
change-id: 20250824-sdm660-lpass-lpi-a8b02a23861a

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


