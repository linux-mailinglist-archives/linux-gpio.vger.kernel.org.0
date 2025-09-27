Return-Path: <linux-gpio+bounces-26640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1219BA591A
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 07:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 081384A3B2C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 05:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D2E1F3FE9;
	Sat, 27 Sep 2025 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iQ9cw2vI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KkS437eX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7118834;
	Sat, 27 Sep 2025 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758949251; cv=none; b=T2Pn5v8902y7rlJQezwP05342AhNfTS/oah6Qfbf69BS91LXGBdyw2nzjfmYUAiEmLI26Lm5jVgcst8LcHRFZCBomhShn5KiYgPilmpbY6qK15i6/8OOCx3pTUj1aD9lH0pMw1ww93Op0R4vjmky2qOVIpqYHnfTSxYM5mPUq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758949251; c=relaxed/simple;
	bh=DI2L0s38OFZ3kmt5elmBX6ywpaznAAhIuFMkreoguPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VUzEUrY2V2U4kT78KBv9n/g4lxGzKSX7OEsmWmXnMqr4Gd9ulozoKvChToijkgHeneG7zC3Obzt0aBFhl3lBSY9VO+onCZYN/geoWdfmk2nKBFch6hojs4KBna/+eD2+YZqvFNBZfubb/uoShFcMYPSbEHd0n62f/beIHohEZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iQ9cw2vI; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KkS437eX; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758949150; bh=wiywbGUArM2TQ2jnZnO3jhn
	LS3BT0xyRgYF6NOHEeCA=; b=iQ9cw2vI8QxFct2o8MH27UteoPUKwqq19TixtBcEwsWZGJXIdq
	W+IWQ6b6ojLpdK0cUC35hXWVxILAlAwTKm4/bbjKZq2zOLIaRHmboo8GLqDLyE5No9sv+4ymC7l
	xIF9FJ+CZPoa5Laeq15iWmphoRDV5oMClZe+xBcbUVs99YZRKO9VqQD4fBrLnQ53aTbUOEw5gwN
	DY0KP9dyR/zfc8/gYlrRoZ+QVR95Mw5pXN/UsuegDJj5vonh50vqkVLOckFIF6lCyR+X/UUDkWp
	dDsClMJdSAZ8sItP75yYspZbwUgBoIl9BcrEQXpbgd/NxtQkOIGOu0I8kW0uWyk1P5w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758949150; bh=wiywbGUArM2TQ2jnZnO3jhn
	LS3BT0xyRgYF6NOHEeCA=; b=KkS437eXQbphejCILSt2qSlQaxkC4ms05KgUvohaEhHAKPGi8i
	72CND7y6VRqSAuMbiRKohE9wy+ieZje3FIDg==;
From: Dang Huynh <dang.huynh@mainlining.org>
Subject: [PATCH v3 0/3] RDA8810PL GPIO fixes
Date: Sat, 27 Sep 2025 11:59:05 +0700
Message-Id: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlv12gC/x2MWwqAIBAArxL73YLZQ+sq0YflZgthohCBdPekz
 xmYyZAoMiWYqgyRbk58+QJtXcF2GO8I2RYGKWQvRtljtEbrRoQTXeALd37QrsOuuk6SIQUlDJG
 K/qfz8r4fb5qMN2QAAAA=
X-Change-ID: 20250925-rda8810pl-gpio-fix-db6f7442eae7
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=1382;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=DI2L0s38OFZ3kmt5elmBX6ywpaznAAhIuFMkreoguPs=;
 b=tEr871K0fXKTRnsUIazo974JxiDPEzxnp6VPDZtrqbXbUKfc9zGsgYwiW2Fea/Jsbw7OWuMQq
 p89UgMS1Gi+CCcTQXOf4Kd71tWBYkAF6BGp1GlwdVkBgI3ef72ZJr8C
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

This patchset fixes two issues with the RDA GPIO driver:
- Makes GPIO IRQ optional for modem-handled GPIO block
- GPIO output direction misbehaviors

This change should not affect any existing users of the RDA Micro
platform.

This patchset is considered to be a v3, as I did not tag the previous
patchset as v2 and is a split from both of my v1/v2 patchset.

Changes in v3:
- Use bidirectional direction register for dirin register which truly
  fixes the previous issue.
- Link to v2: https://lore.kernel.org/all/20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org/

Changes in v2:
- Update commit message for "gpio: rda: Make direction register unreadable"
- Link to v1: https://lore.kernel.org/all/20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org/

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
Dang Huynh (3):
      dt-bindings: gpio: rda: Make interrupts optional
      gpio: rda: Make IRQ optional
      gpio: rda: Use bidirectional GPIO register for direction input

 Documentation/devicetree/bindings/gpio/gpio-rda.yaml | 3 ---
 drivers/gpio/gpio-rda.c                              | 5 ++---
 2 files changed, 2 insertions(+), 6 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250925-rda8810pl-gpio-fix-db6f7442eae7

Best regards,
-- 
Dang Huynh <dang.huynh@mainlining.org>


