Return-Path: <linux-gpio+bounces-37119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFDbBfgODGoZVQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:19:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8A5578E0C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D53A0304B285
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3C43D1AA0;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxXZVszL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0D3CEB8D;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175001; cv=none; b=mYN++O90jxkxz2L4NhoKHmtHAdLOL8E/73ymkTi8CnXqGPl3I3QqfJORNvyf/tthkXE3eBnD/MPNgtqmnc7TOak0gOsTr5MOcO1HyH//v3C7z4vFHAkEXbyqwyjO9tacdmpuudxz+wnl4UnlvDGP6ZXvCYZeVveHH80HNWCuEyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175001; c=relaxed/simple;
	bh=7DeREkHBuy3CC/OxlxoJowva/HyNWfGd+W2ZNWZknP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqhcso+qkuYn40lJUE57HuINpMqquo9gKSnjnnAo2/tRKRE0nwDnCSuJKmc8bFRVXlqI8YQ29KZ8Mvm4K1tpobUjHcmawSdFsgoBgs73q7HtUIENoIuFgnLkp3ovAE2SBr6+/S0r1QUlZzLsWamUENZBc+LTz2mRvgU6VXAzSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxXZVszL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3B05C2BCF6;
	Tue, 19 May 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175001;
	bh=7DeREkHBuy3CC/OxlxoJowva/HyNWfGd+W2ZNWZknP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DxXZVszL1Vd2/gJ1oZnQtwUbS+JFr6nh9GxWNU2qiCCVguxmCKn5osIhCLA1kJxh3
	 K0p5w/+zQxIwNd2FLIoJgInRdXcXRP99aONWCoS3wPxuOwZ3vbVDou+IRic8TF7ixz
	 3Xula5ZK+VtDd3N6nG2qwYk6CNdt7Q+WDOIV+mi/3EfrEnzc0j6mIdFYInAvfkRmTy
	 hPzl7jFTMA4+wSuh6LxuTaPR7eBtUSRXeBE6u9OnqBr8V81f/K+MCGrivQmYUq/uBY
	 M4lL/uAQIB2RqfdG/Gbj6fMiBZMKJHWQQZ4izZuA96M2+RliLrM1TMI+nf7Fvi1L91
	 D8oSBx9A7EbAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E858ECD4851;
	Tue, 19 May 2026 07:16:40 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 19 May 2026 09:16:33 +0200
Subject: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
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
 iommu@lists.linux.dev, phone-devel@vger.kernel.org, 
 Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779174999; l=2004;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=gqK5qmgCceA2ln5R06RBqAB8HOklQ9gk21qwB8S51xo=;
 b=CawgQZH3ABWHU9Zr9Up8crfhnEMz2Vgaed7AUvvpvQiEn2eArchcgd/osjmRXfG6JU04X/0OP
 x4JynWe0q+DDi4kl6i1jGvf7xzq50ctXBEggP9kyPYSUAlxVIBcV0Ge
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37119-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,alex-min.fr:replyto,alex-min.fr:mid,alex-min.fr:email]
X-Rspamd-Queue-Id: 6E8A5578E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

pinctrl consumers can request states while the pinctrl core enables the
controller. On Qualcomm pinctrl drivers this can happen before the SoC
function list has been registered, which leaves the function table
incomplete during state lookup.

On APQ8064 this can fail while claiming pinctrl hogs:

   apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
   apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
   apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22

Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
SoC pin functions, and only then enable the pinctrl device.

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



