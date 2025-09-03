Return-Path: <linux-gpio+bounces-25517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA796B4225A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10EEC7A7D48
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63A927E060;
	Wed,  3 Sep 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pO0ddSNE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fWS7C7zC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4817BD6;
	Wed,  3 Sep 2025 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907174; cv=none; b=FwtpRoY6Mw/DsMDQtPPqXM5OLlz1TFw9JCLf8qWWCuGBbrd41/MmKCeD+huYS4DraIuCUEbOpNCOpWVyUm2kPnPHua49D5/XROpjJbFd8rjOjQHwpmlm2Anc2k0TNHQG8KI/LH+DoMLlDCDo8o+G3x7HVhAB52ofzsLhxTTRY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907174; c=relaxed/simple;
	bh=O+zJVRk+eiCCZu2ihyHhcn0Bb1ObmQdOLsSPmEDCyjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dqGZDKaO+CkdfAw7CGh7cArdw0UN9NhudPIGoKc9+SnSkIcPojc8BtMIFpGCfY1udfoNc26T3A7E5mh1EtV3J2a4ysYwjVNjgQuhTt2i8j6NRMy+UQqZlp50oibkVG6Buv5pE1np8tjgpURW+9OcpJE5AqCvL/PIRZOJ9fNCC2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pO0ddSNE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fWS7C7zC; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1756906765; bh=uuOUSFoqXtL4E2qSbeJsRAw
	W3ZM+WFVHxLvbUp+0gsU=; b=pO0ddSNEH9S9Sr02XyO/VcfIsRFsB4NkcvGiIfvGn//0U2Jepa
	gHZMibnvAYNN4yZi892ATp1I2hH7Os2iyFMTmkC3CuAb4JFjTaTSUNZdQju9272+TNSOe5D7ejj
	naAm/KQjsUHOrRJ5EJYqFQsZ4Qcz1QyQ+pA2TuDVh4cQQ+ku9bOAVOMUYMuUrPoULJ+WQS2KMZI
	naaOo027DvKXyWD/KVmQnc6gZTMyf5U/+F+TZjLjDJGvOXjBGNczQTChsbhu5bq54vWgmNKlJxj
	6fwr0DtYf7silFVWFRdzz1bzmDIbNxU4AiEpwhMwAnfd1INfgwtZ1OoaXUR1BEor+Iw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1756906765; bh=uuOUSFoqXtL4E2qSbeJsRAw
	W3ZM+WFVHxLvbUp+0gsU=; b=fWS7C7zCtluT4pLCdChC+txaJTAc7jg3hKnSGT1K+G0XNqnFdk
	CGChrLViKPSrdnFBDqDvdInjNQvc/M5ZJaCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v5 0/3] Add SDM660 LPASS LPI TLMM
Date: Wed, 03 Sep 2025 16:39:00 +0300
Message-Id: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPREuGgC/4XOTQ6CMBAF4KuQrq0p0x+KK+9hXAy0SBMF0iqBE
 O5uYUWU6GaSN8n7ZiYSrHc2kFMyEW97F1zbxCAPCSlrbG6WOhMzAQaSaRA0mIdSjN47DCFOR1E
 XDBC4VimSWOu8rdywkpdrzLULz9aP64U+XbY/sD6ljDLGjSxL0MDFecTG2OHoX2TBetgCcgeAC
 GCVZTyvZAmZ/QT4P4BHQEkjUJgCcv0FiC2gdwCxfiCwMkZCruQWmOf5DYOFadBzAQAA
X-Change-ID: 20250824-sdm660-lpass-lpi-a8b02a23861a
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756906764; l=2533;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=O+zJVRk+eiCCZu2ihyHhcn0Bb1ObmQdOLsSPmEDCyjM=;
 b=8VkfwdVdRz8pC7+arQwnEQFeMEXX69AYTmTuR6uYbm0vJi+OvwB5UBHBborEPmFzc4KglTvfZ
 VA/sLr8k8SPBY7ePU/m2ImC7ZrdsF3tYvJaN6Y7xhSIdCelSESUTZmC
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
introduces pin_offset field for LPI pinctrl drivers to support
SDM660's quirky pin_offsets taken from an array with 
predefined offsets from downstream [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
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
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    | 161 +++++++++++++++++++++
 6 files changed, 315 insertions(+), 2 deletions(-)
---
base-commit: ef67c54a170cee962b09c638514d55790b68bdf5
change-id: 20250824-sdm660-lpass-lpi-a8b02a23861a

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


