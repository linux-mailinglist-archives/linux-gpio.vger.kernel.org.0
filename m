Return-Path: <linux-gpio+bounces-35298-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJIJNiFI52kF6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35298-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:49:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B54439173
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3A4D3063D5E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26423B19D8;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F959cm3m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2273AE707;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764713; cv=none; b=Mm3RQ5HqjB+qncH4vq34TkIYT1dWvo2chRnenXg9/pFmDpeCcYl5CXHYQhyw+95sY+qb8v4v06paLKMBLLL7ntYToLctoV1PNjCXb3HYVjfeUZAPZHYpjUmZ01Z3qREmvxe0Pl69U+cRJ4Odp0Z6IcWGWA0s4MoZwvsmsoBC1xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764713; c=relaxed/simple;
	bh=hz1drQskerk3cBFOXbH0y4Nl0xBRIA0S1KUxNg70Qjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjD4FnZNUOrApt4KfjC4qe///loGqxxbyHwyvvf3jjg/11Ia16rg4PJ8iP9t7aoVLCng+CXjR/3bp1pjnbzbSqNcvC6b9qGVCxpiKnJO9/CsCJVYHSboo1YHrvRDhdDPt6YiDY5FO8inxqEd1UUrP5uZwwxQCCHi+HQZwr8xQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F959cm3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F16BC2BCC6;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764713;
	bh=hz1drQskerk3cBFOXbH0y4Nl0xBRIA0S1KUxNg70Qjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F959cm3mDSw8hR2b//HD/9+46qLfvPp2e/WrNOvly7mHl07A2kCN6hzoMsSzPyyAt
	 rxE5iANrehqrx/teQrtVs1xoIKeEjOL/mGBasNCV29qP8YKJWXIF13QRK6boiFqOpW
	 1lV5uu+8wcl2MEmKsl4vijwzPfvrsknhzDpvvWINZ+39eaZhfb1iB821bU8DsKP6hW
	 wM5sfL1NQBV6Ay9J0cUUhAELaUFL1I8/mdLYuqrcz6AMx8QKQal5ZM3xcYyEtCY+c7
	 u4suNKS9lcQAdIfspgdlA+830haBEdgFDrsnmAmBjzQMdmSM9nkZ5IizwfzWMLGCvq
	 TwrzL5AjT+lig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E39F327D3;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 21 Apr 2026 11:45:09 +0200
Subject: [PATCH 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-mainline-send-v1-sending-v1-3-bcb0857724de@alex-min.fr>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 iommu@lists.linux.dev, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776764711; l=1630;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=6ryJlJVCkxtW6xPWScWBZczAfUNMkDuF43NbAurnDYY=;
 b=BWVeQKa6MDQcqITgM9e0FnseLN+FDNNSYIWclYMZbEKMC7Wm88EE2HvGZkTadjuyNj5VKvTSc
 l+qgR85bblrC9HBFJElP8gomJKYL2kSdD+uh7P7e6/4YeP0epm+067y
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35298-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40B54439173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

Register Qualcomm pinctrl with devm_pinctrl_register_and_init() so pin
functions can be added before the pinctrl device is enabled.

This lets pinmux_generic_add_pinfunction() populate the function list
before consumers request states during pinctrl_enable().

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..a2a1e0835735 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1593,11 +1593,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->desc.pins = pctrl->soc->pins;
 	pctrl->desc.npins = pctrl->soc->npins;
 
-	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
-	if (IS_ERR(pctrl->pctrl)) {
-		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return PTR_ERR(pctrl->pctrl);
-	}
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
+					     pctrl, &pctrl->pctrl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Couldn't register pinctrl driver\n");
 
 	for (i = 0; i < soc_data->nfunctions; i++) {
 		func = &soc_data->functions[i];
@@ -1607,6 +1607,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 			return ret;
 	}
 
+	ret = pinctrl_enable(pctrl->pctrl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Couldn't enable pinctrl driver\n");
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.43.0



