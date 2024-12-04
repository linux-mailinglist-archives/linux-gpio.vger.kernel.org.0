Return-Path: <linux-gpio+bounces-13496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974B9E40EC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A71C2891D6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A494211497;
	Wed,  4 Dec 2024 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4TuP7ru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1721148C;
	Wed,  4 Dec 2024 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331637; cv=none; b=mAKMPzKo9egmifGFKP1RfWlRDDo94uYVl4inj8QHW4Mib36XdSfqVjiHiP1uhMWwl/7E1YZq9Nov064Qu65w9/r+KRGdZLMc9EOEymKByKWpfr33aCj+OzcI4jbAk8ZN9MoC85lBjwj2VhK9wOkHmpkYVbzB3vDAG1Syku/GOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331637; c=relaxed/simple;
	bh=jL/RgBUIFHij6tVEOwmpRNZtSrfS7K4xo6QB6iNlzm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTqznd+BJMUQOtBrPoCgYtbN/XzbGd7rTL3PJw2Xwf4MzpASqR0ojfTadfWZI1anU23tyKaLbW5Os3gX2EzEVXM8n7WL2hVbci41U9luJI8Zq1tUUskPA8s+JR33PmSNXqLaneZ6dW3t3OIlWNAySsJTIVynzFYrbN97KnfNiws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4TuP7ru; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEE8C4CECD;
	Wed,  4 Dec 2024 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331637;
	bh=jL/RgBUIFHij6tVEOwmpRNZtSrfS7K4xo6QB6iNlzm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4TuP7ru5h5qwbya+sVoBvw5hlqLOJKhq3l6/TInEMhPx61x+T8WHvMarnr2UCBgG
	 xHn9DBUHnMSAannXYvyCYwm5+Sv1aVTmXLLs7LI6cWrNYMCGBMoDmV35VbdtsPWHIo
	 hcGtRh/rNe3kF+1PDQBR4BBW3p5paH3VVvcbskdIleNF3oXZNqzDnxN+pZ4yvDjrcT
	 ASaAjpTKkqtU+I/q2onLkYH/yG+H/dI+Qha28r28THCa/Ms4KiALZF+uAFEJ0xyy5z
	 6H6PzschcWmYw0MQLs5OkAsBPaNsFJm1XRaq++Al/4goBLNHcWTDXnZtqGdz9ogOHQ
	 b9vANWoehXEOQ==
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
Subject: [PATCH AUTOSEL 6.11 27/33] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Date: Wed,  4 Dec 2024 10:47:40 -0500
Message-ID: <20241204154817.2212455-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154817.2212455-1-sashal@kernel.org>
References: <20241204154817.2212455-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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


