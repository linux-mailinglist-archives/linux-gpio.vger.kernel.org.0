Return-Path: <linux-gpio+bounces-13492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E458D9E4085
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E8761682DA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6887F2309A4;
	Wed,  4 Dec 2024 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHXmAJDR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFCA230995;
	Wed,  4 Dec 2024 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331527; cv=none; b=itpvzLJcY2arxElvzbXJ6U0hlbNdGsw8OoW2gcYtJD0F3gQJV3vyF+gIsr/d+iDk2pspeQXVOf2UL8QH8ClSI0KPTMDWOMEBWTF3MG1IvvKdwaNw3LRFr4RnR+QldKk+/N5iSdh8VsyFhfRwTH1fz0fjcdx0tGADG2XS48ABSng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331527; c=relaxed/simple;
	bh=jL/RgBUIFHij6tVEOwmpRNZtSrfS7K4xo6QB6iNlzm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XzsmxHWy1b1GM6oPWmmL3J38yGFP5ZOCWrFL0j0a9gCy+GJQ8SNQ0vKacMVYKzPsbvGEKFn0Wj03nKuBX21jzw5QMjkTm8mKVK7TohH6cDTCDImMSfeXWI0pP7o6iJapvuyBlvGrMWxUkVZ/4Z9qX7o2c76VnRNhQXbJnEJ+78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHXmAJDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF07C4CECD;
	Wed,  4 Dec 2024 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331526;
	bh=jL/RgBUIFHij6tVEOwmpRNZtSrfS7K4xo6QB6iNlzm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHXmAJDR+KYAzG7s/Rab76vUAr4sVvkcngPZIsHJCMbpRWti5fuXkfcArH+o0v7Si
	 lr2oRX26z+DoGCxMIYEQt1GJOTIrnvUdoOl/osvLL09TBwyD7BWQCKAsDHvlVilna5
	 lJLdZzncW0VGdCHv7pbNHFo6IaAL63bLcmsgBdKFeACy5InNy92xwHHvadgQQVRwvz
	 sj+K6Oow6JfF+T6eS//i8m/5AsCqeoDO5FgEzbXnXIU9k8jiAnJHiWSftIlvPlCFEP
	 a1C8kUibofZCqY1ua8CRpuD+1S57M2/M+4N0Q8fU2uVOvxyXR3Oo7gszwUJKlNwqHV
	 mfTUmKYtiOkaw==
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
Subject: [PATCH AUTOSEL 6.12 29/36] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Date: Wed,  4 Dec 2024 10:45:45 -0500
Message-ID: <20241204154626.2211476-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154626.2211476-1-sashal@kernel.org>
References: <20241204154626.2211476-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index d16ece90d926c..5fa04e7c1d5c4 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -983,6 +983,7 @@ static const struct of_device_id pmic_mpp_of_match[] = {
 	{ .compatible = "qcom,pm8226-mpp", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8937-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8950-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pmi8950-mpp", .data = (void *) 4 },
-- 
2.43.0


