Return-Path: <linux-gpio+bounces-7530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A7E90CB34
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E3761C23C35
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD15C13C801;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0mv12Pw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4EF1367;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712556; cv=none; b=R32xeYjCwQ05vDv7cX2wIW9qjqzxgjSD+7KhruH69PV/4ekRa0fZyWNOsag2R0gXTcYzGehoKKcczdpGNI76hl7DkoQRVLI1E4McqKN1FbGCVwvQR1aBfCeC7Dv5Zu5jPJiAmba9GebaglkOjpgLg7LQMZ8duep3rbb5MeSWzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712556; c=relaxed/simple;
	bh=R5kXx5fAoGEhpeDpuTqdYccUxE+YzQPbvhlrrsGkPfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmjmKerfFoWAl9TJEo/dfcVMAbbbbw1rlVTRVHNUgv+gCRGiUgu1S4rUjkEkMT7oQ9hHlas1lMOAiespRRZrMXEjUUt6WOrnnUxNj1kACTQ2CH+XZK5oM4HmZbQul9cNCDCmq0gHKgmFpOyvDcq5PwcGIpXpLFtOG8Tr9pn4gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0mv12Pw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D5C2C4AF55;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=R5kXx5fAoGEhpeDpuTqdYccUxE+YzQPbvhlrrsGkPfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F0mv12PwXJyPILspOmGhRLuauM9NIggqbe1Mo0i5e5XcTXbA30yhLCAzc6Ys4AzZU
	 l5cJXzvdzzlinLrnykm/vifPIwFSMSlcLmF8IFwODTEOq5sOnFPLwjXpA8K0Gzj67R
	 eHP/1DIMFaPfmtgCKATylvDIC8i5Vr4/YnQGtwW+V5RYHMl80XqcXnXokw/sFn9oVT
	 eGBqiUP4woh/QcYSr2cNiWxZHGtmDqtA1pwM5nXMNKSdJcD05pxdhYoi9emC97DX2z
	 jG6IOF6coCYvKRe9dvF7i1gPpCm51RQuPAyIGvM157aVnhRv9M00obu4DuRI3vDvJt
	 UqBrr1iFCawvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E03C27C4F;
	Tue, 18 Jun 2024 12:09:15 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:14 +0200
Subject: [PATCH RESEND v10 03/12] pinctrl: single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-3-754e5ece9078@skole.hr>
References: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
In-Reply-To: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Rob Herring <robh@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=/nR1o+WfwzLszgn+C3p6mt8A5/wqrmlXux49ejE20Hw=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjRRS8WFa96wH4cU8qz9ZyqeNrJk9sCMc07P
 rFUy7i9tuKJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40QAKCRCaEZ6wQi2W
 4bmRD/9TZSmiKm1CkLE4xNVYuYwXwZpQIzFIg+m7ibFPr5pFBKqmSxx/vDUuB8epNzwL1wHrY/T
 iBOF3SXpRdxxoj+wUy1m7u2iH4dva83/DLAjQnBh0tAfRlZlLjLI9e6piAeYAImmm2fBwFjWQgx
 ZLI/is000ca8lT/KgvYYoRn5D1uh7dQmSoRt996ElhYSe3lJrc45jqw+Cj8Ni2z+aRYZeHmuSnq
 VJzzr6yQDkut7xDjsNmgOKHe8YQT3FC6+LSBgUeK2kpZGAe0sxOYaE/6IK/h3ivN+lXQ7ilJQ1r
 n16uHVYUKzEHKNsHVg0LvHgchTVxMlQyqHuJip4RJddmK07fhjDCfgDsyXOzzKF43htvnEU4/ai
 VqIW3kd5GN1427ud8IZgxetc6xsdXXbQphtrrOKwyr6Ed/1KEkx2dYP9xbzmoCj5ZtirPCpg1Ih
 3nnEjiXtN1ckxr/WzbfA9OoUnme4yQtLmQs/n33ckwri53mkm6VvKwO4nxaipOEYIpINMTUyBv3
 VvD4tAvB8dqWfl4U1nUGLy+Fgt+bHewiMPu5s9rTqE13olg4aPWKotOz68cXPPnzuSt0hOIxT60
 KNceFpj1VnlQP5vRCZVP5VrKx/z0/pjH8cocMpb8S1eCiZez9VeIjkH4wHVo3Kci7ApgVx51EwE
 vCtLkTBcSsWUAJw==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 19cc0db771a5..c15bf3cbabd7 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1967,6 +1967,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
 	{ .compatible = "ti,dra7-padconf", .data = &pinctrl_single_dra7 },

-- 
2.45.2



