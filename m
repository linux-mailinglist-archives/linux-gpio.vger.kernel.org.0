Return-Path: <linux-gpio+bounces-8677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69894C78D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 02:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010A31F24B48
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 00:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C888B2F41;
	Fri,  9 Aug 2024 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9t60Da1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1F1802;
	Fri,  9 Aug 2024 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723162932; cv=none; b=Bq7MEDVrMDYcnZmCYSNTceL2AdOXGk2KT/dUb8BcpE7No+gKcLnXuFbVvBbzHbrf+/dzJ8sMkVQNN4EIqdeiRbjjuXHT0+9Z8FAJWawCyZpvi6dibawI6YPfXrHDTyYa+tmmfgTaDLWNoXX1rEDQGpQ5N5QYOMFdXhjY8Jgdg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723162932; c=relaxed/simple;
	bh=1Q1V4q5zT2MiYUpvo2kf1eAUp7sExbPBrJjTuQ+QUMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OamqC7zQkcCPzYG1eFazXZ3X+fAs4gIkQe3+G9R0X9tpD0+zb8nDwDzJ1Jc4S7LTNrUlxVQHqJROxJQfEO++cwQgW3te6xF4j2Ffd4+nYuvwugIruyjn/dsaAxMJ2+RBobJkISS8Z1XPMIoveKwvX29QyaPAktSU7PvVSCP6N2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9t60Da1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91871C32782;
	Fri,  9 Aug 2024 00:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723162932;
	bh=1Q1V4q5zT2MiYUpvo2kf1eAUp7sExbPBrJjTuQ+QUMk=;
	h=From:Date:Subject:To:Cc:From;
	b=P9t60Da1NzDEDejPoHRm0QRovwiiYaUFQef23uA6ox472xfUPNXc02h4lCZg0TpxM
	 DQFPyf6ihsgLuFvLxZKTMHPbF2WPL+1nyaVesWshQ5PW8sAW5Rtryz6yyTzAaE/4SL
	 PLAUYgswA48ZeV4tdGvyVz7CA4ebT1WULq+kIlimJO0Jf19BAXAPqrLWR90enJowHi
	 Luf7FL0hMFIf8mVHZMpUAHeidB3kgZhtgIQqNwJq7BIdgVL3SAJlFpAWMb0X6YH24k
	 nNJqLOa1K6zrtpFdiHCSSxtHUCeqeDe+R6+FaTOGc4SaDEUE+f4XD/oOVqtMn50Q4b
	 +R6j4BOroAKWQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 09 Aug 2024 02:22:04 +0200
Subject: [PATCH] pinctrl: qcom: x1e80100: Fix special pin offsets
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACthtWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNL3ZL8gsxk3Yz44pRk3dQks9SUxBRzQ4vkFCWgjoKi1LTMCrBp0bG
 1tQBb5oC6XQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723162928; l=1562;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=x5seRk1WP98LaMkA9Z1zk0HE9qR/MHMhKwFgfw7mvws=;
 b=GAKbqxq1OirazrLZqKxy+KshFetZ6RDgFi7ufnw++1ykR4DOxZUkqgzNBGexb0CZYio1bRlUA
 eVqoImnCBuaDa6Zu1a7tKDice9cwz3vFUe/RwBwcX9oclr6EBtLWBL+
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

Remove the erroneus 0x100000 offset to prevent the boards from crashing
on pin state setting, as well as for the intended state changes to take
effect.

Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 6cd4d10e6fd6..65ed933f05ce 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1805,10 +1805,10 @@ static const struct msm_pingroup x1e80100_groups[] = {
 	[235] = PINGROUP(235, aon_cci, qdss_gpio, _, _, _, _, _, _, _),
 	[236] = PINGROUP(236, aon_cci, qdss_gpio, _, _, _, _, _, _, _),
 	[237] = PINGROUP(237, _, _, _, _, _, _, _, _, _),
-	[238] = UFS_RESET(ufs_reset, 0x1f9000),
-	[239] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1f2000, 14, 6),
-	[240] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1f2000, 11, 3),
-	[241] = SDC_QDSD_PINGROUP(sdc2_data, 0x1f2000, 9, 0),
+	[238] = UFS_RESET(ufs_reset, 0xf9000),
+	[239] = SDC_QDSD_PINGROUP(sdc2_clk, 0xf2000, 14, 6),
+	[240] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xf2000, 11, 3),
+	[241] = SDC_QDSD_PINGROUP(sdc2_data, 0xf2000, 9, 0),
 };
 
 static const struct msm_gpio_wakeirq_map x1e80100_pdc_map[] = {

---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240809-topic-h_sdc-eb6edad718cd

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


