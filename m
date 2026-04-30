Return-Path: <linux-gpio+bounces-35830-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHtlD7EA82kvwgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35830-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:11:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B781D49E6C9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C582302F7D2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FCE39E6E4;
	Thu, 30 Apr 2026 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4kIU7Are"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D375F39BFF4
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533059; cv=none; b=Sht8xAscJMNm+GMDRKBO5IvsJkP792uov0DR9arjpRS0niO5YVs7lrEZJoOoN8mzxsQuqAjI9YqNglXYr0L2xmgJbai6HNHjkPpLWGuXsvtOo5YokP1qwocO+vFUKXvz+N/0pMnnXFt7B+HqVuyY3YBdOWQHYQzfEwML74TVuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533059; c=relaxed/simple;
	bh=xA+JyyhoD+6cuOWQwY5YNIB4x5Pz3Kxm/8/MqUktfKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qp3mOYFsc685wgYrXybB/FNG5TyzdGAsR2IIQoLMVBXj1dsKKgXieozyaAHqTIpZglf9fgmjPV9FLBabCjRIfNxpRXdGhSxpxpfa2WF/X6npo9yywWALz+Z4GbqligyDIuHiAVw7S1R1zArVMt646pxvRdaTYU3b5e8rRNGj9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4kIU7Are; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so2673055e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533055; x=1778137855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/a28fcWAgOrJO1VSx976gpf9GAOotGbvaSHKVCrmZw=;
        b=4kIU7AreGm6O1JzvvJM63qjYgVePyADXOXeTWwy9RAKOT81adXsQpEy7aVFpczBH+q
         asEBPpbiLBKksjH9JzfKwP3EQIaB9ZxeN0qvm/sjX87N6kqKUfM3M8Yue6dV/rv4NmHq
         lyHhhOmvx+6aEBzHl7PYfrYmgBFKrvOfBNvYxcDVN5nucel2+JH7ZvHFPAJMChswACcX
         a455WdBCZocStJ94f4BiUjxyRygP4c4mw4HwQ++fVFcOXENEj50/tQq4CaB0Z/rsn/Sv
         xleTKgmA4XQRGdfbG8i1+VcNLOVoOHSqGgVOZJv7pYMoLdfrvizsgPIMDYIkIIIPLbP3
         uGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533055; x=1778137855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/a28fcWAgOrJO1VSx976gpf9GAOotGbvaSHKVCrmZw=;
        b=hCPUQoFk5gCjgEESbZz87NgXnOmptFBclgmqDO9BdmzQla/DL22yPeChtlV7HCM41B
         LcdgXeYt0Xqw1KDM6ipQSblbo8MNPPtVgjI+7SeT6LjZLYbeAP9t/gXJXdCrH+4BRagi
         R7GIxeIZGIsO8Ooh/XTD4JhHhdDj599VdrwtGuhGiqCNQdBWjQY0V02l7hyOthmXc7ES
         d5ZkoZWqK28vDJ86B0PjJ9eXszsxQVT9REuQuYQygynQh+9ZLaWfIgnTlQLx5wJ2svrp
         f7ck7DCVV5ZcukA0Lz4KqcClXeDg2/SU4UKM27tMU4Ymi5XD7Y3e2dPuwZ7EsoEwcY4A
         VE/w==
X-Forwarded-Encrypted: i=1; AFNElJ8WdX8tN+KHIAgucD5aiJ6zvcKXmC/UrvGdxFf2qeS2JcjB1Hn2+uPQvG8xBaaJZT8CL1xXFLRca2lI@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhwUJqs7WG8GYpSyM2FX5+8cFfMOpurbHawG1ip+ODDBxFBhk
	H2DRlNcSBmoGPTSfTns5Xzo8RhJIvY7kQyGOUd35JFpDqNch++HQa65XCu6vVNxpVgs=
X-Gm-Gg: AeBDiesaggcD5mzjji/cCFJQolsi/3Aog6sFgJxPWMDuU6TUGuGwO9KTcdjCCVVz+Pa
	hjxrF/QrjvFSarTO1ojyUC9EiwGg+eighMW9jQU5cfWOkTBtffncRya2inUf1Agris2vCuM8xkI
	2z/OkY3YMCTO50dBivNzzCiBDNZrKYDDxb8aTaX8vpk+Da6c7r3U36VPV2NxSZg7n7AZU5F4uEO
	TIaBcOerYtisvBe5pDA7U5XwNmLrOlNYdktbBjr1px0xwPFGLdD1D7LWTVYXsnhDKCYQ6qDxngg
	HDHd6Ttxn6oftijmqfMCD7dhPTmbLUi+9EBbPFbzoo2/TqDC+QNsPSCCfoRC+HjgydTj/3FiV9c
	ATJv1AHykWOdgt6eMHnWkhfDT4R4Qpe/P+51XUxbtZGA9r0RFOQ0+xqcyhGk/mQiAWoQ9g+unPR
	coE7mVdCTcvcPpGozppdy6qaCK1tjcbHApsqBNmsnEXWR532z22VkKZW52oflSuNXeSxihT1Cfm
	z2n1Als
X-Received: by 2002:a05:600c:a00e:b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48a84471b86mr27140065e9.21.1777533055237;
        Thu, 30 Apr 2026 00:10:55 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:44 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-4-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=2211;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xA+JyyhoD+6cuOWQwY5YNIB4x5Pz3Kxm/8/MqUktfKk=;
 b=o47mlBib4+72w4KeKq52GDFNeG46iqvF8whC4buxAu3HdKwKgINEBOpYn5vs8NBfDwkL2uj4N
 y8i1wxSd+I7Db+UWVHa8rVux1DtoPMRNGFdI+uCJlPu1z3JWTXLjZzU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: B781D49E6C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35830-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,33c0000:email,0.0.0.5:email]

Add LPASS LPI pinctrl node required for audio functionality on SM6350.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 034545d2af2d..d6adf68563cb 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1450,6 +1450,72 @@ compute-cb@5 {
 			};
 		};
 
+		lpass_tlmm: pinctrl@33c0000 {
+			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+			reg = <0x0 0x033c0000 0x0 0x20000>,
+			      <0x0 0x03550000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-619.0", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.54.0


