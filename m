Return-Path: <linux-gpio+bounces-22712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2075AF7266
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869401C838CC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAF72E7641;
	Thu,  3 Jul 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG+uUU5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3492E6D0F;
	Thu,  3 Jul 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542342; cv=none; b=WM8RL6x9eWN98T35EP3IYmmLIexLYu0ZedwuDovPcMtQYO6Q0qInvP/vuZ/ylYx0Nk9jBcTmppvmm93ZBKOKmO6AiQoUkVQgqmzTdGqVHBx1xVhi1ZdTy3pQ4BbNJVRvlpauL60wzI1cMBA7+ujpGb9+dIuoKq6YRUsmb0dcQxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542342; c=relaxed/simple;
	bh=Pb8T1fs8hc/HXciFLS9ppoBRsmEt8rdNEhTeKhcNkgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X2pQZzepVtjL+05GzyHwjUswQ06FyqwpR4CdFAPV6d41e91F0kUZJH2W79Czhnoj/STRSVKVx77G3/DcQnsWrfDIiI9cKN4rI0XovrDJqU3GFsJGrcS79dAzJTj6esp/UwUxsk372QtPrNWSr/IEmr2hYbb4Km1cpwyD/KSOgXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG+uUU5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C65C4CEEB;
	Thu,  3 Jul 2025 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542342;
	bh=Pb8T1fs8hc/HXciFLS9ppoBRsmEt8rdNEhTeKhcNkgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SG+uUU5gMLd5rvYA9SEzCtXfKk+cW/eOPd+QXUcS5iT5wNsXCxVRAzKtU999JFjkf
	 yjPOLbgxsqDI2AV8Qc5o2SN07/qJtHNAKLN4ml+OiwFXX++era8oQoEhtXFYoPThHL
	 /972gE6FjCQDhGgvtUGh2cOE9MI4LBfcmNFzKEh5f4Ga7okHs0QKS7q29d4rkQRWp8
	 0YnEd65ICIKWCdR1pUtq8VJcGqq3E8klLxWsJNqgtn/HULV4RYOwZWkk8FHEWJKhk1
	 8FPohdc6OmhpfVDNzmth5+yBG6S50ezbpV29tV9GvXDtjirNh2E8OMCSJbIoB81Y7/
	 dySrZhM34JuDw==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 6/8] regulator: tps6594-regulator: remove hardcoded buck config
Date: Thu,  3 Jul 2025 13:31:51 +0200
Message-Id: <20250703113153.2447110-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 00c826525fba ("regulator: tps6594-regulator: Add TI TPS65224 PMIC
regulators") added support for the TPS65224 and made the description of
the multi-phase buck converter variable depending on the variant of the
PMIC. But this was just done for MUTLI_BUCK12 and MULTI_BUCK12_34
configs probably because this variant only supports a multi-phase
configuration on buck 1 and 2. Remove the hardcoded value for the
remaining two configs, too as future PMIC variants might also support
these.

This is a preparation patch to refactor the regulator description and
is compile-time only tested.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/tps6594-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index 26669f3f1033..2c7c4df80695 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -695,14 +695,14 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 
 		if (i == MULTI_BUCK123 || i == MULTI_BUCK1234) {
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-							 tps6594_bucks_irq_types[buck_idx + 2],
+							 bucks_irq_types[buck_idx + 2],
 							 nr_types, &irq_idx);
 			if (error)
 				return error;
 		}
 		if (i == MULTI_BUCK1234) {
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-							 tps6594_bucks_irq_types[buck_idx + 3],
+							 bucks_irq_types[buck_idx + 3],
 							 nr_types, &irq_idx);
 			if (error)
 				return error;
-- 
2.39.5


