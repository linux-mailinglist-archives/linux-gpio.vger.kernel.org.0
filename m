Return-Path: <linux-gpio+bounces-21532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BB3AD8B40
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073E716D0A1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D062E7F3C;
	Fri, 13 Jun 2025 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMDOe2uK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E2E2E7F2B;
	Fri, 13 Jun 2025 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815146; cv=none; b=E3/2iHChmXE4kCFyAfXaWkJjrf3whjXBQ27n/uSzmNvZrkFyOmUFl6geaOTZEb3RoHKfUHzG/IAyTNrDofA11e83mEHTtY+wP9hAubHx3WpPlDUG0dh/BQZ+JrRgs0045JYM3Aw2O+9uQA3/Po95Yg9wvOVCcqJbdobyTZ6i2PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815146; c=relaxed/simple;
	bh=EILYez5+fieJa+J2JuhyTmx9aEJO6nJWLXQnxTmkJws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q1FDlP6TyAR3qPox8e/+h+h6CiTfqtVJXUo5XsLQWc/J/yEMppUw0I4/3W4Cxzl2rbLwjhZmRq6EHAkgp3R6BKtxJaG8OrXudhEj1YDppB9yJrNHYS1BfUMhVaHsoHL9F1LzexyL7HeYfeEVGhZrTw2BmUT3RSPf7VNpzjbY79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMDOe2uK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B829C4CEE3;
	Fri, 13 Jun 2025 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815146;
	bh=EILYez5+fieJa+J2JuhyTmx9aEJO6nJWLXQnxTmkJws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMDOe2uKzE+90bT5Y6FSoRkdjIX5eSGRqEnMMIk8xSJJYWhXAHka/cKQvDbHJgGU2
	 dt5APuFadyE7UZcCg/JEew6kGwGYHg7XGlUt3MSGWeO7Np4GGY3xvLmvypvczUh8Ou
	 nlY93dpUU5KkvwQMt21tm2936TkPr2IJMu8Mt0ajeuEVJXhcwJ0Wo4J8eD9ZeF93QQ
	 NzEYArSuXPJmZ7PAwKwN+oTJNZBjvLFC6gQFYOCC1z6ofgrY55RhL/5+hupdoMSBoR
	 gvzZLejOL7vYrabg6O4ykaUcEIR4/FZh+MSzJ2xeQmPj3gg7BO2JvQXtky2NjjKc7P
	 iIwqgMf8U6ImA==
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
Subject: [PATCH v2 5/7] regulator: tps6594-regulator: remove hardcoded buck config
Date: Fri, 13 Jun 2025 13:45:16 +0200
Message-Id: <20250613114518.1772109-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>
References: <20250613114518.1772109-1-mwalle@kernel.org>
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


