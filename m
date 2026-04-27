Return-Path: <linux-gpio+bounces-35614-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBjPEsm672knFQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35614-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294E479637
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 21:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DAE03072844
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 19:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0D24218AA;
	Mon, 27 Apr 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roqEVmXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C223914E1;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318490; cv=none; b=PWeb2spLHtGRfLsT1hh0W8sdAWkc1cxcXFadNKkmNMCqhZrMofSMB4nVupkxSsZzfE9qt3HhpbeLH8ibo+EkaIx3km51iBOA5T+Qcmtjnh/cw1kUCDqR0gKVjY0vFgCtw3lyC3XHwSx5Uql8dMR3X+1sApzZfjod6v4FaOyjp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318490; c=relaxed/simple;
	bh=Bb1lbtQItfW5BTJKMAd/sfKV3J+o1fT9fhNTOqbzM2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ppbfxo/vcLTHjPN2BeEUbxSS1nrdKQ4gPlhv4kUpuiGJB52RLZy9/CpwWVrcken33+t2wb7mWCtIzfwe1zqdabKxOIxd9WLfgrf6yYjwZVIcyMugH9b4Eeba5xx19dC/KUPF8K9Ppa1nAd6SmN6rfuWQf0aV/Sn//RkE2pNaqRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roqEVmXE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E3C4C2BCC4;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318490;
	bh=Bb1lbtQItfW5BTJKMAd/sfKV3J+o1fT9fhNTOqbzM2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=roqEVmXEAzDySkh8mMNxD4+M1WkwqfDzYTbkkVO46nhpnt6Jer+q3SiCoP1kDI/hD
	 XUK4EyERAv7YBKcwa6zLcpoaKDg9y8WkIcs7seOkgEyZYnEiCm/YM/imxGjorswG/q
	 FtSE76fBGA4aJXsqoTn8wnrsnpB9Fn3kgfW7aod9puiRjGv/eHGfCpN4qOgAm5h86R
	 QGtVBVp/9YT2bO5c2buVwPR1RezzjkYVl2FM955mj/kTmsJdDLMQSPGMVNG6gHpEj8
	 +w7W0ZoALxUeMf1OktWR+wyw8j2MwfLUP6KFeluc7EPSq1mClJNg8IjFRIxjvLdma9
	 snaBxXmacyQ4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86559FF886F;
	Mon, 27 Apr 2026 19:34:50 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Mon, 27 Apr 2026 21:34:48 +0200
Subject: [PATCH v2 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-mainline-send-v1-sending-v2-2-dcaa9178007b@alex-min.fr>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
In-Reply-To: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777318488; l=1745;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=5UIfYQUdRZLRDt1LSWl5X2pDrLJ84c7SqdbQApH5K2U=;
 b=oXTU0+0R9FAs0PpW+YQSjiyd25xzBt0VxQScacWPCwQ9P7UXv7hzkwboxvLfIMU37he/4Vjoy
 r0DacSZ8fOPDldzx0fPqoSi1Pc+1UQJtvhfL+NhA96KdmwTvbizGOkd
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Queue-Id: 9294E479637
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35614-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,quicinc.com:email,alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921 provides USB ID detection through the USB_ID_IN interrupt, which
APQ8064 boards use for OTG role detection.

The Qualcomm PMIC misc extcon binding only needs the interrupt
description for this use case. Allow qcom,pm8921-misc without requiring
a register resource so boards can describe PM8921 USB ID detection.

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



