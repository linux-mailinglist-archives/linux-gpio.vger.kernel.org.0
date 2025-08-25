Return-Path: <linux-gpio+bounces-24928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C5B33F79
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7247F1A827D9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B0B15624B;
	Mon, 25 Aug 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUKo+ODF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D282C18A;
	Mon, 25 Aug 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125162; cv=none; b=eCDVVSBOry2RBgvQ3loWHNGP7Ihn8pJlvL3uCpNTlqNODdi+kEpjhTYRrI+XlBkzgqaQ9mNg0XSqW/4nwqH63cIJ4updO8+hpyh6hy76BDzCz0hty+sQaKZA1D0PyYPwx17xwYRIX3HbTutlYVGTGHa7d97oweu5ycnAc03rb/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125162; c=relaxed/simple;
	bh=zlQZif1/IWQ4cdmTyd6FCBlbHrEmXVxxNYu54P+m/DQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eWC8Rfw3TMaeInO4qGUWA3E5AEYBNjZyY2Jaj+nMWbhiGmbwlt8TXbL9ffT5VtB96hHUZut1BgNEkDLW6GWyFFQdMkG06nzybSFAYt2DucQXNNvpYPTmMjRCL7d4IvMuVlqFZCQJNf3kUAxWRu0QwGubmZHIf11AH+ScOQdkubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUKo+ODF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA86EC4CEED;
	Mon, 25 Aug 2025 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756125162;
	bh=zlQZif1/IWQ4cdmTyd6FCBlbHrEmXVxxNYu54P+m/DQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XUKo+ODFhCQi2kSqGRC+WcRTMbP8e7Pj6IQkXeNWZCYnH9giZsX3N+ZQYbpr5YUFb
	 lydeCkkOF8eXKBY1mBnI+HGrVWsoihirLo7rdtYSq+zXgPNvDU3Jga12HoZNdmgFgz
	 +9cct4r+fQpJfFrGHZSM7z/LZKWc0m3VWWop6cUuMi5qmWKzHXHL6DZse52QgvNTYo
	 mV9ELqYdirFhte8HMm4v5vT1qsseKvuUm4yV4c2Tp2M6upo3eCPqLsNSIUaoXlcIq3
	 02pDgQEFHXV2uElcueUXwiELRLjzvEiafvXmihR5RjOXAJ2IgkRV1uPlrRO3ChDmHP
	 +SWFc/pvwrvDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA95CA0EED;
	Mon, 25 Aug 2025 12:32:41 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Subject: [PATCH v3 0/3] Add SDM660 LPASS LPI TLMM
Date: Mon, 25 Aug 2025 15:32:27 +0300
Message-Id: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANtXrGgC/33NwQ6CMAyA4VchOzszOgbTk+9hPMxtSBMFsuoCI
 Xt3BycOxkuTv0m/Lox8QE/sXCws+IiEQ59DHgpmO9M/PEeXm4EAJTRUnNyrrgV/joYoT+RG3wU
 YkLouDctnY/AtTht5veXukN5DmLcPsVy3f7BYcsGFkE5ZCxpkdZlN7/x0DB+2YhH2gPoBQAZM2
 zTy1CoLjd8DKaUvs8ZqCvEAAAA=
X-Change-ID: 20250824-sdm660-lpass-lpi-a8b02a23861a
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756125160; l=1677;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=zlQZif1/IWQ4cdmTyd6FCBlbHrEmXVxxNYu54P+m/DQ=;
 b=TxXsTAvL1VvuaQM3xl6MFmTEDgy+eVHZL6TUsnuGEO+O8HCOLAByMO8I5Ae1sch+FBnsr6fmL
 XUkbKds8X2cBHvmLmgW9DubxhriA14nMXR1ixMgvBfvzSXJ+RIQr8+y
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
introduces pin_offset callback for LPI pinctrl drivers to support
SDM660's quirky pin_offset function which uses an array with 
predefined offsets [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
Changes in v3:
- Fixed compilation of LPI drivers as modules by changing pin_offset function determination logic 
- Link to v2: https://lore.kernel.org/r/20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru

Changes in v2:
- Extended description of "pinctrl: qcom: Add SDM660 LPASS LPI TLMM" patch
- Resent using b4 relay
- Link to v1: https://lore.kernel.org/r/20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru

---
Nickolay Goppen (2):
      pinctrl: qcom: lpass-lpi: Introduce pin_offset callback
      dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl

Richard Acayan (1):
      pinctrl: qcom: Add SDM660 LPASS LPI TLMM

 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     |  74 ++++++++
 drivers/pinctrl/qcom/Kconfig                       |  10 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  18 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   7 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    | 196 +++++++++++++++++++++
 6 files changed, 304 insertions(+), 2 deletions(-)
---
base-commit: d2798d0f96755807da0222cfc9793f2b1f38a2f1
change-id: 20250824-sdm660-lpass-lpi-a8b02a23861a

Best regards,
-- 
Nickolay Goppen <setotau@yandex.ru>



