Return-Path: <linux-gpio+bounces-37118-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLEgC9wODGqJVAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37118-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:18:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC19578DCE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4708302FB6C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BC03CFF68;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTywY77f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1D3CDBDD;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175001; cv=none; b=uCfVI/Hw18hKSyazw4EaWQMcMdcVugunicIoxQUNOHt20MxJY0et+UN0aKZUnq/B+oFI/mAIjgDdH7+hqIwfIavmOiJVRugXuBCQzs9v1mjlNXCM2m9LI0FIRhffm8E6l5wEpZnZJS1/dEA3ViVF4stz5l7hXpbSNEM8/UXF1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175001; c=relaxed/simple;
	bh=26/B1BppBfes5RCO1Ic1nT0B6Eke9pZ1Ck4puuNbwjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmCqn10mhZF+JFz+9ylLduaS4SXR2yyFuMzEx0P+N/pbOOYF0V7Ze+m8BIhDoiCeXSiRjOMo+NwFz6AaK6vcTI/nJG/7PmthC8f4k4MgyHM61tKgGyq10I6BTn1KnAbYMpPjkIRCvgXLcwvFQxKSFI0+Vz0eJ3Op//bdGZdS/Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTywY77f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C73DAC2BCC6;
	Tue, 19 May 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175000;
	bh=26/B1BppBfes5RCO1Ic1nT0B6Eke9pZ1Ck4puuNbwjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HTywY77fP/we1H4I9ihH794nXjq920YY6znzDGdxOQBkxkxBxi6HjVUJKSMmvdbi1
	 WOlevq53iQzjbcjsPkCO1v4QQG0k+lBk12j1dATmlEUDY7JDT2vN1GRc/YB8+3Vsl+
	 HVURUqOMZLWsLrUpCdoXVxBrUYw7UUrkjnHTGPrrXHmwgppGQzu+cQNM1Vdx93WD7O
	 f2NmkyicL1dDZ71uTcNzJA4iK+K86bdW+JuKi76pZk3ekt4EjSz0j0LapyIkdfiLs4
	 +Fq8uDIzjH80jvr+CuoEXRXjg9pDjm0aUCms4iIyDe+qnLfyH3idrgOgalY4mJ3o+l
	 3akE9KbO4/vdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA126CD4F5B;
	Tue, 19 May 2026 07:16:40 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 19 May 2026 09:16:32 +0200
Subject: [PATCH v3 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-mainline-send-v1-sending-v3-2-3dd7aa125353@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779174999; l=1917;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=vqyH0stw0peI1PfW63PuN6liDgMjrgI82QMhyQ70tz8=;
 b=kfGk6oeX1jcJazd0LrLbLbrKjzAeHCn17Gykl81HwU6hC/n4HYIMy2AS3EA5AlZ+BjCHH8ps1
 2ZjakS2tToND/apPmb78Ssbk/V6ztUhGMdI2raQwI77ABYN+r11BrEW
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
	TAGGED_FROM(0.00)[bounces-37118-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,alex-min.fr:replyto,alex-min.fr:mid,alex-min.fr:email]
X-Rspamd-Queue-Id: 9EC19578DCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921/PM8821 provide USB ID detection through the PMIC USB block. The
USB_ID_IN interrupt is exposed by the PM8921 interrupt controller and is
used by APQ8064 platforms for OTG role detection.

The device is modeled as a child of the SSBI-connected PM8921 PMIC.
Unlike PM8941, the downstream PM8xxx misc device is not instantiated with
a register resource for this path, and the mainline extcon driver only
needs the named USB ID interrupt. Allow qcom,pm8921-misc without requiring
reg.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml    | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index 6b80518cbf62..4e3d0aadb83c 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/extcon/qcom,pm8941-misc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. PM8941 USB ID Extcon device
+title: Qualcomm Technologies, Inc. PMIC USB ID Extcon device
 
 maintainers:
   - Guru Das Srinagesh <quic_gurus@quicinc.com>
@@ -15,8 +15,9 @@ description: |
 
 properties:
   compatible:
-    items:
-      - const: qcom,pm8941-misc
+    enum:
+      - qcom,pm8921-misc
+      - qcom,pm8941-misc
 
   reg:
     maxItems: 1
@@ -37,10 +38,18 @@ properties:
           - const: usb_vbus
 required:
   - compatible
-  - reg
   - interrupts
   - interrupt-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,pm8941-misc
+    then:
+      required:
+        - reg
+
 additionalProperties: false
 
 examples:

-- 
2.43.0



