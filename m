Return-Path: <linux-gpio+bounces-31344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNJsHXK8gGmHBQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:02:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62269CDCA4
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5ADC3305A53B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 14:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6F937647A;
	Mon,  2 Feb 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtLZro1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A237648B;
	Mon,  2 Feb 2026 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044273; cv=none; b=nDadG8dnAoHMdBpVZh1CL2EfgJ9sUJl85Xx3cxiQv9qOqhJyuI0YpKytnsIqs9ALnIFk7JAoITYie76xj0a81rmcrOeD6E2iPcJ/ctNCSx9RcYvpY6JQyq8ClpXJb4YxHSEPeLG0zAc5K6VJIGwAPHnLt+EcpYNETV/fLfZrr7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044273; c=relaxed/simple;
	bh=XTmReTqxgimbnOnoAYL0eE32UGUCGUxvwKzM11q7nIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UpGVxqsItjmMamJREHe0i7gzD5RCOSEtIYxXfJlOZWka/jWoPth16Y4Zt0JAq+KX4tAzDUtSgV8zDZ+0oYQ8u8qhneEO8wLUEUG+szVKFEOD9IAsLTnTuconMJC3i4zy72FcyohOMzPiOxpzE1ETL5XRgb54SST3dwW6gjrI/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtLZro1P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C810C19422;
	Mon,  2 Feb 2026 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044273;
	bh=XTmReTqxgimbnOnoAYL0eE32UGUCGUxvwKzM11q7nIQ=;
	h=From:Subject:Date:To:Cc:From;
	b=MtLZro1PSWlMK0jmQbeMEJDW2tJnW28QA5i/kpT9u58Svq357DhnCGt06J9d69Hna
	 KQfG99EyIGbDRvMOLmOcumd5sI/uedejaPJa9MlGBVKIchhkMJxjnsrJHuwLbp/NaN
	 KjQvImha5XHsuGoLsdYJE6aTJfFDh4x2zSjOzgA9/awfee/mvf2iCrzXTMTaSH8A4R
	 Afv3U19hAwc4z70kqIukqTc0x4GFKS6NBJVtM43HYTxmj+F3CscedqL4XU5w4Qnh+z
	 fRPLYClv1Zcb65y+xWUp2J//HA7FwVxdOQFUegLBbNEWMxDBnq0hg/oC/8QPUTW6aB
	 PZp+pe/zkHe4Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFC PATCH 0/8] Fix TCSR representation on SM8750
Date: Mon, 02 Feb 2026 15:57:32 +0100
Message-Id: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23IIKPehXIkJ0rb2oqEQg/nvSZ
 WAOMxUyJaYM21Ah0cOZg+8ixwHMrf1FyLY7KKFm0YElRDa4LpM4i8kJSVntjHJSWgm9iokcv/9
 xP1r7AKfUYJVhAAAA
X-Change-ID: 20260202-topic-8750_tcsr-e2dafc2f11d1
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=2545;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XTmReTqxgimbnOnoAYL0eE32UGUCGUxvwKzM11q7nIQ=;
 b=+CRd1QwyhqhqBXAue7l1WzBqvSwbW0/fFSRj8QOUmESObSVonSOco/8gHIMPIsqjgYWtHvVlT
 93bzSB9PkyqDxXf98kRM4HwIZQ0qbhExoRYXYU4bROCVJM80xf5chb6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31344-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[konrad.dybcio.oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt,noautosel];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 62269CDCA4
X-Rspamd-Action: no action

As sparked by this thread:
<20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>

The current representation of TCSR is wrong.

On platforms post and including SM8550, the TCSR had a sub-block in it,
containing gate clocks used for distributing the XO output to various
consumers. This is what we refer to as TCSR_CC upstream.

SM8750 however, is notably different. That same set of tunables had
been moved to the TLMM register space. This is made worse, as the
sm8750-tcsrcc driver consumes the qcom,sm8750-tcsr compatible.

This hardware change had been undone with the generation following
8750.

This series attempts to unwind that. It's difficult to merge, both for
bindings and functional reasons..

I think it goes without saying this breaks backwards compatibility, but
it has to be done to represent TCSR at all. The patches are ordered in
a least-destructive order..

I gave this a quick spin on (remote) hw, the UFS (one of the consumers)
still works, but more testing would be greatly appreciated.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (8):
      dt-bindings: Move qcom,sm8750-tcsr from clock/tcsr to mfd/tcsr
      dt-bindings: pinctrl: qcom,sm8750-tlmm: Allow clocks/clock-cells
      pinctrl: qcom: Allow exposing reference clocks living in TLMM reg space
      pinctrl: qcom: sm8750: Expose reference clocks
      arm64: dts: qcom: Remove inexistent TCSR_CC
      clk: qcom: Remove tcsrcc-sm8750
      arm64: dts: qcom: sm8750: Describe TCSR
      arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   1 +
 .../bindings/pinctrl/qcom,sm8750-tlmm.yaml         |  12 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  27 ++--
 arch/arm64/configs/defconfig                       |   1 -
 drivers/clk/qcom/Kconfig                           |   8 --
 drivers/clk/qcom/Makefile                          |   1 -
 drivers/clk/qcom/tcsrcc-sm8750.c                   | 141 ---------------------
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  92 ++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h                 |  14 ++
 drivers/pinctrl/qcom/pinctrl-sm8750.c              |  31 +++++
 11 files changed, 163 insertions(+), 167 deletions(-)
---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260202-topic-8750_tcsr-e2dafc2f11d1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


