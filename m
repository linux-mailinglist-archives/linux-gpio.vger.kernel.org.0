Return-Path: <linux-gpio+bounces-38155-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gmmqGOTOJ2qE2gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38155-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:29:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B579765DC98
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=c2Gyq1ot;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38155-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38155-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6B230E7394
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 08:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080183ED3CF;
	Tue,  9 Jun 2026 08:13:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45E3E835E;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992836; cv=none; b=sPVlX9Ccvw7cfjk6dEPU3c4UWrRm8YmNLWRLJPRHS+CRJ6zCUuJmrRdUokZGxLBeKSYqzKtHt33Eec144HxtqHE/fQOOXEW5wOnZX/DvFQD02D2AwSsP5KNqYHTQ18oxeul2uIqLtgwIcKV3SQR5E+CKJAPEnxYlacCzAS5CnKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992836; c=relaxed/simple;
	bh=UQADokhMMs9ijQx/8MIvZTTkJpSOxP4ort4y3prZCtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drmOWsHSDKaVIpoDRNia07+jKnXY1V2ltahuzJ7Mmvr28fkYt9BZf2XJJ+Gb2846MRVekiygwfc3yIZ7f7JlthYcvXnIT71/EbPVr9OZHfqU8iGkaY84/keviYJ5wx69eb3tZ/nO8KJGlHUFaWpCPob2f+RURUgk3iKzKybIqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2Gyq1ot; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 424B7C2BCB4;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780992836;
	bh=UQADokhMMs9ijQx/8MIvZTTkJpSOxP4ort4y3prZCtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c2Gyq1otZ/yySsQw9ulQoVWns/Gl20Ud6rFtvfVm/cexzcNcYHXVGXTNgTC1UVaVq
	 xjXEi29t23V7C580LQ6WChscGuyuJvyIhjvg6rCrsfMvC4BG5B1ypM1M0aN7JkML/u
	 Y0Lv01sZl4qBRTPt+uuraPi+qp52s4thX4LZ6DF30SwQA7MRtmt0ceSF4WlmvHmxBE
	 H4IVO0LzKvRekXvODxIy5LqEdN4R0bPgMijQnJkHkzSpXTp9MUBCK/jky2hqDH35GL
	 OPPSVRLspZDpsC+IalmC7nA71lNLi+NI8BXaqxun/XibqROoFIbuTGJ38M47578IOU
	 6t1bjej40S4og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289D5CD8CAD;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 09 Jun 2026 10:13:44 +0200
Subject: [PATCH v4 1/6] dt-bindings: arm: qcom: Add Samsung Galaxy S4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mainline-send-v1-sending-v4-1-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780992834; l=854;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=Lrgs0k4d0tyivYZbLbwfL0EK902GKco2rWAQQHTAiDQ=;
 b=iG960oqpG5Gws+WwzouqzOgwg0yO/ydb451Lct7m2qqXkK6j/9yNPVS2AiPGC3iSmOHyygAN6
 VNfxO5HAzpdBankvatXefIZzsLlQROSAzrKV9sHFmTZUsrAcXjYyzxt
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38155-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B579765DC98

From: Alexandre MINETTE <contact@alex-min.fr>

Add the compatible for the Qualcomm APQ8064-based Samsung Galaxy S4,
codenamed jflte.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..b7e186ed2efc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,6 +39,7 @@ properties:
           - enum:
               - asus,nexus7-flo
               - lg,nexus4-mako
+              - samsung,jflte
               - sony,xperia-yuga
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410

-- 
2.43.0



