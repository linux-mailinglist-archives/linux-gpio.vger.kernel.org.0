Return-Path: <linux-gpio+bounces-31346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBN9IfS9gGl3AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:08:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0117CDEA1
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67A78312B8C8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 14:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE41379975;
	Mon,  2 Feb 2026 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy4ONN/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33C364E85;
	Mon,  2 Feb 2026 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044284; cv=none; b=WTdVpd6YwP7LdO3kyJJlx50IftxncU2dsZAwOV0XXkzTLtyCgjxb2K5hNKg1+Pkd3WILsaVq/faK3NAkpMCxRCcRnGcswn1rVZ3EHqxj1naR6PyapBspIzHeAVpN8HDq0W+ZIaO/LIjVbbA3vVp2f3rsdrEWy9i4utvaTvmA5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044284; c=relaxed/simple;
	bh=WrkE3KnR40Jr7WeldZUrKrhOpgORxGxgXjF8DyMvuYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIAM9YKp/v8h2keohxv1d+6sdlrTnEp0n/2OZIXeau5JeyuISoBW4xE+FClAsm0NQ1Q2CYOipGDvqfZvZUOkeINM0ZYoZEDSrnkFoI0OUhTbZN592g1ucHNk0Eh/FqzE8fShJRrBM4wN6rQ8Fk/AMZvw/CJlJtrROiMSkn8vcxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy4ONN/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335E9C2BC86;
	Mon,  2 Feb 2026 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044284;
	bh=WrkE3KnR40Jr7WeldZUrKrhOpgORxGxgXjF8DyMvuYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fy4ONN/fpGvBWY25CjSYLBcttWtqDCnUeA+Fdzbt044Q6kfOKyw6u0CDgY08IhMgk
	 bGfmlNHQAuramvFL7O17d1EqI+gLr2BwvKz1AbPkuO84E6DAMbPim2O0HkL4CEosKH
	 uuuEZS12ay+1wxHjxY3+GyAPxodmvnsai9Tf4XVLZYscjtj5nyZ2YR0IQJkk9nt5js
	 gbg0vS4iU2j4v3F2Yn89MmwPUvVlm83IvWQVGfAPc7UnMnhedZOGQY7hnwihq3DcY+
	 hECbYFGi0S3c9UB6scdEVt65Fu18NywBPMhb+wA0PDxEsrGU8GSCxooB5fq+eIpKUq
	 zoTnRegw+EPzg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:34 +0100
Subject: [PATCH RFC 2/8] dt-bindings: pinctrl: qcom,sm8750-tlmm: Allow
 clocks/clock-cells
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-2-cd7e6648c64f@oss.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=1823;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=B4OvKogN/7PqKBfyCbBZSMrA7mnCwm2FZc2lYzaJU7o=;
 b=7WYFQhCF9wMdpqhNa1cTXR1jPgwxcQmMteNRj0rPhPzZRvw5150gNl4VvK/gtVr8O4+RUi9fX
 8vvRfvxRLS7BLxsZX2aSrNE/b5VLag8UwHllajufFiHjNhiZHWYW1ln
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31346-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f100000:email,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: F0117CDEA1
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

On SM8750 specifically, the TLMM block register space contains a number
of gates that forward the system XO (reference) clock to various IP
blocks.

Allow '#clock-cells' (since it provides clocks) and 'clocks' (so that
the parent clock may be consumed and linked with the clocks provided).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
index 7aecc97745a8..136366d89290 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
@@ -19,6 +19,10 @@ properties:
   compatible:
     const: qcom,sm8750-tlmm
 
+  clocks:
+    items:
+      - description: RPMh XO clock
+
   reg:
     maxItems: 1
 
@@ -32,6 +36,9 @@ properties:
   gpio-line-names:
     maxItems: 215
 
+  '#clock-cells':
+    const: 1
+
 patternProperties:
   "-state$":
     oneOf:
@@ -100,6 +107,8 @@ $defs:
 required:
   - compatible
   - reg
+  - clocks
+  - '#clock-cells'
 
 unevaluatedProperties: false
 
@@ -109,6 +118,7 @@ examples:
     tlmm: pinctrl@f100000 {
         compatible = "qcom,sm8750-tlmm";
         reg = <0x0f100000 0x300000>;
+        clocks = <&rpmhcc_xo>;
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&tlmm 0 0 216>;
@@ -116,6 +126,8 @@ examples:
         #interrupt-cells = <2>;
         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
+        #clock-cells = <1>;
+
         gpio-wo-state {
             pins = "gpio1";
             function = "gpio";

-- 
2.52.0


