Return-Path: <linux-gpio+bounces-24867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E67B332C3
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 23:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 519EA3B84A7
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 21:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B24244667;
	Sun, 24 Aug 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtC1ath5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D915E5DC;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756069525; cv=none; b=K3vJmoUjNzUGb0yi/ueUmK0KaI8LqtSaBMkYjHEGQZ4Q//VggocLkTFxnXWZTtAIGs1Yx73TZnPZaXBk1+BlEVGsbdnyFb8CUsQw0CdIzI635oAaDHHhIuCFwcAH2XluIbFCoY6Wx1knin3JD4Cg2KOFz7rsBokptHKohj6MmwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756069525; c=relaxed/simple;
	bh=JEFpMbPlFzz53yrCK4CHoEeXJJEfFNfWrdbpvZv8miQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=khjLo4IMkalQsB8OzLMmmlCLj9yi17B8hb/VUgxdNy4dI5zTEOhA19w39ZUm7SIJsoycl1Ije3beeAo6HeUISpkpkjTDDVzoGPS6Q4sSLOUFKCioR20Vedzo4dUEtREcMESpT0zw6XT/WwkPoUiPs+k9Qae6HY/e0LcCizMcziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtC1ath5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56EC0C4CEED;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756069525;
	bh=JEFpMbPlFzz53yrCK4CHoEeXJJEfFNfWrdbpvZv8miQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dtC1ath5AmP0hYcG3fxxbYEMVeEuRC7u/ib5xl7dtK+mSxCZ7Ns4XcPqTkxQT7Tgl
	 RjMVNhUNBKoKDnfCB/4iHJOxHgG7KcOj4enC8fYiRfnwg0ecBaZcXmk4S2BSniucn5
	 1sFifQsd5j1jd49QJV/Yb8Ld9MTogbnwejfCAPqzBQTbtLxP7MnzshE++wCuJ0Xem8
	 C2oKhuhaURcEwKmqgwcHadTWSbAhWhM8Vpxf6MlzzXqUqf+pa0O4hxrq7dYTDMMOzf
	 wcaKg5oo3D2wsuw76ouqvtCFWLZ1WVdrxLnIrfMqyVbmOb967yYISv2YAkGrXB/T6S
	 lG5L4aeYFs0nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB54CA0EED;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Subject: [PATCH v2 0/3] Add SDM660 LPASS LPI TLMM
Date: Mon, 25 Aug 2025 00:05:23 +0300
Message-Id: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN+q2gC/32NQQqDMBBFryKzbso4UQld9R7iYmrSOtCqZFpRJ
 Hdv6gG6+fA+/Pd30BAlKFyKHWJYRGUaM9CpgH7g8RGM+MxASDU6qoz6V9Ogec6smlMMuxsSk3V
 NyZBncwx3WQ9l22UeRN9T3I6Hpfy1f2RLadAgWl/3PTmy1XXj0Yf1HD/QpZS+Fx94bLAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756069524; l=2014;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=JEFpMbPlFzz53yrCK4CHoEeXJJEfFNfWrdbpvZv8miQ=;
 b=gRDjTC7anqZqS3M1vzY85tJBMbPBwzFwF/lg1BVr4ruObp/hTXAxIpJyeUuI5oss2t21TOnyx
 /ST9sSU+DH1DnlI0E4NBYLUVK7Z45eA0GcN4L9LKSkpYwOL3Y6No1AZ
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
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  13 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   2 +
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c  |   1 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    | 196 +++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c    |   1 +
 15 files changed, 303 insertions(+), 2 deletions(-)
---
base-commit: d2798d0f96755807da0222cfc9793f2b1f38a2f1
change-id: 20250824-sdm660-lpass-lpi-a8b02a23861a

Best regards,
-- 
Nickolay Goppen <setotau@yandex.ru>



