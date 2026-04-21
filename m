Return-Path: <linux-gpio+bounces-35297-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHS7HA1I52kF6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-35297-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:49:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB239439156
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FD2E305DECB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD723B0AE1;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM5fYeP9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E223AE701;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764713; cv=none; b=AFXvAZmRq5SCsrWFM+y0Pulo0WgMYIi8iTXQSY6Ujb9djEdn03V1AY6oJObQld4vFOPOtZUFHKCv/khdQ2dIIoG6jejOQAOYiqFOlodOsplkxoOVjF43cI6ingukmJPZ3aMaNki61mVFwKy3WoM43Clz8zwxCwYNuEVWBlF1Yu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764713; c=relaxed/simple;
	bh=mG/Qyz88Z3mO9PPd9omIUWPB3gHWwYXqU0j2fzy+loE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7vZVntejVoTE+cHP05qjr6WodTxU8UpH+3WDEGHC1SXH77NFHNJNZQtlnW3qm6hz7yyfxkbcsQacQO/f+jY+EEaVQ1avKctHhFnvQvlhzooVFOcsW1zTRyA203y0dt/qRIaCIdtnfHdOdpCyBKuEjErndVumjeDJvvZzwva03o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM5fYeP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC6FC2BCB6;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764713;
	bh=mG/Qyz88Z3mO9PPd9omIUWPB3gHWwYXqU0j2fzy+loE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RM5fYeP9XFFrdmr9o54G2n1HKaZw+T+fR/cbvoLPfFtV/vlig2haosy7EPN5We2v0
	 FZP+hA8ODzufNChX6RieqXxk9qguS/+X9zghcL7ji4cWOjuXz4ERgxslqls6YT3WgW
	 FQP14JtjX1SvjOy/jcqzhWQRQCh22quzI4jQBtwGfSXz/kijRrrk/doSHyNtGGJPwd
	 TLdo40penudfqseEoPhPJSwVJYnyMDi6GPp96q4kFf6CmKc1KdEH5O0tJwvY92XnUE
	 pN21GJFgwsOO6n+HuE/DwgjF31ozAMmhbKq2b4gTM0loG8H1xoq1JsVYCs9yOaExJq
	 hM/cMjzRc/GRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1BEF327D0;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 21 Apr 2026 11:45:08 +0200
Subject: [PATCH 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776764711; l=1686;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=hnBPQnGAcRm1YlYzJFFtxlKkl+dmNElxuaA7vF8baSw=;
 b=CRcV/R56i6XTribBVeGZbxaFa+SPjHPDS2TRI+isQpII8DbEnT5A7G4mqZYF3L6l0QpY+ldXb
 Fgv5vZRXPPIB5zxTqTQBek7Z5bCmA/IAUoCLaUErYfm7knyDvMCMa64
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
	TAGGED_FROM(0.00)[bounces-35297-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid]
X-Rspamd-Queue-Id: EB239439156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921 exposes USB ID state through the same interrupt-based logic as
PM8941, so it can use the same Qualcomm PMIC misc extcon binding.

Unlike PM8941, PM8921 does not need a register resource for this use
case, so allow qcom,pm8921-misc without requiring reg.

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



