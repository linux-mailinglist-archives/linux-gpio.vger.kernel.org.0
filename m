Return-Path: <linux-gpio+bounces-25157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67670B3AAD5
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A406B1BA7A5A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7299E27AC44;
	Thu, 28 Aug 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSVPtDar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537527054A;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409020; cv=none; b=mIstU5gYH+dimEwUWMecvYFw8294iLcOaBnuKXnHkp+BJOh6jvzIT/Dl+rRjfW37swU6wmB3W2/zO8zlspuUXwYCJoL46eHpC68ULzDicb6ZBlh2DJkOkPwohB4WnEfrlZLpf8JxixkUaxkFONg2Sh1V2s+/7Op47e1Tiyt/By8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409020; c=relaxed/simple;
	bh=FZwL7XBHhgoAckbWlwEtMct61pGudjOnR3GfzuWKi34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BzZA2YOAM+zNITN54ieUpJmhj13RfeZXnGeBTq/24abm1gA+nXWuAzBksJ9aZf4jw+wEJTPy7M109kYg+ONzShxtyNq4jFSESeU1aY8Mciqd9uxsHPXdqtLBJe8XmrjW58eXYrR3XVm2BjRYMeBkZ8IPVsda3K3OcxA0JY1+wFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSVPtDar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97AFCC4CEF4;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756409019;
	bh=FZwL7XBHhgoAckbWlwEtMct61pGudjOnR3GfzuWKi34=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iSVPtDarfv8Hgod18zKSRohuiR2k/w/6eDc1QupTnvwZQtaoTFVYGUj/w8PYQSHvR
	 w9pM2xH4UPb9BaDyo3laqG/zkLoAhAL3dyLqKzHkiCDuX5CIOJA5ZURollXsfYf2/h
	 +rFHuz9k3SuIxoRpaHg+M+0F62EeNl0WMKLqYMHYIAw9MoDPrL9sI0ulN6urdZ2R3a
	 mUbVaKPk1BUUabPg51jxlrZhs/PH2ApSByWXCg7C/bPxxm8EbqmXyY3SxAFNKlXXFO
	 kssnZYuZYhgVPbLH+VY+ZXOi+LH5MgKbKv2zZxozBZ2l3vlsNiPiICiEwpCIzak3JX
	 FV/YtjSk2iVRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC40CA0FF7;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Subject: [PATCH v4 0/3] Add SDM660 LPASS LPI TLMM
Date: Thu, 28 Aug 2025 22:23:36 +0300
Message-Id: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALissGgC/4XNwQ6CMAyA4VchOzszug2GJ9/DeCjbkCUKZNMFQ
 nh3Byc1Ri9N/ib9OpNgvbOBHLKZeBtdcH2XQuwyolvsLpY6k5oAA8kUCBrMrSgYvQ4YQpqOoqo
 ZIHBV5EjS2eBt48aNPJ1Tty7cez9tH2K+bn9gMaeMMsaN1BoUcHGcsDN23PsHWbEIr4D8AkACs
 ClLXjVSQ2k/Af4P4AkopBEoTA2VegOWZXkCxYl36zIBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756409018; l=2199;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=FZwL7XBHhgoAckbWlwEtMct61pGudjOnR3GfzuWKi34=;
 b=a1gGoYgpK4ZQPNnQPogN3Kj0i8goX1ZnwWD6Rmv0VGgTs1Meo08YF4SbuOLptdWi58nc7KIVN
 sABjBervZT0AQc1TZO0K10+nxUtrCOyG558kRTVY9ESg6GA2nunxBih
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
introduces pin_offset field for LPI pinctrl drivers to support
SDM660's quirky pin_offsets taken from an array with 
predefined offsets from downstream [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
Changes in v4:
- Replaced pin_offset callback with a pin_offset field in lpi_pingroup struct
- Introduced LPI_PINGROUP_OFFSET macro with additional pin_offset field handling
- Introduced LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag for indicating use of predefined pin_offsets
- Replaced an array with offsets in SDM660 LPASS LPI TLMM driver with pin_offset defined for each pin in the new pin_offset field
- Link to v3: https://lore.kernel.org/r/20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru

Changes in v3:
- Fixed compilation of LPI drivers as modules by changing pin_offset function determination logic 
- Link to v2: https://lore.kernel.org/r/20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru

Changes in v2:
- Extended description of "pinctrl: qcom: Add SDM660 LPASS LPI TLMM" patch
- Resent using b4 relay
- Link to v1: https://lore.kernel.org/r/20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru

---
Nickolay Goppen (2):
      pinctrl: qcom: lpass-lpi: Add ability to use custom pin offsets
      dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl

Richard Acayan (1):
      pinctrl: qcom: Add SDM660 LPASS LPI TLMM

 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     |  74 ++++++++++
 drivers/pinctrl/qcom/Kconfig                       |  10 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  18 ++-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  18 +++
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    | 155 +++++++++++++++++++++
 6 files changed, 274 insertions(+), 2 deletions(-)
---
base-commit: d2798d0f96755807da0222cfc9793f2b1f38a2f1
change-id: 20250824-sdm660-lpass-lpi-a8b02a23861a

Best regards,
-- 
Nickolay Goppen <setotau@yandex.ru>



