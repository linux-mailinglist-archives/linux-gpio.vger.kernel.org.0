Return-Path: <linux-gpio+bounces-13503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5459E4169
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C677A167D10
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289E7224B15;
	Wed,  4 Dec 2024 17:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcGMApev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1CC224B07;
	Wed,  4 Dec 2024 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331770; cv=none; b=GhSAejkSJNu0gTuwSdFFm0k50fKbAUempek7DXukukBSNOHZtWlQqJfEhELkbDBRF9yawXFjule8vXFfoxLcFmzbAvwD7JOUHH8cfomny6dqHgL12iHVuNfzCfdQyekVMWRcwmOjG03LYYJ8Ve7CpJFcCGaQdUNvMRaZ9VPfbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331770; c=relaxed/simple;
	bh=OJNu50YNgqoBrOcGF4lciAHcWjVwGvUYhnDDiLLPJKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRVgHBPvyI0nmWHGpDsKapDsut9sDXzkgkAKeDDMIJA+Oz2grLxmGLMxgeV7/AvfQTmhhf4wY7TGRo3Thu29fKIBSazW0EbM1PdLuQ0pSqYjpCdd6GCPMU6l99vILbY7ZJAFNJ2aiJgxYCNOClRouoRXTnjGp41Y1cJUfPYNB84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcGMApev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F1CC4CED1;
	Wed,  4 Dec 2024 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331770;
	bh=OJNu50YNgqoBrOcGF4lciAHcWjVwGvUYhnDDiLLPJKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XcGMApevayaCZSTmDUNm0bCB6VGjy7OTCmmYL1uX4+rcmoxRURhlq45XeLPDzJRn8
	 69p13wR58Gb5fTag+0TerMd4iTcNX7gIuoThp6rZdlJi4iMioxH8lpGt76PjNRGY9t
	 6b7b0l3jGrg5xsD8RbSOxUd6fza47uZiT5XyDBsFhmvLb/ZFwpbPDfTEz+qj27aVWm
	 83xdPdL03J9jgIupZSKSxbhFbQRC+OSYhpamX8/7cfHvurniL09iM1DodFCfUMr4sN
	 9PleXDnnbOc/4hO22kIM+iD0bkPFTz4fM9eZKOgp0Y7cRbx5qlzEz6cWz7uiou30U4
	 a4JXQCkXr+uPw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/15] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Date: Wed,  4 Dec 2024 10:50:51 -0500
Message-ID: <20241204155105.2214350-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155105.2214350-1-sashal@kernel.org>
References: <20241204155105.2214350-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
Content-Transfer-Encoding: 8bit

From: Barnabás Czémán <barnabas.czeman@mainlining.org>

[ Upstream commit f755261190e88f5d19fe0a3b762f0bbaff6bd438 ]

The PM8937 provides 4 MPPs.
Add a compatible to support them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
Link: https://lore.kernel.org/20241031-msm8917-v2-4-8a075faa89b1@mainlining.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 6937157f50b3c..148cc107b7aff 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -964,6 +964,7 @@ static const struct of_device_id pmic_mpp_of_match[] = {
 	{ .compatible = "qcom,pm8226-mpp", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8937-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8950-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pmi8950-mpp", .data = (void *) 4 },
-- 
2.43.0


