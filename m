Return-Path: <linux-gpio+bounces-13500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5399E43E4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 19:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52AD2B851F1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4CD21CA01;
	Wed,  4 Dec 2024 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koHK4Mng"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4151A21C9F2;
	Wed,  4 Dec 2024 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331725; cv=none; b=BCCmx4gvfe8TQ3LC9mx7bpJYnqIQcoLkiZcZdm++2cF7Y0V/wWYYcG4Z9slj6b53+ZUAbh9AsgG9HX0BKMq7LhKf2FacqR0hz+cWb149pE256LU0V/0vKwuljI3Phn/rxJRoL1GjQt/2UZE4OKG2fywJZ8a1ElwTw9V2cuMlYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331725; c=relaxed/simple;
	bh=+ZKVrXOCYBLVt8Ak43JKeh6DPrPVObu9UTY2iSU88Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkLofDWIHbU1QN78dSFksAOhIIFbNb4E9b7dEbA9c7JiRQLHPEt/nOuWA+EdhEW0rsqAQuaGHJkWrRRSM/X0iGzPoA0/9ahkRL+EVNmnhC949W5oSRlyqysMAYiBbfr+W71IwlLHaAoxfqtF1lfvQAsMDJizv6PE15ubQvA/KK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koHK4Mng; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4BFC4CECD;
	Wed,  4 Dec 2024 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331724;
	bh=+ZKVrXOCYBLVt8Ak43JKeh6DPrPVObu9UTY2iSU88Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=koHK4Mnga24xaPtTrPryirgMd9Ups21/TPRCKcZ4vAi6yNQbmaFoLn++d/+4ze+En
	 ZldPIP3erjag4vpydfgSfjbMbBWKf7T4g3AyX8g3ZiGcscSuZMwr2JqzixubQojk9n
	 iw+p6+4DFfyNko/8it+EwZc1SRSOO4uTJq2bZLOoCsuClBcydMDHscHkQZYiD/oJAr
	 EyKJSJothUQJUWUB6M4xDg94IMP3Ji2i7k894d9//tYLuY9Gl+8NgvPWTJysHQoDao
	 4yHKa9O7MUcbaxGDgTdVHpie33lsJUEikp+2zOgf/WOyUWdmKHnRH0rNLm6mUEMBT3
	 Vg/WJrM095GDQ==
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
Subject: [PATCH AUTOSEL 6.6 20/24] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Date: Wed,  4 Dec 2024 10:49:40 -0500
Message-ID: <20241204155003.2213733-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155003.2213733-1-sashal@kernel.org>
References: <20241204155003.2213733-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
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
index fe0393829c207..08255a87897cf 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -984,6 +984,7 @@ static const struct of_device_id pmic_mpp_of_match[] = {
 	{ .compatible = "qcom,pm8226-mpp", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8937-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8950-mpp", .data = (void *) 4 },
 	{ .compatible = "qcom,pmi8950-mpp", .data = (void *) 4 },
-- 
2.43.0


