Return-Path: <linux-gpio+bounces-12089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA419B01FD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7588F1C20D67
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0D12036E6;
	Fri, 25 Oct 2024 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObIYQnj1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74A2003DE;
	Fri, 25 Oct 2024 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858675; cv=none; b=A9BlruXrN6517hbFQSCmwgEadAN5HSdRZXPWnu9dk/zflhVPrS2JIBuVdilX1fuy5t6QdZqbsM5rm5pBVkjKalBYmwDpVLvca4C4SJc2v5CxSxyYl7opXvdtaVC2Xv0s+blAM8AIrVkoOPY2R9hz7NDWpSc4aTF5eupF13ESM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858675; c=relaxed/simple;
	bh=S/bqUsr/5mwZ4YNDlIpRTUK2R5DCl91evENsXbbAavU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUYWsOj5OdzbgXlOwOx+dAfGAhqOrchIEHPjxgWzoOOdxihc226SZyZV3TP+1GrU962n0rM2dQ7+xSRJRpFrQcA1OvdGk5oRvm9DkbA2RCYEljD8/K3WHYQR+DTAWI5+93bSDK6LpfnhG8r/omrzbuKj3S5OT1QqDumsWVwCCKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObIYQnj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649B6C4CEC3;
	Fri, 25 Oct 2024 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729858675;
	bh=S/bqUsr/5mwZ4YNDlIpRTUK2R5DCl91evENsXbbAavU=;
	h=From:To:Cc:Subject:Date:From;
	b=ObIYQnj1d5qS35RgUz/CYU3NgtD8eMELFeSoT1MyO4EajCgPup+/G1agh2+89Qg94
	 MO6ezXD8ui4gTk4cqznxIUhdCGQiW5mLQxTk4MQ2y+K+nUFhgpOlbOtFOiJ2Qch8Z3
	 0UvdSK6NYP58Kk7y6irEf9x3VFdigolioVtkXHlxmx+xuElMSCKCmCDtf3an3UQpzj
	 56hsR5Y2HGkNJgqNr0NijLAO56Yq4I/hhQn2cdRwceifCiN9SakoPSYDB9d94N7R3z
	 rylyCfYqmfvAgu3M5hEYglQ8py3TxDRerOOfSLxRARADz7MeXR3OcOjnivzjiHuzdb
	 cZG6d8lJNZmBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t4JGe-000000000Q8-42Hn;
	Fri, 25 Oct 2024 14:18:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: spmi: fix debugfs drive strength
Date: Fri, 25 Oct 2024 14:16:22 +0200
Message-ID: <20241025121622.1496-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength
mapping") fixed a long-standing issue in the Qualcomm SPMI PMIC gpio
driver which had the 'low' and 'high' drive strength settings switched
but failed to update the debugfs interface which still gets this wrong.

Fix the debugfs code so that the exported values match the hardware
settings.

Note that this probably means that most devicetrees that try to describe
the firmware settings got this wrong if the settings were derived from
debugfs. Before the above mentioned commit the settings would have
actually matched the firmware settings even if they were described
incorrectly, but now they are inverted.

Fixes: 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength mapping")
Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
Cc: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: stable@vger.kernel.org	# 3.19
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 3d03293f6320..3a12304e2b7d 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -667,7 +667,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 		"push-pull", "open-drain", "open-source"
 	};
 	static const char *const strengths[] = {
-		"no", "high", "medium", "low"
+		"no", "low", "medium", "high"
 	};
 
 	pad = pctldev->desc->pins[pin].drv_data;
-- 
2.45.2


