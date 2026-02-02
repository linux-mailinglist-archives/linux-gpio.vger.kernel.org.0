Return-Path: <linux-gpio+bounces-31345-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOoHNJ6+gGl3AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31345-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:11:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C89CDF4B
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D35EA3023029
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 14:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F3D3793A8;
	Mon,  2 Feb 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1/nOYD0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146DB378D95;
	Mon,  2 Feb 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044279; cv=none; b=P1UctWrzrc5nKPFxq/aicglquClAAXCm/uctaEJXV2gHgu/RqmTAwXIdSzgZt3zGrs1PvtFNWVyrp4DYcZ2EPIsvgGQo8JkWu29zFR7bpaRu4oGCzs6qCLLzvjzrVx9ZYVH3+JQmIjgLLgqBWiTVMAeC4niq9OB1BLTpOhhzmFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044279; c=relaxed/simple;
	bh=h3KwcvIZf+fAF7t4Fbqh9aQytTahrxTAYp6WAROtuQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skCklJTfYxpFgYW0hQw/COYRr1TOEGMZsOmkBuDRYrB/qhXKIDX+vJpNcFJYXsY2t+JGMI6FkGcXF6EULhLG/uMJmtgVKR96QqBUvrEORr+uO43VeQdlx+59nAB/heOpsinnUOfvXl4hnU9SJ5sM8pQh/9qVE9vM+0+rQvDC//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1/nOYD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A751FC19422;
	Mon,  2 Feb 2026 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044278;
	bh=h3KwcvIZf+fAF7t4Fbqh9aQytTahrxTAYp6WAROtuQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i1/nOYD0UtpyxMQgM6kXwYrvRZQV/I/q+5c3CGLwJx4fnKg1Rr6omHa0Oi2kC6Lyq
	 Akfudf8k5F7Twg7wDM9OFlu7T0ayWKcc7891duXmNxjG/MQI2Z4DDbcIi9g+i4G7u4
	 6ypdCmMIEVbWu+5RBHSjWKRv03zk8oOyq15QnPcqdqdJxqmEZ464UyFACv2rEfmraD
	 UI7kY+qrX65fONtoWaFr5rnAcAacK6eO1gmCBi3NBjndjF7V6dBSRGqFsmGBkNR7qA
	 eM01NuYfdXkJ22Ja5Ew2bMNU8AnYtFd8BBSM1IbhHZ0+AE3KELsdhyS1y/M6/jTw/U
	 GS3GlG9mKbJMQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:33 +0100
Subject: [PATCH RFC 1/8] dt-bindings: Move qcom,sm8750-tcsr from clock/tcsr
 to mfd/tcsr
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-1-cd7e6648c64f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=2158;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=6UGWxjygTyV7CtJDaBjoqaAeJVbZk3fw7xKoKC2F9+c=;
 b=etIMkAFeNnzu8gMWFFUm7IyTEGCWfmXsKi/yPoI4PRHRe+wVj99wkx+F4zDHr1cCsv0tBRndP
 uorxezcsFZWBh8fhiXbW+OESAAye/Hnomvf8VSYqasvt36HSlDW95aL
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31345-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 34C89CDF4B
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The TCSR block is described in two places: clock/qcom,sm8550-tcsr.yaml
and mfd/qcom,tcsr.yaml.

The former refers to the version of the block containing various gate
clocks, downstream from the main system refclk.

The latter refers to a version lacking that, instead only providing
various general tunables.

The clock gates on SM8750 specifically (unlike a generation preceding
and following it) do NOT live in TCSR, but in the TLMM (pinmux/cfg IP)
register space instead. Move it to the mfd/tcsr binding to represent
that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 2 --
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml          | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 784fef830681..8da8f44fc8a5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -18,7 +18,6 @@ description: |
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
-  - include/dt-bindings/clock/qcom,sm8750-tcsr.h
 
 properties:
   compatible:
@@ -30,7 +29,6 @@ properties:
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
-          - qcom,sm8750-tcsr
           - qcom,x1e80100-tcsr
       - const: syscon
 
diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..1a1fa2b79476 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sm8250-tcsr
           - qcom,sm8350-tcsr
           - qcom,sm8450-tcsr
+          - qcom,sm8750-tcsr
           - qcom,tcsr-apq8064
           - qcom,tcsr-apq8084
           - qcom,tcsr-ipq5018

-- 
2.52.0


